package com.sisbam.sgp.entity.administration;

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
import com.sisbam.sgp.entity.administration.Empleado;
import com.sisbam.sgp.entity.administration.Proyecto;
import com.sisbam.sgp.entity.administration.Solicitud;
import com.sisbam.sgp.entity.administration.TipoProyecto;
import com.sisbam.sgp.entity.administration.Usuario;
import com.sisbam.sgp.entity.security.Permisos;
import com.sisbam.sgp.entity.security.Rol;

@Controller
public class TareaController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Tarea/";
	private static final String IDENTIFICADOR = "tipoS";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/tareas", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/tareas", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			Tarea tarea = new Tarea();
			model.addAttribute("tareaForm", tarea);
			model.addAttribute("tarea", null);
	
			List<Tarea> tareas = (List<Tarea>) this.manage_entity.getAll("Tarea");
			List<Recurso> recursos = (List<Recurso>) this.manage_entity.getAll("Recurso");
	
				
			model.addAttribute("tareas", tareas);
			model.addAttribute("recursos", recursos);
		
			retorno = path+"tarea";
		}
		return retorno;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/tarea/add", method = {RequestMethod.POST, RequestMethod.GET})
	public String addTarea(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Tarea tarea = new Tarea();
			List<Recurso> recursos = (List<Recurso>) this.manage_entity.getAll("Recurso");
			
	    	model.addAttribute("tareaForm", tarea);
			model.addAttribute("tarea", null);
			model.addAttribute("recursos", recursos);
			
			
			retorno = path+"tarea-form";
		}
		return retorno;
		
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/tareas/add", method = {RequestMethod.POST, RequestMethod.GET})
		public String saveOrUpadateTarea(@ModelAttribute("tareaForm") Tarea tareaRecibida,Model model) throws ClassNotFoundException {
			String retorno = "403";
			if(permisos.isC())
			{
					Tarea tarea = tareaRecibida;
					Recurso recursoRecibido = (Recurso) this.manage_entity.getById(Recurso.class.getName(), tarea.getIdRecurso());
					tarea.setRecurso(recursoRecibido);
					
					
					if(tarea.getIdTarea()==0) {
						manage_entity.save(Tarea.class.getName(), tarea);
					}else{
						manage_entity.update(Tarea.class.getName(), tarea);
					}
					retorno="redirect:/tareas";
			}
			return retorno;
		}
		
		
		
		//ACTUALIZAR
				@RequestMapping(value = "/tareas/update/{id}", method = RequestMethod.GET)
				public String update(@PathVariable("id") String idTarea, Model model, HttpServletRequest request) throws ClassNotFoundException {
					String retorno="403";
					if(permisos.isU()) 
					{
						Tarea tarea = (Tarea) manage_entity.getById(Tarea.class.getName(), Integer.parseInt(idTarea));
						model.addAttribute("tarea", tarea);
						Tarea tareaForm = new Tarea();
						model.addAttribute("tareaForm", tareaForm);
						
						List<Recurso> recursos = (List<Recurso>) this.manage_entity.getAll("Recurso");
						model.addAttribute("recursos", recursos);
					
						retorno=path+"tarea-form";
					}
					
					return retorno;
				}
				
				//ELIMINAR
				@RequestMapping(value = "/tareas/delete/{id}", method =  RequestMethod.GET)
				public String delete(@PathVariable("id") String idTarea, Model model) throws ClassNotFoundException {
					String retorno="403";
					if(permisos.isD()) {
					Tarea tarea = (Tarea) manage_entity.getById(Tarea.class.getName(), Integer.parseInt(idTarea));
					manage_entity.delete(Tarea.class.getName(), tarea);
					model.addAttribute("tarea", tarea);
					
					Tarea tareaForm = new Tarea();
					model.addAttribute("tareaForm", tareaForm);
					retorno="redirect:/tareas";
					}
					return retorno;
				}
		
		
		
		
}