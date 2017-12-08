package com.sisbam.sisconta.entity.security;

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
@Table(name = "vista", catalog = "sisconta")
public class Vista {
	private int idVista;
	
	private String url;
	private String icon;
	
//	private boolean C = false;
//	private boolean R = false;
//	private boolean U = false;
//	private boolean D = false;
	private Menu menu;
	
	
	private String nombre;
	
	@Column(name = "nombre", nullable = true, length = 32)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	@Transient
	private int idMenu;

	@Transient
	public int getIdMenu() {
		return idMenu;
	}

	@Transient
	public void setIdMenu(int idMenu) {
		this.idMenu = idMenu;
	}
	
	public Vista() {
	}
//	public Vista(int idVista, String url, String icon, boolean c, boolean r, boolean u, boolean d) {
//		this.idVista = idVista;
//		this.url = url;
//		this.icon = icon;
//		C = c;
//		R = r;
//		U = u;
//		D = d;
//	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_menu")
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "vista_id_vista_seq")
	@SequenceGenerator(name = "vista_id_vista_seq", sequenceName = "vista_id_vista_seq", allocationSize = 1)
	@Column(name = "id_vista", unique = true, nullable = false)
	public int getIdVista() {
		return idVista;
	}
	public void setIdVista(int idVista) {
		this.idVista = idVista;
	}
	
	@Column(name = "url", nullable = false, length = 256)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "icono", nullable = false, length = 256)
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
//	@Column(name = "c", nullable = false)
//	public boolean isC() {
//		return C;
//	}
//	public void setC(boolean c) {
//		C = c;
//	}
//	@Column(name = "r", nullable = false)
//	public boolean isR() {
//		return R;
//	}
//	public void setR(boolean r) {
//		R = r;
//	}
//	
//	@Column(name = "u", nullable = false)
//	public boolean isU() {
//		return U;
//	}
//	public void setU(boolean u) {
//		U = u;
//	}
//	
//	@Column(name = "d", nullable = false)
//	public boolean isD() {
//		return D;
//	}
//	public void setD(boolean d) {
//		D = d;
//	}
	
	
}
