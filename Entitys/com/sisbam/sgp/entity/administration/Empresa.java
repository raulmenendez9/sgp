package com.sisbam.sgp.entity.administration;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "empresa", catalog = "sgr")
public class Empresa implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idEmpresa;
	private String nombre;
	private String politicas;
	private String objetivos;
	private String alcance;
	
	public Empresa(){
		
	}
	
	
	public Empresa(int idEmpresa, String nombre, String politicas, String objetivos, String alcance) {
		this.idEmpresa = idEmpresa;
		this.nombre = nombre;
		this.politicas = politicas;
		this.objetivos = objetivos;
		this.alcance = alcance;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "empresa_id_empresa_seq")
	@SequenceGenerator(name = "empresa_id_empresa_seq", sequenceName = "empresa_id_empresa_seq", allocationSize = 1)
	@Column(name = "id_empresa", unique = true, nullable = false)
	public int getIdEmpresa() {
		return idEmpresa;
	}

	public void setIdEmpresa(int idEmpresa) {
		this.idEmpresa = idEmpresa;
	}

	@Column(name = "nombre", nullable = false, length = 100)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "politicas", nullable = false, length = 254)
	public String getPoliticas() {
		return politicas;
	}

	public void setPoliticas(String politicas) {
		this.politicas = politicas;
	}

	@Column(name = "objetivos", nullable = false, length = 254)
	public String getObjetivos() {
		return objetivos;
	}

	public void setObjetivos(String objetivos) {
		this.objetivos = objetivos;
	}

	@Column(name = "alcance", nullable = false, length = 254)
	public String getAlcance() {
		return alcance;
	}

	public void setAlcance(String alcance) {
		this.alcance = alcance;
	}
	
	
	

	
	

}
