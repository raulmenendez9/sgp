package com.sisbam.sgp.controller.administration;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.dao.DaoImp;
import com.sisbam.sgp.entity.administration.Empleado;
import com.sisbam.sgp.entity.administration.Solicitud;
import com.sisbam.sgp.entity.administration.Usuario;
import com.sisbam.sgp.entity.security.Permisos;
import com.sisbam.sgp.entity.security.Rol;

@Controller
public class SolicitudController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Solicitud/";
	private static final String IDENTIFICADOR = "tipoS";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/solicitudes", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/solicitudes", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			Solicitud solicitud = new Solicitud();
			model.addAttribute("solicitudForm", solicitud);
			model.addAttribute("solicitud", null);
				List<Solicitud> solicitudes = (List<Solicitud>) this.manage_entity.getAll("Solicitud");
				List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
				model.addAttribute("solicitudes", solicitudes);
				model.addAttribute("usuarios", usuarios);
			retorno = path+"solicitud";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/solicitudes/add", method = RequestMethod.GET)
	public String addUsuario(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Solicitud solicitud = new Solicitud();
			List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
			
			model.addAttribute("solicitudForm", solicitud);
			model.addAttribute("solicitud", null);
			model.addAttribute("usuarios", usuarios);
			
			retorno = path+"solicitud-form";
		}
		return retorno;
		
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/solicitudes/add", method = RequestMethod.POST)
		public String saveOrUpadateSolicitud(@ModelAttribute("solicitudForm") Solicitud solicitudRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
			if(permisos.isC())
			{
					Solicitud solicitud = solicitudRecibido;
					Usuario usuarioSeleccionado = (Usuario) this.manage_entity.getById(Usuario.class.getName(), solicitud.getIdUsuario());
					solicitud.setUsuario(usuarioSeleccionado);
					if(solicitud.getCodSolicitud()==0) {
						manage_entity.save(Solicitud.class.getName(), solicitud);
					}else{
						manage_entity.update(Solicitud.class.getName(), solicitud);
					}
					retorno="redirect:/solicitudes";
			}
			return retorno;
		}
		
		//ACTUALIZAR
		@RequestMapping(value = "/solicitudes/update/{id}", method = RequestMethod.GET)
		public String update(@PathVariable("id") String codSolicitud, Model model, HttpServletRequest request) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isU()) 
			{
				Solicitud solicitud = (Solicitud) manage_entity.getById(Solicitud.class.getName(), Integer.parseInt(codSolicitud));
				model.addAttribute("solicitud", solicitud);
				Solicitud solicitudForm = new Solicitud();
				model.addAttribute("solicitudForm", solicitudForm);
				
				List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
				model.addAttribute("usuarios", usuarios);
				retorno=path+"solicitud-form";
			}
			
			return retorno;
		}
		
		//ELIMINAR
		@RequestMapping(value = "/solicitudes/delete/{id}", method = RequestMethod.GET)
		public String delete(@PathVariable("id") String codSolicitud, Model model) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isD()) {
			Solicitud solicitud = (Solicitud) manage_entity.getById(Solicitud.class.getName(), Integer.parseInt(codSolicitud));
			manage_entity.delete(Solicitud.class.getName(), solicitud);
			model.addAttribute("solicitud", solicitud);
			
			Solicitud solicitudForm = new Solicitud();
			model.addAttribute("SolicitudForm", solicitudForm);
			retorno="redirect:/solicitudes";
			}
			return retorno;
		}

}