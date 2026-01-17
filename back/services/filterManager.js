// src/services/filters/filterManager.js
import { filtrosA } from './filters/modalidadA.js';
import { filtrosB } from './filters/modalidadB.js';
import { filtrosC } from './filters/modalidadC.js';

const mapaFiltros = {
  'A': filtrosA,
  'B': filtrosB,
  'C': filtrosC
};

export const obtenerFiltrosPorModalidad = (modalidad) => {
  return mapaFiltros[modalidad] || null;
};