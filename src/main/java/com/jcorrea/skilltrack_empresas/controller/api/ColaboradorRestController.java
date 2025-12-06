package com.jcorrea.skilltrack_empresas.controller.api;

import com.jcorrea.skilltrack_empresas.dto.ColaboradorDTO;
import com.jcorrea.skilltrack_empresas.model.Colaborador;
import com.jcorrea.skilltrack_empresas.service.ColaboradorService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/colaboradores")
public class ColaboradorRestController {

    private final ColaboradorService colaboradorService;

    public ColaboradorRestController(ColaboradorService colaboradorService) {
        this.colaboradorService = colaboradorService;
    }

    /**
     * GET /api/colaboradores
     * GET /api/colaboradores?empresaId=1
     *
     * Filtra en memoria por empresaId para no tocar el repositorio.
     */
    @GetMapping
    public List<ColaboradorDTO> listarColaboradores(
            @RequestParam(name = "empresaId", required = false) Integer empresaId) {

        List<Colaborador> todos = colaboradorService.listarTodos();

        List<Colaborador> filtrados;
        if (empresaId == null) {
            filtrados = todos;
        } else {
            filtrados = todos.stream()
                    .filter(c -> c.getEmpresa() != null
                            && empresaId.equals(c.getEmpresa().getIdEmpresa()))
                    .collect(Collectors.toList());
        }

        return filtrados.stream()
                .map(ColaboradorDTO::fromEntity)
                .collect(Collectors.toList());
    }

    /**
     * GET /api/colaboradores/{id}
     */
    @GetMapping("/{id}")
    public ResponseEntity<ColaboradorDTO> obtenerColaborador(@PathVariable("id") Long id) {
        return colaboradorService.buscarPorId(id)
                .map(ColaboradorDTO::fromEntity)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}