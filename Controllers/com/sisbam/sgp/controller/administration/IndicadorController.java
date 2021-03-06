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
import com.sisbam.sgp.entity.administration.Empresa;
import com.sisbam.sgp.entity.administration.Proyecto;
import com.sisbam.sgp.entity.administration.Solicitud;
import com.sisbam.sgp.entity.administration.TipoProyecto;
import com.sisbam.sgp.entity.administration.VariableImpacto;
import com.sisbam.sgp.entity.administration.Indicador;
import com.sisbam.sgp.entity.administration.Usuario;
import com.sisbam.sgp.entity.security.Permisos;
import com.sisbam.sgp.entity.security.Rol;


@Controller
public class IndicadorController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path = "Administration/Indicador/";
	private static final String IDENTIFICADOR = "ind2";
	
	private Permisos permisos;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/indicadores", method = RequestMethod.GET)
	
	//INDEX
	public String index(Model model, HttpServletRequest request) {
		
		String retorno = "403";
		
		HttpSession session = request.getSession();
		ObtenerPermisosPorUrl facilitador = new ObtenerPermisosPorUrl();
		session = facilitador.Obtener("/sgp/indicadores", request, manage_entity,IDENTIFICADOR);
		permisos = (Permisos) session.getAttribute("permisos-de-"+IDENTIFICADOR);
			
		
		
		if(permisos.isR())
		{
			Indicador indicador = new Indicador();
			model.addAttribute("indicadorForm", indicador);
			model.addAttribute("indicador", null);
			
				List<Indicador> indicadores = (List<Indicador>) this.manage_entity.getAll("Indicador");
				List<Proyecto> proyectos = (List<Proyecto>) this.manage_entity.getAll("Proyecto");
				List<VariableImpacto> variableImpactos = (List<VariableImpacto>) this.manage_entity.getAll("VariableImpacto");
				
				model.addAttribute("indicadores", indicadores);
				model.addAttribute("proyectos", proyectos);
				model.addAttribute("variableImpactos", variableImpactos);
				
			retorno = path+"indicador";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/indicador/add", method = RequestMethod.GET)
	public String addIndicador(Model model, HttpServletRequest request)  {
		
		
		String retorno = "403";
		if(permisos.isC()){
			Indicador indicador = new Indicador();
			
			List<Proyecto> proyectos = (List<Proyecto>) this.manage_entity.getAll("Proyecto");
			List<VariableImpacto> variableImpactos = (List<VariableImpacto>) this.manage_entity.getAll("VariableImpacto");
		
			model.addAttribute("indicadorForm", indicador);
			model.addAttribute("indicador", null);
			model.addAttribute("proyectos", proyectos);
			model.addAttribute("variableImpactos", variableImpactos);
			
			retorno = path+"indicador-form";
		}
		return retorno;
		
	}
	
	
	//GUARDAR
		@RequestMapping(value = "/indicadores/add", method = {RequestMethod.POST, RequestMethod.GET})
		public String saveOrUpadateIndicador(@ModelAttribute("indicadorForm") Indicador indicadorRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
			if(permisos.isC())
			{
					Indicador indicador = indicadorRecibido;
					
					Proyecto proyectoRecibido = (Proyecto) this.manage_entity.getById(Proyecto.class.getName(), indicador.getCodProyecto());
					indicador.setProyecto(proyectoRecibido);
					
					VariableImpacto variableImpactoRecibido = (VariableImpacto) this.manage_entity.getById(VariableImpacto.class.getName(), indicador.getIdVariableImpacto());
					indicador.setVariableImpacto(variableImpactoRecibido);
					
					VariableImpacto variableImpactoRecibido2 = (VariableImpacto) this.manage_entity.getById(VariableImpacto.class.getName(), indicador.getIdVariableImpacto2());
					indicador.setVariableImpacto2(variableImpactoRecibido2);
					
					
					if(indicador.getIdIndicador()==0) {
						manage_entity.save(Indicador.class.getName(), indicador);
					}else{
						manage_entity.update(Indicador.class.getName(), indicador);
					}
					retorno="redirect:/indicadores";
			}
			return retorno;
		}
		
		
		@RequestMapping(value = "/ind/add", method = {RequestMethod.POST, RequestMethod.GET})
		public String saveOrUpadateInd(@ModelAttribute("indicadorForm") Indicador indicadorRecibido,Model model) throws ClassNotFoundException {
			String retorno = "403";
			
					Indicador indicador = indicadorRecibido;
					
					Proyecto proyectoRecibido = (Proyecto) this.manage_entity.getById(Proyecto.class.getName(), indicador.getCodProyecto());
					indicador.setProyecto(proyectoRecibido);
					
					VariableImpacto variableImpactoRecibido = (VariableImpacto) this.manage_entity.getById(VariableImpacto.class.getName(), indicador.getIdVariableImpacto());
					indicador.setVariableImpacto(variableImpactoRecibido);
					
					VariableImpacto variableImpactoRecibido2 = (VariableImpacto) this.manage_entity.getById(VariableImpacto.class.getName(), indicador.getIdVariableImpacto2());
					indicador.setVariableImpacto2(variableImpactoRecibido2);
					
					
					if(indicador.getIdIndicador()==0) {
						manage_entity.save(Indicador.class.getName(), indicador);
					}else{
						manage_entity.update(Indicador.class.getName(), indicador);
					}
					retorno="redirect:/proyectos";
			
			return retorno;
		}
		
		
		
		//ACTUALIZAR
		@RequestMapping(value = "/indicadores/update/{id}", method = RequestMethod.GET)
		public String update(@PathVariable("id") String idIndicador, Model model, HttpServletRequest request) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isU()) 
			{
				Indicador indicador = (Indicador) manage_entity.getById(Indicador.class.getName(), Integer.parseInt(idIndicador));
				model.addAttribute("indicador", indicador);
				
				Indicador indicadorForm = new Indicador();
				model.addAttribute("indicadorForm", indicadorForm);
				
				List<Proyecto> Proyecto = (List<Proyecto>) this.manage_entity.getAll("Proyecto");
				model.addAttribute("proyecto", Proyecto);
				

				List<VariableImpacto> vsi = (List<VariableImpacto>) this.manage_entity.getAll("VariableImpacto");
				model.addAttribute("vsi", vsi);
				retorno=path+"indicador-form";
			}
			
			return retorno;
		}
		
	
		
		//ELIMINAR
		@RequestMapping(value = "/indicadores/delete/{id}", method = RequestMethod.GET)
		public String delete(@PathVariable("id") String idIndicador, Model model) throws ClassNotFoundException {
			String retorno="403";
			if(permisos.isD()) {
			Indicador indicador = (Indicador) manage_entity.getById(Indicador.class.getName(), Integer.parseInt(idIndicador));
			manage_entity.delete(Indicador.class.getName(), indicador);
			model.addAttribute("indicador", indicador);
			
			Indicador indicadorForm = new Indicador();
			model.addAttribute("indicadorForm", indicadorForm);
			retorno="redirect:/indicadores";
			}
			return retorno;
		}
		
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/indicador/ayuda", method = RequestMethod.GET)
		public String ayuda(Model model, HttpServletRequest request)  {
			
			
			String retorno = "403";
			if(permisos.isC()){
				Indicador indicador = new Indicador();
				
			
			
				model.addAttribute("indicadorForm", indicador);
				model.addAttribute("indicador", null);
			
				
				retorno = path+"indicador-form";
			}
			return retorno;
			
		}
		
	
		@RequestMapping(value = "/indact/{id}", method = RequestMethod.GET)
		public String updateReal(@PathVariable("id") String idIndicador, Model model, HttpServletRequest request) throws ClassNotFoundException {
			String retorno="403";
			
				List<Indicador> indicadores = (List<Indicador>) this.manage_entity.getAll("Indicador");
				model.addAttribute("indicadores", indicadores);
				
				Indicador indicador = (Indicador) manage_entity.getById(Indicador.class.getName(), Integer.parseInt(idIndicador));
				model.addAttribute("indicador", indicador);
				
				Indicador indicadorForm = new Indicador();
				model.addAttribute("indicadorForm", indicadorForm);
				
				List<Proyecto> Proyecto = (List<Proyecto>) this.manage_entity.getAll("Proyecto");
				model.addAttribute("proyecto", Proyecto);
				
				model.addAttribute("proyectos", Proyecto);
				

				List<VariableImpacto> vsi = (List<VariableImpacto>) this.manage_entity.getAll("VariableImpacto");
				model.addAttribute("vsi", vsi);
				
				List<VariableImpacto> variableImpactos = (List<VariableImpacto>) this.manage_entity.getAll("VariableImpacto");
				model.addAttribute("variableImpactos", variableImpactos);
				
				retorno=path+"real";
			
			return retorno;
		}

		
}