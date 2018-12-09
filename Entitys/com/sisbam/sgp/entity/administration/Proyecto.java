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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "proyecto", catalog = "sgp")
public class Proyecto implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	private int codProyecto;
	private String ambitoImpacto;
	private Date fechaInicio;
	private Date fechaFin;
	private String tipoFinanciamiento;
	private float montoAprobado;
	private String patrocinadores;
	private String resumen;
	private String planteamiento;
	private String antecedentes;
	private String metodologia;
	private int duracion;
	private boolean habilitado;
	//
	private String objeitovG;
	private String objetivoE1;
	private String objetivoE2;
	private String objetivoE3;
	private String objetivoE4;
	private String objetivoE5;
	private String medidaSostenibilidad;
	//
	private Solicitud solicitud;
	
	public Proyecto() {
		
	}
		
	public Proyecto(int codProyecto, String ambitoImpacto, Date fechaInicio, Date fechaFin, int duracion, String tipoFinanciamiento,
			float montoAprobado, String patrocinadores, String resumen, String planteamiento, String antecedentes,
			String metodologia, Solicitud solicitud, String objetivoG,String objetivoE1,String objetivoE2,String objetivoE3,String objetivoE4,String objetivoE5,String medidaSostenibilidad, boolean habilitado) {
	
		this.objeitovG=objetivoG;
		this.objetivoE1=objetivoE1;
		this.objetivoE2=objetivoE2;
		this.objetivoE3=objetivoE3;
		this.objetivoE4=objetivoE4;
		this.objetivoE5=objetivoE5;
		this.medidaSostenibilidad=medidaSostenibilidad;
		this.codProyecto = codProyecto;
		this.ambitoImpacto = ambitoImpacto;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.duracion=duracion;
		this.tipoFinanciamiento = tipoFinanciamiento;
		this.montoAprobado = montoAprobado;
		this.patrocinadores = patrocinadores;
		this.resumen = resumen;
		this.planteamiento = planteamiento;
		this.antecedentes = antecedentes;
		this.metodologia = metodologia;
		this.solicitud = solicitud;
		this.habilitado = true;
	}

	@Transient
	private int codSolictud;

	@Transient
	public int getcodSolicitud() {
		return codSolictud;
	}

	@Transient
	public void setcodSolicitud(int codSolictud) {
		this.codSolictud = codSolictud;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "proyecto_codproyecto_seq")
	@SequenceGenerator(name = "proyecto_codproyecto_seq", sequenceName = "proyecto_codproyecto_seq", allocationSize = 1)
	@Column(name = "codproyecto", unique = true, nullable = false)
	public int getCodProyecto() {
		return codProyecto;
	}
	public void setCodProyecto(int codProyecto) {
		this.codProyecto = codProyecto;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "codSolicitud")
	public Solicitud getSolicitud() {
		return this.solicitud;
	}

	public void setSolicitud(Solicitud solicitud ) {
		this.solicitud = solicitud;
	}

	@Column(name = "ambitoImpacto", nullable = false, length = 256)
	public String getAmbitoImpacto() {
		return ambitoImpacto;
	}
	
	public void setAmbitoImpacto(String ambitoImpacto) {
		this.ambitoImpacto= ambitoImpacto;
	}
		
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "fechaInicio", nullable = false, length = 256)
	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
		
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "fechaFin", nullable = false, length = 256)
	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
		
	@Column(name = "duracion", nullable = false, length = 256)
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion= duracion;
	}
		
	//
	@Column(name = "habilitado", nullable = false)
	public boolean isHabilitado() {
		return habilitado;
	}

	public void setHabilitado(boolean habilitado) {
		this.habilitado = habilitado;
	}
	
	 //
	
	@Column(name = "tipoFinanciamiento", nullable = false, length = 256)
	public String getTipoFinanciamiento() {
		return tipoFinanciamiento;
	}

	public void setTipoFinanciamiento(String tipoFinanciamiento) {
		this.tipoFinanciamiento= tipoFinanciamiento;
	}
		
	@Column(name = "montoAprobado", nullable = false, length = 256)
	public Float getMontoAprobado() {
		return montoAprobado;
	}
	public void setMontoAprobado(Float montoAprobado) {
		this.montoAprobado= montoAprobado;
	}
		
	@Column(name = "patrocinadores", nullable = true, length = 256)
	public String getPatrocinadores() {
		return patrocinadores;
	}
	public void setPatrocinadores(String patrocinadores) {
		this.patrocinadores= patrocinadores;
	}
		
	@Column(name = "resumen", nullable = true, length = 256)
	public String getResumen() {
		return resumen;
	}
	
	public void setResumen(String resumen) {
		this.resumen= resumen;
	}
	
	@Column(name = "planteamiento", nullable = true, length = 256)
	public String getPlanteamiento() {
		return planteamiento;
	}
	
	public void setPlanteamiento(String planteamiento) {
		this.planteamiento= planteamiento;
	}
	
	
	@Column(name = "antecedentes", nullable = true, length = 256)
	public String getAntecedentes() {
		return antecedentes;
	}
	
	public void setAntecedentes(String antecedentes) {
		this.antecedentes= antecedentes;
	}
	
	@Column(name = "metodologia", nullable = true, length = 256)
	public String getMetodologia() {
		return metodologia;
	}
	
	public void setMetodologia(String metodologia) {
		this.metodologia= metodologia;
	}

	@Column(name = "objGeneral", nullable = false, length = 256)
	public String getObjeitovG() {
		return objeitovG;
	}

	public void setObjeitovG(String objeitovG) {
		this.objeitovG = objeitovG;
	}

	@Column(name = "objEsp1", nullable = false, length = 256)
	public String getObjetivoE1() {
		return objetivoE1;
	}

	
	public void setObjetivoE1(String objetivoE1) {
		this.objetivoE1 = objetivoE1;
	}

	@Column(name = "objEsp2", nullable = false, length = 256)
	public String getObjetivoE2() {
		return objetivoE2;
	}

	public void setObjetivoE2(String objetivoE2) {
		this.objetivoE2 = objetivoE2;
	}
	@Column(name = "objEsp3", nullable = false, length = 256)
	public String getObjetivoE3() {
		return objetivoE3;
	}
	
	public void setObjetivoE3(String objetivoE3) {
		this.objetivoE3 = objetivoE3;
	}

	@Column(name = "objEsp4", nullable = true, length = 256)
	public String getObjetivoE4() {
		return objetivoE4;
	}

	public void setObjetivoE4(String objetivoE4) {
		this.objetivoE4 = objetivoE4;
	}
	@Column(name = "objEsp5", nullable = true, length = 256)
	public String getObjetivoE5() {
		return objetivoE5;
	}

	public void setObjetivoE5(String objetivoE5) {
		this.objetivoE5 = objetivoE5;
	}

	@Column(name = "medidas", nullable = true, length = 256)
	public String getMedidaSostenibilidad() {
		return medidaSostenibilidad;
	}

	public void setMedidaSostenibilidad(String medidaSostenibilidad) {
		this.medidaSostenibilidad = medidaSostenibilidad;
	}
	
}
	
	
