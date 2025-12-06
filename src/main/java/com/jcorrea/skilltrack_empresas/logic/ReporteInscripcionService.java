package com.jcorrea.skilltrack_empresas.logic;

import java.util.List;

public interface ReporteInscripcionService {

    /**
     * Calcula el porcentaje de inscripciones aprobadas (estado = "APROBADO")
     * sobre el total de estados entregados.
     * Si la lista es nula o vacía, retorna 0.0.
     */
    double calcularPorcentajeAprobados(List<String> estados);

    /**
     * Calcula el promedio de una lista de notas.
     * Ignora valores nulos. Si no hay notas válidas, retorna 0.0.
     */
    double calcularPromedioNotas(List<Double> notas);

    /**
     * Cuenta cuántas inscripciones tienen un estado específico
     * (comparación case-insensitive y trim).
     */
    long contarPorEstado(List<String> estados, String estadoBuscado);
}