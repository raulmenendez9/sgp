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

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "solicitud", catalog = "sgp")
public class Solicitud implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	private int codSolicitud;
	private String titulo;
//	private Proyecto codProyecto;
	private boolean estado=false;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	private Date fecha;
	private String justificacion;
	private String objeto;

	
	@Transient
	private Usuario usuario;
	
	
	public Solicitud() {}
	
	public Solicitud(int codSolicitud, String titulo,Usuario usuario, boolean estado, String justificacion,String objeto,Date fecha) {
		this.codSolicitud = codSolicitud;
		this.titulo= titulo;
		this.usuario = usuario;
	//	this.codProyecto = codProyecto;
		this.estado = estado;
		this.justificacion = justificacion;
		this.objeto = objeto;
		this.fecha = fecha;
	}
	
	@Transient
	private int idUsuario;

	@Transient
	public int getIdUsuario() {
		return idUsuario;
	}

	@Transient
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "solicitud_codsolicitud_seq")
	@SequenceGenerator(name = "solicitud_codsolicitud_seq", sequenceName = "solicitud_codsolicitud_seq", allocationSize = 1)
	@Column(name = "codsoliciutud", unique = true, nullable = false)
	public int getCodSolicitud() {
		return codSolicitud;
	}
	public void setCodSolicitud(int codSolicitud) {
		this.codSolicitud = codSolicitud;
	}
	//@Transient
	//private Usuario idUsuario;
	
	//@Transient
	//private int usuario;

	//public int getUsuario() {
	//	return usuario;
	//}

	/*public void setUsuario(int usuario) {
		this.usuario = usuario;
	}*/

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idUsuario")
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}


	@Column(name = "estado", nullable = false, length = 256)
	public boolean isEstado() {
		return estado;
	}
	
	
	/*
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "codProyecto")
	public Proyecto getCodProyecto() {
		return codProyecto;
	}
	
	public void setCodProyecto(Proyecto codProyecto) {
		this.codProyecto = codProyecto;
	}
	*/
	
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "fecha", nullable = false, length = 256)
	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	@Column(name = "justificacion", nullable = false, length = 256)
	public String getJustificacion() {
		return justificacion;
	}
	public void setJustificacion(String justificacion) {
		this.justificacion = justificacion;
	}
	
	@Column(name = "objetivo", nullable = false, length = 256)
	public String getObjeto() {
		return objeto;
	}
	public void setObjeto(String objeto) {
		this.objeto = objeto;
	}
	@Column(name="Titulo", nullable= false, length = 256)
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo= titulo;
	}
	

	}
	
	
