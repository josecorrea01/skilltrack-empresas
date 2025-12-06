package com.jcorrea.skilltrack_empresas.repository;

import com.jcorrea.skilltrack_empresas.model.Colaborador;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ColaboradorRepository extends JpaRepository<Colaborador, Long> {

    List<Colaborador> findByEmpresa_IdEmpresa(Long idEmpresa);
}