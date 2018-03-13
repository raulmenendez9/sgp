package com.sisbam.sisconta.entity.accounting;
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
@Table(name = "cuentacontable", catalog = "sgr")
public class CuentaContable implements java.io.Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idCuentaContable;
	private String codigo;
	private String nombre;
	private Date fechaModificacion;
	private Double saldoDeudor =0.0;
	private Double saldoAcreedor=0.0;
	private CuentaContable cuentaPadre;
	private String description;
	
	

	public CuentaContable()
	{
		
	}
	
	public CuentaContable(String nombre, String codigo,String descripcion,CuentaContable cuentaPadre,Double saldoAcreedor,Double saldoDeudor)
	{
		
		
		java.util.Date fecha=new Date();
		
		this.codigo=codigo;
		this.nombre=nombre;
		this.description=descripcion;
		this.cuentaPadre=cuentaPadre; 
		this.fechaModificacion= fecha;
		this.saldoAcreedor=saldoAcreedor;
		this.saldoDeudor=saldoDeudor;
	}
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CuentaContable_id_CuentaContable_seq")
	@SequenceGenerator(name = "CuentaContable_id_CuentaContable_seq", sequenceName = "CuentaContable_id_CuentaContable_seq", allocationSize = 1)
	@Column(name = "id_CuentaContable", unique = true, nullable = false)
	public int getIdCuentaContable() {
		return idCuentaContable;
	}
	
	public void setIdCuentaContable(int idCuentaContable) {
		this.idCuentaContable = idCuentaContable;
	}
	

	@Column(name = "codigo",unique=true, nullable = false, length = 100)
	public String getCodigo() {
		return codigo;
	}
	
	
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	@Column(name = "nombre", nullable = false, length = 256)
	public String getNombre() {
		return nombre;
	}
	
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	@Column(name = "fecha", nullable = true)
	public Date getFechaModificacion() {
		return fechaModificacion;
	}
	
	public void setFechaModificacion(Date fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	@Column(name = "SaldoDeudor", nullable = true)
	public Double getSaldoDeudor() {
		return saldoDeudor;
	}
	public void setSaldoDeudor(Double saldoDeudor) {
		this.saldoDeudor = saldoDeudor;
	}
	
	@Column(name = "SaldoAcreedor", nullable = true)
	public Double getSaldoAcreedor() {
		return saldoAcreedor;
	}
	
	public void setSaldoAcreedor(Double saldoAcreedor) {
		this.saldoAcreedor = saldoAcreedor;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_cuentaPadre", nullable=true)
	public CuentaContable getCuentaPadre() {
		return cuentaPadre;
	}
	
	public void setCuentaPadre(CuentaContable cuentaPadre) {
		this.cuentaPadre = cuentaPadre;
	}
	
	@Column(name = "descripcion", nullable = true, length = 512)
	public String getDescription() {
		return description;
	}
	
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	

}
