package com.sisbam.sisconta.entity.accounting;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "partidaxcuentaslist")
public class PartidaListCuentas {
	private int idPartidaXcuentasList;
	public Partida partida;
	public CuentaContable cuentaContable;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pxc_list_id_pxc_list_seq")
	@SequenceGenerator(name = "pxc_list_id_pxc_list_seq", sequenceName = "pxc_list_id_pxc_list_seq", allocationSize = 1)
	@Column(name = "id_pxc_list", unique = true, nullable = false)
	public int getIdPartidaXcuentasList() {
		return this.idPartidaXcuentasList;
	}
	
	public void setIdPartidaXcuentasList(int idPartidaXcuentasList) {
		this.idPartidaXcuentasList = idPartidaXcuentasList;
	}



	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_partida")
	public Partida getPartida() {
		return partida;
	}
	public void setPartida(Partida partida) {
		this.partida = partida;
	}
	
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_cuenta")
	public CuentaContable getCuentaContable() {
		return cuentaContable;
	}
	public void setCuentaContable(CuentaContable cuentaContable) {
		this.cuentaContable = cuentaContable;
	}
	

}
