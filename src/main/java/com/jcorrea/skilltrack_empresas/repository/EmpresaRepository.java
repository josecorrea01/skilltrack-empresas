package com.jcorrea.skilltrack_empresas.repository;

import com.jcorrea.skilltrack_empresas.model.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Integer> {
    // Por ahora no necesitamos métodos extra, con los heredados basta
}
