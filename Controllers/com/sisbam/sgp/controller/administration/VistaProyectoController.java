package com.sisbam.sgp.controller.administration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.controller.variety.ReportesController;
import com.sisbam.sgp.dao.DaoImp;
import com.sisbam.sgp.entity.administration.Actividad;
import com.sisbam.sgp.entity.administration.Proyecto;
import com.sisbam.sgp.entity.administration.Solicitud;
import com.sisbam.sgp.entity.administration.TipoProyecto;
import com.sisbam.sgp.entity.administration.Usuario;
import com.sisbam.sgp.entity.security.Permisos;

@Controller
public class VistaProyectoController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path="Administration/Proyecto/";
	private static final String IDENTIFICADOR = "vistaprox23";
	
	private Permisos permisos;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/verProyectos", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";

		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/verProyectos", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
		
		
		model.addAttribute("read",	permisos.isR());

		if(permisos.isR()) {
			Proyecto proyecto = new Proyecto();
			model.addAttribute("proyectoForm", proyecto);
			model.addAttribute("verProyectos", null);
			
			//List<Bitacora> bitacoras= (List<Bitacora>) this.manage_entity.getAll(Bitacora.class.getName());
			List<String> consulta = new ArrayList<String>();
			String query ="select t2.titulo,t1.codproyecto, t1.duracion, t3.nombre FROM proyecto as t1 inner join   solicitud as t2 on t1.codSolicitud = t2.codsoliciutud inner join actividad as t3 on t1.codproyecto = t3.codpoyecto";
			consulta = (List<String>) manage_entity.executeNativeQuery(query);
			model.addAttribute("vistapros", consulta);
			
			List<Proyecto> proyectos = (List<Proyecto>) this.manage_entity.getAll("Proyecto");	
			model.addAttribute("proyectos", proyectos);
			retorno = path+"verProyectos";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
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
		return retorno;
		
	}
	
	//VER
	@RequestMapping(value = "/verproyectos/update/{id}", method = RequestMethod.GET)
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
			retorno=path+"verproyecto-form";
		}
		
		return retorno;
	}
	
	/*@RequestMapping(value = "/reporteBitacora", method = RequestMethod.GET)
	public void reporte(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		ReportesController rep = new ReportesController();
		HashMap<String,Object> hmParams=new HashMap<String,Object>();
		 hmParams.put("titulo",			"HISTORIAL");
	     hmParams.put("descripcion",	"HISTORIAL DE CAMBIOS AL SISTEMA");
		rep.genearReporte(model, request, response, "historialRep",hmParams);
	}*/

}