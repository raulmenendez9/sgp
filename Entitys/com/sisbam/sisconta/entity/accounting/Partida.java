package com.sisbam.sisconta.entity.accounting;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "partida")
public class Partida implements java.io.Serializable{

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int idPartida;
	
	private String descripcion;
	private Date fecha;
	private String tipoDePartida;
	private String mesAtrabajar;
	
	
	private Double saldoAcreedor=0.0;
	private Double saldoDeudor=0.0;
	
	public Set<CuentaContable> SET_DIARIO_PARTIDA_x_CUENTACONTABLE;

	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "partida_id_partida_seq")
	@SequenceGenerator(name = "partida_id_partida_seq", sequenceName = "partida_id_partida_seq", allocationSize = 1)
	@Column(name = "id_partida", unique = false, nullable = false)
	public int getIdPartida() {
		return idPartida;
	}

	public void setIdPartida(int idPartida) {
		this.idPartida = idPartida;
	}
	
	public Partida() {	}

	@Column(name = "descripcion", nullable = false, length = 1024)
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

	@Column(name = "tipo_partida", nullable = false, length = 32)
	public String getTipoDePartida() {
		return tipoDePartida;
	}

	public void setTipoDePartida(String tipoDePartida) {
		this.tipoDePartida = tipoDePartida;
	}

	@Column(name = "mes_a_trabajar", nullable = false, length = 32)
	public String getMesAtrabajar() {
		return mesAtrabajar;
	}

	public void setMesAtrabajar(String mesAtrabajar) {
		this.mesAtrabajar = mesAtrabajar;
	}

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

	

	@ManyToMany
	@JoinTable(name="SET_DIARIO_PARTIDA_x_CUENTACONTABLE")
	public Set<CuentaContable> getSET_DIARIO_PARTIDA_x_CUENTACONTABLE() {
		return SET_DIARIO_PARTIDA_x_CUENTACONTABLE;
	}

	public void setSET_DIARIO_PARTIDA_x_CUENTACONTABLE(Set<CuentaContable> sET_DIARIO_PARTIDA_x_CUENTACONTABLE) {
		SET_DIARIO_PARTIDA_x_CUENTACONTABLE = sET_DIARIO_PARTIDA_x_CUENTACONTABLE;
	}

	
	
	
}
