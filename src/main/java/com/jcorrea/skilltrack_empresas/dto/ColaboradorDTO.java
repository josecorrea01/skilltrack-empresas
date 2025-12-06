package com.jcorrea.skilltrack_empresas.dto;


import com.jcorrea.skilltrack_empresas.model.Colaborador;
import com.jcorrea.skilltrack_empresas.model.Empresa;

public class ColaboradorDTO {

    private Long id;
    private String nombre;
    private String email;
    private String rut;
    private String cargo;
    private Integer empresaId;
    private String empresaNombre;

    public ColaboradorDTO() {
    }

    public ColaboradorDTO(Long id, String nombre, String email, String rut,
                          String cargo, Integer empresaId, String empresaNombre) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.rut = rut;
        this.cargo = cargo;
        this.empresaId = empresaId;
        this.empresaNombre = empresaNombre;
    }

    public static ColaboradorDTO fromEntity(Colaborador colaborador) {
        if (colaborador == null) {
            return null;
        }

        Empresa empresa = colaborador.getEmpresa();
        Integer empresaId = null;
        String empresaNombre = null;

        if (empresa != null) {
            empresaId = empresa.getIdEmpresa();
            empresaNombre = empresa.getNombre();
        }


        Long idColaborador = null;
        if (colaborador.getIdColaborador() != null) {
            idColaborador = colaborador.getIdColaborador().longValue();
        }

        return new ColaboradorDTO(
                idColaborador,
                colaborador.getNombre(),
                colaborador.getEmail(),
                colaborador.getRut(),
                colaborador.getCargo(),
                empresaId,
                empresaNombre
        );
    }

    // Getters y setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Integer getEmpresaId() {
        return empresaId;
    }

    public void setEmpresaId(Integer empresaId) {
        this.empresaId = empresaId;
    }

    public String getEmpresaNombre() {
        return empresaNombre;
    }

    public void setEmpresaNombre(String empresaNombre) {
        this.empresaNombre = empresaNombre;
    }
}