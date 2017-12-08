package com.sisbam.sisconta.entity.administration;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "empleado", catalog = "sgr")

public class Empleado implements java.io.Serializable{
	private int idEmpleado;
	private Empresa empresa;
	private String nombre;
	private String apellidos;
	private String puesto;
	
	public Empleado()
	{
	}
	public Empleado(int idEmpleado, Empresa empresa, String nombre, String apellidos, String puesto) {
	
		this.idEmpleado = idEmpleado;
		this.empresa = empresa;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.puesto = puesto;
	}

	@Transient
	private int idEmpresa;
	@Transient
	public int getIdEmpresa() {
		return idEmpresa;
	}
	@Transient
	public void setIdEmpresa(int idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "empleado_id_empleado_seq")
	@SequenceGenerator(name = "empleado_id_empleado_seq", sequenceName = "empleado_id_empleado_seq", allocationSize = 1)
	@Column(name = "id_empleado", unique = true, nullable = false)
	public int getIdEmpleado() {
		return idEmpleado;
	}

	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_empresa")
	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	@Column(name = "nombre", nullable = false, length = 100)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "apellidos", nullable = false, length = 100)
	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	@Column(name = "puesto", nullable = false, length = 100)
	public String getPuesto() {
		return puesto;
	}

	public void setPuesto(String puesto) {
		this.puesto = puesto;
	}

	
}
