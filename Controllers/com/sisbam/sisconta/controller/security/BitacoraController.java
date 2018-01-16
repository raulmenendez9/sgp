package com.sisbam.sisconta.controller.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.security.Bitacora;
import com.sisbam.sisconta.entity.security.Permisos;

@Controller
public class BitacoraController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path="Security/";
	
	private Permisos permisos;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/bitacora", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		ObtenerPermisosPorUrl obtener = new ObtenerPermisosPorUrl();
		this.permisos = obtener.Obtener("/sisconta/bitacora", request, manage_entity);
		
		model.addAttribute("read",	permisos.isR());

		if(permisos.isR()) {
			model.addAttribute("bitacora", null);
			List<Bitacora> bitacoras= (List<Bitacora>) this.manage_entity.getAll(Bitacora.class.getName());
			model.addAttribute("bitacoras", bitacoras);
			retorno = path+"bitacora";
		}
		return retorno;
	}

}
