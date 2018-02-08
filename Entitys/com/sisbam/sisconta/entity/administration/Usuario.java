package com.sisbam.sisconta.entity.administration;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.sisbam.sisconta.entity.security.Rol;

@Entity
@Table(name = "usuario")
public class Usuario implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idUsuario;
	private Rol rol;
	private String username;
	private String password;
	private boolean activo;
	//private Empresa empresa;
	private Empleado empleado;

	public Usuario(int idUsuario, String username, String password, boolean activo,/* Empresa empresa,*/ Empleado empleado) {
		this.idUsuario = idUsuario;
		this.username = username;
		this.password = password;
		this.activo = activo;
		//this.empresa = empresa;
		this.empleado = empleado;
		// this.idRol = idRol;
	}
	
	@Transient
	private int idEmpleado;
	
	
	
	@Transient
	public int getIdEmpleado() {
		return idEmpleado;
	}
	@Transient
	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	@Transient
	private int idRol;

	@Transient
	public int getIdRol() {
		return idRol;
	}

	@Transient
	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}
		

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "usuario_id_usuario_seq")
	@SequenceGenerator(name = "usuario_id_usuario_seq", sequenceName = "usuario_id_usuario_seq", allocationSize = 1)
	@Column(name = "id_usuario", unique = true, nullable = false)
	public int getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_rol")
	public Rol getRol() {
		return this.rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}
	
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_empleado")
	public Empleado getEmpleado() {
		return empleado;
	}
	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}
	
	@Column(name = "username", nullable = false, length = 256)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 256)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "activo", nullable = false)
	public boolean isActivo() {
		return this.activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	
	public Usuario() {
	}

	
}
