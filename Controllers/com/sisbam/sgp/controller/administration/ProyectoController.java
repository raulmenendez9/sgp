package com.sisbam.sgp.controller.administration;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.dao.DaoImp;
import com.sisbam.sgp.entity.administration.Actividad;
import com.sisbam.sgp.entity.administration.Empleado;
import com.sisbam.sgp.entity.administration.Proyecto;
import com.sisbam.sgp.entity.administration.Solicitud;
import com.sisbam.sgp.entity.administration.TipoProyecto;
import com.sisbam.sgp.entity.administration.Usuario;
import com.sisbam.sgp.entity.security.Permisos;
import com.sisbam.sgp.entity.security.Rol;

@Controller
public class ProyectoController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Proyecto/";
	private static final String IDENTIFICADOR = "tipoS";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/proyectos", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/proyectos", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
		String usuario = ""+SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(usuario);
		
		
		if(permisos.isR())
		{
			Proyecto proyecto = new Proyecto();
			model.addAttribute("proyectoForm", proyecto);
			model.addAttribute("proyecto", null);
	
			List<Proyecto> proyectos = (List<Proyecto>) this.manage_entity.getAll("Proyecto");
			List<Solicitud> solicitudes = (List<Solicitud>) this.manage_entity.getListByName("Solicitud", "estado", "true");
		
				
			model.addAttribute("proyectos", proyectos);
			model.addAttribute("solicitudes", solicitudes);
			retorno = path+"proyecto";
		}
		return retorno;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/proyecto/add", method = {RequestMethod.POST, RequestMethod.GET})
	public String addProyecto(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Proyecto proyecto = new Proyecto();
			List<Solicitud> solicitudes = (List<Solicitud>) this.manage_entity.getAll("Solicitud");
			
			model.addAttribute("proyectoForm", proyecto);
			model.addAttribute("proyecto", null);
			model.addAttribute("solicitudes", solicitudes);
			
			
			retorno = path+"proyecto-form";
		}
		return retorno;
		
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/proyectos/add", method = {RequestMethod.POST, RequestMethod.GET})
		public String saveOrUpadateProyecto(@ModelAttribute("proyectoForm") Proyecto proyectoRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
			if(permisos.isC())
			{
					Proyecto proyecto = proyectoRecibido;
					Solicitud solicitudRecibida = (Solicitud) this.manage_entity.getById(Solicitud.class.getName(), proyecto.getcodSolicitud());
					proyecto.setSolicitud(solicitudRecibida);
					
					if(proyecto.getCodProyecto()==0) {
						manage_entity.save(Proyecto.class.getName(), proyecto);
					}else{
						manage_entity.update(Proyecto.class.getName(), proyecto);
					}
					retorno="redirect:/proyectos";
			}
			return retorno;
		}
		
		
		
		//ACTUALIZAR
				@RequestMapping(value = "/proyectos/update/{id}", method = RequestMethod.GET)
				public String update(@PathVariable("id") String codProyecto, Model model, HttpServletRequest request) throws ClassNotFoundException {
					String retorno="403";
					if(permisos.isU()) 
					{
						Proyecto proyecto = (Proyecto) manage_entity.getById(Proyecto.class.getName(), Integer.parseInt(codProyecto));
						model.addAttribute("solicitud", proyecto);
						Proyecto proyectoForm = new Proyecto();
						model.addAttribute("proyectoForm", proyectoForm);
						
						List<Solicitud> solicitudes = (List<Solicitud>) this.manage_entity.getAll("Solicitud");
						model.addAttribute("solicitudes", solicitudes);
						retorno=path+"proyecto-form";
					}
					
					return retorno;
				}
				
				//ELIMINAR
				@RequestMapping(value = "/proyectos/delete/{id}", method =  RequestMethod.GET)
				public String delete(@PathVariable("id") String codProyecto, Model model) throws ClassNotFoundException {
					String retorno="403";
					if(permisos.isD()) {
					Proyecto proyecto = (Proyecto) manage_entity.getById(Proyecto.class.getName(), Integer.parseInt(codProyecto));
					manage_entity.delete(Proyecto.class.getName(), proyecto);
					model.addAttribute("proyecto", proyecto);
					
					Proyecto proyectoForm = new Proyecto();
					model.addAttribute("proyectoForm", proyectoForm);
					retorno="redirect:/proyectos";
					}
					return retorno;
				}
		
		
		
		
}