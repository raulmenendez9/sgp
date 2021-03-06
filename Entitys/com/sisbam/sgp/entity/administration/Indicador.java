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
	private float indicadorR;
	private float datoa;
	private float datob;
	private float datoc;
	private float datod;
	private float indicadorReal;
	
	private Proyecto proyecto;
	
	@Transient
	private VariableImpacto variableImpacto;
	
	private VariableImpacto variableImpacto2;
	
	public Indicador() {
		
	}
	
	public Indicador(int idIndicador, String nombre,String descripcion,Proyecto proyecto, VariableImpacto variableImpacto,VariableImpacto variableImpacto2, 
			float indicadorR, float datoa, float datob, float indicadorReal, float datoc, float datod) {
		this.idIndicador = idIndicador;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.proyecto = proyecto;
		this.variableImpacto = variableImpacto;
		this.variableImpacto2 = variableImpacto2;
		this.indicadorR = indicadorR;
		this.datoa = datoa;
		this.datob = datob;
		this.datoc = 0;
		this.datod =0;
		this.indicadorReal = 0;
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
	
	@Transient
	private int idVariableImpacto2;

	@Transient
	public int getIdVariableImpacto2() {
		return idVariableImpacto2;
	}

	@Transient
	public void setIdVariableImpacto2(int idVariableImpacto2) {
		this.idVariableImpacto2 = idVariableImpacto2;
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


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idVariableImpacto2")
	public VariableImpacto getVariableImpacto2() {
		return variableImpacto2;
	}

	public void setVariableImpacto2(VariableImpacto variableImpacto2) {
		this.variableImpacto2 = variableImpacto2;
	}

	@Column(name = "indicadorReal", nullable = false)
	public float getIndicadorR() {
		return indicadorR;
	}

	public void setIndicadorR(float indicadorR) {
		this.indicadorR = indicadorR;
	}

	@Column(name = "datoa", nullable = false)
	public float getDatoa() {
		return datoa;
	}

	public void setDatoa(float datoa) {
		this.datoa = datoa;
	}
	@Column(name = "datob", nullable = false)
	public float getDatob() {
		return datob;
	}

	public void setDatob(float datob) {
		this.datob = datob;
	}

	@Column(name = "datoc", nullable = false)
	public float getDatoc() {
		return datoc;
	}

	public void setDatoc(float datoc) {
		this.datoc = datoc;
	}

	@Column(name = "datod", nullable = false)
	public float getDatod() {
		return datod;
	}

	public void setDatod(float datod) {
		this.datod = datod;
	}

	@Column(name = "indicadorIdeal", nullable = false)
	public float getIndicadorReal() {
		return indicadorReal;
	}

	public void setIndicadorReal(float indicadorReal) {
		this.indicadorReal = indicadorReal;
	}
	
	

	}
	
	
