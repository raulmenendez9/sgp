package com.sisbam.sgp.entity.administration;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "funcion", catalog = "sgr")
public class Funcion {

	private static final long serialVersionUID = 1L;
	private int idFuncion;
	private String nombre;
	private String descripcion;
	
	
	public Funcion(){
		
	}
	
	
	public Funcion(int idFuncion, String nombre, String descripcion) {
		this.idFuncion = idFuncion;
		this.nombre = nombre;
		this.descripcion=descripcion;

	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "funcion_idFuncion_seq")
	@SequenceGenerator(name = "funcion_idFuncion_seq", sequenceName = "funcion_idFuncion_seq", allocationSize = 1)
	@Column(name = "idFuncion", unique = true, nullable = false)
	public int getIdFuncion() {
		return idFuncion;
	}

	public void setIdFuncion(int idFuncion) {
		this.idFuncion = idFuncion;
	}

	@Column(name = "nombre", nullable = false, length = 20)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name = "descripcion", nullable = false, length = 100)
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
