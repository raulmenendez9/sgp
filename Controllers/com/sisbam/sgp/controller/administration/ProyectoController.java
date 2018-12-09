package com.sisbam.sgp.controller.administration;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.dao.DaoImp;
import com.sisbam.sgp.entity.administration.Actividad;
import com.sisbam.sgp.entity.administration.Empleado;
import com.sisbam.sgp.entity.administration.Indicador;
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
	private static final Logger logger = LoggerFactory.getLogger(ProyectoController.class);
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
	
			//List<Proyecto> proyectos = (List<Proyecto>) this.manage_entity.getAll("Proyecto");
			List<Indicador> proyectos = (List<Indicador>) this.manage_entity.getListByName("Proyecto", "habilitado", "true");
			List<Solicitud> solicitudes = (List<Solicitud>) this.manage_entity.getAll("Solicitud");
			model.addAttribute("solicitudes", solicitudes);
			model.addAttribute("proyectos", proyectos);
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

			List<String> consulta = new ArrayList<String>();
			String sql = "SELECT s.codsoliciutud, s.estado, s.fecha, s.justificacion,s.objetivo, s.titulo FROM Solicitud as s WHERE s.estado="+true+" and NOT EXISTS (SELECT null FROM Proyecto as z WHERE z.codSolicitud = s.codsoliciutud) ";
			consulta = (List<String>) manage_entity.executeNativeQuery(sql);		
			model.addAttribute("solicitudes", consulta);
			model.addAttribute("proyectoForm", proyecto);
			model.addAttribute("proyecto", null);
			
			
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
						
						/*List<Proyecto> proyecto = (List<Proyecto>) this.manage_entity.getListByName("Proyecto", "codProyecto", codProyecto);
						model.addAttribute("solicitud", proyecto);*/
						
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
		
		
				@RequestMapping(value = "/pi/{id}", method =  RequestMethod.GET)
				public String indicador(@PathVariable("id") String codProyecto, Model model, HttpServletRequest request) throws ClassNotFoundException {
					String retorno="403";
					if(permisos.isD()) {
					
					List<Indicador> indicadores = (List<Indicador>) this.manage_entity.getListByName("Indicador", "codProyecto", codProyecto);
					model.addAttribute("indicadores", indicadores);
					retorno=path+"proyectosindicador";
					}
					return retorno;
				}
				//Actividades Gabriel
				@RequestMapping(value = "/actividad/{id}", method =  RequestMethod.GET)
				public String actividad(@PathVariable("id") String codProyecto, Model model, HttpServletRequest request) throws ClassNotFoundException {
					String retorno="403";
					Double promedio = 0.0;
					if(permisos.isD()) {
					
					List<Actividad> actividades = (List<Actividad>) this.manage_entity.getListByName("Actividad", "codpoyecto", codProyecto);
					model.addAttribute("actividades", actividades);
					
					Proyecto proyecto = (Proyecto) manage_entity.getById(Proyecto.class.getName(), Integer.parseInt(codProyecto));
					model.addAttribute("idProyecto", proyecto.getCodProyecto());
					
					for(Actividad act : actividades)
					{
						promedio = promedio + act.getEstado();
					}
					
					promedio = promedio / actividades.size();
					model.addAttribute("promedio",promedio);
					retorno=path + "proyectosact";
					}
					return retorno;
				}
				
				//Terminar proyecto Gabriel
				@RequestMapping(value = "/proyectos/end/{id}", method =  RequestMethod.GET)
				public String proyectoEnd(@PathVariable("id") String codProyecto, Model model) throws ClassNotFoundException {
				
					String retorno ="403";
					Proyecto proyecto = (Proyecto) manage_entity.getById(Proyecto.class.getName(), Integer.parseInt(codProyecto));
					System.out.println(proyecto.getDuracion());
					proyecto.setHabilitado(false);
					manage_entity.update(Proyecto.class.getName(), proyecto);
					model.addAttribute("proyecto", proyecto);
				Proyecto proyectoForm = new Proyecto();
				model.addAttribute("proyectoForm", proyectoForm);
					retorno="redirect:/proyectos";
					return retorno;
					
				}
		
				
				
				//Matriz Gabriel
				@RequestMapping(value = "/matriz/{id}", method =  RequestMethod.GET)
				public String matriz(@PathVariable("id") String codProyecto, Model model, HttpServletRequest request) throws ClassNotFoundException {
					String retorno="403";
					double estado=0;
					if(permisos.isD()) {
					
					List<Indicador> indicadores = (List<Indicador>) this.manage_entity.getListByName("Indicador", "codProyecto", codProyecto);
					model.addAttribute("indicadores", indicadores);
					retorno=path+"matriz";
					}
					return retorno;
				}
				
				
				@SuppressWarnings("unchecked")
				@RequestMapping(value = "/upload", method = RequestMethod.GET)
				
				
				public String subir(Model model, HttpServletRequest request) throws ClassNotFoundException{
					
					String retorno = "403";
					retorno = path+"upload";
					return retorno;
				}
				
				//subir archivo
				 @RequestMapping(value = "/uploadFile", method = {RequestMethod.POST,  RequestMethod.GET})
				 
				 public @ResponseBody String uploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws ClassNotFoundException{
					 String retorno = "403"; 

				  if (!file.isEmpty()) {
				   try {
				    byte[] bytes = file.getBytes();
				    // Crear el directorio para almacenar el archivo
				    String rootPath = System.getProperty("catalina.home");
				    File dir = new File(rootPath + File.separator + "tmpFiles");
				    
				    if (!dir.exists())
				     dir.mkdirs();

				    // Crear documento en el servidor
				    File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
				    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				    stream.write(bytes);
				    stream.close();

				    logger.info("Ubicación de documento = " + serverFile.getAbsolutePath());

				    retorno = "Documento subido correctamente = " + file.getOriginalFilename() + " Ubicacion del Archivo = " + serverFile.getAbsolutePath();
				   } catch (Exception e) {
					   retorno = "Ocurrio un error al subir documento" + file.getOriginalFilename() + " => " + e.getMessage();
				   }
				  } else {
					  retorno = "Ocurrio un error al subir " + file.getOriginalFilename() + " documento vacio.";
				  }
					 return retorno;
				 }
		
}