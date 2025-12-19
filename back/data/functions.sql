--FUNCION PARA VALIDAR QUE UN PROFESOR NO TENGA CONFLICTOS DE HORARIO ENTRE TALLERES || TAMBIEN VALIDA QUE HAYA MAXIMO 2 PROFESORES POR TALLER
CREATE OR REPLACE FUNCTION check_teacher_schedule_overlap()
RETURNS TRIGGER AS $$
BEGIN
    -- 1. Primero: Validar el máximo de 2 profesores por taller
    IF (SELECT COUNT(*) FROM workshop_teachers WHERE id_workshop = NEW.id_workshop) >= 2 THEN
        RAISE EXCEPTION 'Este taller ya tiene el máximo de 2 profesores.';
    END IF;

    -- 2. Segundo: Validar que el profesor no tenga otro taller en esas fechas
    IF EXISTS (
        SELECT 1 
        FROM workshop_teachers wt
        JOIN workshops w_existente ON wt.id_workshop = w_existente.id_workshop
        JOIN workshops w_nuevo ON w_nuevo.id_workshop = NEW.id_workshop
        WHERE wt.id_teacher = NEW.id_teacher
        AND (w_nuevo.start_date, w_nuevo.end_date) OVERLAPS (w_existente.start_date, w_existente.end_date)
    ) THEN
        RAISE EXCEPTION 'Conflicto de horario: El profesor ya tiene un taller asignado en esas fechas.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_teacher_schedule
BEFORE INSERT ON workshop_teachers
FOR EACH ROW EXECUTE FUNCTION check_teacher_schedule_overlap();



--FUNCION PARA ACTUALIZAR LOS PLAZAS DISPONIBLES AL INSCRIBIRSE O DESINSCRIBIRSE DE UN TALLER
CREATE OR REPLACE FUNCTION update_available_slots()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE workshops 
        SET available_slots = available_slots - 1 
        WHERE id_workshop = NEW.id_workshop;
    ELSIF (TG_OP = 'DELETE') THEN
        UPDATE workshops 
        SET available_slots = available_slots + 1 
        WHERE id_workshop = OLD.id_workshop;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_slots
AFTER INSERT OR DELETE ON workshop_enrollments
FOR EACH ROW EXECUTE FUNCTION update_available_slots();