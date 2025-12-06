package com.jcorrea.skilltrack_empresas.controller;

import com.jcorrea.skilltrack_empresas.model.Colaborador;
import com.jcorrea.skilltrack_empresas.service.ColaboradorService;
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

    public ColaboradorController(ColaboradorService colaboradorService) {
        this.colaboradorService = colaboradorService;
    }

    @GetMapping
    public String listarColaboradores(Model model) {
        List<Colaborador> colaboradores = colaboradorService.listarTodos();
        model.addAttribute("colaboradores", colaboradores);
        model.addAttribute("totalColaboradores", colaboradores.size());
        return "colaboradores/lista";
    }

    @GetMapping("/{id}")
    public String detalleColaborador(@PathVariable("id") Integer id, Model model) {
        Colaborador colaborador = colaboradorService.buscarPorId(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        model.addAttribute("colaborador", colaborador);
        return "colaboradores/detalle";
    }
}