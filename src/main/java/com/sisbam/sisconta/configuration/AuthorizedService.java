package com.sisbam.sisconta.configuration;

import com.sisbam.sisconta.dao.Dao;
import com.sisbam.sisconta.entity.administration.Usuario;

public class AuthorizedService {

	public static boolean getRolAuthorization(Dao manage_entity, String username, String vista) {
		boolean authorized = false;
		String rol = null;
		Usuario user = (Usuario) manage_entity.getByName(Usuario.class.getSimpleName(), "username", username);
		rol = user.getRol().getNombre();
		switch (rol) {
		case "Administrador":
			authorized = true;
			break;
		case "Coordinador Didactico":
			switch (vista) {
			case "nota":
				authorized = true;
				break;
			default:
				break;
			}
			break;
		case "Alumno":
			
			break;
		case "Maestro":

			break;
		default:
			break;
		}
		return authorized;
	}
	
	public static String getRol(Dao manage_entity, String username){
		String rol = null;
		Usuario user = (Usuario) manage_entity.getByName(Usuario.class.getSimpleName(), "username", username);
		rol = user.getRol().getNombre();
		return rol;
	}
}
