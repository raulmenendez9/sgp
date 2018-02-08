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
@Table(name = "producto")
public class Producto implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int 	idProducto;
	private int 	cantidad;
	private String 	nombre;
	private String 	descripcion;
	private Double 	precioCompra;
	private Double 	precioVenta;
	private Date   	ultimaModificacion;
	private Proveedor proveedor;
	//porahora
	
	
	@Transient
	private int idProveedor;
	

	@Transient
	public int getIdProveedor() {
		return idProveedor;
	}

	@Transient
	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "producto_id_producto_seq")
	@SequenceGenerator(name = "producto_id_producto_seq", sequenceName = "producto_id_producto_seq", allocationSize = 1)
	@Column(name = "id_producto", unique = true, nullable = false)
	public int getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	
	@Column(name = "cantidad", nullable = true)
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	@Column(name = "nombre", nullable = false,length=128)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name = "descripcion", nullable = false,length=1024)
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Column(name = "p_compra", nullable = false)
	public Double getPrecioCompra() {
		return precioCompra;
	}
	public void setPrecioCompra(Double precioCompra) {
		this.precioCompra = precioCompra;
	}
	
	@Column(name = "p_venta", nullable = false)
	public Double getPrecioVenta() {
		return precioVenta;
	}
	public void setPrecioVenta(Double precioVenta) {
		this.precioVenta = precioVenta;
	}
	
	@Column(name = "ultima_modificacion", nullable = false)
	public Date getUltimaModificacion() {
		return ultimaModificacion;
	}
	public void setUltimaModificacion(Date ultimaModificacion) {
		this.ultimaModificacion = ultimaModificacion;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_proveedor")
	public Proveedor getProveedor() {
		return proveedor;
	}
	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}
	
	
	
	
	
}
