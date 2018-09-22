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
import com.sisbam.sgp.entity.administration.Tarea;
import com.sisbam.sgp.entity.administration.Actividad;
import com.sisbam.sgp.entity.security.Permisos;

@Controller
public class ActividadController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Actividad/";
	private static final String IDENTIFICADOR = "actividadP";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/actividades", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/actividades", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			Actividad actividad = new Actividad();
			model.addAttribute("actividadForm", actividad);
			model.addAttribute("actividad", null);

			List<Actividad> actividades = (List<Actividad>) this.manage_entity.getAll("Actividad");
			
		  List<Tarea> tareas = (List<Tarea>) this.manage_entity.getAll("Tarea");
				model.addAttribute("actividades", actividades);
				model.addAttribute("tareas", tareas);
			retorno = path+"actividad";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/actividades/add", method = RequestMethod.GET)
	public String addActividad(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Actividad actividad = new Actividad();
			List<Tarea> tareas = (List<Tarea>) this.manage_entity.getAll("Tarea");
			
			model.addAttribute("actividadForm", actividad);
			model.addAttribute("actividad", null);
			model.addAttribute("tareas", tareas);
			
			retorno = path+"actividad-form";
		}
		return retorno;
		
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/actividades/add", method = {RequestMethod.POST, RequestMethod.GET})
		public String saveOrUpadateActividad(@ModelAttribute("actividadForm") Actividad actividadRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
			if(permisos.isC())
			{
					Actividad actividad = actividadRecibido;
					Tarea tareaSeleccionada = (Tarea) this.manage_entity.getById(Tarea.class.getName(), actividad.getIdTarea());
					actividad.setTarea(tareaSeleccionada);
					if(actividad.getIdActividad()==0) {
						manage_entity.save(Actividad.class.getName(), actividad);
					}else{
						manage_entity.update(Actividad.class.getName(), actividad);
					}
					retorno="redirect:/actividades";
			}
			return retorno;
		}
		
		//ACTUALIZAR
		@RequestMapping(value = "/actividades/update/{id}", method = RequestMethod.GET)
		public String update(@PathVariable("id") String idActividad, Model model, HttpServletRequest request) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isU()) 
			{
				Actividad actividad = (Actividad) manage_entity.getById(Actividad.class.getName(), Integer.parseInt(idActividad));
				model.addAttribute("actividad", actividad);
				Actividad actividadForm = new Actividad();
				model.addAttribute("actividadForm", actividadForm);
				
				List<Tarea> tareas = (List<Tarea>) this.manage_entity.getAll("Tarea");
				model.addAttribute("tareas", tareas);
				retorno=path+"actividad-form";
			}
			
			return retorno;
		}
		
		//ELIMINAR
		@RequestMapping(value = "/actividades/delete/{id}", method = RequestMethod.GET)
		public String delete(@PathVariable("id") String idActividad, Model model) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isD()) {
			Actividad actividad = (Actividad) manage_entity.getById(Actividad.class.getName(), Integer.parseInt(idActividad));
			manage_entity.delete(Actividad.class.getName(), actividad);
			model.addAttribute("actividad", actividad);
			
			Actividad actividadForm = new Actividad();
			model.addAttribute("actividadForm", actividadForm);
			retorno="redirect:/actividades";
			}
			return retorno;
		}

}
