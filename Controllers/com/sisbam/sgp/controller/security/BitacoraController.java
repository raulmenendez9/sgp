package com.sisbam.sgp.controller.security;

import java.util.ArrayList;
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

import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.controller.variety.ReportesController;
import com.sisbam.sgp.dao.DaoImp;
import com.sisbam.sgp.entity.security.Bitacora;
import com.sisbam.sgp.entity.security.Permisos;

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
		session = facilitador.Obtener("/sgp/bitacora", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
		
		
		model.addAttribute("read",	permisos.isR());

		if(permisos.isR()) {
			model.addAttribute("bitacora", null);
			
			//List<Bitacora> bitacoras= (List<Bitacora>) this.manage_entity.getAll(Bitacora.class.getName());
			List<String> consulta = new ArrayList<String>();
			String query ="select id_bitacora, accion,to_char(fecha, 'DD/MM/YYYY' ), linea, tabla, username  from bitacora order by id_bitacora desc limit 200 ";
			consulta = (List<String>) manage_entity.executeNativeQuery(query);
			
			model.addAttribute("bitacoras", consulta);
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
