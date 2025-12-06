package com.jcorrea.skilltrack_empresas.logic;

import java.util.List;

public class ReporteInscripcionServiceImpl implements ReporteInscripcionService {

    @Override
    public double calcularPorcentajeAprobados(List<String> estados) {
        if (estados == null || estados.isEmpty()) {
            return 0.0;
        }

        int total = estados.size();
        int aprobados = 0;

        for (String estado : estados) {
            if (estado != null && "APROBADO".equalsIgnoreCase(estado.trim())) {
                aprobados++;
            }
        }

        return (aprobados * 100.0) / total;
    }

    @Override
    public double calcularPromedioNotas(List<Double> notas) {
        if (notas == null || notas.isEmpty()) {
            return 0.0;
        }

        double suma = 0.0;
        int contadorValidas = 0;

        for (Double nota : notas) {
            if (nota != null) {
                suma += nota;
                contadorValidas++;
            }
        }

        if (contadorValidas == 0) {
            return 0.0;
        }

        return suma / contadorValidas;
    }

    @Override
    public long contarPorEstado(List<String> estados, String estadoBuscado) {
        if (estados == null || estados.isEmpty() || estadoBuscado == null) {
            return 0L;
        }

        String objetivo = estadoBuscado.trim().toUpperCase();
        long contador = 0L;

        for (String estado : estados) {
            if (estado != null && estado.trim().toUpperCase().equals(objetivo)) {
                contador++;
            }
        }

        return contador;
    }
}