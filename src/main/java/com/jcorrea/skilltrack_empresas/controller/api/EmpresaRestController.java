package com.jcorrea.skilltrack_empresas.controller.api;

import com.jcorrea.skilltrack_empresas.dto.EmpresaDTO;
import com.jcorrea.skilltrack_empresas.model.Empresa;
import com.jcorrea.skilltrack_empresas.service.EmpresaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/empresas")
public class EmpresaRestController {

    private final EmpresaService empresaService;

    public EmpresaRestController(EmpresaService empresaService) {
        this.empresaService = empresaService;
    }

    /**
     * GET /api/empresas
     * GET /api/empresas?q=texto
     */
    @GetMapping
    public List<EmpresaDTO> listarEmpresas(
            @RequestParam(name = "q", required = false) String q) {

        List<Empresa> empresas = (q == null || q.isBlank())
                ? empresaService.listarTodas()
                : empresaService.buscarPorTexto(q);

        return empresas.stream()
                .map(EmpresaDTO::fromEntity)
                .collect(Collectors.toList());
    }

    /**
     * GET /api/empresas/{id}
     */
    @GetMapping("/{id}")
    public ResponseEntity<EmpresaDTO> obtenerEmpresa(@PathVariable("id") Integer id) {
        return empresaService.buscarPorId(id)
                .map(EmpresaDTO::fromEntity)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}