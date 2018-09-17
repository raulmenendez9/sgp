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


@Entity
@Table(name = "recurso", catalog = "sgp")
public class Recurso implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	private int idRecurso;
	private String nombre;
	private String email;
	
	@Transient
	private Funcion funcion;
	
	
     public Recurso() {
		
	  }
	
	
	public Recurso(int idRecurso, String nombre, String email, Funcion funcion) {
		
		this.idRecurso = idRecurso;
		this.nombre = nombre;
		this.email = email;
		this.funcion = funcion;
	}
	
	@Transient
	private int idFuncion;

	@Transient
	public int getIdFuncion() {
		return idFuncion;
	}

	@Transient
	public void setIdFuncion(int idFuncion) {
		this.idFuncion = idFuncion;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "recurso_idrecurso_seq")
	@SequenceGenerator(name = "recurso_idrecurso_seq", sequenceName = "recurso_idrecurso_seq", allocationSize = 1)
	@Column(name = "idrecurso", unique = true, nullable = false)
	public int getIdRecurso() {
		return idRecurso;
	}
	public void setIdRecurso(int idRecurso) {
		this.idRecurso = idRecurso;
	}
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idFuncion")
	public Funcion getFuncion() {
		return this.funcion;
	}

	public void setFuncion(Funcion funcion) {
		this.funcion = funcion;
	}


	@Column(name = "nombre", nullable = false, length = 256)
	public String getNombre() {
		return nombre;
	}
	
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
	@Column(name = "email", nullable = true, length = 256)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

	}
	
	

