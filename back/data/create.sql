-- -----------------------------------------------------
-- Taula: Centres
-- -----------------------------------------------------
CREATE TABLE Centres (
    id_centre INT PRIMARY KEY AUTO_INCREMENT,
    nom_centre VARCHAR(255) NOT NULL,
    codi_centre VARCHAR(50) UNIQUE NOT NULL,
    adreca TEXT,
    telefon VARCHAR(20),
    data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Taula: Tallers
-- -----------------------------------------------------
CREATE TABLE Tallers (
    id_taller INT PRIMARY KEY AUTO_INCREMENT,
    titol VARCHAR(255) NOT NULL,
    descripcio_curta TEXT,
    
    places_maximes INT NOT NULL,
    places_disponibles INT,
    
    categoria VARCHAR(100),
    horari VARCHAR(255),
    
    estat ENUM('PENDENT', 'COMPLET', 'OFERT', 'ARXIU') NOT NULL DEFAULT 'OFERT',
    
    durada_hores DECIMAL(4, 2),
    esta_actiu BOOLEAN DEFAULT TRUE,
    data_creacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    professor_id INT, 
    CONSTRAINT fk_taller_professor FOREIGN KEY (professor_id) REFERENCES Usuaris(id_usuari)
);

-- -----------------------------------------------------
-- Taula: Usuaris
-- -----------------------------------------------------
CREATE TABLE Usuaris (
    id_usuari INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    rol ENUM('ADMINISTRADOR', 'PROFESSOR', 'CENTRE') NOT NULL,
    
    telefon VARCHAR(20),
    
    id_centre INT,
    
    esta_actiu BOOLEAN DEFAULT TRUE,
    data_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_usuaris_centre FOREIGN KEY (id_centre) REFERENCES Centres(id_centre)
);

