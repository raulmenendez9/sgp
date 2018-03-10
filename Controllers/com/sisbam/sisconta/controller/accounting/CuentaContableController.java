package com.sisbam.sisconta.controller.accounting;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.controller.variety.ReportesController;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.accounting.CuentaContable;
import com.sisbam.sisconta.entity.security.Permisos;


@Controller
public class CuentaContableController {
	
	@Autowired
	private DaoImp manage_entity;//generalizacion de todo lo que tenga que ver con SQL
	
	private String path = "Accounting/";//ruta donde esta la carpeta de las vista
	private static final String IDENTIFICADOR = "cuentaContablex12";
	
	private Permisos permisos;//permisos del usuario en determinada vista
	
	private Boolean ERROR;

	
//Metodo para leer de la base de datos responde con una lista de empresas a la URL:/empresas
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cuentas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sisconta/cuentas", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
					

		if(permisos.isR())//si no tiene permiso de leer mandara a la pantalla de error 403 Forbiden
		{
			CuentaContable cuenta = new CuentaContable();
			model.addAttribute("cuentaForm", cuenta);
			model.addAttribute("cuenta", null);
				List<CuentaContable> cuentas = (List<CuentaContable>) this.manage_entity.getAll(CuentaContable.class.getName());
				
				model.addAttribute("cuentas", asignarTab(cuentas));
			retorno = path+"cuenta";
		}
		return retorno;
	}
	
	@RequestMapping(value = "/cuentasadd", method = RequestMethod.POST)
	public String saveOrUpadateCuenta(@ModelAttribute("cuentaForm") CuentaContable cuentaRecibido,Model model) throws ClassNotFoundException{
		String retorno = "403";

		
		if(permisos.isC())
		{
			
				if(validarCuenta(cuentaRecibido.getCodigo())) {
					
					CuentaContable cuentaConPadreCapturado = encontrarPadre(cuentaRecibido);
					
					CuentaContable cuenta = cuentaConPadreCapturado;
					if(cuenta.getIdCuentaContable()==0){
						manage_entity.save(CuentaContable.class.getName(), cuenta);
					}else{
						manage_entity.update(CuentaContable.class.getName(), cuenta);
					}
					retorno="redirect:/cuentas";
				}
				else {
					retorno ="Variety/ErrorCuentaContable";
				}
			
				
				
		}
		return retorno;
	}
	

	
	
	@RequestMapping(value = "/cuentas/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String cuentaId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isU()) 
		{
			CuentaContable cuenta = (CuentaContable) manage_entity.getById(CuentaContable.class.getName(), Integer.parseInt(cuentaId));
			model.addAttribute("cuenta", cuenta);
			CuentaContable cuentaForm = new CuentaContable();
			model.addAttribute("cuentaForm", cuentaForm);
			retorno=path+"cuenta-form";
		}
		
		return retorno;
	}
	
	/*
	 * Delete:
	 * Borra objetos de tipo empresa mediante un id enviado en la URL. 
	 */


	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/cuentas/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String cuentaId, Model model) throws NumberFormatException, ClassNotFoundException{
		try {
			String retorno="403";
			if(permisos.isD()) {
			CuentaContable cuenta = (CuentaContable) manage_entity.getById(CuentaContable.class.getName(), Integer.parseInt(cuentaId));
			manage_entity.delete(CuentaContable.class.getName(), cuenta);
			model.addAttribute("cuenta", cuenta);
			CuentaContable cuentaForm = new CuentaContable();
			model.addAttribute("cuentaForm", cuentaForm);
			retorno="redirect:/cuentas";
			}
			return retorno;
			
		} catch (HibernateException e) {
			System.out.println("ERROR HIBERNATE"+e);
			model.addAttribute("mensaje",e);
			model.addAttribute("hayerror","si");
			ERROR=true;
			
			
			return "redirect:/cuentas";
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	*******************************************
//	METODS PARA FUNCIONAMIENTO
//	*******************************************
	
	public Boolean validarCuenta(String codigo) {
		try {
			Long.parseLong(codigo);
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	
	
	public CuentaContable encontrarPadre(CuentaContable cuentaRecibido) {
		
		Date hoy = new Date();
		cuentaRecibido.setFechaModificacion(hoy);
		String codigo =cuentaRecibido.getCodigo();
		if(codigo.length()<=1) {
			cuentaRecibido.setCuentaPadre(null);
			return cuentaRecibido;
		}
		else {
			
			CuentaContable cuentaPadre =null;
									while(codigo.length()>0)//mientras el codigo de la cuenta sea mayor a 1
									{
										try {
												//quitarle el ultimo numero a el codigo, para que se pueda consultar y averiguar quien es el padre
												String codigoConsulta = codigo.substring(0, codigo.length()-1);
												cuentaPadre = (CuentaContable) manage_entity.getByName(CuentaContable.class.getName(), "codigo", codigoConsulta);
												//si la consulta no retorna nada quiere decir que no encontre al papa
												if(cuentaPadre!=null) {
													//si la consulta devuelve algo es porque lo encontre, lo capture y le digo al hijo quien es su papa
													cuentaRecibido.setCuentaPadre(cuentaPadre);
													codigo ="";
												}
												else {
													//si el padre que obtuve con el codigo anterior devuelve null es que no encontre al padre y pruebo con otro codigo
													codigo = codigo.substring(0, codigo.length()-1);
												}
											} 
											catch (Exception e) 
											{
												//por cualquier razon mando un null por si encutro un padre falso osea vacio
												cuentaPadre=null;
											}
									}
									
									
									//si no encontro niguna cuenta y su codigo es mayor a uno es porque es un padre pero hay que quitarle numeros a su codigo
									if(cuentaPadre==null) {
										String codigoactual =cuentaRecibido.getCodigo();
										codigoactual=codigoactual.substring(0, 1);
										cuentaRecibido.setCodigo(codigoactual);
										return cuentaRecibido;
									}
									
			}
		
		
		
		
		return cuentaRecibido;
		
	}
	
	
	public List<CuentaContable> asignarTab(List<CuentaContable> cuentas){
		String nombre=null;
		String tab = null;
		int i=0;
		List<CuentaContable> cuentasConTabulacion =new ArrayList<CuentaContable>();
		for(CuentaContable cuentita:cuentas) {
			
			if(cuentita.getCodigo().length()==1) {
				
				cuentita.setNombre("<b>"+cuentita.getNombre()+"<b>");
				i=99;
			}
			
			nombre = cuentita.getNombre();
			for(i=0;cuentita.getCodigo().length()>i;i++) {
				
				if(tab!=null) {
					tab = tab+"-";
				}
				else {
					tab = "-";
				}
					
			}
			
			cuentita.setNombre(tab+nombre);
			cuentasConTabulacion.add(cuentita);
			
			tab=null;
			
		}
		
		
		return cuentasConTabulacion;
	}
	
	
	@RequestMapping(value = "/reporteCuentasContables", method = RequestMethod.GET)
	public void reporte(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		ReportesController rep = new ReportesController();
		HashMap<String,Object> hmParams=new HashMap<String,Object>();
		rep.genearReporte(model, request, response, "cuentacontableRep",hmParams);
	}
	

	
	
	
	
	
	
}
