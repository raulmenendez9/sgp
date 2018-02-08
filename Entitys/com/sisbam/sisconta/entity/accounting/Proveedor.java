package com.sisbam.sisconta.entity.accounting;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "proveedor")
public class Proveedor implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idProveedor;
	private String nombreProveedor;
	private String numeroRegistro;
	//por ahorita 
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "proveedor_id_proveedor_seq")
	@SequenceGenerator(name = "proveedor_id_proveedor_seq", sequenceName = "proveedor_id_proveedor_seq", allocationSize = 1)
	@Column(name = "id_proveedor", unique = true, nullable = false)
	public int getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}
	
	
	@Column(name = "nombre_proveedor", nullable = false, length = 64)
	public String getNombreProveedor() {
		return nombreProveedor;
	}
	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}
	
	
	@Column(name = "numero_registro", nullable = false, length = 32)
	public String getNumeroRegistro() {
		return numeroRegistro;
	}
	public void setNumeroRegistro(String numeroRegistro) {
		this.numeroRegistro = numeroRegistro;
	}
	
	
	
	
	

}
