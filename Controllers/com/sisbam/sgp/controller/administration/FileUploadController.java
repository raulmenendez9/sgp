package com.sisbam.sgp.controller.administration;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
//import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.dao.DaoImp;
//import com.sisbam.sgp.entity.administration.Actividad;
//import com.sisbam.sgp.entity.administration.Proyecto;
//import com.sisbam.sgp.entity.security.Permisos;


@Controller
//@RequestMapping(value="/sgp/upload")
public class FileUploadController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Proyecto/";
	private static final String IDENTIFICADOR = "uploadP";
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	//private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/upload", request, manage_entity,IDENTIFICADOR);
		//permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		//if(permisos.isR())
		//{
			/*Actividad actividad = new Actividad();
			model.addAttribute("actividadForm", actividad);
			model.addAttribute("actividad", null);

			List<Actividad> actividades = (List<Actividad>) this.manage_entity.getAll("Actividad");
			List<Proyecto> proyectos = (List<Proyecto>) this.manage_entity.getAll("Proyecto");
	
	
				model.addAttribute("actividades", actividades);
				model.addAttribute("proyectos",proyectos);
			retorno = path+"actividad";
			
		}*/
		retorno = path+"upload";
		return retorno;
	}

	

 //subir archivo
 @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
 
 public @ResponseBody String uploadFile( @RequestParam(value = "_csrf", required = false) String csrf,
			@RequestParam("file") MultipartFile file) throws ClassNotFoundException{
	 String retorno = "403";
	// @RequestParam(value = "_csrf", required = false) String csrf; 

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

 // subir multiples archivos
 /*@RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
 public @ResponseBody String uploadMultipleFile(@RequestParam("file") MultipartFile[] files) {

  if (files.length != files.length)
   return "Falta información";

  String message = "";
  for (int i = 0; i < files.length; i++) {
   MultipartFile file = files[i];
   String name = files[i].getOriginalFilename();
   try {
    byte[] bytes = file.getBytes();

    // Crear el directorio para almacenar el archivo
    String rootPath = System.getProperty("catalina.home");
    File dir = new File(rootPath + File.separator + "tmpFiles");
    if (!dir.exists())
     dir.mkdirs();

    // Crear documento en el servidor
    File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
    stream.write(bytes);
    stream.close();

    logger.info("Ubicación de documento = " + serverFile.getAbsolutePath());

    message = message + "<br> Documentos Subidos Correctamente = " + name + " Ubicacion del Archivo = " + serverFile.getAbsolutePath();
   } catch (Exception e) {
    return "Ocurrio un error al subir " + name + " => " + e.getMessage();
   }
  }
  return message;
 }*/
}