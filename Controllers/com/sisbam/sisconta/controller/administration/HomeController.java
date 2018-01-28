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

import com.sisbam.sisconta.controller.variety.ReportesController;
import com.sisbam.sisconta.dao.Dao;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.administration.Usuario;
import com.sisbam.sisconta.entity.security.Menu;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

import freemarker.core.ParseException;

@Controller
public class HomeController {
	
	@Autowired
	private DaoImp manage_entity;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		HttpSession session = request.getSession();

//		*************Cargar el usuario y el Rol actual***************
		Principal user = request.getUserPrincipal();
		Usuario usuario = (Usuario) manage_entity.getByName(Usuario.class.getName(),"username", user.getName());
		Rol rol = (Rol) manage_entity.getByName(Rol.class.getName(), "idRol", usuario.getRol().getIdRol().toString());
		session.setAttribute("rol_usuarioactual", rol);
		session.setAttribute("usuarioactual", usuario);
		
		//**************cargar el menu lateral*******************
		
		List<Vista> vistas = (List<Vista>) manage_entity.getAll(Vista.class.getName());
		List<Menu> menus = (List<Menu>) manage_entity.getMenusByUser(user); 
		List<Menu> menustodos = (List<Menu>) manage_entity.getAll(Menu.class.getName()); 
		
		List<Permisos> permisos = (List<Permisos>) manage_entity.getListByName(Permisos.class.getName(), "rol", usuario.getRol().getIdRol().toString());
		
		session.setAttribute("vistasx", listaVistas(rol));
		session.setAttribute("menusdelrolx", listaMenus(rol));
		
		session.setAttribute("vistas_all", vistas);
		session.setAttribute("menus_all", menus);
		session.setAttribute("user", user);
		//********************************************************
		
		
		return "inicio";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "login";
	}
	
	
	public List<String> listaMenus(Rol rol){
		String sql = "select m.nombre,m.icono,m.id_menu from permisos p "
				+ " inner join vista v on v.id_vista = p.id_vista "
				+ " inner join menu m on m.id_menu = v.id_menu"
				+ " where p.id_rol ="+rol.getIdRol()
				+ " group by m.nombre,m.icono,m.id_menu";
		
		List<String> listamenus = (List<String>) manage_entity.executeNativeQuery(sql);
		return listamenus;
	}
	
	public List<String> listaVistas(Rol rol){
		String sql = "select v.nombre,v.id_menu,v.id_vista,v.url,v.icono  from permisos p "
				+ " inner join vista v on v.id_vista = p.id_vista "
				+ " inner join menu m on m.id_menu = v.id_menu "
				+ " where p.id_rol ="+rol.getIdRol()+""
				+ " group by v.nombre,v.id_menu,v.id_vista,v.url,v.icono "
				+ " order by v.id_menu";
		
		List<String> listamenus = (List<String>) manage_entity.executeNativeQuery(sql);
		return listamenus;
		
	}
	
	
}
