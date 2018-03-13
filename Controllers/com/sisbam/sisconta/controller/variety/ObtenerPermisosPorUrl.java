package com.sisbam.sisconta.controller.variety;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

public class ObtenerPermisosPorUrl {
	
	
	public HttpSession Obtener(String url,HttpServletRequest request,DaoImp manage_entity,String identificador) {
		//se obtiene la session 
		HttpSession session = request.getSession();
		Permisos permisos = new Permisos();
		
		try {
				//si no existen en sesion los permisos se cargan en session
				if(session.getAttribute("read"+identificador)==null) {
					
					
					
				
					
					//se obtiene el rol y la vista 
					Rol rol = (Rol) request.getSession().getAttribute("rol_usuarioactual");
					Vista vista = (Vista) manage_entity.getByName(Vista.class.getName(), "url", url);
					
					permisos = (Permisos) manage_entity.getPermisosByVistaAndRol(vista, rol);
					
					
					//*************CARGAR BOTONES PERMITIDOS******************
//					String c = permisos.isC()?"si":"no";
//					String r = permisos.isC()?"si":"no";
//					String u = permisos.isC()?"si":"no";
//					String d = permisos.isC()?"si":"no";
					
					session.setAttribute("create"+identificador,(Boolean)permisos.isC());
					session.setAttribute("read"+identificador,  (Boolean)permisos.isR());
					session.setAttribute("update"+identificador,(Boolean)permisos.isU());
					session.setAttribute("delete"+identificador,(Boolean)permisos.isD());
					//**********************************************************
					session.setAttribute("permisos-de-"+identificador,permisos);
					
					
				}
				else {
					//si ya estan los permisos en sesion solo se obtienen
					permisos = (Permisos) session.getAttribute("permisos-de-"+identificador);
					//*************CARGAR BOTONES PERMITIDOS******************
					
//					String c = permisos.isC()?"si":"no";
//					String r = permisos.isC()?"si":"no";
//					String u = permisos.isC()?"si":"no";
//					String d = permisos.isC()?"si":"no";
					
					session.setAttribute("create"+identificador,(Boolean)permisos.isC());
					session.setAttribute("read"+identificador,  (Boolean)permisos.isR());
					session.setAttribute("update"+identificador,(Boolean)permisos.isU());
					session.setAttribute("delete"+identificador,(Boolean)permisos.isD());
					//**********************************************************
					session.setAttribute("permisos-de-"+identificador,permisos);
					
					
				}
		
		
		
		return session;
		}
		catch(Exception e) {
			System.out.println("NULL POINTER: VISTA-ROL NO ENCONTRADA ObtenerPermisosPorUrl.java"+e);
			return session;
		}
	}
	
	
	
	
//	USAR ESTE METODO CUANDO SE ESTEN HACIENDO PRUEBAS Y NO SE QUIERA AGREGAR LA VISTA AL MENU
	public Permisos ObtenerAmbienteDePruebas(String url,HttpServletRequest request,DaoImp manage_entity) {
		Rol rol = (Rol) request.getSession().getAttribute("rol_usuarioactual");
		Vista vista = (Vista) manage_entity.getByName(Vista.class.getName(), "url", url);
		Permisos permisos = new Permisos();
		permisos.setC(true);
		permisos.setR(true);
		permisos.setU(true);
		permisos.setD(true);
		permisos.setVista(vista);
		permisos.setRol(rol);
		return permisos;
	}

}
