package com.sisbam.sgp.entity.administration;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "especificacionProyecto", catalog = "sgr")
public class EspecificacionProyecto implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idEspecificacion;
	private int cantidadRegistro;

	
	public EspecificacionProyecto(){
		
	}
	

	public EspecificacionProyecto(int idEspecificacion, int cantidadRegistro) {
		this.idEspecificacion = idEspecificacion;
		this.cantidadRegistro = cantidadRegistro;

	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "especificacionProyecto_idEspecificacion_seq")
	@SequenceGenerator(name = "especificacionProyecto_idEspecificacion_seq", sequenceName = "especificacionProyecto_idEspecificacion_seq", allocationSize = 1)
	@Column(name = "idEspecificacion", unique = true, nullable = false)
	public int getIdEspecificacion() {
		return idEspecificacion;
	}

	public void setIdEspecificacion(int idEspecificacion) {
		this.idEspecificacion = idEspecificacion;
	}

	@Column(name = "cantidadRegistro", nullable = false)
	public int getCantidadRegistro() {
		return cantidadRegistro;
	}

	public void setCantidadRegistro(int cantidadRegistro) {
		this.cantidadRegistro = cantidadRegistro;
	}

	
}