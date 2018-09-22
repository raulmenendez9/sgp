package com.sisbam.sgp.entity.administration;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "actividad", catalog = "sgp")
public class Actividad {
	private static final long serialVersionUID = 1L;
	private int idActividad;
	private String nombre;
	private String descripcion;
	
	@Transient
	private Tarea tarea;
	
     public Actividad() {
		
	  }	
	
	public Actividad(int idActividad, String nombre, String descripcion, Tarea tarea) {
		
		this.idActividad = idActividad;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.tarea = tarea;
	}
	
	@Transient
	private int idTarea;

	@Transient
	public int getIdTarea() {
		return idTarea;
	}

	@Transient
	public void setIdTarea(int idTarea) {
		this.idTarea = idTarea;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "actividad_idactividad_seq")
	@SequenceGenerator(name = "actividad_idactividad_seq", sequenceName = "actividad_idactividad_seq", allocationSize = 1)
	@Column(name = "idactividad", unique = true, nullable = false)
	public int getIdActividad() {
		return idActividad;
	}
	
	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idTarea")
	public Tarea getTarea() {
		return this.tarea;
	}

	public void setTarea(Tarea tarea) {
		this.tarea = tarea;
	}

	@Column(name = "nombre", nullable = false, length = 50)
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name = "descripcion", nullable = true, length = 100)
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
