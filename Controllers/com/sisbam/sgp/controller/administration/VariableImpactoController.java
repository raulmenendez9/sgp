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
import com.sisbam.sgp.entity.security.Permisos;
import com.sisbam.sgp.entity.administration.VariableImpacto;

@Controller
public class VariableImpactoController {

	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Variable/";
	private static final String IDENTIFICADOR = "tipov";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/variableImpactos", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/variableImpactos", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			VariableImpacto variableImpacto = new VariableImpacto();
			model.addAttribute("variableImpactoForm", variableImpacto);
			model.addAttribute("variableImpacto", null);
				List<VariableImpacto> variableImpactos = (List<VariableImpacto>) this.manage_entity.getAll("VariableImpacto");
				model.addAttribute("variableImpactos", variableImpactos);
			retorno = path+"variableImpacto";
		}
		return retorno;
	}
	
	//GUARDAR
	@RequestMapping(value = "/variableImpactos/add", method = RequestMethod.POST)
	public String saveOrUpadateVariableImpacto(@ModelAttribute("variableImpactoForm") VariableImpacto variableImpactoRecibido,Model model) throws ClassNotFoundException {
		String retorno = "403";
		if(permisos.isC())
		{
				VariableImpacto variableImpacto = variableImpactoRecibido;
				if(variableImpacto.getidVariableImpacto()==0) {
					manage_entity.save(VariableImpacto.class.getName(), variableImpacto);
				}else{
					manage_entity.update(VariableImpacto.class.getName(), variableImpacto);
				}
				retorno="redirect:/variableImpactos";
		}
		return retorno;
	}
	
	//ACTUALIZAR
	@RequestMapping(value = "/variableImpactos/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String variableImpactoId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isU()) 
		{
			VariableImpacto variableImpacto = (VariableImpacto) manage_entity.getById(VariableImpacto.class.getName(), Integer.parseInt(variableImpactoId));
			model.addAttribute("variableImpacto", variableImpacto);
			VariableImpacto variableImpactoForm = new VariableImpacto();
			model.addAttribute("variableImpactoForm", variableImpactoForm);
			retorno=path+"variableImpacto-form";
		}
		
		return retorno;
	}
	
	//ELIMINAR
	@RequestMapping(value = "/variableImpactos/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String variableImpactoId, Model model) throws ClassNotFoundException {
		String retorno="403";
		if(permisos.isD()) {
		VariableImpacto variableImpacto = (VariableImpacto) manage_entity.getById(VariableImpacto.class.getName(), Integer.parseInt(variableImpactoId));
		manage_entity.delete(VariableImpacto.class.getName(), variableImpacto);
		model.addAttribute("variableImpacto", variableImpacto);
		
		VariableImpacto variableImpactoForm = new VariableImpacto();
		model.addAttribute("variableImpactoForm", variableImpactoForm);
		retorno="redirect:/variableImpactos";
		}
		return retorno;
	}
	
}