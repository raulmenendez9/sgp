package com.sisbam.sisconta.entity.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "rol", catalog = "sisconta")
public class Rol implements java.io.Serializable {

	private Integer idRol;
	private String nombre;
	private String descripcion;
	private boolean activo;
	
    public Set<Menu> menuset;

   
    @ManyToMany
    @JoinTable(name="menuset")
	public Set<Menu> getMenuset() {
		return menuset;
	}

	public void setMenuset(Set<Menu> menuset) {
		this.menuset = menuset;
	}

	public Rol() {
	}

	public Rol(Integer idRol, String nombre, String descripcion, boolean activo) {
		this.idRol = idRol;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.activo = activo;
	}

	
	

	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "rol_id_rol_seq")
    @SequenceGenerator(name = "rol_id_rol_seq",
            sequenceName = "rol_id_rol_seq", allocationSize = 1)
	@Column(name = "id_rol", unique = true, nullable = false)
	public Integer getIdRol() {
		return this.idRol;
	}

	public void setIdRol(Integer idRol) {
		this.idRol = idRol;
	}

	@Column(name = "nombre", nullable = false, length = 50)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "descripcion", nullable = true, length = 512)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "activo", nullable = false)
	public boolean isActivo() {
		return this.activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

}
