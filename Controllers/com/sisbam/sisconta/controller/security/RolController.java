package com.sisbam.sisconta.controller.security;

import javax.servlet.http.HttpServletRequest;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.configuration.AuthorizedService;
import com.sisbam.sisconta.controller.variety.ObtenerPermisosPorUrl;
import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.security.Menu;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

@Controller
public class RolController {
	@Autowired
	private DaoImp manage_entity;
	
	private String path="Security/Rol/";
	
	private Permisos permisos;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		
	ObtenerPermisosPorUrl obtener = new ObtenerPermisosPorUrl();
	this.permisos = obtener.Obtener("/sisconta/vistas", request, manage_entity);
		
//se cargan los permisos CRUD que tenga el usuario sobre la vista		
//*************CARGAR BOTONES PERMITIDOS******************
		model.addAttribute("create",permisos.isC());
		model.addAttribute("read",	permisos.isR());
		model.addAttribute("update",permisos.isU());
		model.addAttribute("delete",permisos.isD());
//**********************************************************
		String retorno = "403";
		if(permisos.isR()) {	
		
			Rol rol1 = new Rol();
			model.addAttribute("rolForm", rol1);
			model.addAttribute("rol1", null);
			
			List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
			
			model.addAttribute("roles", roles);
			retorno = path+"rol";
			return retorno;
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/rolesadd", method = RequestMethod.GET)//FUNCIONANDO  4/11/2017 NO TOCAR
	public String addRol(Model model, HttpServletRequest request) {
		
		String retorno = "403";
//		HOY YA NO VAS A CARGAR MENUS Y VISTAS DISPONIBLES, PORQUE CUANDO SE HAGA UN NUEVO ROL, SE MOSTRARAN TODOS LOS MENUS Y TODAS LAS VISTAS
//		LO QUE VA A IR CAMBIANDO SON LOS PERMISOS, LO DEMAS SE MANTIENE IGUAL
//		ASI QUE LLEVAR TODOS LOS MENUS Y VISTAS DISPONIBLES YA NO ES NECESARIO
		if(permisos.isC()) {		
		
			Rol rol1 = new Rol();
			model.addAttribute("rolForm", rol1);
			model.addAttribute("rol", null);
			model.addAttribute("rol1", null);
			List<Vista> vistas = (List<Vista>) manage_entity.getAll("Vista");
			List<Permisos> permisos = (List<Permisos>) manage_entity.getAll(Permisos.class.getName());
			model.addAttribute("menusdeagregacion", (List<Menu>) manage_entity.getAll(Menu.class.getName()));
			model.addAttribute("vistas", vistas);
			model.addAttribute("permisos", permisos);
			model.addAttribute("estoyguardando",true);
			retorno = path+"rolform";
		}
		return retorno;
	}
	
	@RequestMapping(value = "/rolesadd", method = RequestMethod.POST)
	public String saveOrUpadateRol(HttpServletRequest request) {
		String retorno = "403";
		if(permisos.isC()) {	

		Rol rol = new Rol();
		try {

			Integer idROL = 0;
			String nombreROL = request.getParameter("nombre");
			String descripcionROL = request.getParameter("descripcion");
			try {
				idROL = Integer.parseInt(request.getParameter("idRol"));
			} catch (Exception e) {
				System.out.println("Error, linea 127 SaveOrUpdate Rol, imposible parsear integer" + e);
				idROL = 0;
			}

			if (idROL != null && idROL != 0) {
				try {
					rol = (Rol) this.manage_entity.getById(Rol.class.getName(), idROL);
				} catch (NumberFormatException | ClassNotFoundException e) {
				}
			}
			if(descripcionROL==null) {
				rol.setDescripcion(" ");
			}
			else
				rol.setDescripcion(descripcionROL);
			
			rol.setNombre(nombreROL);

		} // fintry

		catch (Exception e) {
			System.out.println("LINEA 110" + e);
		}

		if (rol.getIdRol() == null) {

			List<Menu> menustodos = (List<Menu>)request.getSession().getAttribute("menus_all");
			List<Menu> menusroles = new ArrayList<Menu>();
			for (Menu menu : menustodos) {
				String menuesderol = request.getParameter("menuactivo-" + menu.getId());
				if (menuesderol != null) {

					if (menuesderol != null) {
						menu.setActivo(true);
						menusroles.add(menu);
					}
				}
			}

			try {
				System.out.println("Tratar de hacer INSERT");
				Set<Menu> menus = new HashSet<Menu>(menusroles);
				rol.setMenuset(menus);
			} catch (Exception e) {
				System.out.println("ERROR LINEA 151" + e);
			}
			manage_entity.save(Rol.class.getName(), rol);

			
			Permisos permisos = new Permisos();
			List<Vista> vistastodas = (List<Vista>) request.getSession().getAttribute("vistas_all");
			for (Vista vista : vistastodas) {
				
				
				String menuesderol = request.getParameter("menuactivo-" + vista.getMenu().getId());
				String create = request.getParameter("create-" + vista.getIdVista());
				String read = request.getParameter("read-" + vista.getIdVista());
				String update = request.getParameter("update-" + vista.getIdVista());
				String delete = request.getParameter("delete-" + vista.getIdVista());
				
				System.out.println("Create:"+create+" Read:"+read+"Update:"+update+" Delete:"+delete+"\n");
				
				if (create != null && menuesderol!=null) {
					permisos.setC(true);
				}

				if (read != null && menuesderol!=null) {
					permisos.setR(true);
				}

				if (update != null && menuesderol!=null) {
					permisos.setU(true);
				}

				if (delete != null && menuesderol!=null) {
					permisos.setD(true);
				}
				
				if((create != null || read != null || update != null || delete != null)&& (menuesderol!=null)) {
					permisos.setVista(vista);
					permisos.setRol(rol);
					manage_entity.save("Permisos", permisos);
				}

				
			}
			
			

		} else {
			System.out.println("Tratar de hacer UPDATE");

			List<Menu> menustodos = (List<Menu>) manage_entity.getAll("Menu");
			List<Menu> menusroles = new ArrayList<Menu>();
			for (Menu menu : menustodos) {
				String menuesderol = request.getParameter("menuactivo-" + menu.getId());
				if (menuesderol != null) {
					menu.setActivo(true);
					menusroles.add(menu);
				}
			}
					
			Set<Menu> menus = new HashSet<Menu>(menusroles);
			rol.setMenuset(menus);

			manage_entity.update(Rol.class.getName(), rol);

			List<Vista> vistastodas = (List<Vista>) manage_entity.getAll("Vista");
			boolean permiEncontrado=true;
				for(Vista vista: vistastodas) {
					Permisos permisos = manage_entity.getPermisosByVistaAndRol(vista, rol);
					String menuesderol = request.getParameter("menuactivo-" + vista.getMenu().getId());
					String create = request.getParameter("create-" + vista.getIdVista());
					String read = request.getParameter("read-" + vista.getIdVista());
					String update = request.getParameter("update-" + vista.getIdVista());
					String delete = request.getParameter("delete-" + vista.getIdVista());
					try {
						boolean xx = permisos.isC();
					}
					catch(Exception e) {
						permiEncontrado =false;
					}
					
					if(permiEncontrado) {
						
						
						if (create != null) {
							permisos.setC(true);
						}
						else {
							permisos.setC(false);
						}

						if (read != null) {
							permisos.setR(true);
						}
						else {
							permisos.setR(false);
						}

						if (update != null) {
							permisos.setU(true);
						}
						else {
							permisos.setU(false);
						}

						if (delete != null) {
							permisos.setD(true);
						}
						else {
							permisos.setD(false);
						}
						
						if((create != null || read != null || update != null || delete != null)&& (menuesderol!=null)) {
							manage_entity.update("Permisos", permisos);
						}	
						
					}
					else {
						Permisos permix = new Permisos();
						if (create != null && menuesderol!=null) {
							permix.setC(true);
						}

						if (read != null && menuesderol!=null) {
							permix.setR(true);
						}

						if (update != null && menuesderol!=null) {
							permix.setU(true);
						}

						if (delete != null && menuesderol!=null) {
							permix.setD(true);
						}
						
						if((create != null || read != null || update != null || delete != null)&& (menuesderol!=null)) {
							permix.setVista(vista);
							permix.setRol(rol);
							manage_entity.save("Permisos", permix);
						}
					}
							
					
				}
				
			
		}
		return "redirect:/roles";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/rolesupdate/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String rolId, Model model, HttpServletRequest request) throws ClassNotFoundException {
		
		String retorno = "403";
		if(permisos.isU()) {	
		
		String username = request.getUserPrincipal().getName();
		String rol = AuthorizedService.getRol(manage_entity, username);
		model.addAttribute("rol", rol);
		
		Rol rol1 = (Rol) manage_entity.getById(Rol.class.getName(), Integer.parseInt(rolId));
		
		List<Integer> idsMenu = (List<Integer>) manage_entity.executeNativeQuery("select MENUSET_ID_MENU from menuset where ROLSET_ID_ROL = "+Integer.parseInt(rolId));
		List<Menu> menusdelrol = new ArrayList<Menu>();
		Menu menu = new Menu();
		for(Integer idmenu : idsMenu) {
			menu = (Menu) manage_entity.getById(Menu.class.getName(), idmenu);
			menu.setActivo(true);
			menusdelrol.add(menu);
		}
		
		List<Vista> vistas = (List<Vista>) manage_entity.getAll(Vista.class.getName());
		List<Permisos> permisos = (List<Permisos>) manage_entity.getAll(Permisos.class.getName());
		
		String msg_menurolvacio ="";
		if(menusdelrol.isEmpty()) {
			msg_menurolvacio = "No hay menus asociados a este rol";
		}
		
		
		List<Menu> menusdeagregacion = new ArrayList<Menu>();
		menusdeagregacion = manage_entity.getMenusByDistict(menusdelrol);
		
		
		model.addAttribute("msg_menurolvacio", msg_menurolvacio);
		
		String msglistadisp = "LISTA DE MENUS DISPONIBLES";
		String msglistaactuales = "LISTA DE MENUS ACTUALES";
		
		model.addAttribute("menusDisponibles",(List<Menu>) manage_entity.getMenusByRol(rol1));
		model.addAttribute("menusdeagregacion",menusdeagregacion);
		model.addAttribute("msj_listaDeDisponibles",msglistadisp);
		model.addAttribute("msj_listaActuales",msglistaactuales);
		
		model.addAttribute("rol1", rol1);
		List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
		model.addAttribute("roles", roles);
		model.addAttribute("vistas", vistas);
		model.addAttribute("permisos", permisos);
		model.addAttribute("estoyactualizando",true);
		model.addAttribute("estoyguardando",true);
		
		return path+"rolform";
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/rolesdelete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String rolId, Model model) throws ClassNotFoundException {
		Rol rol = (Rol) manage_entity.getById(Rol.class.getName(), Integer.parseInt(rolId));
		if(permisos.isD()) {	
		model.addAttribute("rol", rol);
									
				Permisos permi = new Permisos();
				List<Vista> vistas = (List<Vista>) manage_entity.getAll(Vista.class.getName());
		
					for(Vista vistita : vistas) {
						try {	
						permi = (Permisos) manage_entity.getPermisosByVistaAndRol(vistita, rol);
						if(permi.getRol().getIdRol()==rol.getIdRol()) {
//							System.err.println("TRATANDO DE BORRAR PERMISOS-> "+rol.getIdRol()+"-> "+vistita.getNombre());
							manage_entity.delete(Permisos.class.getName(), permi);
						}
						}
						catch(Exception e) {
//							System.err.println("Error: rolform, nada grave"+e.getMessage());
						}
//						permi.getVista().getIdVista()==vistita.getIdVista()&&
						
					}
				

					
				manage_entity.delete(Rol.class.getName(), rol);
		Rol rolForm = new Rol();
		model.addAttribute("rolForm", rolForm);
		
		List<Rol> roles = (List<Rol>) this.manage_entity.getAll("Rol");
		model.addAttribute("roles", roles);
		return "redirect:/roles";
	}
		 return "403";
	}
}
