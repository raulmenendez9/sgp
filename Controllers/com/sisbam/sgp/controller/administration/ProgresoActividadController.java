package com.sisbam.sgp.controller.administration;

import java.util.ArrayList;
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
import com.sisbam.sgp.entity.administration.Proyecto;
import com.sisbam.sgp.entity.administration.Solicitud;
import com.sisbam.sgp.entity.security.Permisos;

@Controller
public class ProgresoActividadController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Actividad/";
	private static final String IDENTIFICADOR = "actividadP";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/progresoActividades", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/progresoActividades", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
		
		model.addAttribute("read",	permisos.isR());
		
		if(permisos.isR())
		{
			Actividad actividad = new Actividad();
			model.addAttribute("actividadForm", actividad);
			model.addAttribute("verProgreso", null);

			List<String> consulta = new ArrayList<String>();
			String query ="SELECT b.codpoyecto, b.idactividad,s.titulo, b.nombre, b.estado, b.fechafin, b.fechainicio\r\n" + 
					"	FROM actividad as b inner join proyecto as e on e.codproyecto=b.codpoyecto inner join solicitud as s on e.codsolicitud=s.codsoliciutud";
			consulta = (List<String>) manage_entity.executeNativeQuery(query);
			model.addAttribute("vistaprogre", consulta);
		
			retorno = path+"progresoActividades";
		}
		return retorno;
	}
	/*@SuppressWarnings("unchecked")
	@RequestMapping(value = "/verProyectos/add", method = {RequestMethod.POST, RequestMethod.GET})
	public String addProyecto(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Proyecto proyecto = new Proyecto();
			List<Solicitud> solicitudes = (List<Solicitud>) this.manage_entity.getAll("Solicitud");
			
			model.addAttribute("proyectoForm", proyecto);
			model.addAttribute("proyecto", null);
			model.addAttribute("solicitudes", solicitudes);
			
			
			retorno = path+"verproyecto-form";
		}
		return retorno;*/
		
	}