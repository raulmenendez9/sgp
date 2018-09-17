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
import com.sisbam.sgp.entity.administration.Funcion;
import com.sisbam.sgp.entity.administration.Recurso;
import com.sisbam.sgp.entity.security.Permisos;
import com.sisbam.sgp.entity.security.Rol;

@Controller
public class RecursoController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Proyecto/";
	private static final String IDENTIFICADOR = "tipoS";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/recursos", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/recursos", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			Recurso recurso = new Recurso();
			model.addAttribute("recursoForm", recurso);
			model.addAttribute("recurso", null);

			List<Recurso> recursos = (List<Recurso>) this.manage_entity.getAll("Recurso");
			
		  List<Funcion> funciones = (List<Funcion>) this.manage_entity.getAll("Funcion");
				model.addAttribute("recursos", recursos);
				model.addAttribute("funciones", funciones);
			retorno = path+"recurso";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/recursos/add", method = RequestMethod.GET)
	public String addRecurso(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Recurso recurso = new Recurso();
			List<Funcion> funciones = (List<Funcion>) this.manage_entity.getAll("Funcion");
			
			model.addAttribute("recursoForm", recurso);
			model.addAttribute("recurso", null);
			model.addAttribute("funciones", funciones);
			
			retorno = path+"recurso-form";
		}
		return retorno;
		
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/recursos/add", method = {RequestMethod.POST, RequestMethod.GET})
		public String saveOrUpadateRecurso(@ModelAttribute("recursoForm") Recurso recursoRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
			if(permisos.isC())
			{
					Recurso recurso = recursoRecibido;
					Funcion funcionSeleccionada = (Funcion) this.manage_entity.getById(Funcion.class.getName(), recurso.getIdFuncion());
					recurso.setFuncion(funcionSeleccionada);
					if(recurso.getIdRecurso()==0) {
						manage_entity.save(Recurso.class.getName(), recurso);
					}else{
						manage_entity.update(Recurso.class.getName(), recurso);
					}
					retorno="redirect:/recursos";
			}
			return retorno;
		}
		
		//ACTUALIZAR
		@RequestMapping(value = "/recursos/update/{id}", method = RequestMethod.GET)
		public String update(@PathVariable("id") String idRecurso, Model model, HttpServletRequest request) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isU()) 
			{
				Recurso recurso = (Recurso) manage_entity.getById(Recurso.class.getName(), Integer.parseInt(idRecurso));
				model.addAttribute("recurso", recurso);
				Recurso recursoForm = new Recurso();
				model.addAttribute("recursoForm", recursoForm);
				
				List<Funcion> funciones = (List<Funcion>) this.manage_entity.getAll("Funcion");
				model.addAttribute("funciones", funciones);
				retorno=path+"recurso-form";
			}
			
			return retorno;
		}
		
		//ELIMINAR
		@RequestMapping(value = "/recursos/delete/{id}", method = RequestMethod.GET)
		public String delete(@PathVariable("id") String idRecurso, Model model) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isD()) {
			Recurso recurso = (Recurso) manage_entity.getById(Recurso.class.getName(), Integer.parseInt(idRecurso));
			manage_entity.delete(Recurso.class.getName(), recurso);
			model.addAttribute("recurso", recurso);
			
			Recurso recursoForm = new Recurso();
			model.addAttribute("RecursoForm", recursoForm);
			retorno="redirect:/recursos";
			}
			return retorno;
		}

		
}