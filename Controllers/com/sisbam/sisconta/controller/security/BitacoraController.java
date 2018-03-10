package com.sisbam.sisconta.controller.security;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.controller.variety.ReportesController;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.security.Bitacora;
import com.sisbam.sisconta.entity.security.Permisos;

import freemarker.core.ParseException;

@Controller
public class BitacoraController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path="Security/";
	private static final String IDENTIFICADOR = "bitacorax23";
	
	private Permisos permisos;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/bitacora", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";

		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sisconta/bitacora", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
		
		
		model.addAttribute("read",	permisos.isR());

		if(permisos.isR()) {
			model.addAttribute("bitacora", null);
			List<Bitacora> bitacoras= (List<Bitacora>) this.manage_entity.getAll(Bitacora.class.getName());
			model.addAttribute("bitacoras", bitacoras);
			retorno = path+"bitacora";
		}
		return retorno;
	}
	
	@RequestMapping(value = "/reporteBitacora", method = RequestMethod.GET)
	public void reporte(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		ReportesController rep = new ReportesController();
		HashMap<String,Object> hmParams=new HashMap<String,Object>();
		 hmParams.put("titulo",			"HISTORIAL");
	     hmParams.put("descripcion",	"HISTORIAL DE CAMBIOS AL SISTEMA");
		rep.genearReporte(model, request, response, "historialRep",hmParams);
	}

}
