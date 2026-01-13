// src/services/filters/filterManager.js
import { filtrosA } from './modalidadA.js';
import { filtrosB } from './modalidadB.js';
import { filtrosC } from './modalidadC.js';

const mapaFiltros = {
  'A': filtrosA,
  'B': filtrosB,
  'C': filtrosC
};

export const obtenerPipeline = (modalidad) => {
  return mapaFiltros[modalidad] || null;
};