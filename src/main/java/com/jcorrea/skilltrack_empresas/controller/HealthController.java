package com.jcorrea.skilltrack_empresas.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    @GetMapping("/health")
    public String health() {
        return "SkillTrack Empresas OK - perfil Railway";
    }
}