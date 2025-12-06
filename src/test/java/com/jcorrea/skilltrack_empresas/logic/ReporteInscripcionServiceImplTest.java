package com.jcorrea.skilltrack_empresas.logic;

import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ReporteInscripcionServiceImplTest {

    private final ReporteInscripcionService service = new ReporteInscripcionServiceImpl();

    @Test
    void calcularPorcentajeAprobados_conMezclaDeEstados() {
        List<String> estados = Arrays.asList("APROBADO", "REPROBADO", "APROBADO", "EN_CURSO");

        double resultado = service.calcularPorcentajeAprobados(estados);

        // 2 aprobados de 4 -> 50%
        assertEquals(50.0, resultado, 0.01);
    }

    @Test
    void calcularPorcentajeAprobados_listaVaciaRetornaCero() {
        double resultado = service.calcularPorcentajeAprobados(Collections.emptyList());
        assertEquals(0.0, resultado, 0.0);
    }

    @Test
    void calcularPorcentajeAprobados_ignoraMayusculasYEspacios() {
        List<String> estados = Arrays.asList(" aprobado ", "APROBADO", "reprobado");

        double resultado = service.calcularPorcentajeAprobados(estados);

        // 2 de 3
        assertEquals((2 * 100.0) / 3, resultado, 0.01);
    }

    @Test
    void calcularPromedioNotas_conValoresValidos() {
        List<Double> notas = Arrays.asList(5.0, 6.0, 4.0);

        double resultado = service.calcularPromedioNotas(notas);

        // (5 + 6 + 4) / 3 = 5.0
        assertEquals(5.0, resultado, 0.0001);
    }

    @Test
    void calcularPromedioNotas_conNulosYListaMixta() {
        List<Double> notas = Arrays.asList(6.0, null, 4.0);

        double resultado = service.calcularPromedioNotas(notas);

        // (6 + 4) / 2 = 5.0
        assertEquals(5.0, resultado, 0.0001);
    }

    @Test
    void calcularPromedioNotas_listaVaciaRetornaCero() {
        double resultado = service.calcularPromedioNotas(Collections.emptyList());
        assertEquals(0.0, resultado, 0.0);
    }

    @Test
    void contarPorEstado_caseInsensitive() {
        List<String> estados = Arrays.asList("APROBADO", "aprobado", "EN_CURSO", "REPROBADO");

        long resultado = service.contarPorEstado(estados, "aprobado");

        assertEquals(2L, resultado);
    }

    @Test
    void contarPorEstado_listaNulaORestadoNuloRetornaCero() {
        assertEquals(0L, service.contarPorEstado(null, "APROBADO"));
        assertEquals(0L, service.contarPorEstado(Collections.emptyList(), "APROBADO"));
        assertEquals(0L, service.contarPorEstado(Arrays.asList("APROBADO"), null));
    }
}