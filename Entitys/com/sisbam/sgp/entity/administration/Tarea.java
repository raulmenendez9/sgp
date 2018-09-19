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
	private Date fechaInicio;
	private Date fechaFin;
	private int duracion;
	private String prioridad;
	private Recurso recurso;
	
	
	
	public Tarea() {
		
	}
	

	public Tarea(int idTarea, String nombre, String descripcion, Date fechaInicio, Date fechaFin, int duracion,
			String prioridad, Recurso recurso) {
	
		this.idTarea = idTarea;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.duracion = duracion;
		this.prioridad = prioridad;
		this.recurso = recurso;
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
	
	

	@Column(name = "nombre", nullable = false, length = 256)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre= nombre;
	}
	
	@Column(name = "descripcion", nullable = false, length = 256)
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion= descripcion;
	}
	
	
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "fechaInicio", nullable = false, length = 256)
	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "fechaFin", nullable = false, length = 256)
	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	
	

	@Column(name = "duracion", nullable = false, length = 256)
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion= duracion;
	}
	
	
	
	@Column(name = "prioridad", nullable = false, length = 50)
	public String getPrioridad() {
		return prioridad;
	}
	public void setPrioridad(String prioridad) {
		this.prioridad= prioridad;
	}
	
	
	

	

	}
	
	
