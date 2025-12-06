package com.jcorrea.skilltrack_empresas.service;

import com.jcorrea.skilltrack_empresas.model.Colaborador;
import com.jcorrea.skilltrack_empresas.repository.ColaboradorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ColaboradorService {

    private final ColaboradorRepository colaboradorRepository;

    public ColaboradorService(ColaboradorRepository colaboradorRepository) {
        this.colaboradorRepository = colaboradorRepository;
    }

    public List<Colaborador> listarTodos() {
        return colaboradorRepository.findAll();
    }

    public Optional<Colaborador> buscarPorId(Long id) {
        return colaboradorRepository.findById(id);
    }

    public Colaborador guardar(Colaborador colaborador) {
        return colaboradorRepository.save(colaborador);
    }

    public void eliminarPorId(Long id) {
        colaboradorRepository.deleteById(id);
    }
}