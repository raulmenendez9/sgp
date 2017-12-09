package com.sisbam.sisconta.controller.administration;
import java.security.Principal;
import java.util.List;

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
import com.sisbam.sisconta.entity.administration.Empresa;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;


@Controller
public class EmpresaController {
	
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Empresa/";
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/empresas", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService
							.getRolAuthorization(manage_entity, username, "empresa");
		if(authorized){
			Empresa empresa = new Empresa();
			model.addAttribute("empresaForm", empresa);
			model.addAttribute("empresa", null);
			List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
			model.addAttribute("empresas", empresas);
			retorno = path+"empresa";
		}
		return retorno;
	}
	
	@RequestMapping(value = "/empresas/add", method = RequestMethod.GET)
	public String addEmpresa(Model model, HttpServletRequest request)  {
		
	
		
		String retorno = "403";
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		boolean authorized = AuthorizedService.getRolAuthorization(manage_entity, username, "empresa-form");
		if(authorized){
			Empresa empresa = new Empresa();
			model.addAttribute("empresaForm", empresa);
			model.addAttribute("empresa", null);
			retorno = path+"empresa-form";
		}
		return retorno;
		
	}
	
	@RequestMapping(value = "/empresas/add", method = RequestMethod.POST)
	public String saveOrUpadateEmpresa(@ModelAttribute("empresaForm") Empresa empresaRecibido) throws ClassNotFoundException {
		Empresa empresa = empresaRecibido;
		if(empresa.getIdEmpresa()==0){
			manage_entity.save(Empresa.class.getName(), empresa);
		}else{
			manage_entity.update(Empresa.class.getName(), empresa);
		}
		return "redirect:/empresas";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/empresas/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String empresaId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		Empresa empresa = (Empresa) manage_entity.getById(Empresa.class.getName(), Integer.parseInt(empresaId));
		model.addAttribute("empresa", empresa);
		
		Empresa empresaForm = new Empresa();
		model.addAttribute("empresaForm", empresaForm);
		
		List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
		model.addAttribute("roles", roles);
		return path+"empresa-form";
	}
	
	/*
	 * Delete:
	 * Borra objetos de tipo empresa mediante un id enviado en la URL. 
	 */


	@RequestMapping(value = "/empresas/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String empresaId, Model model) throws ClassNotFoundException {
		Empresa empresa = (Empresa) manage_entity.getById(Empresa.class.getName(), Integer.parseInt(empresaId));
		manage_entity.delete(Empresa.class.getName(), empresa);
		model.addAttribute("empresa", empresa);
		
		Empresa empresaForm = new Empresa();
		model.addAttribute("empresaForm", empresaForm);
		
		@SuppressWarnings("unchecked")
		List<Empresa> empresas = (List<Empresa>) this.manage_entity.getAll("Empresa");
		model.addAttribute("empresas", empresas);
		return "redirect:/empresas";
	}
	
	
}
