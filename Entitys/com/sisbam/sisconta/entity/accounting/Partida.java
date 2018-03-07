package com.sisbam.sisconta.entity.accounting;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "partida")
public class Partida implements java.io.Serializable{
	
	
	private static final long serialVersionUID = 1L;
	private int idPartida;
	private List<CuentaContable> cuentas;
	private String descripcion;
	private Date fecha;
	private String tipoDePartida;
	private String mesAtrabajar;
	
	
	private Double saldoAcreedor;
	private Double saldoDeudor;
	
	
	
	@Column(name = "sa", nullable = false)
	public Double getSaldoAcreedor() {
		return saldoAcreedor;
	}

	public void setSaldoAcreedor(Double saldoAcreedor) {
		this.saldoAcreedor = saldoAcreedor;
	}

	@Column(name = "sd", nullable = false)
	public Double getSaldoDeudor() {
		return saldoDeudor;
	}

	public void setSaldoDeudor(Double saldoDeudor) {
		this.saldoDeudor = saldoDeudor;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "partida_id_partida_seq")
	@SequenceGenerator(name = "partida_id_partida_seq", sequenceName = "partida_id_partida_seq", allocationSize = 1)
	@Column(name = "id_partida", unique = true, nullable = false)
	public int getIdPartida() {
		return this.idPartida;
	}

	public void setIdPartida(int idPartida) {
		this.idPartida = idPartida;
	}

	
	@OneToMany( targetEntity=CuentaContable.class )
	public List<CuentaContable> getCuentas() {
		return cuentas;
	}

	public void setCuentas(List<CuentaContable> cuentas) {
		this.cuentas = cuentas;
	}

	@Column(name = "descripcion", nullable = false, length = 128)
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	
	@Column(name = "fecha", nullable = false)
	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Column(name = "tipo_de_partida", nullable = false, length = 64)
	public String getTipoDePartida() {
		return tipoDePartida;
	}

	public void setTipoDePartida(String tipoDePartida) {
		this.tipoDePartida = tipoDePartida;
	}

	@Column(name = "mes_a_trabajar", nullable = false, length = 64)
	public String getMesAtrabajar() {
		return mesAtrabajar;
	}

	public void setMesAtrabajar(String mesAtrabajar) {
		this.mesAtrabajar = mesAtrabajar;
	}
	
	
	
	
	
	

}
