package com.jcorrea.skilltrack_empresas.repository;

import com.jcorrea.skilltrack_empresas.model.Colaborador;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ColaboradorRepository extends JpaRepository<Colaborador, Integer> {
    // Por ahora solo usamos los métodos básicos (findAll, findById, etc.)
}