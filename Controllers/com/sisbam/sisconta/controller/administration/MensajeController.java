package com.sisbam.sisconta.controller.administration;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.administration.Empleado;
import com.sisbam.sisconta.entity.administration.Usuario;
import com.sisbam.sisconta.entity.administration.Empresa;
import com.sisbam.sisconta.entity.administration.Mensajes;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

@Controller
public class MensajeController {
	@Autowired
	private DaoImp manage_entity;
	private String path = "Administration/Mensajes/";
	private static final String IDENTIFICADOR = "mensajes-x23";
	private Permisos permisos;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mensajes", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sisconta/mensajes", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		if(permisos.isR())
		{
			Mensajes mensaje = new Mensajes();
			model.addAttribute("mensajeForm", mensaje);
			model.addAttribute("mensaje", null);
				List<Mensajes> mensajes = (List<Mensajes>) this.manage_entity.getAll("Mensajes");
				List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
				model.addAttribute("mensajes", mensajes);
				model.addAttribute("usuarios", usuarios);
			retorno = path+"mensaje"; //cambiado
		}
		return retorno;
}
	@RequestMapping(value = "/mensajes/add", method = RequestMethod.POST)
	public String saveOrUpadateMensajes(@ModelAttribute("mensajeForm") Mensajes mensajesRecibido,Model model) throws ClassNotFoundException {
		String retorno = "403";
		if(permisos.isC())
		{
			
			Mensajes mensajes = new Mensajes();

			List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");

			model.addAttribute("usuarios", usuarios);

			model.addAttribute("mensajeForm", mensajes);

			model.addAttribute("mensajes", null);
			
				Mensajes mensaje = mensajesRecibido;
				if(mensaje.getIdMensaje()==0){
					manage_entity.save(Mensajes.class.getName(), mensaje);
				}else{
					manage_entity.update(Mensajes.class.getName(), mensaje);
				}
				retorno="redirect:/mensaje"; //cambiado
		}
		return retorno;
	}
	
	@RequestMapping(value = "/mensajes/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String mensajeId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isU()) 
		{
			Mensajes mensaje = (Mensajes) manage_entity.getById(Mensajes.class.getName(), Integer.parseInt(mensajeId));
			model.addAttribute("mensaje", mensaje);
			Mensajes mensajeForm = new Mensajes();
			model.addAttribute("mensajeForm", mensajeForm);
			retorno=path+"mensaje-form";
		}
		
		return retorno;
	}
	@RequestMapping(value = "/mensajes/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String mensajeId, Model model) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isD()) {
		Mensajes mensaje = (Mensajes) manage_entity.getById(Mensajes.class.getName(), Integer.parseInt(mensajeId));
		manage_entity.delete(Mensajes.class.getName(), mensaje);
		model.addAttribute("mensaje", mensaje);
		
		Mensajes mensajeForm = new Mensajes();
		model.addAttribute("mensajeForm", mensajeForm);
		retorno="redirect:/mensaje"; // cambiado
		}
		return retorno;
	}
	
	
}
	