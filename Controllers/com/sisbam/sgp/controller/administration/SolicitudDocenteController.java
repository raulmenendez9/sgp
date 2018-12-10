package com.sisbam.sgp.controller.administration;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import com.sisbam.sgp.entity.administration.Solicitud;
import com.sisbam.sgp.entity.administration.TipoProyecto;
import com.sisbam.sgp.entity.administration.Usuario;
import com.sisbam.sgp.entity.security.Permisos;

@Controller
public class SolicitudDocenteController {

	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/SolicitudA/";
	private static final String IDENTIFICADOR = "tipoSo";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/solicitudesapro", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/solicitudesapro", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
		
			Solicitud solicitud = new Solicitud();
			model.addAttribute("solicitudForm", solicitud);
			model.addAttribute("solicitud", null);
			List<Solicitud> solicitudes = (List<Solicitud>) this.manage_entity.getAll("Solicitud");
			
			
				List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
				List<TipoProyecto> tiposProyectos = (List<TipoProyecto>) this.manage_entity.getAll("TipoProyecto");
				model.addAttribute("tiposProyectos", tiposProyectos);
				model.addAttribute("solicitudes", solicitudes);
				model.addAttribute("usuarios", usuarios);
			retorno = path+"solicitudapro";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/solicitudesapro/add", method = RequestMethod.GET)
	public String addUsuario(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Solicitud solicitud = new Solicitud();
			List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
			List<TipoProyecto> tiposProyectos = (List<TipoProyecto>) this.manage_entity.getAll("TipoProyecto");
			model.addAttribute("tiposProyectos", tiposProyectos);
			model.addAttribute("solicitudForm", solicitud);
			model.addAttribute("solicitud", null);
			model.addAttribute("usuarios", usuarios);
			
			retorno = path+"solicitudapro-form";
		}
		return retorno;
		
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/solicitudesapro/add", method = RequestMethod.POST)
		public String saveOrUpadateSolicitud(@ModelAttribute("solicitudForm") Solicitud solicitudRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
		
			if(permisos.isC())
			{
					Solicitud solicitud = solicitudRecibido;
					Usuario usuarioSeleccionado = (Usuario) this.manage_entity.getById(Usuario.class.getName(), solicitud.getIdUsuario());
					solicitud.setUsuario(usuarioSeleccionado);
					TipoProyecto tipoSeleccionado = (TipoProyecto)this.manage_entity.getById(TipoProyecto.class.getName(), solicitud.getIdTipoProyecto());
					solicitud.setTipoProyecto(tipoSeleccionado);
					String destinatario =  solicitud.getCorreo(); //A quien le quieres escribir.
				    String asunto = "Solicitud de proyecto";
				    String cuerpo = "Tiene una nueva solicitude de proyecto del docente : "+usuarioSeleccionado.getEmpleado().getNombre()+" "+usuarioSeleccionado.getEmpleado().getApellidos();

				    
					
					if(solicitud.getCodSolicitud()==0) {
						manage_entity.save(Solicitud.class.getName(), solicitud);
						enviarConGMail(destinatario, asunto, cuerpo);
					}else{
						manage_entity.update(Solicitud.class.getName(), solicitud);
					}
					retorno="redirect:/solicitudesapro";
			}
			return retorno;
		}
		
		//ACTUALIZAR
		@RequestMapping(value = "/solicitudesapro/update/{id}", method = RequestMethod.GET)
		public String update(@PathVariable("id") String codSolicitud, Model model, HttpServletRequest request) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isU()) 
			{
				Solicitud solicitud = (Solicitud) manage_entity.getById(Solicitud.class.getName(), Integer.parseInt(codSolicitud));
				model.addAttribute("solicitud", solicitud);
				Solicitud solicitudForm = new Solicitud();
				model.addAttribute("solicitudForm", solicitudForm);

				List<TipoProyecto> tiposProyectos = (List<TipoProyecto>) this.manage_entity.getAll("TipoProyecto");
				model.addAttribute("tiposProyectos", tiposProyectos);
				
				List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
				model.addAttribute("usuarios", usuarios);
				
				retorno=path+"solicitudapro-form";
			}
			
			return retorno;
		}
		
		//ELIMINAR
		@RequestMapping(value = "/solicitudesapro/delete/{id}", method = RequestMethod.GET)
		public String delete(@PathVariable("id") String codSolicitud, Model model) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isD()) {
			Solicitud solicitud = (Solicitud) manage_entity.getById(Solicitud.class.getName(), Integer.parseInt(codSolicitud));
			manage_entity.delete(Solicitud.class.getName(), solicitud);
			model.addAttribute("solicitud", solicitud);
			
			Solicitud solicitudForm = new Solicitud();
			model.addAttribute("SolicitudForm", solicitudForm);
			retorno="redirect:/solicitudesapro";
			}
			return retorno;
		}
		
		
		//CODIGO REALIZADO POR GABRIEL FERNANDO PEREZ SAGASTUME
		private static void enviarConGMail(String destinatario, String asunto, String cuerpo) {
		    
		    String remitente = "sagastume13001";  
		    Properties props = System.getProperties();
		    props.put("mail.smtp.host", "smtp.gmail.com");  
		    props.put("mail.smtp.user", remitente);
		    props.put("mail.smtp.clave", "sagastumeps13001");    
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.enable", "true"); 
		    props.put("mail.smtp.port", "587"); 

		    Session session = Session.getDefaultInstance(props);
		    MimeMessage message = new MimeMessage(session);

		    try {
		        message.setFrom(new InternetAddress(remitente));
		        message.addRecipients(Message.RecipientType.TO, destinatario);
		        message.setSubject(asunto);
		        message.setText(cuerpo);
		        Transport transport = session.getTransport("smtp");
		        transport.connect("smtp.gmail.com", remitente, "sagastumeps13001");
		        transport.sendMessage(message, message.getAllRecipients());
		        transport.close();
		    }
		    catch (MessagingException me) {
		        me.printStackTrace();   
		    }
		}

		
	}
