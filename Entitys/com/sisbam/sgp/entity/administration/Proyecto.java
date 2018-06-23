package com.sisbam.sgp.entity.administration;


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

import org.hibernate.type.DateType;



@Entity
@Table(name = "proyecto", catalog = "sgr")
public class Proyecto implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String codProyecto;
	private String nombreProyecto;
	private DateType fechaInicio;
	private DateType fechaFin;
	private FormularioProyecto formularioProyecto;
	private EstadoProyecto estadoProyecto;
	
	public Proyecto(){
		
	}
	
	
	public Proyecto(String codProyecto,  String nombreProyecto, DateType fechaInicio, DateType fechaFin, FormularioProyecto formularioProyecto, EstadoProyecto estadoProyecto) {
		this.codProyecto = codProyecto;
		this.nombreProyecto = nombreProyecto;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.formularioProyecto = formularioProyecto;
		this.estadoProyecto = estadoProyecto;
	}
	

	@Transient
	private int idFormulario;
	@Transient
	public int getIdFormularioProyecto() {
		return idFormulario;
	}
	@Transient
	public void setIdFormularioProyecto(int idFormulario) {
		this.idFormulario = idFormulario;
	}
	
	


	@Transient
	private int idEstado;
	@Transient
	public int getIdEstadoProyecto() {
		return idEstado;
	}
	@Transient
	public void setIdEstadoProyecto(int idEstado) {
		this.idEstado = idEstado;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "proyecto_codProyecto")
	@SequenceGenerator(name = "proyecto_codProyecto", sequenceName = "proyecto_codProyecto", allocationSize = 1)
	@Column(name = "codProyecto", unique = true, nullable = false)
	public String getcodProyecto() {
		return codProyecto;
	}

	public void setcodProyecto(String codProyecto) {
		this.codProyecto = codProyecto;
	}

	@Column(name = "nombreProyecto", nullable = false, length = 50)
	public String getnombreProyecto() {
		return nombreProyecto;
	}

	public void setnombreProyecto(String nombreProyecto) {
		this.nombreProyecto = nombreProyecto;
	}

	@Column(name = "fechaInicio", nullable = false)
	public DateType getfechaInicio() {
		return fechaInicio;
	}

	public void setfechaInicio(DateType fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	@Column(name = "fechaFin", nullable = false)
	public DateType getfechaFin() {
		return fechaFin;
	}

	public void setfechaFin(DateType fechaFin) {
		this.fechaFin = fechaFin;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idFormulario")
	public FormularioProyecto getFormularioProyecto() {
		return formularioProyecto;
	}

	public void setFormularioProyecto(FormularioProyecto formularioProyecto) {
		this.formularioProyecto = formularioProyecto;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idEstado")
	public EstadoProyecto getEstadoProyecto() {
		return estadoProyecto;
	}

	public void setEstadoProyecto(EstadoProyecto estadoProyecto) {
		this.estadoProyecto = estadoProyecto;
	}

}
