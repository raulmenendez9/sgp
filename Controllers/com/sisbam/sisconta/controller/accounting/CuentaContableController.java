package com.sisbam.sisconta.controller.accounting;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.accounting.CuentaContable;
import com.sisbam.sisconta.entity.administration.Empresa;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;


@Controller
public class CuentaContableController {
	
	@Autowired
	private DaoImp manage_entity;//generalizacion de todo lo que tenga que ver con SQL
	
	private String path = "Accounting/";//ruta donde esta la carpeta de las vista
	
	private Permisos permisos;//permisos del usuario en determinada vista

	
//Metodo para leer de la base de datos responde con una lista de empresas a la URL:/empresas
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cuentas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		ObtenerPermisosPorUrl obtener = new ObtenerPermisosPorUrl();
		this.permisos = obtener.ObtenerAmbienteDePruebas("/sisconta/vistas", request, manage_entity);
		
//se cargan los permisos CRUD que tenga el usuario sobre la vista		
//*************CARGAR BOTONES PERMITIDOS******************
		model.addAttribute("create",permisos.isC());
		model.addAttribute("read",	permisos.isR());
		model.addAttribute("update",permisos.isU());
		model.addAttribute("delete",permisos.isD());
//**********************************************************
		if(permisos.isR())//si no tiene permiso de leer mandara a la pantalla de error 403 Forbiden
		{
			CuentaContable cuenta = new CuentaContable();
			model.addAttribute("cuentaForm", cuenta);
			model.addAttribute("cuenta", null);
				List<CuentaContable> cuentas = (List<CuentaContable>) this.manage_entity.getAll(CuentaContable.class.getName());
				model.addAttribute("cuentas", cuentas);
			retorno = path+"cuenta";
		}
		return retorno;
	}
	
	@RequestMapping(value = "/cuentas/add", method = RequestMethod.POST)
	public String saveOrUpadateCuenta(@ModelAttribute("cuentaForm") CuentaContable cuentaRecibido,Model model) throws ClassNotFoundException {
		String retorno = "403";
		
		cuentaRecibido.setCuentaPadre(null);
		Date hoy = new Date();
		cuentaRecibido.setFechaModificacion(hoy);
		
		if(permisos.isC())
		{
				CuentaContable cuenta = cuentaRecibido;
				if(cuenta.getIdCuentaContable()==0){
					manage_entity.save(CuentaContable.class.getName(), cuenta);
				}else{
					manage_entity.update(CuentaContable.class.getName(), cuenta);
				}
				retorno="redirect:/cuentas";
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


	@RequestMapping(value = "/cuentas/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String cuentaId, Model model) throws ClassNotFoundException {
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
	}
	
	
}
