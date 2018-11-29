package com.sisbam.sgp.controller.administration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
			String query ="select t2.titulo,t1.codproyecto, t1.duracion FROM proyecto as t1 inner join   solicitud as t2 on t1.codSolicitud = t2.codsoliciutud";
			consulta = (List<String>) manage_entity.executeNativeQuery(query);
			model.addAttribute("vistapros", consulta);
			
			List<Proyecto> proyectos = (List<Proyecto>) this.manage_entity.getAll("Proyecto");	
			model.addAttribute("proyectos", proyectos);
			
			List<String> consulta2 = new ArrayList<String>();
			String query2 ="select t1.codproyecto,t2.titulo, t2.justificacion, t1.ambitoimpacto,t1.antecedentes,t1.objesp3,t1.medidas,t1.metodologia,\r\n" + 
					"t1.montoaprobado,t1.objgeneral,t1.objesp1,t1.objesp2,t1.patrocinadores,t1.planteamiento,t1.resumen,t1.tipofinanciamiento,  t1.duracion, t3.nombre, r.nombre as tarea, rr.nombre as recurso,t4.nombre as tipoproyecto\r\n" + 
					"FROM proyecto as t1 full outer join   solicitud as t2 on t1.codSolicitud = t2.codsoliciutud full outer join tipoproyecto as t4 on t2.id_tipoproyecto = t4.idtipoproyecto full outer join actividad as t3 on t1.codproyecto = t3.codpoyecto \r\n" + 
					"full outer join tarea as r on t3.idactividad = r.idactividad full outer join recurso as rr on r.idrecurso=rr.idrecurso";
			consulta2 = (List<String>) manage_entity.executeNativeQuery(query2);
			
			model.addAttribute("vistaproyecto", consulta2);
			retorno = path+"verProyectos";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/proyecto/gantt/{id}", method = RequestMethod.GET)
	 public String gantt(@PathVariable("id") String codProyecto, Model model, HttpServletRequest request)
	 {
		 String retorno = "403";
			
			HttpSession session = request.getSession();
			ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
			session = facilitador.Obtener("/sgp/proyectos", request, manage_entity,IDENTIFICADOR);
			permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			String usuario = ""+SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			System.out.println(usuario);
			
			if(permisos.isC()){
				
				List<String> actividades = new ArrayList<String>();	
				String query ="select fechafin from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				actividades = (List<String>) manage_entity.executeNativeQuery(query);
				model.addAttribute("actividades", actividades);
				
				List<Actividad> actividad = new ArrayList<Actividad>();
				String query2 ="select nombre from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				actividad = (List<Actividad>) manage_entity.executeNativeQuery(query2);
				model.addAttribute("actividad", actividad);
		
				List<Actividad> actividad3 = new ArrayList<Actividad>();
				String query3 ="select fechafin from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				actividad3 = (List<Actividad>) manage_entity.executeNativeQuery(query3);
				model.addAttribute("fechafin", actividad3);
		
				List<Actividad> actividad4 = new ArrayList<Actividad>();
				String query4 ="select fechainicio from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				actividad4 = (List<Actividad>) manage_entity.executeNativeQuery(query4);
				model.addAttribute("fechainicio", actividad4);
				
				List<Actividad> actividad5 = new ArrayList<Actividad>();
				String query5="select estado from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				actividad5 = (List<Actividad>) manage_entity.executeNativeQuery(query5);
				model.addAttribute("estado", actividad5);
				 
				List<Actividad> actividad6 = new ArrayList<Actividad>();
				String query6="select idactividad from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				actividad6 = (List<Actividad>) manage_entity.executeNativeQuery(query6);
				model.addAttribute("codigo", actividad6);
				
				List<Actividad> actividad8 = new ArrayList<Actividad>();
				String query8="select round(avg(estado),2) from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				actividad8 = (List<Actividad>) manage_entity.executeNativeQuery(query8);
				model.addAttribute("codigo", actividad8);
				
				query ="select round(avg(estado),2) from actividad where codpoyecto="+Integer.parseInt(codProyecto);
				//actividades = (List<String>) manage_entity.executeNativeQuery(query);
				model.addAttribute("actividades", actividad8);
		
				System.out.println(actividad8);
				
				System.out.println(actividad);
				System.out.println(actividad4);
				System.out.println(actividad3);
				System.out.println(actividad6);
				System.out.println(actividad5);
			retorno = path+"gantt";
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
			List<String> consulta = new ArrayList<String>();
			String query ="select t1.codproyecto, t3.nombre, r.nombre as tarea, rr.nombre as recurso\r\n" + 
					"					FROM proyecto as t1 full outer join   solicitud as t2 on t1.codSolicitud = t2.codsoliciutud full outer join tipoproyecto as t4 on t2.id_tipoproyecto = t4.idtipoproyecto full outer join actividad as t3 on t1.codproyecto = t3.codpoyecto \r\n" + 
					"					full outer join tarea as r on t3.idactividad = r.idactividad full outer join recurso as rr on r.idrecurso=rr.idrecurso where t1.codproyecto="+Integer.parseInt(codProyecto);
			consulta = (List<String>) manage_entity.executeNativeQuery(query);
			model.addAttribute("verproyectos", consulta);
			
			List<String> consulta2 = new ArrayList<String>();
			String query2 ="select t1.codproyecto,t2.titulo, t2.justificacion, t1.ambitoimpacto,t1.antecedentes,t1.objesp3,t1.medidas,t1.metodologia, \r\n" + 
					"					t1.montoaprobado,t1.objgeneral,t1.objesp1,t1.objesp2,t1.patrocinadores,t1.planteamiento,t1.resumen,t1.tipofinanciamiento,  t1.duracion,t4.nombre as tipoproyecto \r\n" + 
					"					FROM proyecto as t1 full outer join   solicitud as t2 on t1.codSolicitud = t2.codsoliciutud full outer join tipoproyecto as t4 on t2.id_tipoproyecto = t4.idtipoproyecto where t1.codproyecto="+Integer.parseInt(codProyecto);
			
			consulta2 = (List<String>) manage_entity.executeNativeQuery(query2);
			
			model.addAttribute("vistaproyecto", consulta2);
			
			List<Actividad> actividad8 = new ArrayList<Actividad>();
			String query8="select round(avg(estado),2) from actividad where codpoyecto="+Integer.parseInt(codProyecto);
			actividad8 = (List<Actividad>) manage_entity.executeNativeQuery(query8);
			model.addAttribute("promedio", actividad8);
			
			
			System.out.println(actividad8);
			
			/*List<String> consulta = new ArrayList<String>();
			String query ="SELECT  nombre, codpoyecto\r\n" + 
					"	FROM actividad where codpoyecto="+Integer.parseInt(codProyecto);
			consulta = (List<String>) manage_entity.executeNativeQuery(query);
			model.addAttribute("verproyectos", consulta);
			
			List<String> consultaTarea = new ArrayList<String>();
			String queryt ="select t1.codproyecto, r.nombre as tarea\r\n" + 
					"					FROM proyecto as t1  full outer join actividad as t3 on t1.codproyecto = t3.codpoyecto \r\n" + 
					"					full outer join tarea as r on t3.idactividad = r.idactividad where t1.codproyecto="+Integer.parseInt(codProyecto);
			consulta = (List<String>) manage_entity.executeNativeQuery(queryt);
			model.addAttribute("vertarea", consultaTarea);
			
			List<String> consultaRecurso = new ArrayList<String>();
			String queryr ="select t1.codproyecto, rr.nombre as recurso\r\n" + 
					"					FROM proyecto as t1   full outer join actividad as t3 on t1.codproyecto = t3.codpoyecto full outer join tarea as r on t3.idactividad = r.idactividad inner join recurso as rr on r.idrecurso=rr.idrecurso where t1.codproyecto="+Integer.parseInt(codProyecto);
			consulta = (List<String>) manage_entity.executeNativeQuery(queryr);
			model.addAttribute("verrecursos", consultaRecurso);*/
			
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