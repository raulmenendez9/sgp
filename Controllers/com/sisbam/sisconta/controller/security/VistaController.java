package com.sisbam.sisconta.controller.security;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.http.HTTPException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.configuration.AuthorizedService;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.security.Menu;
import com.sisbam.sisconta.entity.security.Vista;

@Controller
public class VistaController {
	
	@Autowired
	private DaoImp manage_entity;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/vistas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		
		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "vista");
		if(authorized){
			Vista vista = new Vista();
			model.addAttribute("vistaForm", vista);
			model.addAttribute("vista", null);
			List<Vista> vistas= (List<Vista>) this.manage_entity.getAll("Vista");
			List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
			model.addAttribute("vistas", vistas);
			model.addAttribute("menus", menus);
			

			
			retorno = "vista";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/vistas/add", method = RequestMethod.GET)
	public String addVista(Model model, HttpServletRequest request)  {
		
		
		
		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "vista-form");
		if(authorized){
			Vista vista = new Vista();
			List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
			model.addAttribute("vistaForm", vista);
			model.addAttribute("vista", null);
			model.addAttribute("menus", menus);
			retorno = "vista-form";
		}
		return retorno;
		
	}
	
	@RequestMapping(value = "/vistas/add", method = RequestMethod.POST)
	public String saveOrUpadateVista(@ModelAttribute("vistaForm") Vista vistaRecibido) throws ClassNotFoundException {
		Vista vista = vistaRecibido;
		Menu menuSeleccionado = (Menu) this.manage_entity.getById(Menu.class.getName(), vista.getIdMenu());	
		vista.setMenu(menuSeleccionado);
		
		
		if(vista.getIdVista()==0){
			manage_entity.save(Vista.class.getName(), vista);
		}else{
			manage_entity.update(Vista.class.getName(), vista);
		}
		return "redirect:/vistas";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/vistas/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String vistaId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		
		
		
		
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
				
		Vista vista = (Vista) manage_entity.getById(Vista.class.getName(), Integer.parseInt(vistaId));
		model.addAttribute("vista", vista);
		
		Vista vistaForm = new Vista();
		model.addAttribute("vistaForm", vistaForm);
		
		List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
		model.addAttribute("menus", menus);
		return "vista-form";
	}
	
	
	@RequestMapping(value = "/vistas/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String vistaId, Model model) throws ClassNotFoundException {
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
	
	@RequestMapping("/quepex")
    public String generator() throws HTTPException {
        throw new HTTPException(404);
    }
	
}
