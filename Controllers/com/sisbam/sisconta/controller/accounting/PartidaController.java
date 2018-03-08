package com.sisbam.sisconta.controller.accounting;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibm.icu.util.BytesTrie.Iterator;
import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.accounting.CuentaContable;
import com.sisbam.sisconta.entity.accounting.Partida;
import com.sisbam.sisconta.entity.security.Permisos;

@Controller
public class PartidaController{

	
	/*
	 * Variable usada como un servicio que provee los metodos necesarios
	 * para la realizacion de un CRUD. 
	*/
	@Autowired
	private DaoImp manage_entity;
	
	private String path ="Accounting/Partida/";
	
	private Permisos permisos;
	 
	
	/*
	 * value = "/Usuarioes" => URL.
	 * method = RequestMethod.GET => metodos: GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS, TRACE.
	 * */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		String retorno = "403";
		ObtenerPermisosPorUrl obtener = new ObtenerPermisosPorUrl();
		this.permisos = obtener.Obtener("/sisconta/partidas", request, manage_entity);
		
//*************CARGAR BOTONES PERMITIDOS******************
		model.addAttribute("create",permisos.isC());
		model.addAttribute("read",	permisos.isR());
		model.addAttribute("update",permisos.isU());
		model.addAttribute("delete",permisos.isD());
//**********************************************************
		
		
			if(permisos.isR()) {
			Partida partida = new Partida();
			model.addAttribute("partidaForm", partida);
			model.addAttribute("paratida", null);
			
			List<Partida> partidas = (List<Partida>) this.manage_entity.getAll(Partida.class.getName());
			model.addAttribute("partidas", partidas);
			retorno = path+"partidas";
			}
			
