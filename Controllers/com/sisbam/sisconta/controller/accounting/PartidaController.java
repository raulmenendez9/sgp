package com.sisbam.sisconta.controller.accounting;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.SysexMessage;
import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.jaxb.hbm.internal.ImplicitResultSetMappingDefinition;
import org.hibernate.dialect.CUBRIDDialect;
import org.hibernate.query.criteria.internal.predicate.IsEmptyPredicate;
import org.json.simple.JSONObject;
import org.mvel2.optimizers.impl.refl.nodes.ListAccessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
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
	private static final String IDENTIFICADOR = "partidasx23";
	
	private Permisos permisos = new Permisos();
	private DecimalFormat df = new DecimalFormat("#.00"); 
	
	/*
	 * value = "/Usuarioes" => URL.
	 * method = RequestMethod.GET => metodos: GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS, TRACE.
	 * */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) 
	{
		String retorno = "403";
		
			HttpSession session = request.getSession();
			ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
			session = facilitador.Obtener("/sisconta/partidas", request, manage_entity,IDENTIFICADOR);
			permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
				
		
			if(permisos.isR()) {
			Partida partida = new Partida();
			model.addAttribute("partidaForm", partida);
			model.addAttribute("paratida", null);
			
			System.out.println("//////////////////////CARGANDO LISTA DE PARTIDAS/////////////////////////");
			List<Partida> partidas = (List<Partida>) this.manage_entity.getAll(Partida.class.getName());
			System.out.println("/////////////////////////////////////////////////////////////////////////");
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
	public String saveOrUpadatePartida(@ModelAttribute("partidaForm") Partida partidaRecibido,
		HttpServletRequest request) throws ClassNotFoundException {
		HttpSession session = request.getSession();
		
		
		Set<CuentaContable> cuentas = new HashSet<CuentaContable>(ListarCuentas(session));
		partidaRecibido.setFecha(new Date());
		partidaRecibido.setSET_DIARIO_PARTIDA_x_CUENTACONTABLE(cuentas);
		
		HashMap< String, Object> mapa = SubTotal(ListarCuentas(session));
		
		partidaRecibido.setSaldoAcreedor((Double.parseDouble(df.format(Double.parseDouble(""+mapa.get("totalAcreedor"))))));
		partidaRecibido.setSaldoDeudor((Double.parseDouble(df.format(Double.parseDouble(""+mapa.get("totalAcreedor"))))));
		
		manage_entity.save(Partida.class.getName(), partidaRecibido);
		
		session.removeAttribute("listaDeCuentasDiario");
		
		return "redirect:/partidas/add";
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
	
	
	
	//TRATAMIENTO DE LISTA DE CUENTAS
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas/procesarCuentas", method = RequestMethod.POST)
	public String procesarListaCuentas(Model model,HttpServletRequest request) throws ClassNotFoundException {
		HttpSession session = request.getSession();
		try {
		
		//Obtener lista de cuentas	
		List<CuentaContable> listaCuentas = ListarCuentas(session);
		//Obntener la cuenta que se ingreso
		String cuenta=request.getParameter("cuenta-contable");
		//obtener saldo acreedor y deudor
		 
		String sd="0.00";
		String sa="0.00";
		try {sd=df.format(Double.parseDouble((request.getParameter("sd")!=null||!request.getParameter("sa").equals(""))?request.getParameter("sd").toString():"0.00"));}catch(Exception e) {sd="0.00";}
		try {sa=df.format(Double.parseDouble((request.getParameter("sa")!=null||!request.getParameter("sa").equals(""))?request.getParameter("sa").toString():"0.00"));}catch(Exception e) {sa="0.00";}
		
		
		
		//quitar a la cuenta el nombre, para solo quedarse con el codigo
		String[] token = cuenta.split("-");
		String codigoCuenta = token[0];
		CuentaContable cc = new CuentaContable();
		//buscar la cuenta con ese codigo en la base
		
		System.out.println("#########ESTA ESTA PERMITIDA#####################");
		cc = (CuentaContable) manage_entity.getByName(CuentaContable.class.getName(), "codigo", codigoCuenta);
		System.out.println("################################################");
		//si el codigo no se encuentra en la base es porque se ingresaron caracteres extranos o una cuenta invalida
		if(cc==null) {
			HashMap< String, Object> mapa = SubTotal(ListarCuentas(session));
			model.addAttribute("mensaje","Error, cuenta ingresada no existe");
			model.addAttribute("totalAcreedor",mapa.get("totalAcreedor"));
			model.addAttribute("totalDeudor",mapa.get("totalDeudor"));
			return path+"listacuentas-form";
		}
		
		//obtener la lista de cuentas hijas
		
		List<CuentaContable> listaHijas = ObtenerHIjas(session);
		//al objeto cuenta se le meten los saldos
		try {cc.setSaldoDeudor(Double.parseDouble(sd));} catch (Exception e) { cc.setSaldoDeudor(0.00);}
		try {cc.setSaldoAcreedor(Double.parseDouble(sa));} catch (Exception e) { cc.setSaldoAcreedor(0.00);}
		
		//si la cuenta existe en la lista de cuentas hijas se procede con normalidad si no muestra un mensaje
		if(ExisteElemento(listaHijas, cc)) {
			
				//validar si la cuenta ya existe en la lista
				
				if(ExisteElemento(listaCuentas, cc)) {
					HashMap< String, Object> mapa = SubTotal(ListarCuentas(session));
					model.addAttribute("mensaje","La cuenta: "+cc.getNombre()+" ya existe en la lista, no puede ser abonada o cargada 2 veces en un mismo asiento");
					model.addAttribute("totalAcreedor",mapa.get("totalAcreedor"));
					model.addAttribute("totalDeudor",mapa.get("totalDeudor"));
				}
				else{
					listaCuentas = AgregarElemento(listaCuentas, cc);
					HashMap< String, Object> mapa = SubTotal(listaCuentas);
					model.addAttribute("mensaje",mapa.get("mensaje"));
					model.addAttribute("totalAcreedor",mapa.get("totalAcreedor"));
					model.addAttribute("totalDeudor",mapa.get("totalDeudor"));
				}
		}
		else {
			model.addAttribute("mensaje","Error, cuenta ingresada no es valida para transacciones");
		}
		
		session.setAttribute("listaDeCuentasDiario", listaCuentas);
		
		}
		catch(Exception e) {
			System.out.println("ERROR LLENANDO LISTA "+e);
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
		HashMap< String, Object> mapa = SubTotal(ListarCuentas(session));
		model.addAttribute("mensaje",mapa.get("mensaje"));
		model.addAttribute("totalAcreedor",mapa.get("totalAcreedor"));
		model.addAttribute("totalDeudor",mapa.get("totalDeudor"));
		return path+"listacuentas-form";
	}
	
	/**
	 * 
	 * Elimina una cuenta obtenida en la vista
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ClassNotFoundException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partidas/eliminar", method = RequestMethod.POST)
	public String eliminarCuentaEnListaCuentas(Model model,HttpServletRequest request) throws ClassNotFoundException {
		HttpSession session = request.getSession();
		List<CuentaContable> listaCuentas = ListarCuentas(session);
		String cuenta=request.getParameter("cuenta-contable");
		CuentaContable cc = new CuentaContable();
		System.out.println("-----------OBTENER CUENTA APARTIR DE CODIGO----------");
		cc = (CuentaContable) manage_entity.getByName(CuentaContable.class.getName(), "codigo", cuenta);
		System.out.println("------------------------------------------------------");
		listaCuentas = EliminarElemento(listaCuentas, cc);
		HashMap< String, Object> mapa = SubTotal(ListarCuentas(session));
		model.addAttribute("mensaje",mapa.get("mensaje"));
		model.addAttribute("totalAcreedor",mapa.get("totalAcreedor"));
		model.addAttribute("totalDeudor",mapa.get("totalDeudor"));
		session.setAttribute("listaDeCuentasDiario", listaCuentas);
		return path+"listacuentas-form";
	}
	
	
	
	/**
	 * 
	 * Apartir de la sesion, llena la lista de cuentas hija
	 * disponibles para que el usuario escoja una tecleando el codigo
	 * 
	 * @param session
	 * @return
	 * @throws ClassNotFoundException
	 */
	@SuppressWarnings("unchecked")
	public HttpSession LlenarJSON(HttpSession session) throws ClassNotFoundException {
		if(session.getAttribute("objString")==null) {
			 String sql = " select id_cuentacontable from cuentacontable " + 
						 " EXCEPT" + 
						 " select id_cuentapadre from cuentacontable where id_cuentapadre>0";
			 List<Integer> ctas = (List<Integer>) manage_entity.executeNativeQuery(sql);
			 List<CuentaContable> cuentasHijas = new ArrayList<CuentaContable>();
			 JSONObject obj = new JSONObject();
			 
			 for(Integer cc : ctas) 
			 {
				 CuentaContable c = (CuentaContable) manage_entity.getById(CuentaContable.class.getName(), cc);
				 if(c!=null){
					 obj.put(""+c.getCodigo()+"-"+c.getNombre(), null);
					 cuentasHijas.add(c);
				 }
				 
			 }
			session.setAttribute("objString",obj.toJSONString()); 
		}
	return session;
		
	}
	
	
	
	
	/**
	 * 
	 * Apartir de la sesion obtiene la lista de cuentas que se han guardado en la sesion
	 * y las devuelve, validando que no vengan vacias
	 * 
	 * 
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CuentaContable> ListarCuentas(HttpSession session){
		List<CuentaContable> listaCuentas = null;
		try {
			
	
			if(session.getAttribute("listaDeCuentasDiario")==null) {
				listaCuentas=new ArrayList<CuentaContable>();
			}
			else
			{
				listaCuentas=(List<CuentaContable>)session.getAttribute("listaDeCuentasDiario");
			}
			
			return listaCuentas;
		}
		catch(Exception e) {
			System.err.println("ERROR ListarCuentas: "+e);
			return listaCuentas;
		}
		
	}
	
	
	/**
	 * 
	 * Toma una lista agarra los saldos y los suma
	 * despues devuelve un mapa con un mensaje y la suma de los saldos
	 * 
	 * @param listaCuentas
	 * @return HashMap<String,Object>
	 */
	public HashMap<String,Object> SubTotal(List<CuentaContable> listaCuentas){
		HashMap<String, Object> mapa = new HashMap<>();
		try {
		Double acumA =0.00;
		Double acumD =0.00;
		
		if(listaCuentas.isEmpty()) {
			mapa.put("mensaje", 		"");
			mapa.put("totalAcreedor",	df.format(acumA));
			mapa.put("totalDeudor",		df.format(acumD));
			System.out.println();
			
			return mapa;
		}
		
		for(CuentaContable cx:listaCuentas) {
			acumA=cx.getSaldoAcreedor()+acumA;
			acumD=cx.getSaldoDeudor()+acumD;
		}
		
		if(acumA>acumD) {
			mapa.put("mensaje", 		"Saldo acreedor es mayor que saldo deudor");
			mapa.put("totalAcreedor",	df.format(acumA));
			mapa.put("totalDeudor",		df.format(acumD));
			return mapa;
		}
		
		else if(acumA<acumD) {
			mapa.put("mensaje", 		"Saldo deudor es mayor que saldo acreedor");
			mapa.put("totalAcreedor",	df.format(acumA));
			mapa.put("totalDeudor",		df.format(acumD));
			return mapa;
		}
		
		else if(acumA.toString().equals(acumD.toString())) {
			mapa.put("mensaje", 		"");
			mapa.put("totalAcreedor",	df.format(acumA));
			mapa.put("totalDeudor",		df.format(acumD));
			return mapa;
		}
		
		}
		catch(Exception e) {
			System.err.println("ERROR SubTotal: "+e);
			mapa.put("mensaje", 		"");
			mapa.put("totalAcreedor",	"err");
			mapa.put("totalDeudor",		"err");
			return mapa;
		}
		return mapa;
	}
	
	
	/**
	 * Toma una cuenta contable y una lista de cuentas
	 * anade la cuenta a esta lista y la devuelve
	 * 
	 * @param listaCuentas
	 * @param cuenta
	 * @return listaCuentas
	 */
	public List<CuentaContable> AgregarElemento(List<CuentaContable> listaCuentas,CuentaContable cuenta){
		listaCuentas.add(cuenta);
		return listaCuentas;
	}
	
	
	
	/**
	 * 
	 * Toma una cuenta contable y una lista de cuentas
	 * elimina esta cuenta de la lista y 
	 * devuelve la nueva lista sin la cuenta que se selecciono
	 * 
	 * @param listaCuentas
	 * @param cuenta
	 * @return listaCuentas
	 */
	public List<CuentaContable> EliminarElemento(List<CuentaContable> listaCuentas,CuentaContable cuenta){
		int i=0;
		int x=0;
		
			for(CuentaContable cx : listaCuentas) {
				
				if(cx.getCodigo().trim().equals(cuenta.getCodigo().trim())) {
					x=i;
				}
				else {
					i++;
				}
			}
			listaCuentas.remove(x);
			return listaCuentas;
	}
	
	
	/**
	 * Verifica si un elemento existe en la lista de cuentas
	 * 
	 * @param listaCuentas
	 * @param cuenta
	 * @return true si existe, false si no existe
	 */
	public boolean ExisteElemento(List<CuentaContable> listaCuentas,CuentaContable cuenta) {
		
		if(listaCuentas.isEmpty()) {
			return false;
		}
		
			for(CuentaContable cx : listaCuentas) {
				if(cx.getCodigo().trim().equals(cuenta.getCodigo().trim())) {
					System.err.println("LA CUENTA :"+cx.getCodigo()+"ES IGUAL A "+cuenta.getCodigo());
					return true;
				}
			}
			
			return false;
	}
	
	
	
	/**
	 * 
	 * Devuelve una lista de cuentas aptas para hacer transacciones
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 */
	@SuppressWarnings("unchecked")
	public List<CuentaContable> ObtenerHIjas(HttpSession session) throws ClassNotFoundException{
		
	List<CuentaContable> cuentasHijas = new ArrayList<CuentaContable>();
	 if(session.getAttribute("listacuentashijas")==null)
	 {
		 System.out.println("============LLENANDO CUENTAS HIJAS PARA LA SESION ACTUAL ===============");
					 String sql = " select id_cuentacontable from cuentacontable " + 
							 " EXCEPT" + 
							 " select id_cuentapadre from cuentacontable where id_cuentapadre>0";
					 List<Integer> ctas = (List<Integer>) manage_entity.executeNativeQuery(sql);
					 
					 for(Integer cc : ctas) 
					 {
						 CuentaContable c = (CuentaContable) manage_entity.getById(CuentaContable.class.getName(), cc);
						 if(c!=null) {
							 cuentasHijas.add(c);
						 }
					 }
					 session.setAttribute("listacuentashijas", cuentasHijas);
					 System.out.println("============FIN LLENADO DE HIJASL ==============="); 
	 }
	 else {
		 cuentasHijas = (List<CuentaContable>) session.getAttribute("listacuentashijas");
	 }
		
	 return cuentasHijas;
	 
	}
	
	/**
	 * Imprime en consola una lista de cuentas
	 * 
	 * @param listaCuentas
	 */
	public void ImprimirLista(List<CuentaContable> listaCuentas) {
		
		if(listaCuentas.isEmpty()) {
			System.err.println("LISTA DE CUENTAS ESTA VACIA");
		}
		int i=0;
		for(CuentaContable cx : listaCuentas) {
			System.err.println("#"+i+" "+cx.getCodigo()+cx.getNombre());
		}
	}
	
	
	public String validarCuentas(List<CuentaContable> listaCuentas) {
		
		String result ="";
		
		for(CuentaContable cc: listaCuentas) {
			
		}
		
		
		
		
		return result;
		
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> lista = new ArrayList<String>();
		lista.add("1");
		lista.add("2");
		lista.add("3");
		lista.add("4");
		lista.add("5");
		lista.add("6");
		lista.add("7");
		lista.add("8");
		lista.add("9");
		lista.add("0");
		
		lista.add("7");
		lista.add("8");
		lista.add("9");
		lista.add("0");
		
		System.out.println("LISTA ANTES DE MDIFICAR");
		for(String ss : lista) {
			System.out.println(ss);
		}
		
		
		
	    Set<String> hs = new HashSet<>();
	    hs.addAll(lista);
	    lista.clear();
	    lista.addAll(hs);
	    
	    System.out.println("LISTA DESPUES DE MDIFICAR");
		for(String ss : lista) {
			System.out.println(ss);
		}

	}
	

	
	
}
