package com.sisbam.sgp.entity.security;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "menu", catalog = "sgp")
public class Menu {
	private int id;
	private String nombre;
	private String icono;
	private List<Vista> vistas = new ArrayList<Vista>();
	private Boolean activo;
	
	   
	public Set<Rol> rolset;
	   
    @ManyToMany(mappedBy="menuset")
	public Set<Rol> getRolset() {
		return rolset;
	}
	public void setRolset(Set<Rol> rolset) {
		this.rolset = rolset;
	}
	
	public Menu() {
	}
	public Menu(int id, String nombre, String icono, List<Vista> vistas) {
		this.id = id;
		this.nombre = nombre;
		this.icono = icono;
		this.vistas = vistas;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "menu_id_menu_seq")
	@SequenceGenerator(name = "menu_id_menu_seq", sequenceName = "menu_id_menu_seq", allocationSize = 1)
	@Column(name = "id_menu", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "menu", cascade = CascadeType.REMOVE)
	public List<Vista> getVistas() {
		return vistas;
	}
	public void setVistas(List<Vista> vistas) {
		this.vistas = vistas;
	}
	
	@Column(name = "nombre", nullable = false, length = 32)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name = "icono", nullable = false, length = 128)
	public String getIcono() {
		return icono;
	}
	public void setIcono(String icono) {
		this.icono = icono;
	}
	
	@Column(name = "activo", nullable = true)
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	
	
}
