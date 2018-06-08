package com.sisbam.sgp.entity.accounting;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "tipo_documento")
public class TipoDocumento implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idTipoDocumento;
	private String tipodoc;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tipodoc_id_tipodoc_seq")
	@SequenceGenerator(name = "tipodoc_id_tipodoc_seq", sequenceName = "tipodoc_id_tipodoc_seq", allocationSize = 1)
	@Column(name = "id_tipodocumento", unique = true, nullable = false)
	public int getIdTipoDocumento() {
		return idTipoDocumento;
	}
	public void setIdTipoDocumento(int idTipoDocumento) {
		this.idTipoDocumento = idTipoDocumento;
	}
	
	@Column(name = "tipo_docu", nullable = false)
	public String getTipodoc() {
		return tipodoc;
	}
	public void setTipodoc(String tipodoc) {
		this.tipodoc = tipodoc;
	}
	
	

}
