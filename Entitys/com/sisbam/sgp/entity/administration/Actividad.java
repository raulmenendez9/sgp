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
	private Proyecto proyecto;
	
	
	
	
     public Actividad() {
		
	  }	
	
	public Actividad(int idActividad, String nombre, String descripcion, Proyecto proyecto) {
		
		this.idActividad = idActividad;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.proyecto = proyecto;
	}
	
	@Transient
	private int codProyecto;

	@Transient
	public int getCodProyecto() {
		return codProyecto;
	}

	@Transient
	public void setCodProyecto(int codProyecto) {
		this.codProyecto = codProyecto;
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
	@JoinColumn(name = "codPoyecto")
	public Proyecto getProyecto() {
		return this.proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
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
