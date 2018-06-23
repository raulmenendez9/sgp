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

@Entity
@Table(name = "formularioProyecto", catalog = "sgr")



public class FormularioProyecto implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idFormulario;
	private EspecificacionProyecto especificacionProyecto;
	private String justificacion;
	private String objetivoEspecifico;
	private String lineaBase;
	private String estrategiaImplementacion;
	private String estrategiaInstitucionalizacion;
	private String objetivoGeneral;
	private String planteamientoSocial;
	
	public FormularioProyecto()
	{
	}
	public FormularioProyecto(int idFormulario, EspecificacionProyecto especificacionProyecto,
			String justificacion, String objetivoEspecifico, String lineaBase, String estrategiaImplementacion, 
			String estrategiaInstitucionalizacion, String objetivoGeneral, String planteamientoSocial) {
	
		this.idFormulario = idFormulario;
		this.especificacionProyecto = especificacionProyecto;
		this.justificacion = justificacion;
		this.objetivoEspecifico = objetivoEspecifico;
		this.lineaBase = lineaBase;
		this.estrategiaImplementacion = estrategiaImplementacion;
		this.estrategiaInstitucionalizacion = estrategiaInstitucionalizacion;
		this.objetivoGeneral = objetivoGeneral;
		this.planteamientoSocial = planteamientoSocial;
	}

	@Transient
	private int idEspecificacionProyecto;
	@Transient
	public int getIdEspecificacionProyecto() {
		return idEspecificacionProyecto;
	}
	@Transient
	public void setIdEspecificacionProyecto(int idEspecificacionProyecto) {
		this.idEspecificacionProyecto = idEspecificacionProyecto;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "formularioProyecto_idFormulario_seq")
	@SequenceGenerator(name = "formularioProyecto_idFormulario_seq", sequenceName = "formularioProyecto_idFormulario_seq", allocationSize = 1)
	@Column(name = "idFormulario", unique = true, nullable = false)
	public int getIdFormularioProyecto() {
		return idFormulario;
	}

	public void setIdFormularioProyecto(int idFormulario) {
		this.idFormulario = idFormulario;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idEspecificacion")
	
	public EspecificacionProyecto getEspecificacionProyecto() {
		return especificacionProyecto;
	}

	public void setEspecificacionProyecto(EspecificacionProyecto especificacionProyecto) {
		this.especificacionProyecto = especificacionProyecto;
	}

	@Column(name = "justificacion", nullable = false, length = 50)
	public String getJustificacion() {
		return justificacion;
	}

	public void setJustificacion(String justificacion) {
		this.justificacion = justificacion;
	}

	@Column(name = "objetivoEspecifico", nullable = false, length = 50)
	public String getObjetivoEspecifico() {
		return objetivoEspecifico;
	}

	public void setObjetivoEspecifico(String objetivoEspecifico) {
		this.objetivoEspecifico = objetivoEspecifico;
	}

	@Column(name = "lineaBase", nullable = false, length = 50)
	public String getLineaBase() {
		return lineaBase;
	}

	public void setLineaBase(String lineaBase) {
		this.lineaBase = lineaBase;
	}
	
	@Column(name = "estrategiaImplementacion", nullable = false, length = 50)
	public String getEstrategiaImplementacion() {
		return estrategiaImplementacion;
	}

	public void setEstrategiaImplementacion(String estrategiaImplementacion) {
		this.estrategiaImplementacion = estrategiaImplementacion;
	}
	
	@Column(name = "estrategiaInstitucionalizacion", nullable = false, length = 50)
	public String getEstrategiaInstitucionalizacion() {
		return estrategiaInstitucionalizacion;
	}

	public void setEstrategiaInstitucionalizacion(String estrategiaInstitucionalizacion) {
		this.estrategiaInstitucionalizacion = estrategiaInstitucionalizacion;
	}
	
	@Column(name = "objetivoGeneral", nullable = false, length = 50)
	public String getObjetivoGeneral() {
		return objetivoGeneral;
	}

	public void setObjetivoGeneral(String objetivoGeneral) {
		this.objetivoGeneral = objetivoGeneral;
	}
	
	@Column(name = "planteamientoSocial", nullable = false, length = 50)
	public String getPlanteamientoSocial() {
		return planteamientoSocial;
	}

	public void setPlanteamientoSocial(String planteamientoSocial) {
		this.planteamientoSocial = planteamientoSocial;
	}




	
}

	
	
	

