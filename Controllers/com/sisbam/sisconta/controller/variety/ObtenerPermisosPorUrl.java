package com.sisbam.sisconta.controller.variety;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

public class ObtenerPermisosPorUrl {
	
	
	
	public Permisos Obtener(String url,HttpServletRequest request,DaoImp manage_entity) {
		Rol rol = (Rol) request.getSession().getAttribute("rol_usuarioactual");
		Vista vista = (Vista) manage_entity.getByName(Vista.class.getName(), "url", url);
		Permisos permisos = (Permisos) manage_entity.getPermisosByVistaAndRol(vista, rol);
		
		return permisos;
		
	}

}
