package com.jcorrea.skilltrack_empresas.repository;

import com.jcorrea.skilltrack_empresas.model.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmpresaRepository extends JpaRepository<Empresa, Integer> {

    // Buscar por nombre o rubro, ignorando mayúsculas/minúsculas
    List<Empresa> findByNombreContainingIgnoreCaseOrRubroContainingIgnoreCase(String nombre, String rubro);
}