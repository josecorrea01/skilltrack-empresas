package com.jcorrea.skilltrack_empresas.controller;

import com.jcorrea.skilltrack_empresas.model.Empresa;
import com.jcorrea.skilltrack_empresas.service.EmpresaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/empresas")
public class EmpresaController {

    private final EmpresaService empresaService;

    public EmpresaController(EmpresaService empresaService) {
        this.empresaService = empresaService;
    }

    @GetMapping
    public String listarEmpresas(Model model) {
        List<Empresa> empresas = empresaService.listarTodas();
        model.addAttribute("empresas", empresas);
        return "empresas/lista";
    }

    @GetMapping("/{id}")
    public String verDetalleEmpresa(@PathVariable("id") Integer id, Model model) {
        Empresa empresa = empresaService.buscarPorId(id);
        model.addAttribute("empresa", empresa);
        return "empresas/detalle";
    }
}