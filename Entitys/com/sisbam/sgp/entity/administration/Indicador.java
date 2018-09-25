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
@Table(name = "indicador", catalog = "sgp")
public class Indicador implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	private int idIndicador;
	private String nombre;
	private String descripcion;

	
	private Proyecto proyecto;
	
	@Transient
	private VariableImpacto variableImpacto;
	
	public Indicador() {
		
	}
	
	public Indicador(int idIndicador, String nombre,String descripcion,Proyecto proyecto, VariableImpacto variableImpacto) {
		this.idIndicador = idIndicador;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.proyecto = proyecto;
		this.variableImpacto = variableImpacto;
		
	
	}
	
	@Transient
	private int codProyecto;

	@Transient
	public int getCodProyecto() {
		return codProyecto;
	}

	@Transient
	public void setCodProyecto(int codProyecto) {
		this.codProyecto = codProyecto;
	}
	
	
	@Transient
	private int idVariableImpacto;

	@Transient
	public int getIdVariableImpacto() {
		return idVariableImpacto;
	}

	@Transient
	public void setIdVariableImpacto(int idVariableImpacto) {
		this.idVariableImpacto = idVariableImpacto;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "indicador_idindicador_seq")
	@SequenceGenerator(name = "indicador_idindicador_seq", sequenceName = "indicador_idindicador_seq", allocationSize = 1)
	@Column(name = "idindicador", unique = true, nullable = false)
	public int getIdIndicador() {
		return idIndicador;
	}
	public void setIdIndicador(int idIndicador) {
		this.idIndicador = idIndicador;
	}
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "codProyecto")
	public Proyecto getProyecto() {
		return this.proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idVariableImpacto")
	public VariableImpacto getVariableImpacto() {
		return this.variableImpacto;
	}

	public void setVariableImpacto(VariableImpacto variableImpacto ) {
		this.variableImpacto = variableImpacto;
	}

	
	
	
	@Column(name = "nombre", nullable = false, length = 256)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name = "descripcion", nullable = false, length = 256)
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	

	}
	
	
