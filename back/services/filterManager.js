// src/services/filters/filterManager.js
import { filtrosA, assignTeachers as assignA } from './filters/modalidadA.js';
import { filtrosB, assignTeachers as assignB } from './filters/modalidadB.js';
import { filtrosC, assignTeachers as assignC } from './filters/modalidadC.js';

const mapaFiltros = {
  'A': { filtros: filtrosA, assignTeachers: assignA },
  'B': { filtros: filtrosB, assignTeachers: assignB },
  'C': { filtros: filtrosC, assignTeachers: assignC }
};

export const obtenerFiltrosPorModalidad = (modalidad) => {
  return mapaFiltros[modalidad]?.filtros || null;
};

export const assignTeachersByModality = async (modalidad, workshop, participatingCenters, globalLoad, db) => {
    const mod = mapaFiltros[modalidad];
    if (mod && mod.assignTeachers) {
        return await mod.assignTeachers(workshop, participatingCenters, globalLoad, db);
    }
    console.warn(`⚠️ No teacher assignment logic for modality ${modalidad}`);
    return [];
};