			return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas/add", method = RequestMethod.GET)
	public String addPartida(Model model, HttpServletRequest request) throws ClassNotFoundException  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			
			Partida partida = new Partida();
			model.addAttribute("partidaForm", partida);
			model.addAttribute("partida", null);
			retorno = path+"partida-form";
		}
		return retorno;
		
	}
	
	@RequestMapping(value = "/partidasadd", method = RequestMethod.POST)
	public String saveOrUpadateUsuario(@ModelAttribute("partidaForm") Partida partidaRecibido,
			HttpServletRequest request) throws ClassNotFoundException {
		if (permisos.isC() || permisos.isU()) {

			Partida partida = partidaRecibido;

			if (partida.getIdPartida() == 0) {
				manage_entity.save(Partida.class.getName(), partida);
			}
			else {
				manage_entity.update(Partida.class.getName(), partida);
			}
			return "redirect:/usuarios";
		}
		return "403";
	}
	
	@RequestMapping(value = "/partidas/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String partidaId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		if(permisos.isU()) {
		
		Partida partida = (Partida) manage_entity.getById(Partida.class.getName(), Integer.parseInt(partidaId));
		model.addAttribute("partida", partida);
		
		Partida partidaForm = new Partida();
		model.addAttribute("partidaForm", partidaForm);
		
		return path+"partida-form";
		}
		return "403";
	}
	
	/**
	 * Delete:
	 * Borra objetos de tipo usuario mediante un id enviado en la URL. 
	 */
	@RequestMapping(value = "/partidas/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String partidaId, Model model) throws ClassNotFoundException {
		if(permisos.isD()) {
		Partida partida = (Partida) manage_entity.getById(Partida.class.getName(), Integer.parseInt(partidaId));
		manage_entity.delete(Partida.class.getName(), partida);
		model.addAttribute("partida", partida);
		
		Partida partidaForm = new Partida();
		model.addAttribute("partidaForm", partidaForm);
		
		}
		return "redirect:/partidas";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas/procesarCuentas", method = RequestMethod.POST)
	public String procesarListaCuentas(Model model,HttpServletRequest request) throws ClassNotFoundException {
		HttpSession session = request.getSession();
		try {
		
		List<CuentaContable> listaCuentas;
		
		if(session.getAttribute("listaDeCuentasDiario")==null) {
			listaCuentas=new ArrayList<CuentaContable>();
		}
		else
		{
			listaCuentas=(List<CuentaContable>)session.getAttribute("listaDeCuentasDiario");
		}
		
		String cuenta=request.getParameter("cuenta-contable");
		
		
		String sd=request.getParameter("sd")!=null?request.getParameter("sd"):"0.00";
		String sa=request.getParameter("sa")!=null?request.getParameter("sa"):"0.00";
		
		
		String[] token = cuenta.split("-");
		String codigoCuenta = token[0];
		CuentaContable cc = new CuentaContable();
		cc = (CuentaContable) manage_entity.getByName(CuentaContable.class.getName(), "codigo", codigoCuenta);
		

		try {cc.setSaldoDeudor(Double.parseDouble(sd));} catch (Exception e) { cc.setSaldoDeudor(0.00);}
		try {cc.setSaldoAcreedor(Double.parseDouble(sa));} catch (Exception e) { cc.setSaldoAcreedor(0.00);}
		
		
		
		
		listaCuentas.add(cc);
		
		session.setAttribute("listaDeCuentasDiario", listaCuentas);
		
		
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return path+"listacuentas-form";
		}
		session= LlenarJSON(session);
		return path+"listacuentas-form";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas/mostrarCuentas", method = RequestMethod.GET)
	public String mostrarListaCuentas(Model model,HttpServletRequest request) throws ClassNotFoundException {
		HttpSession session = request.getSession();
		session= LlenarJSON(session);
		session = subtotal(session);
		return path+"listacuentas-form";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas/eliminar", method = RequestMethod.POST)
	public String eliminarCuentaEnListaCuentas(Model model,HttpServletRequest request) throws ClassNotFoundException {
		HttpSession session = request.getSession();
		List<CuentaContable> listaCuentas;
		String cuenta=request.getParameter("cuenta-contable");
		CuentaContable cc = new CuentaContable();
		
		
		cc = (CuentaContable) manage_entity.getByName(CuentaContable.class.getName(), "codigo", cuenta);
		
		if(session.getAttribute("listaDeCuentasDiario")==null) {
			listaCuentas=new ArrayList<CuentaContable>();
		}
		else
		{
			listaCuentas=(List<CuentaContable>)session.getAttribute("listaDeCuentasDiario");
		}
		
		int i=0;
		int x=0;
		
			for(CuentaContable cx : listaCuentas) {
				if(cx.getCodigo().trim().equals(cc.getCodigo().trim())) {
					x=i;
				}
				else {
					i++;
				}
			}
			
			listaCuentas.remove(x);
		
		
		session.setAttribute("listaDeCuentasDiario", listaCuentas);
		session = subtotal(session);
		return path+"listacuentas-form";
	}
	
	
	@SuppressWarnings("unchecked")
	public HttpSession LlenarJSON(HttpSession session) throws ClassNotFoundException {
	
	 if(session.getAttribute("objString")==null) {	
			 String sql = " select id_cuentacontable from cuentacontable " + 
						 " EXCEPT" + 
						 " select id_cuentapadre from cuentacontable where id_cuentapadre>0";
			 List<Integer> ctas = (List<Integer>) manage_entity.executeNativeQuery(sql);
			 JSONObject obj = new JSONObject();
			 
			 for(Integer cc : ctas) 
			 {
				 CuentaContable c = (CuentaContable) manage_entity.getById(CuentaContable.class.getName(), cc);
				 obj.put(""+c.getCodigo()+"-"+c.getNombre(), null);
			 }
			
			session.setAttribute("objString",obj.toJSONString()); 
	 }
	
	 
	session=subtotal(session);
	return session;
		
	}
	
	
	@SuppressWarnings("unchecked")
	public HttpSession subtotal(HttpSession session){
		
		List<CuentaContable> cc;
		Double acumA =0.00;
		Double acumD =0.00;
		if(session.getAttribute("listaDeCuentasDiario")==null) {
			session.removeAttribute("mensajeCuentasDiario");
			return session;
		}
		else {
			session.removeAttribute("mensajeCuentasDiario");
			cc=(List<CuentaContable> )session.getAttribute("listaDeCuentasDiario");
			for(CuentaContable cx:cc) {
				acumA=cx.getSaldoAcreedor()+acumA;
				acumD=cx.getSaldoDeudor()+acumD;
			}
			
			if(acumA==acumD) {
				session.setAttribute("mensajeCuentasDiario", "");
				session.setAttribute("totalAcreedor", acumA);
				session.setAttribute("totalDeudor", acumD);
				return session;
			}
			
			if(acumA>acumD) {
				session.setAttribute("mensajeCuentasDiario", "Acreedor mayor que deudor...");
				session.setAttribute("totalAcreedor", acumA);
				session.setAttribute("totalDeudor", acumD);
				return session;
			}
			
			if(acumA<acumD) {
				session.setAttribute("mensajeCuentasDiario", "Deudor mayor que acreedor...");
				session.setAttribute("totalAcreedor", acumA);
				session.setAttribute("totalDeudor", acumD);
				return session;
			}
		}
		
		return session;
	}
		
	
	
	
	
}
