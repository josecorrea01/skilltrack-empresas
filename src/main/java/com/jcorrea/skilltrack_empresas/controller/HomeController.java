package com.jcorrea.skilltrack_empresas.controller;

import com.jcorrea.skilltrack_empresas.repository.EmpresaRepository;
import com.jcorrea.skilltrack_empresas.repository.ColaboradorRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final EmpresaRepository empresaRepository;
    private final ColaboradorRepository colaboradorRepository;

    public HomeController(EmpresaRepository empresaRepository,
                          ColaboradorRepository colaboradorRepository) {
        this.empresaRepository = empresaRepository;
        this.colaboradorRepository = colaboradorRepository;
    }

    @GetMapping("/")
    public String inicio(Model model) {

        long totalEmpresas = empresaRepository.count();
        long totalColaboradores = colaboradorRepository.count();

        model.addAttribute("totalEmpresas", totalEmpresas);
        model.addAttribute("totalColaboradores", totalColaboradores);

        return "index"; // -> /WEB-INF/views/index.jsp
    }
}