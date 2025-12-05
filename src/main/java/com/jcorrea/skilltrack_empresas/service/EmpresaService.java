package com.jcorrea.skilltrack_empresas.service;

import com.jcorrea.skilltrack_empresas.model.Empresa;
import com.jcorrea.skilltrack_empresas.repository.EmpresaRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpresaService {

    private final EmpresaRepository empresaRepository;

    public EmpresaService(EmpresaRepository empresaRepository) {
        this.empresaRepository = empresaRepository;
    }

    public List<Empresa> listarTodas() {
        return empresaRepository.findAll();
    }

    public Empresa buscarPorId(Integer idEmpresa) {
        return empresaRepository.findById(idEmpresa)
                .orElseThrow(() ->
                        new EntityNotFoundException("Empresa no encontrada con id " + idEmpresa));
    }
}