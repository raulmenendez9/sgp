package com.sisbam.sisconta.controller.security;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.http.HTTPException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.security.Menu;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Vista;

@Controller
public class VistaController {
	
	@Autowired
	private DaoImp manage_entity;
	
	private String path="Security/Vista/";
	private static final String IDENTIFICADOR = "vistasx23";
	
	private Permisos permisos;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/vistas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sisconta/vistas", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
	
		
		if(permisos.isR()) {
			Vista vista = new Vista();
			model.addAttribute("vistaForm", vista);
			model.addAttribute("vista", null);
			List<Vista> vistas= (List<Vista>) this.manage_entity.getAll("Vista");
			List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
			model.addAttribute("vistas", vistas);
			model.addAttribute("menus", menus);
			retorno = path+"vista";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/vistas/add", method = RequestMethod.GET)
	public String addVista(Model model, HttpServletRequest request)  {
		
		
		
		
		String retorno = "403";
		if(permisos.isC())
		{
			Vista vista = new Vista();
			List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
			model.addAttribute("vistaForm", vista);
			model.addAttribute("vista", null);
			model.addAttribute("menus", menus);
			retorno = path+"vista-form";
		}
		return retorno;
		
	}
	
	@RequestMapping(value = "/vistas/add", method = RequestMethod.POST)
	public String saveOrUpadateVista(@ModelAttribute("vistaForm") Vista vistaRecibido) throws ClassNotFoundException {
		Vista vista = vistaRecibido;
		Menu menuSeleccionado = (Menu) this.manage_entity.getById(Menu.class.getName(), vista.getIdMenu());
		vista.setMenu(menuSeleccionado);
		if (permisos.isC()) {

			if (vista.getIdVista() == 0) {
				manage_entity.save(Vista.class.getName(), vista);
			} else {
				manage_entity.update(Vista.class.getName(), vista);
			}
			return "redirect:/vistas";
		}
		return "403";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/vistas/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String vistaId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		if(permisos.isU()) 
		{
				
		Vista vista = (Vista) manage_entity.getById(Vista.class.getName(), Integer.parseInt(vistaId));
		model.addAttribute("vista", vista);
		
		Vista vistaForm = new Vista();
		model.addAttribute("vistaForm", vistaForm);
		
		List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
		model.addAttribute("menus", menus);
		return path+"vista-form";
		}
		return "403";
	}
	
	
	@RequestMapping(value = "/vistas/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String vistaId, Model model) throws ClassNotFoundException {
		if(permisos.isD()) {
		Vista vista = (Vista) manage_entity.getById(Vista.class.getName(), Integer.parseInt(vistaId));
		manage_entity.delete(Vista.class.getName(), vista);
		model.addAttribute("vista", vista);
		
		Vista vistaForm = new Vista();
		model.addAttribute("vistaForm", vistaForm);
		
		@SuppressWarnings("unchecked")
		List<Vista> vistas = (List<Vista>) this.manage_entity.getAll("Vista");
		model.addAttribute("vistas", vistas);
		return "redirect:/vistas";
		}
		return "403";
	}
	
	@RequestMapping("/quepex")
    public String generator() throws HTTPException {
        throw new HTTPException(404);
    }
	
}
