package com.sisbam.sgp.entity.security;

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
import javax.persistence.Transient;


@Entity
@Table(name = "permisos", catalog = "sgp")
public class Permisos {
	
private int idPermisos;

private boolean C = false;
private boolean R = false;
private boolean U = false;
private boolean D = false;

private Vista vista;
private Rol rol;


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
//***************************
@Transient
private int idVista;
@Transient
public int getIdVista() {
	return idVista;
}
@Transient
public void setIdVista(int idVista) {
	this.idVista = idVista;
}
//*************************
@Id
@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "permiso_id_permiso_seq")
@SequenceGenerator(name = "permiso_id_permiso_seq", sequenceName = "permiso_id_permiso_seq", allocationSize = 1)
@Column(name = "id_permiso", unique = true, nullable = false)
public int getIdPermisos() {
	return idPermisos;
}
public void setIdPermisos(int idPermisos) {
	this.idPermisos = idPermisos;
}
@Column(name = "c", nullable = false)
public boolean isC() {
	return C;
}
public void setC(boolean c) {
	C = c;
}
@Column(name = "r", nullable = false)
public boolean isR() {
	return R;
}
public void setR(boolean r) {
	R = r;
}

@Column(name = "u", nullable = false)
public boolean isU() {
	return U;
}
public void setU(boolean u) {
	U = u;
}

@Column(name = "d", nullable = false)
public boolean isD() {
	return D;
}
public void setD(boolean d) {
	D = d;
}
@ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name = "id_vista")
public Vista getVista() {
	return vista;
}
public void setVista(Vista vista) {
	this.vista = vista;
}

@ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name = "id_rol")
public Rol getRol() {
	return rol;
}
public void setRol(Rol rol) {
	this.rol = rol;
}
public Permisos() {
}


}
