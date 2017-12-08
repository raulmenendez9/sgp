package com.sisbam.sisconta.controller.administration;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.configuration.AuthorizedService;
import com.sisbam.sisconta.dao.Dao;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.administration.Usuario;
import com.sisbam.sisconta.entity.security.Menu;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

@Controller
public class HomeController {
	
	@Autowired
	private DaoImp manage_entity;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		//**************cargar el menu lateral*******************
		Principal user = request.getUserPrincipal();
		List<Vista> vistas = (List<Vista>) manage_entity.getAll(Vista.class.getName());
		List<Menu> menus = (List<Menu>) manage_entity.getMenusByUser(user); 
		session.setAttribute("vistasx", vistas);
		session.setAttribute("menusdelrolx", menus);
		
		session.setAttribute("vistas_all", vistas);
		session.setAttribute("menus_all", menus);
		//********************************************************
		Rol rolin = null;
		Vista vista = null;
		try {
			rolin = (Rol) manage_entity.getById(Rol.class.getName(), 1);
			vista = (Vista) manage_entity.getById(Vista.class.getName(), 1);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR EN LINEA 56 HOME CONTROLLER"+e);
		}
		
	
		
		
		
		
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		
		return "inicio";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "login";
	}
	
//	OBTENER EL ROL DEL USUARIO QUE VE LA PAGINA, APARTIR DE ESE ROL OBTENER TODOS LOS MENUS QUE PERTENECEN A ESE ROL
//	LUEGO GUANDO HE MOSTRADO EL MENU DEL ROL LISTO LAS VISTAS PARA ESE MENU DENTRO DE EL 
//	AL FINAL SOLO DEBO ENVIAR LA LISTA DE MENUS Y LA LISTA DE VISTAS PARA QUE CUANDO LA VISTA.MENU.ID == MENU.ID MUESTRE LA VISTA
	
}
