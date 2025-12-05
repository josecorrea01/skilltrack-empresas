package com.jcorrea.skilltrack_empresas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        // Resuelve /WEB-INF/views/index.jsp
        return "index";
    }
}
