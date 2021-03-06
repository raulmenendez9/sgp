package com.sisbam.sgp.controller.administration;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sgp.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sgp.dao.DaoImp;
import com.sisbam.sgp.entity.administration.Empleado;
import com.sisbam.sgp.entity.administration.Usuario;
import com.sisbam.sgp.entity.security.Permisos;
import com.sisbam.sgp.entity.security.Rol;;

@Controller
public class UsuarioController {
	/*
	 * Variable usada como un servicio que provee los metodos necesarios
	 * para la realizacion de un CRUD. 
	*/
	@Autowired
	private DaoImp manage_entity;
	
	private String path ="Administration/Usuario/";
	private static final String IDENTIFICADOR = "usuariosx67";
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	private Permisos permisos;
	 
	
	/*
	 * value = "/Usuarioes" => URL.
	 * method = RequestMethod.GET => metodos: GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS, TRACE.
	 * */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/usuarios", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) throws ClassNotFoundException {
		String retorno = "403";
		HttpSession session = request.getSession();
		session = LlenarJSON(session);
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/usuarios", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
//****ASIGNAR LOS PERMISOS PARA LAS URL********
			if(permisos.isR()) {
				Usuario usuario = new Usuario();
				model.addAttribute("usuarioForm", usuario);
				model.addAttribute("usuario", null);
				List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
				List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
			//	List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
				List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");
				// Agrega al modelo el atributo "usuarios", asi se conocera en la vista
				// la lista usuarios creada y llenada en el controlador.
				model.addAttribute("usuarios", usuarios);
				model.addAttribute("roles", roles);
				//model.addAttribute("empresas", empresas);
				model.addAttribute("empleados", empleados);
				retorno = path+"usuario";
			}
			
			return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/usuarios/add", method = RequestMethod.GET)
	public String addUsuario(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Usuario usuario = new Usuario();
			List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
			//List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
			List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");
			model.addAttribute("usuarioForm", usuario);
			model.addAttribute("usuario", null);
			model.addAttribute("roles", roles);
			//model.addAttribute("empresas", empresas);
			model.addAttribute("empleados", empleados);
			retorno = path+"usuario-form";
		}
		return retorno;
		
	}
	
	@RequestMapping(value = "/usuariosadd", method = RequestMethod.POST)
	public String saveOrUpadateUsuario(@ModelAttribute("usuarioForm") Usuario usuarioRecibido,
			HttpServletRequest request) throws ClassNotFoundException {
		if (permisos.isC() || permisos.isU()) {

			Usuario usuario = usuarioRecibido;
			

			Rol rolSeleccionado = (Rol) this.manage_entity.getById(Rol.class.getName(), usuario.getIdRol());
			//Empresa EmpresaSeleccionada = (Empresa) this.manage_entity.getById(Empresa.class.getName(),	usuario.getIdEmpresa());
			
			usuario.setRol(rolSeleccionado);
			//usuario.setEmpresa(EmpresaSeleccionada);
			
			String pass = usuario.getPassword();
			usuario.setPassword(passwordEncoder.encode(pass));
			
			
			
			// guardar
			if (usuario.getIdUsuario() == 0) {
				String empleadoId = request.getParameter("empleado-selec");
				empleadoId=empleadoId.split("-")[0];
				Empleado empleado = (Empleado) this.manage_entity.getById(Empleado.class.getName(), Integer.parseInt(empleadoId));
				usuario.setEmpleado(empleado);
						try {
					if (request.getParameter("activo").equals("on")) {
						usuario.setActivo(true);
					} else {
						usuario.setActivo(false);
					}
				} catch (Exception e) {
					usuario.setActivo(false);
				}
				manage_entity.save(Usuario.class.getName(), usuario);

			}

			// actualizar
			else {
				String empleadoId = request.getParameter("empleado-"+usuarioRecibido.getIdUsuario());
				empleadoId=empleadoId.split("-")[0];
				Empleado empleado = (Empleado) this.manage_entity.getById(Empleado.class.getName(), Integer.parseInt(empleadoId));
				usuario.setEmpleado(empleado);
				try {
					if (request.getParameter("activo-" + usuario.getIdUsuario()).equals("on")) {
						usuario.setActivo(true);
					} else {
						usuario.setActivo(false);
					}

				} catch (Exception e) {
					usuario.setActivo(false);
				}

				manage_entity.update(Usuario.class.getName(), usuario);

			}

			return "redirect:/usuarios";
		}
		return "403";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/usuarios/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String usuarioId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		if(permisos.isU()) {
		
				
		Usuario usuario = (Usuario) manage_entity.getById(Usuario.class.getName(), Integer.parseInt(usuarioId));
		model.addAttribute("usuario", usuario);
		
		Usuario usuarioForm = new Usuario();
		model.addAttribute("usuarioForm", usuarioForm);
		
		List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
		//List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
		List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");
		model.addAttribute("roles", roles);
		//model.addAttribute("empresas", empresas);
		model.addAttribute("empleados", empleados);
		
		return path+"usuario-form";
		}
		return "403";
	}
	
	/*
	 * Delete:
	 * Borra objetos de tipo usuario mediante un id enviado en la URL. 
	 */
	@RequestMapping(value = "/usuarios/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String usuarioId, Model model) throws ClassNotFoundException {
		if(permisos.isD()) {
		Usuario usuario = (Usuario) manage_entity.getById(Usuario.class.getName(), Integer.parseInt(usuarioId));
		manage_entity.delete(Usuario.class.getName(), usuario);
		model.addAttribute("usuario", usuario);
		
		Usuario usuarioForm = new Usuario();
		model.addAttribute("usuarioForm", usuarioForm);
		
		@SuppressWarnings("unchecked")
		List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
		model.addAttribute("usuarios", usuarios);
		}
		return "redirect:/usuarios";
	}
	
	/**
	 * 
	 * Apartir de la sesion, llena la lista de cuentas hija
	 * disponibles para que el usuario escoja una tecleando el codigo
	 * 
	 * @param session
	 * @return
	 * @throws ClassNotFoundException
	 */
	@SuppressWarnings("unchecked")
	public HttpSession LlenarJSON(HttpSession session) throws ClassNotFoundException {
		if(session.getAttribute("objStringEmpleados")==null) {
			 System.out.println("//////////////////LLENANDO JSON DE EMPLEADOS////////////////////");
			 List<Empleado> emps =(List<Empleado>) manage_entity.getAll(Empleado.class.getName());
			 System.out.println("//////////////////LLENANDO JSON DE EMPLEADOS////////////////////");
				
			JSONObject obj = new JSONObject();
			for(Empleado e :emps) {
				obj.put(e.getIdEmpleado()+"-"+e.getNombre()+" "+e.getApellidos(),null );
			}
			session.setAttribute("objStringEmpleados",obj.toJSONString()); 
		}
		return session;
	}
	
	

}
