package com.sisbam.sisconta.controller.administration;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.configuration.AuthorizedService;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.administration.Empleado;
import com.sisbam.sisconta.entity.administration.Empresa;
import com.sisbam.sisconta.entity.administration.Usuario;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;;

@Controller
public class UsuarioController {
	/*
	 * Variable usada como un servicio que provee los metodos necesarios
	 * para la realizacion de un CRUD. 
	*/
	@Autowired
	private DaoImp manage_entity;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	
	 
	
	/*
	 * value = "/Usuarioes" => URL.
	 * method = RequestMethod.GET => metodos: GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS, TRACE.
	 * */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/usuarios", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		
//*************CARGAR BOTONES PERMITIDOS******************
 		
		model.addAttribute("create",true);
		model.addAttribute("read",true);
		model.addAttribute("update",true);
		model.addAttribute("delete",true);
//**********************************************************
		
		
//****ASIGNAR LOS PERMISOS PARA LAS URL********

		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "usuario");
		if(authorized){
			Usuario usuario = new Usuario();
			model.addAttribute("usuarioForm", usuario);
			model.addAttribute("usuario", null);
			List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
			List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
			List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
			List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");
			// Agrega al modelo el atributo "usuarios", asi se conocera en la vista
			// la lista usuarios creada y llenada en el controlador.
			model.addAttribute("usuarios", usuarios);
			model.addAttribute("roles", roles);
			model.addAttribute("empresas", empresas);
			model.addAttribute("empleados", empleados);
			retorno = "usuario";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/usuarios/add", method = RequestMethod.GET)
	public String addUsuario(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "usuario-form");
		if(authorized){
			Usuario usuario = new Usuario();
			List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
			List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
			List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");
			model.addAttribute("usuarioForm", usuario);
			model.addAttribute("usuario", null);
			model.addAttribute("roles", roles);
			model.addAttribute("empresas", empresas);
			model.addAttribute("empleados", empleados);
			retorno = "usuario-form";
		}
		return retorno;
		
	}
	
	@RequestMapping(value = "/usuarios/add", method = RequestMethod.POST)
	public String saveOrUpadateUsuario(@ModelAttribute("usuarioForm") Usuario usuarioRecibido) throws ClassNotFoundException {
		Usuario usuario = usuarioRecibido;
		Rol rolSeleccionado = (Rol) this.manage_entity.getById(Rol.class.getName(), usuario.getIdRol());	
		Empresa EmpresaSeleccionada = (Empresa) this.manage_entity.getById(Empresa.class.getName(), usuario.getIdEmpresa());
		Empleado empleado = (Empleado) this.manage_entity.getById(Empleado.class.getName(), usuario.getIdEmpleado());
		usuario.setRol(rolSeleccionado);
		usuario.setEmpresa(EmpresaSeleccionada);
		usuario.setEmpleado(empleado);
		String pass = usuario.getPassword();
		usuario.setPassword(passwordEncoder.encode(pass));
		
		if(usuario.getIdUsuario()==0){
			manage_entity.save(Usuario.class.getName(), usuario);
		}else{
			manage_entity.update(Usuario.class.getName(), usuario);
		}
		return "redirect:/usuarios";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/usuarios/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String usuarioId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		
		
		
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		
				
		Usuario usuario = (Usuario) manage_entity.getById(Usuario.class.getName(), Integer.parseInt(usuarioId));
		model.addAttribute("usuario", usuario);
		
		Usuario usuarioForm = new Usuario();
		model.addAttribute("usuarioForm", usuarioForm);
		
		List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
		List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
		List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");
		model.addAttribute("roles", roles);
		model.addAttribute("empresas", empresas);
		model.addAttribute("empleados", empleados);
		return "usuario-form";
	}
	
	/*
	 * Delete:
	 * Borra objetos de tipo usuario mediante un id enviado en la URL. 
	 */
	@RequestMapping(value = "/usuarios/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String usuarioId, Model model) throws ClassNotFoundException {
		
		Usuario usuario = (Usuario) manage_entity.getById(Usuario.class.getName(), Integer.parseInt(usuarioId));
		manage_entity.delete(Usuario.class.getName(), usuario);
		model.addAttribute("usuario", usuario);
		
		Usuario usuarioForm = new Usuario();
		model.addAttribute("usuarioForm", usuarioForm);
		
		@SuppressWarnings("unchecked")
		List<Usuario> usuarios = (List<Usuario>) this.manage_entity.getAll("Usuario");
		model.addAttribute("usuarios", usuarios);
		return "redirect:/usuarios";
	}

}
