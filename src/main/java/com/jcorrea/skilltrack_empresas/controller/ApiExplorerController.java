package com.jcorrea.skilltrack_empresas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/explorer")
public class ApiExplorerController {

    @GetMapping
    public String mostrarExplorer() {
        // Carga la vista /WEB-INF/views/api/explorer.jsp
        return "api/explorer";
    }
}