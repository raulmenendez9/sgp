package com.sisbam.sgp.controller.administration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.dao.DaoImp;
import com.sisbam.sgp.entity.administration.Empresa;
import com.sisbam.sgp.entity.security.Permisos;


@Controller
public class EmpresaController {
	
	@Autowired
	private DaoImp manage_entity;//generalizacion de todo lo que tenga que ver con SQL
	
	private String path = "Administration/Empresa/";//ruta donde esta la carpeta de las vista
	private static final String IDENTIFICADOR = "empresasx23";
	
	private Permisos permisos;//permisos del usuario en determinada vista

	
//Metodo para leer de la base de datos responde con una lista de empresas a la URL:/empresas
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/empresas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/empresas", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())//si no tiene permiso de leer mandara a la pantalla de error 403 Forbiden
		{
			Empresa empresa = new Empresa();
			model.addAttribute("empresaForm", empresa);
			model.addAttribute("empresa", null);
				List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
				model.addAttribute("empresas", empresas);
			retorno = path+"empresa";
		}
		return retorno;
	}
	
	@RequestMapping(value = "/empresas/add", method = RequestMethod.POST)
	public String saveOrUpadateEmpresa(@ModelAttribute("empresaForm") Empresa empresaRecibido,Model model) throws ClassNotFoundException {
		String retorno = "403";
		if(permisos.isC())
		{
				Empresa empresa = empresaRecibido;
				if(empresa.getIdEmpresa()==0){
					manage_entity.save(Empresa.class.getName(), empresa);
				}else{
					manage_entity.update(Empresa.class.getName(), empresa);
				}
				retorno="redirect:/empresas";
		}
		return retorno;
	}
	
	
	@RequestMapping(value = "/empresas/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String empresaId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isU()) 
		{
			Empresa empresa = (Empresa) manage_entity.getById(Empresa.class.getName(), Integer.parseInt(empresaId));
			model.addAttribute("empresa", empresa);
			Empresa empresaForm = new Empresa();
			model.addAttribute("empresaForm", empresaForm);
			retorno=path+"empresa-form";
		}
		
		return retorno;
	}
	
	/*
	 * Delete:
	 * Borra objetos de tipo empresa mediante un id enviado en la URL. 
	 */


	@RequestMapping(value = "/empresas/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String empresaId, Model model) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isD()) {
		Empresa empresa = (Empresa) manage_entity.getById(Empresa.class.getName(), Integer.parseInt(empresaId));
		manage_entity.delete(Empresa.class.getName(), empresa);
		model.addAttribute("empresa", empresa);
		
		Empresa empresaForm = new Empresa();
		model.addAttribute("empresaForm", empresaForm);
		retorno="redirect:/empresas";
		}
		return retorno;
	}
	
	
}
