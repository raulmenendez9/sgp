package com.sisbam.sisconta.controller.security;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Vista;

@Controller
public class MenuController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path="Security/Menu/";
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/menus", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		
		
		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "menu");
		if(authorized){
			Menu menu = new Menu();
			Vista vista = new Vista();
			model.addAttribute("vistaForm",vista);
			model.addAttribute("menuForm", menu);
			model.addAttribute("menu", null);
			List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
			List<Vista> vistas = (List<Vista>) this.manage_entity.getAll("Vista");
			model.addAttribute("menus", menus);
			model.addAttribute("vistas", vistas);
			retorno = path+"menu";
		}
		return retorno;
	}
	
	
	@RequestMapping(value = "/menus/add", method = RequestMethod.GET)
	public String addMenu(Model model, HttpServletRequest request)  {
		
		
		
		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "menu-form");
		if(authorized){
			Menu menu = new Menu();
//			List<Vista> vistas = (List<Vista>) this.manage_entity.getInstancesById("Vista", "Menu", "id", Menu.getId());
			model.addAttribute("menuForm", menu);
			model.addAttribute("menu", null);
//			model.addAttribute("vistas", vistas);
			retorno = path+"menu-form";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/menus/add", method = RequestMethod.POST)
	public String saveOrUpadateMenu(@ModelAttribute("menuForm") Menu menuRecibido) throws ClassNotFoundException {
		Menu menu = menuRecibido;
		List<Vista>vistas= (List<Vista>) manage_entity.getInstancesById("Vista", "Menu", "id", menu.getId());
		menu.setVistas(vistas);
		menu.setActivo(false);
		if(menu.getId()==0){
			
			manage_entity.save(Menu.class.getName(), menu);
		}else{
			manage_entity.update(Menu.class.getName(), menu);
		}
		return "redirect:/menus";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/menus/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String menuId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		
				
		Menu menu = (Menu) manage_entity.getById(Menu.class.getName(), Integer.parseInt(menuId));
		model.addAttribute("menu", menu);
		
		Menu menuForm = new Menu();
		model.addAttribute("menuForm", menuForm);
		
		List<Vista> vistas = (List<Vista>) this.manage_entity.getAll("Vista");
		model.addAttribute("empresas", vistas);
		return path+"menu-form";
	}
	
	
	@RequestMapping(value = "/menus/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String menuId, Model model) throws ClassNotFoundException {
		Menu menu = (Menu) manage_entity.getById(Menu.class.getName(), Integer.parseInt(menuId));
		
		
		manage_entity.delete(Menu.class.getName(), menu);
		model.addAttribute("menu", menu);
		
		Menu menuForm = new Menu();
		model.addAttribute("menuForm", menuForm);
		
		
		
		@SuppressWarnings("unchecked")
		List<Menu> menus = (List<Menu>) this.manage_entity.getAll("Menu");
		model.addAttribute("menus", menus);
		return "redirect:/menus";
	}
	
	
	
	

}
