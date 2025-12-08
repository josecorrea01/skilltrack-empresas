package com.jcorrea.skilltrack_empresas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class SkilltrackEmpresasApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        // Para despliegue tradicional (WAR en un Tomcat externo) o embebido
        return builder.sources(SkilltrackEmpresasApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(SkilltrackEmpresasApplication.class, args);
    }
}