package com.jcorrea.skilltrack_empresas.controller;

import com.jcorrea.skilltrack_empresas.model.Empresa;
import com.jcorrea.skilltrack_empresas.service.EmpresaService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
@RequestMapping("/empresas")
public class EmpresaController {

    private final EmpresaService empresaService;

    public EmpresaController(EmpresaService empresaService) {
        this.empresaService = empresaService;
    }

    /**
     * Listado de empresas, con búsqueda opcional por nombre/rubro (parámetro q).
     */
    @GetMapping
    public String listarEmpresas(
            @RequestParam(name = "q", required = false) String q,
            Model model) {

        List<Empresa> empresas = (q == null || q.isBlank())
                ? empresaService.listarTodas()
                : empresaService.buscarPorTexto(q);

        model.addAttribute("empresas", empresas);
        model.addAttribute("consulta", q);
        model.addAttribute("totalEmpresas", empresas.size());

        return "empresas/lista";
    }

    /**
     * Detalle de una empresa por ID.
     */
    @GetMapping("/{id}")
    public String detalleEmpresa(@PathVariable("id") Integer id, Model model) {
        Empresa empresa = empresaService.buscarPorId(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        model.addAttribute("empresa", empresa);
        return "empresas/detalle";
    }

    /**
     * Formulario para crear nueva empresa.
     * GET http://localhost:8080/empresas/nueva
     */
    @GetMapping("/nueva")
    public String mostrarFormularioNuevaEmpresa(Model model) {
        model.addAttribute("empresa", new Empresa());
        return "empresas/form"; // /WEB-INF/views/empresas/form.jsp
    }

    /**
     * Guardar empresa nueva.
     * POST http://localhost:8080/empresas
     */
    @PostMapping
    public String guardarEmpresa(@ModelAttribute("empresa") Empresa empresa) {
        empresaService.guardar(empresa);
        return "redirect:/empresas";
    }
}
