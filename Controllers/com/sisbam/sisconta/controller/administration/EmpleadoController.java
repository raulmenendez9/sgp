package com.sisbam.sisconta.controller.administration;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

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

import java.util.List;



@Controller
public class EmpleadoController {

	@Autowired

	private DaoImp manage_entity;

	String path = "Administration/Empleado/";

	@SuppressWarnings("unchecked")

	@RequestMapping(value = "/empleados", method = RequestMethod.GET)

	public String index(Model model, HttpServletRequest request) {
		
		
		
		String retorno = "403";

		String username = request.getUserPrincipal().getName();

		String rol = AuthorizedService.getRol(manage_entity, username);

		model.addAttribute("rol", rol);

		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "Empresa");

		if(authorized){

			Empleado empleado = new Empleado();

			List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");

			List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");

			model.addAttribute("empleados", empleados);

			model.addAttribute("empresas", empresas);

			model.addAttribute("empleadoForm", empleado);

			model.addAttribute("empleado", null);

			retorno = path+"empleado";

		}

		return retorno;

	}

	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/empleados/add", method = RequestMethod.GET)

	public String addEmpleado(Model model, HttpServletRequest request) {
		

		String retorno = "403";

		String username = request.getUserPrincipal().getName();

		String rol = AuthorizedService.getRol(manage_entity, username);

		model.addAttribute("rol", rol);

		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "empleado-form");

		if(authorized){

			Empleado empleado = new Empleado();

			List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");

			model.addAttribute("empresas", empresas);

			model.addAttribute("empleadoForm", empleado);

			model.addAttribute("empleado", null);

			retorno = path+"empleado-form";

		}

		return retorno;

	}

	

	@RequestMapping(value = "/empleados/add", method = RequestMethod.POST)

	public String saveOrUpadateEmpleado(@ModelAttribute("empleadoForm") Empleado empleadoRecibido) {

		Empleado empleado = empleadoRecibido;

		try{

			Empresa pai = (Empresa)this.manage_entity.getById(Empresa.class.getName(), empleado.getIdEmpresa());

			empleado.setEmpresa(pai);	

		}catch(ClassNotFoundException ex)

		{

			System.out.println(ex.getMessage());

		}

		if(empleado.getIdEmpleado()==0){

			manage_entity.save("com.oneforall.sgr.entity.Empleado", empleado);

		}else{

			manage_entity.update("com.oneforall.sgr.entity.Empleado", empleado);

		}

		return "redirect:/empleados";

	}

	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/empleados/update/{id}", method = RequestMethod.GET)

	public String update(@PathVariable("id") String idEmpleado, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		String username = request.getUserPrincipal().getName();

		String rol = AuthorizedService.getRol(manage_entity, username);

		model.addAttribute("rol", rol);

		

		Empleado empleado = (Empleado) manage_entity.getById("com.oneforall.sgr.entity.Empleado", Integer.parseInt(idEmpleado));

		model.addAttribute("empleado", empleado);

		Empleado empleadoForm = new Empleado();

		model.addAttribute("empleadoForm", empleadoForm);

		


		List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa"); 

		model.addAttribute("empresas", empresas);

		List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado"); //esto podria darme error

		model.addAttribute("empleados", empleados);

		return path+"empleado-form";

	}



	@RequestMapping(value = "/empleados/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String idEmpleado, Model model) throws ClassNotFoundException {
		Empleado empleado = (Empleado) manage_entity.getById("com.oneforall.sgr.entity.Empleado", Integer.parseInt(idEmpleado));

	manage_entity.delete("com.oneforall.sgr.entity.Empleado", empleado);

	model.addAttribute("empleado", empleado);

	System.out.println(idEmpleado);

	

	Empleado empleadoForm = new Empleado();

	model.addAttribute("empleadoForm", empleadoForm);

		

		@SuppressWarnings("unchecked")

		List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");

		model.addAttribute("empleados", empleados);

		return "redirect:/empleados";

	}


}
