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
@Table(name = "variableImpacto", catalog = "sgp")
public class VariableImpacto implements java.io.Serializable {
	
	
	private static final long serialVersionUID = 1L;
	private int idVariableImpacto;
	private String nomVariable;
	private String descripcion;
	
	public VariableImpacto() {}
	
	public VariableImpacto(int idVariableImpacto, String nomVariable, String descripcion) {
		super();
		this.idVariableImpacto = idVariableImpacto;
		this.nomVariable = nomVariable;
		this.descripcion = descripcion;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "variableImpacto_idVariableImpacto_seq")
	@SequenceGenerator(name = "variableImpacto_idVariableImpacto_seq", sequenceName = "variableImpacto_idVariableImpacto_seq", allocationSize = 1)
	@Column(name = "idVariableImpacto", unique = true, nullable = false)

	public int getidVariableImpacto() {
		return idVariableImpacto;
	}

	public void setidVariableImpacto(int idVariableImpacto) {
		this.idVariableImpacto = idVariableImpacto;
	}
	
	@Column(name = "nomVariable", nullable = false, length = 25)

	public String getNomVariable() {
		return nomVariable;
	}

	public void setNomVariable(String nomVariable) {
		this.nomVariable = nomVariable;
	}
	
	@Column(name = "descripcion", nullable = false, length = 1500)

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}