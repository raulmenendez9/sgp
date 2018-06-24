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
import com.sisbam.sgp.entity.administration.EspecificacionProyecto;
import com.sisbam.sgp.entity.administration.TipoProyecto;
import com.sisbam.sgp.entity.security.Permisos;

@Controller
public class EspecificacionProyectoController {

	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Proyecto/";
	private static final String IDENTIFICADOR = "tipoE";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/especificacionproyectos", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/especificacionproyectos", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			EspecificacionProyecto especificacionProyecto = new EspecificacionProyecto();
			model.addAttribute("especificacionProyectoForm", especificacionProyecto);
			model.addAttribute("especificacionProyecto", null);
				List<EspecificacionProyecto> especificacionproyectos = (List<EspecificacionProyecto>) this.manage_entity.getAll("EspecificacionProyecto");
				model.addAttribute("especificacionproyectos", especificacionproyectos);
			retorno = path+"especificacionProyecto";
		}
		return retorno;
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/especificacionproyectos/add", method = RequestMethod.POST)
		public String saveOrUpadateEspecificacionProyecto(@ModelAttribute("especificacionProyectoForm") EspecificacionProyecto especificacionProyectoRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
			if(permisos.isC())
			{
					EspecificacionProyecto especificacionProyecto = especificacionProyectoRecibido;
					if(especificacionProyecto.getIdEspecificacion()==0) {
						manage_entity.save(EspecificacionProyecto.class.getName(), especificacionProyecto);
					}else{
						manage_entity.update(EspecificacionProyecto.class.getName(), especificacionProyecto);
					}
					retorno="redirect:/especificacionproyectos";
			}
			return retorno;
		}
		
		//ACTUALIZAR
		@RequestMapping(value = "/especificacionproyectos/update/{id}", method = RequestMethod.GET)
		public String update(@PathVariable("id") String especificacionProyectoId, Model model, HttpServletRequest request) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isU()) 
			{
				EspecificacionProyecto especificacionProyecto = (EspecificacionProyecto) manage_entity.getById(EspecificacionProyecto.class.getName(), Integer.parseInt(especificacionProyectoId));
				model.addAttribute("especificacionProyecto", especificacionProyecto);
				EspecificacionProyecto especificacionProyectoForm = new EspecificacionProyecto();
				model.addAttribute("especificacionProyectoForm", especificacionProyectoForm);
				retorno=path+"especificacionProyecto-form";
			}
			
			return retorno;
		}
		
		//ELIMINAR
		@RequestMapping(value = "/especificacionproyectos/delete/{id}", method = RequestMethod.GET)
		public String delete(@PathVariable("id") String especificacionProyectoId, Model model) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isD()) {
			EspecificacionProyecto especificacionProyecto = (EspecificacionProyecto) manage_entity.getById(EspecificacionProyecto.class.getName(), Integer.parseInt(especificacionProyectoId));
			manage_entity.delete(EspecificacionProyecto.class.getName(), especificacionProyecto);
			model.addAttribute("especificacionProyecto", especificacionProyecto);
			
			EspecificacionProyecto especificacionProyectoForm = new EspecificacionProyecto();
			model.addAttribute("especificacionProyectoForm", especificacionProyectoForm);
			retorno="redirect:/especificacionproyectos";
			}
			return retorno;
		}
		
	
	
	
}










	