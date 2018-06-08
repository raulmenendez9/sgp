package com.sisbam.sgp.entity.security;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "bitacora")
public class Bitacora {
	private int 	idBitacora;
	private Date 	fecha;
	private String 	accion;
	private String 	username;
	private String 	tabla;
	private String  linea;
	
	

	public Bitacora(int idBitacora, Date fecha, String accion, String username, String tabla) {
		super();
		this.idBitacora = idBitacora;
		this.fecha = fecha;
		this.accion = accion;
		this.username = username;
		this.tabla = tabla;
	}
	
	public Bitacora() {
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "bitacora_id_bitacora_seq")
	@SequenceGenerator(name = "bitacora_id_bitacora_seq", sequenceName = "bitacora_id_bitacora_seq", allocationSize = 1)
	@Column(name = "id_bitacora", unique = true, nullable = false)
	public int getIdBitacora() {
		return idBitacora;
	}
	
	public void setIdBitacora(int idBitacora) {
		this.idBitacora = idBitacora;
	}
	
	@Column(name = "fecha")
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	@Column(name = "accion", nullable = false, length = 256)
	public String getAccion() {
		return accion;
	}
	public void setAccion(String accion) {
		this.accion = accion;
	}
	
	@Column(name = "username", nullable = false, length = 64)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name = "tabla", nullable = false, length = 256)
	public String getTabla() {
		return tabla;
	}
	public void setTabla(String tabla) {
		this.tabla = tabla;
	}
	
	@Column(name = "linea", nullable = false, length = 1024)
	public String getLinea() {
		return linea;
	}

	public void setLinea(String linea) {
		this.linea = linea;
	}

}
