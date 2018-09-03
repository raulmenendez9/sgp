package com.sisbam.sgp.entity.administration;


import javax.management.Query;
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

import org.hibernate.type.DateType;



@Entity
@Table(name = "proyecto", catalog = "sgr")
public class Proyecto implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer codProyecto;
	private Solicitud solicitud;
	private TipoProyecto tipoProyecto;
	private String ambitoImpacto;
	private DateType fechaInicio;
	private DateType fechaFin;
	private String tipoFinanciamiento;
	private Float montoAprobado;
	private String patrocinadores;
	private String resumen;
	private String planteamiento;
	private String antecedentes;
	private String metodologia;
	private Usuario usuario;
	
	private boolean estado=true;
	private FormularioProyecto formularioProyecto;

	private Integer duracion;
	
	
	public Proyecto() {
		
	}
	
	public Proyecto(Integer codProyecto, Solicitud solicitud, TipoProyecto tipoProyecto, Usuario usuario, String ambitoImpacto,
			DateType fechaInicio, DateType fechaFin, String tipoFinanciamiento, Float montoAprobado,
			String patrocinadores, String resumen, String planteamiento, String antecedentes, String metodologia,
			FormularioProyecto formularioProyecto, boolean estado, Integer duracion) {
		
		this.codProyecto = codProyecto;
		this.solicitud = solicitud;
		this.tipoProyecto = tipoProyecto;
		this.usuario=usuario;
		this.ambitoImpacto = ambitoImpacto;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.tipoFinanciamiento = tipoFinanciamiento;
		this.montoAprobado = montoAprobado;
		this.patrocinadores = patrocinadores;
		this.resumen = resumen;
		this.planteamiento = planteamiento;
		this.antecedentes = antecedentes;
		this.metodologia = metodologia;
		this.formularioProyecto = formularioProyecto;
		this.estado = estado;
		this.duracion=duracion;
		
	}


	@Transient
	private int idSolicitud;
	@Transient
	public int getIdSolicitud() {
		return idSolicitud;
	}
	@Transient
	public void setIdSolicitud(int idSolicitud) {
		this.idSolicitud = idSolicitud;
	}


	@Transient
	private int idTipoProyecto;
	@Transient
	public int getIdTipoProyecto() {
		return idTipoProyecto;
	}
	@Transient
	public void setIdTipoProyecto(int idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
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
	

	

	
	

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "proyecto_codProyecto")
	@SequenceGenerator(name = "proyecto_codProyecto", sequenceName = "proyecto_codProyecto", allocationSize = 1)
	@Column(name = "codProyecto", unique = true, nullable = false)
	public Integer getCodProyecto() {
		return codProyecto;
	}

	public void setCodProyecto(Integer codProyecto) {
		this.codProyecto = codProyecto;
	}
	

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idSolicitud")
	public Solicitud getSolicitud() {
		return solicitud;
	}

    public void setSolicitud(Solicitud solicitud) {
		this.solicitud = solicitud;
	}
	

  
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idTipoProyecto")
	public TipoProyecto getTipoProyecto() {
		return tipoProyecto;
	}

    public void setTipoProyecto(TipoProyecto tipoProyecto) {
		this.tipoProyecto = tipoProyecto;
	}
	
	
    @Column(name = "ambitoImpacto", nullable = true, length = 500)
	public String getAmbitoImpacto() {
		return ambitoImpacto;
	}

	public void setAmbitoImpacto(String ambitoImpacto) {
		this.ambitoImpacto = ambitoImpacto;
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
    
    
	@Column(name = "tipoFinanciamiento", nullable = true, length = 50)
	public String getTipoFinanciamiento() {
		return tipoFinanciamiento;
	}

	public void setTipoFinanciamiento(String tipoFinanciamiento) {
		this.tipoFinanciamiento = tipoFinanciamiento;
	}

	
	@Column(name = "montoAprobado", nullable = false)
	public Float getMontoAprobado() {
		return montoAprobado;
	}

	public void setMontoAprobado(Float montoAprobado) {
		this.montoAprobado = montoAprobado;
	}
	
	@Column(name = "patrocinadores", nullable = true, length = 500)
	public String getPatrocinadores() {
		return patrocinadores;
	}

	public void setPatrocinadores(String patrocinadores) {
		this.patrocinadores = patrocinadores;
	}
	
	
	@Column(name = "resumen", nullable = true, length = 500)
	public String getResumen() {
		return resumen;
	}

	public void setResumen(String resumen) {
		this.resumen = resumen;
	}

	
	@Column(name = "planteamiento", nullable = true, length = 500)
	public String getPlanteamiento() {
		return planteamiento;
	}

	public void setPlanteamiento(String planteamiento) {
		this.planteamiento = planteamiento;
	}
	
	
	@Column(name = "antecedentes", nullable = true, length = 500)
	public String getAntecedentes() {
		return antecedentes;
	}

	public void setAntecedentes(String antecedentes) {
		this.antecedentes = antecedentes;
	}
	
	
	@Column(name = "metodologia", nullable = true, length = 500)
	public String getMetodologia() {
		return metodologia;
	}

	public void setMetodologia(String metodologia) {
		this.metodologia = metodologia;
	}
	
	
	@Column(name = "duracion", nullable = false)
	public Integer getDuracion() {
		return duracion;
	}

	public void setDuracion(Integer duracion) {
		this.duracion = duracion;
	}
	
	
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idFormulario")
	public FormularioProyecto getTipoFormularioProyecto() {
		return formularioProyecto;
	}

    public void setTipoFormularioProyecto(FormularioProyecto formularioProyecto) {
		this.formularioProyecto = formularioProyecto;
	}
	
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idUsuario")
	public Usuario getUsuario() {
		return usuario;
	}

    public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
    
    
	
	@Column(name = "estado", nullable = false)
	public boolean getEstadoProyecto() {
		return estado;
	}

    public void setEstadoProyecto(boolean estado) {
		this.estado = estado;
	}
    
    
   
	
	
}
	

