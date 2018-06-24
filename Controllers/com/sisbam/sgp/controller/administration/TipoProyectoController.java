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
import com.sisbam.sgp.entity.administration.TipoProyecto;
import com.sisbam.sgp.entity.security.Permisos;

@Controller
public class TipoProyectoController {

	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Proyecto/";
	private static final String IDENTIFICADOR = "tipoP";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/tipoproyectos", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/tipoproyectos", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			TipoProyecto tipoProyecto = new TipoProyecto();
			model.addAttribute("tipoProyectoForm", tipoProyecto);
			model.addAttribute("tipoProyecto", null);
				List<TipoProyecto> tipoproyectos = (List<TipoProyecto>) this.manage_entity.getAll("TipoProyecto");
				model.addAttribute("tipoproyectos", tipoproyectos);
			retorno = path+"tipoProyecto";
		}
		return retorno;
	}
	
	//GUARDAR
	@RequestMapping(value = "/tipoproyectos/add", method = RequestMethod.POST)
	public String saveOrUpadateTipoProyecto(@ModelAttribute("tipoProyectoForm") TipoProyecto tipoProyectoRecibido,Model model) throws ClassNotFoundException {
		String retorno = "403";
		if(permisos.isC())
		{
				TipoProyecto tipoProyecto = tipoProyectoRecibido;
				if(tipoProyecto.getIdTipoProyecto()==0) {
					manage_entity.save(TipoProyecto.class.getName(), tipoProyecto);
				}else{
					manage_entity.update(TipoProyecto.class.getName(), tipoProyecto);
				}
				retorno="redirect:/tipoproyectos";
		}
		return retorno;
	}
	
	//ACTUALIZAR
	@RequestMapping(value = "/tipoproyectos/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String tipoProyectoId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isU()) 
		{
			TipoProyecto tipoProyecto = (TipoProyecto) manage_entity.getById(TipoProyecto.class.getName(), Integer.parseInt(tipoProyectoId));
			model.addAttribute("tipoProyecto", tipoProyecto);
			TipoProyecto tipoProyectoForm = new TipoProyecto();
			model.addAttribute("tipoProyectoForm", tipoProyectoForm);
			retorno=path+"tipoProyecto-form";
		}
		
		return retorno;
	}
	
	//ELIMINAR
	@RequestMapping(value = "/tipoproyectos/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String tipoProyectoId, Model model) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isD()) {
		TipoProyecto tipoProyecto = (TipoProyecto) manage_entity.getById(TipoProyecto.class.getName(), Integer.parseInt(tipoProyectoId));
		manage_entity.delete(TipoProyecto.class.getName(), tipoProyecto);
		model.addAttribute("tipoProyecto", tipoProyecto);
		
		TipoProyecto tipoProyectoForm = new TipoProyecto();
		model.addAttribute("tipoProyectoForm", tipoProyectoForm);
		retorno="redirect:/tipoproyectos";
		}
		return retorno;
	}
	
}
	