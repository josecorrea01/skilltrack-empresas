package com.jcorrea.skilltrack_empresas.service;

import com.jcorrea.skilltrack_empresas.model.Empresa;
import com.jcorrea.skilltrack_empresas.repository.EmpresaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmpresaService {

    private final EmpresaRepository empresaRepository;

    public EmpresaService(EmpresaRepository empresaRepository) {
        this.empresaRepository = empresaRepository;
    }

    /**
     * Listar todas las empresas.
     */
    public List<Empresa> listarTodas() {
        return empresaRepository.findAll();
    }

    /**
     * Buscar una empresa por su ID.
     */
    public Optional<Empresa> buscarPorId(Integer id) {
        return empresaRepository.findById(id);
    }

    /**
     * Buscar empresas por texto (nombre o rubro).
     * Si el texto viene vacío o nulo, devuelve todas.
     */
    public List<Empresa> buscarPorTexto(String texto) {
        if (texto == null || texto.isBlank()) {
            return listarTodas();
        }
        return empresaRepository
                .findByNombreContainingIgnoreCaseOrRubroContainingIgnoreCase(texto, texto);
    }
}