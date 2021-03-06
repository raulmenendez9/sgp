package com.sisbam.sgp.controller.administration;
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
import com.sisbam.sgp.entity.administration.Empresa;
import com.sisbam.sgp.entity.security.Permisos;

import java.util.List;



@Controller
public class EmpleadoController {

	@Autowired

	private DaoImp manage_entity;

	String path = "Administration/Empleado/";
	private static final String IDENTIFICADOR = "empleadox02";
	private Permisos permisos;

	
	@SuppressWarnings("unchecked")

	@RequestMapping(value = "/empleados", method = RequestMethod.GET)

	public String index(Model model, HttpServletRequest request) {
	
	
		
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/empleados", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
		
				

		
		if(permisos.isR()) {

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

		if(permisos.isC()) {

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

		if (permisos.isR()) {

			try {
				Empresa pai = (Empresa) this.manage_entity.getById(Empresa.class.getName(), empleado.getIdEmpresa());
				empleado.setEmpresa(pai);
			} 
			catch (ClassNotFoundException ex) 
			{
				System.err.println("ERROR Empleado contrller"+ex.getMessage());
			}
			if (empleado.getIdEmpleado() == 0) {

				manage_entity.save(Empleado.class.getName(), empleado);
			} 
			else
			{
				manage_entity.update(Empleado.class.getName(), empleado);
			}
			
			return "redirect:/empleados";
		}
		return "403";

	}

	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/empleados/update/{id}", method = RequestMethod.GET)

	public String update(@PathVariable("id") String idEmpleado, Model model, HttpServletRequest request)
			throws ClassNotFoundException {
		
		if(permisos.isU()) {
		Empleado empleado = (Empleado) manage_entity.getById(Empleado.class.getName(),
				Integer.parseInt(idEmpleado));
		model.addAttribute("empleado", empleado);
		Empleado empleadoForm = new Empleado();
		model.addAttribute("empleadoForm", empleadoForm);
		List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
		model.addAttribute("empresas", empresas);
		List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado"); // esto podria darme error
		model.addAttribute("empleados", empleados);
		return path + "empleado-form";
		}
		return "403";

	}



	@RequestMapping(value = "/empleados/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String idEmpleado, Model model) throws ClassNotFoundException {
		Empleado empleado = (Empleado) manage_entity.getById(Empleado.class.getName(), Integer.parseInt(idEmpleado));
		
		if (permisos.isR()) {

			manage_entity.delete(Empleado.class.getName(), empleado);

			model.addAttribute("empleado", empleado);


			Empleado empleadoForm = new Empleado();

			model.addAttribute("empleadoForm", empleadoForm);

			@SuppressWarnings("unchecked")

			List<Empleado> empleados = (List<Empleado>) this.manage_entity.getAll("Empleado");

			model.addAttribute("empleados", empleados);

			return "redirect:/empleados";
		}
		return "403";

	}


}
