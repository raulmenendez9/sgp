package com.sisbam.sgp.entity.administration;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



@Entity
@Table(name = "estadoProyecto", catalog = "sgr")
public class EstadoProyecto implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idEstado;
	private String nombreEstado;
	
	
	public EstadoProyecto(){
		
	}
	
	
	public EstadoProyecto(int idEstado, String nombreEstado) {
		this.idEstado = idEstado;
		this.nombreEstado = nombreEstado;

	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "estadoProyecto_idEstado_seq")
	@SequenceGenerator(name = "estadoProyecto_idEstado_seq", sequenceName = "estadoProyecto_idEstado_seq", allocationSize = 1)
	@Column(name = "idEstado", unique = true, nullable = false)
	public int getIdEstado() {
		return idEstado;
	}

	public void setIdEstado(int idEstado) {
		this.idEstado = idEstado;
	}

	@Column(name = "nombreEstado", nullable = false, length = 20)
	public String getNombreEstado() {
		return nombreEstado;
	}

	public void setNombreEstado(String nombreEstado) {
		this.nombreEstado = nombreEstado;
	}

}
