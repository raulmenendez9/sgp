package com.sisbam.sisconta.entity.accounting;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "compra")
public class Compra implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int 	idCompra;
	private Date fechaEmision;
	private String numeroComprovante;
	private boolean exenta=false;
	private boolean interna=true;
	private boolean importacion=false;
	private Double totalCompra;
	private TipoDocumento tipodocumento;

	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "compra_id_compra_seq")
	@SequenceGenerator(name = "compra_id_compra_seq", sequenceName = "compra_id_compra_seq", allocationSize = 1)
	@Column(name = "id_compra", unique = true, nullable = false)
	public int getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
	}
	
	@Column(name="fecha_emision",nullable=false)
	public Date getFechaEmision() {
		return fechaEmision;
	}
	public void setFechaEmision(Date fechaEmision) {
		this.fechaEmision = fechaEmision;
	}
	
	@Column(name="numero_comprovante",nullable=false,length=32)
	public String getNumeroComprovante() {
		return numeroComprovante;
	}
	public void setNumeroComprovante(String numeroComprovante) {
		this.numeroComprovante = numeroComprovante;
	}
	
	
	@Column(name="es_exenta",nullable=true)
	public boolean isExenta() {
		return exenta;
	}
	
	public void setExenta(boolean exenta) {
		this.exenta = exenta;
	}
	
	@Column(name="es_interna",nullable=true)
	public boolean isInterna() {
		return interna;
	}
	public void setInterna(boolean interna) {
		this.interna = interna;
	}
	
	@Column(name="es_importacion",nullable=true)
	public boolean isImportacion() {
		return importacion;
	}
	public void setImportacion(boolean importacion) {
		this.importacion = importacion;
	}
	
	
	@Column(name="total_compra",nullable=true)
	public Double getTotalCompra() {
		return totalCompra;
	}
	public void setTotalCompra(Double totalCompra) {
		this.totalCompra = totalCompra;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_tipodocumento")
	public TipoDocumento getTipodocumento() {
		return tipodocumento;
	}
	public void setTipodocumento(TipoDocumento tipodocumento) {
		this.tipodocumento = tipodocumento;
	}
	
	
	

}
