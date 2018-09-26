package com.sisbam.sgp.entity.administration;



import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "tarea", catalog = "sgp")
public class Tarea implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	private int idTarea;
	private String nombre;
	private String descripcion;
	private Recurso recurso;
	private Actividad actividad;
	
	public Tarea() {
		
	}
		

 
   
	public Tarea(int idTarea, String nombre, String descripcion, Recurso recurso) {
	
		this.idTarea = idTarea;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.recurso = recurso;
	}



	@Transient
	private int idActividad;

	@Transient
	public int getIdActividad() {
		return idActividad;
	}

	@Transient
	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}
	

	
	@Transient
	private int idRecurso;

	@Transient
	public int getIdRecurso() {
		return idRecurso;
	}

	@Transient
	public void setIdRecurso(int idRecurso) {
		this.idRecurso = idRecurso;
	}
	

		
	

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tarea_idtarea_seq")
	@SequenceGenerator(name = "tarea_idtarea_seq", sequenceName = "tarea_idtarea_seq", allocationSize = 1)
	@Column(name = "idtarea", unique = true, nullable = false)
	public int getIdTarea() {
		return idTarea;
	}
	public void setIdTarea(int idTarea) {
		this.idTarea = idTarea;
	}
	
	
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idRecurso")
	public Recurso getRecurso() {
		return this.recurso;
	}

	public void setRecurso(Recurso recurso ) {
		this.recurso = recurso;
	}
	
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idActividad")
	public Actividad getActividad() {
		return this.actividad;
	}

	public void setActividad(Actividad actividad ) {
		this.actividad = actividad;
	}
	
	

	@Column(name = "nombre", nullable = false, length = 256)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre= nombre;
	}
	
	
	@Column(name = "descripcion", nullable = true, length = 256)
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion= descripcion;
	}
	
	
	
	}
	
	
