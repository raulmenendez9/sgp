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
import javax.persistence.Transient;

@Entity
@Table(name = "mensajes", catalog = "sgr")
public class Mensajes implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idMensaje;
	private Usuario usuarioRedactor;
	private Usuario usuarioDestino;
	private String mensaje;
	private Date fechaEnvio;
	private String asunto;
	
	public Mensajes(){
		
	}
	
	public Mensajes (int idMensaje, Usuario usuarioRedactor, Usuario usuarioDestino, String mensaje, Date fechaEnvio, String asunto) {
		this.idMensaje = idMensaje;
		this.usuarioRedactor = usuarioRedactor;
		this.usuarioDestino = usuarioDestino;
		this.mensaje = mensaje;
		this.fechaEnvio = fechaEnvio;
		this.asunto = asunto;
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
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mensajes_id_mensajes_seq")
	@SequenceGenerator(name = "mensajes_id_mensajes_seq", sequenceName = "mensajes_id_mensajes_seq", allocationSize = 1)
	@Column(name = "id_mensajes", unique = true, nullable = false)
	public int getIdMensaje() {
		return idMensaje;
	}
	
	public void setIdMensaje(int idMensaje) {
		this.idMensaje = idMensaje;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "usuarioRedactor", nullable = false)
	public Usuario getUsuarioRedactor() {
		return usuarioRedactor;
	}

	public void setUsuarioRedactor(Usuario usuarioRedactor) {
		this.usuarioRedactor = usuarioRedactor;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "usuarioDestino", nullable = false)
	public Usuario getUsuarioDestino() {
		return usuarioDestino;
	}

	public void setUsuarioDestino(Usuario usuarioDestino) {
		this.usuarioDestino = usuarioDestino;
	}

	@Column(name = "mensaje", nullable = false, length = 4096)
	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	@Column(name = "fechaEnvio", nullable = false)
	public Date getFechaEnvio() {
		return fechaEnvio;
	}

	public void setFechaEnvio(Date fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}
	
	@Column(name = "asunto", nullable = false, length = 64)
	public String getAsunto() {
		return asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	
	
	

	
	

}
