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
import com.sisbam.sgp.entity.administration.Funcion;
import com.sisbam.sgp.entity.security.Permisos;

@Controller
public class FuncionController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Funcion/";
	private static final String IDENTIFICADOR = "funcionR";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/funciones", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/funciones", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			Funcion funcion = new Funcion();
			model.addAttribute("funcionForm", funcion);
			model.addAttribute("funcion", null);
				List<Funcion> funciones = (List<Funcion>) this.manage_entity.getAll("Funcion");
				model.addAttribute("funciones", funciones);
			retorno = path+"funcion";
		}
		return retorno;
	}
	
	//GUARDAR
	@RequestMapping(value = "/funciones/add", method = RequestMethod.POST)
	public String saveOrUpadateFuncion(@ModelAttribute("funcionForm") Funcion funcionRecibido,Model model) throws ClassNotFoundException {
		String retorno = "403";
		if(permisos.isC())
		{
				Funcion funcion = funcionRecibido;
				if(funcion.getIdFuncion()==0) {
					manage_entity.save(Funcion.class.getName(), funcion);
				}else{
					manage_entity.update(Funcion.class.getName(), funcion);
				}
				retorno="redirect:/funciones";
		}
		return retorno;
	}
	
	//ACTUALIZAR
	@RequestMapping(value = "/funciones/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String funcionId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isU()) 
		{
			Funcion funcion = (Funcion) manage_entity.getById(Funcion.class.getName(), Integer.parseInt(funcionId));
			model.addAttribute("funcion", funcion);
			Funcion funcionForm = new Funcion();
			model.addAttribute("funcionForm", funcionForm);
			retorno=path+"funcion-form";
		}
		
		return retorno;
	}
	
	//ELIMINAR
	@RequestMapping(value = "/funciones/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String funcionId, Model model) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isD()) {
		Funcion funcion = (Funcion) manage_entity.getById(Funcion.class.getName(), Integer.parseInt(funcionId));
		manage_entity.delete(Funcion.class.getName(), funcion);
		model.addAttribute("funcion", funcion);
		
		Funcion funcionForm = new Funcion();
		model.addAttribute("funcionForm", funcionForm);
		retorno="redirect:/funciones";
		}
		return retorno;
	}
	

}

