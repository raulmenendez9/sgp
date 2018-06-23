package com.sisbam.sgp.entity.administration;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "tipoProyecto", catalog = "sgr")

public class TipoProyecto implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idTipoProyecto;
	private String nombre;
	
	public TipoProyecto() {
		
	}
	
	public TipoProyecto(int idTipoProyecto, String nombre) {
		this.idTipoProyecto = idTipoProyecto;
		this.nombre = nombre;
		
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tipoProyecto_idTipoProyecto_seq")
	@SequenceGenerator(name = "tipoProyecto_idTipoProyecto_seq", sequenceName = "tipoProyecto_idTipoProyecto_seq", allocationSize = 1)
	@Column(name = "idTipoProyecto", unique = true, nullable = false)
	public int getIdTipoProyecto() {
		return idTipoProyecto;
	}

	public void setIdTipoProyecto(int idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}

	@Column(name = "nombre", nullable = false, length = 50)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	
}
