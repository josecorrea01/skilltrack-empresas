package com.jcorrea.skilltrack_empresas.dto;

import com.jcorrea.skilltrack_empresas.model.Empresa;

public class EmpresaDTO {

    private Integer id;
    private String nombre;
    private String rubro;
    private String ciudad;
    private String emailContacto;

    public EmpresaDTO() {
    }

    public EmpresaDTO(Integer id, String nombre, String rubro, String ciudad, String emailContacto) {
        this.id = id;
        this.nombre = nombre;
        this.rubro = rubro;
        this.ciudad = ciudad;
        this.emailContacto = emailContacto;
    }

    public static EmpresaDTO fromEntity(Empresa empresa) {
        if (empresa == null) {
            return null;
        }
        return new EmpresaDTO(
                empresa.getIdEmpresa(),
                empresa.getNombre(),
                empresa.getRubro(),
                empresa.getCiudad(),
                empresa.getEmailContacto()
        );
    }

    // Getters y setters

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEmailContacto() {
        return emailContacto;
    }

    public void setEmailContacto(String emailContacto) {
        this.emailContacto = emailContacto;
    }
}