package com.sisbam.sisconta.entity.administration;
import java.beans.Transient;
import java.util.Date;

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
@Table(name = "cuentacontable", catalog = "sgr")
public class CuentaContable implements java.io.Serializable{
	
	
	private int idCuentaContable;
	private String codigo;
	private String nombre;
	private Date fechaModificacion;
	private Double saldoDeudor;
	private Double saldoAcreedor;
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
	

	@Column(name = "codigo", nullable = false, length = 100)
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
	@Column(name = "fecha", nullable = false)
	public Date getFechaModificacion() {
		return fechaModificacion;
	}
	
	public void setFechaModificacion(Date fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	@Column(name = "SaldoDeudor", nullable = false)
	public Double getSaldoDeudor() {
		return saldoDeudor;
	}
	public void setSaldoDeudor(Double saldoDeudor) {
		this.saldoDeudor = saldoDeudor;
	}
	
	@Column(name = "SaldoAcreedor", nullable = false)
	public Double getSaldoAcreedor() {
		return saldoAcreedor;
	}
	
	public void setSaldoAcreedor(Double saldoAcreedor) {
		this.saldoAcreedor = saldoAcreedor;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_cuentaPadre", nullable=false)
	public CuentaContable getCuentaPadre() {
		return cuentaPadre;
	}
	
	public void setCuentaPadre(CuentaContable cuentaPadre) {
		this.cuentaPadre = cuentaPadre;
	}
	
	@Column(name = "descripcion", nullable = false, length = 512)
	public String getDescription() {
		return description;
	}
	
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	

}
