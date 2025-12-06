package com.jcorrea.skilltrack_empresas.controller;

import com.jcorrea.skilltrack_empresas.model.Colaborador;
import com.jcorrea.skilltrack_empresas.service.ColaboradorService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;


import com.jcorrea.skilltrack_empresas.model.Colaborador;
import com.jcorrea.skilltrack_empresas.model.Empresa;
import com.jcorrea.skilltrack_empresas.service.ColaboradorService;
import com.jcorrea.skilltrack_empresas.service.EmpresaService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
@RequestMapping("/colaboradores")
public class ColaboradorController {

    private final ColaboradorService colaboradorService;
    private final EmpresaService empresaService;

    public ColaboradorController(ColaboradorService colaboradorService,
                                 EmpresaService empresaService) {
        this.colaboradorService = colaboradorService;
        this.empresaService = empresaService;
    }

    /**
     * Listado de colaboradores.
     * GET /colaboradores
     */
    @GetMapping
    public String listarColaboradores(Model model) {
        List<Colaborador> colaboradores = colaboradorService.listarTodos();
        model.addAttribute("colaboradores", colaboradores);
        model.addAttribute("totalColaboradores", colaboradores.size());
        return "colaboradores/lista";
    }

    /**
     * Detalle de colaborador por ID.
     * GET /colaboradores/{id}
     */
    @GetMapping("/{id}")
    public String detalleColaborador(@PathVariable("id") Long id, Model model) {
        Colaborador colaborador = colaboradorService.buscarPorId(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        model.addAttribute("colaborador", colaborador);
        return "colaboradores/detalle";
    }

    /**
     * Formulario para crear nuevo colaborador.
     * GET /colaboradores/nuevo
     */
    @GetMapping("/nuevo")
    public String mostrarFormularioNuevoColaborador(Model model) {
        model.addAttribute("colaborador", new Colaborador());
        model.addAttribute("empresas", empresaService.listarTodas()); // para el combo
        return "colaboradores/form";
    }

    /**
     * Guardar colaborador nuevo.
     * POST /colaboradores
     */
    @PostMapping
    public String guardarColaborador(@ModelAttribute("colaborador") Colaborador colaborador,
                                     @RequestParam("empresaId") Integer empresaId) {

        Empresa empresa = empresaService.buscarPorId(empresaId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Empresa no válida"));

        colaborador.setEmpresa(empresa);
        colaboradorService.guardar(colaborador);

        return "redirect:/colaboradores";
    }
}