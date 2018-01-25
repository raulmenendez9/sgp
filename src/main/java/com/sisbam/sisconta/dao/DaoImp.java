package com.sisbam.sisconta.dao;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.resource.transaction.spi.TransactionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.sisbam.sisconta.entity.administration.Usuario;
import com.sisbam.sisconta.entity.security.Bitacora;
import com.sisbam.sisconta.entity.security.Menu;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

/**
 *  Clase que implementa la inteface DAO y todos sus metodos
 */
@Service("manage_entity")

public class DaoImp implements Dao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void crearBitacora(String accion,String tabla){
		String entidad = tabla.replaceAll("com.sisbam.sisconta.entity","");;
		Bitacora bitacora = new Bitacora();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Date hoy = new Date();
		SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		String fechahora = formater.format(hoy);
		
		bitacora.setAccion(accion);
		bitacora.setFecha(hoy);
		bitacora.setTabla(entidad);
		bitacora.setUsername((String)auth.getPrincipal());
		bitacora.setLinea(auth.getPrincipal().toString().toUpperCase()+" "+accion+"     en "+" "+entidad+"->"+fechahora);
		
		saveBitacora(Bitacora.class.getName(), bitacora);
	}
	
	
	@Override
	public void saveBitacora(String entityName, Object obj) {
		
		// recupera la session actual.
		Session session = getCurrentSession();
			
		try {
			// Inicia una nueva transaccion.
			session.getTransaction().begin();
			// save: para guardar una entidad, similar: persist
			session.save(entityName, obj);
			// Ejecuta la transaccion que se realizao anteriormente.
			session.getTransaction().commit();
		} catch (Exception e) {
			// Si el estatus de la transaccion se encuentra activa o el marca
			// rollback
			// se realiza un rollback() para regresar la operacion que se
			// intentaba realizar.
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
	}
	
	@Override
	public void saveSinBitacora(String entityName, Object obj) {
		// recupera la session actual.
				Session session = getCurrentSession();
					
				try {
					// Inicia una nueva transaccion.
					session.getTransaction().begin();
					// save: para guardar una entidad, similar: persist
					session.save(entityName, obj);
					// Ejecuta la transaccion que se realizao anteriormente.
					session.getTransaction().commit();
				} catch (Exception e) {
					// Si el estatus de la transaccion se encuentra activa o el marca
					// rollback
					// se realiza un rollback() para regresar la operacion que se
					// intentaba realizar.
					if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
							|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
						session.getTransaction().rollback();
					}
				} 
		
	}
	
	@Override
	public void updateSinBitacora(String entityName, Object obj) {
		Session session = getCurrentSession();
		try {
			session.getTransaction().begin();
			session.update(entityName, obj);
			session.getTransaction().commit();
		} catch (Exception e) {
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
	}
	
	@Override
	public void deleteSinBitacora(String entityName, Object obj) {
		Session session = getCurrentSession();
		try {
			session.getTransaction().begin();
			session.delete(entityName, obj);
			session.getTransaction().commit();
		} catch (Exception e) {
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
	}
	
	
	@Override
	public void save(String entityName, Object obj) {
		// recupera la session actual.
		Session session = getCurrentSession();
			
		try {
			// Inicia una nueva transaccion.
			session.getTransaction().begin();
			// save: para guardar una entidad, similar: persist
			session.save(entityName, obj);
			// Ejecuta la transaccion que se realizao anteriormente.
			session.getTransaction().commit();
			crearBitacora("Guardo", entityName);
		} catch (Exception e) {
			// Si el estatus de la transaccion se encuentra activa o el marca
			// rollback
			// se realiza un rollback() para regresar la operacion que se
			// intentaba realizar.
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
	}

	@Override
	public void update(String entityName, Object obj) {
		Session session = getCurrentSession();
		try {
			session.getTransaction().begin();
			session.update(entityName, obj);
			session.getTransaction().commit();
			crearBitacora("Actualizo", entityName);
		} catch (Exception e) {
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
	}

	@Override
	public Object getById(String entityName, int id) throws ClassNotFoundException {
		Session session = getCurrentSession();
		Object obj = null;
		try {
			session.getTransaction().begin();
			obj = session.get(entityName, id);
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}

	@Override
	public void delete(String entityName, Object obj) {
		Session session = getCurrentSession();
		try {
			session.getTransaction().begin();
			session.delete(entityName, obj);
			session.getTransaction().commit();
			crearBitacora("Elimino", entityName);
		} catch (Exception e) {
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
	}

	@Override
	public List<?> getAll(String entityName) {
		Session session = getCurrentSession();
		List<?> objects = null;
		/*
		 * Hibernate utiliza: Hibernate Query Language (HQL) and Java
		 * Persistence Query Language (JPQL) Estos utilizan lenguaje similar a
		 * SQL.
		 */
		String hql = "from " + entityName;
		try {
			session.getTransaction().begin();
			/*
			 * list(): usado para que createQuery devuelva una lista de
			 * entidades. Se debe realizar un CAST a esta lista, ya que es una
			 * lista de objetos genericos. El CAST se realiza hasta en el
			 * controlador, ya que es hasta este punto donde sabemos el tipo de
			 * lista que nos estara devolviendo este metodo.
			 */
			objects = session.createQuery(hql).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		}
		return objects;
	}

	@Override
	public Object getByName(String entityName, String column, String name) {		
		Session session = getCurrentSession();
		Object obj = null;
		String hql = "from " + entityName + " where " + column + " = '"+name+"' ";
		try {
			session.getTransaction().begin();
			obj = session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}
	
	
	
	//Agregado por ilich morales 02/09/2017
	//Funci�n para retornar una lista de objetos filtrados por otro campo
	@Override
	public List<?> getListByName(String entityName, String column, String name) {
		Session session = getCurrentSession();
		List<?> obj = null;
		String hql = "from " + entityName + " where str(" + column + ") = :name";
		try {
			session.getTransaction().begin();
			obj = session.createQuery(hql).setParameter("name", name).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}

	protected Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<?> getListFilter(String entityName, List<String> columns, List<String> values) {
		Session session = getCurrentSession();
		List<?> obj = null;
		try {
			String hql = "";
			int nParam = 0;
			for (String columna : columns)
			{
				if (hql.length() == 0)
					hql = "from " + entityName + " where ";
				else
					hql += " and ";	
				hql += "str(" + columna + ") = :name" + nParam;
				nParam++;
			}
			session.getTransaction().begin();
			
			nParam = 0;
			Query resultado = session.createQuery(hql);
			for (String valor : values)
			{
				resultado = resultado.setParameter("name" + nParam, valor);
				nParam++;
			}
			obj = ((org.hibernate.query.Query) resultado).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}
	
	@Override
	public List<?> getListFilterByDate(String entityName, String column_date,String fecha1,String fecha2)
	{
		Session session = getCurrentSession();
		List<?> objects = null;
		String hql ="";

					hql = "from " + entityName
			                + " c where "
			                +"c."+ column_date+" <= '"+fecha2+"' and "+"c."+column_date+" >= '"+fecha1+"'";
					
					try {
						System.out.println(hql);
						session.getTransaction().begin();
						objects = session.createQuery(hql).list();
						session.getTransaction().commit();
					} catch (Exception e) {
						System.out.print("ERROR LINEA 229 consulta devolvio valores nulos");
						if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
								|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
							session.getTransaction().rollback();
						}
					}
					
		
		
		if(objects==null) {
			System.out.println(objects);
			objects=getAll(entityName);
			
		}
		

		
		
		return objects;

	}
	
	@Override
	public List<?> getListByAlumno(String entityName, String column, String idalumno) {
		Session session = getCurrentSession();
		List<?> obj = null;
		String hql = "from " + entityName + " c where c."+column+".idAlumno = "+idalumno;
		
		try {
			session.getTransaction().begin();
			obj = session.createQuery(hql).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}

	@Override
	public List<?> getInstancesById(String entityName,String Instance,String InstanceColumnId, int InstanceId) {
		Session session = getCurrentSession();
		List<?> obj = null;
		String hql = "from " + entityName + " c where c."+Instance+"."+InstanceColumnId+" = "+InstanceId;
		// select * from vista c where c.Menu.id_menu = ?
		try {
			session.getTransaction().begin();
			obj = session.createQuery(hql).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}
	
	@Override
	public List<?> executeNativeQuery(String query) {
		Session session = getCurrentSession();
		List<?> obj = null;
		String hql = query;
		try {
			session.getTransaction().begin();
			obj = session.createNativeQuery(hql).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
				System.out.println("ERROR AL EJECUTAR LA CONSULTA:"+query);
			}
		} 
		return obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Menu> getMenusByUser(Principal user) {
		Rol roldeluseractual = new Rol();
		
		// busquemos a que rol pertenece el usuario actual
		Usuario usuarioactual = (Usuario) getByName(Usuario.class.getName(), "username", user.getName());
		try {
			roldeluseractual = (Rol) getById(Rol.class.getName(), usuarioactual.getRol().getIdRol());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("LINEA 50 ERROR");
		}

		// busquemos los menus que tiene asociado ese rol
		List<Integer> idsMenu = (List<Integer>) executeNativeQuery(
				"select MENUSET_ID_MENU from menuset where ROLSET_ID_ROL = " + roldeluseractual.getIdRol());
		List<Menu> menusdelrol = new ArrayList<Menu>();
		Menu menu = new Menu();
		for (Integer idmenu : idsMenu) {
			try {
				menu = (Menu) getById(Menu.class.getName(), idmenu.intValue());
				menu.setActivo(true);
				menusdelrol.add(menu);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("LINEA 67 ERROR");
			}

		}
		return menusdelrol;
		
	}
	
	
	
	@Override
	public void procedimiento(String proc, int id) {
		Session session = getCurrentSession();
		
		
		try {
			session.getTransaction().begin();
			ProcedureCall query=session.createStoredProcedureCall(proc);
			query.registerParameter(1, Integer.class, ParameterMode.IN);
			query.setParameter(1, id);
			query.getOutputs();
			session.getTransaction().commit();
		} catch (Exception e) {
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
	}

	@Override
	public Permisos getPermisosByVistaAndRol(Vista vista, Rol rol) {
		Session session = getCurrentSession();
		Permisos obj = null;
		String hql = "from " + "Permisos p " + "where p.vista.idVista = "+vista.getIdVista()+""
												+ " and p.rol.idRol = "+rol.getIdRol();
		// select * from vista c where c.Menu.id_menu = ?
		try {
			session.getTransaction().begin();
			obj = (Permisos) session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Menu> getMenusByRol(Rol rol) {
		// busquemos los menus que tiene asociado ese rol
				List<Integer> idsMenu = (List<Integer>) executeNativeQuery(
						"select MENUSET_ID_MENU from menuset where ROLSET_ID_ROL = " + rol.getIdRol());
				List<Menu> menusdelrol = new ArrayList<Menu>();
				Menu menu = new Menu();
				for (Integer idmenu : idsMenu) {
					try {
						menu = (Menu) getById(Menu.class.getName(), idmenu.intValue());
						menu.setActivo(true);
						menusdelrol.add(menu);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("LINEA 67 ERROR");
					}

				}
				return menusdelrol;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Menu> getMenusByDistict(List<Menu> menus) {
		Session session = getCurrentSession();
		List<Menu> obj = null;
		String hql = "from " + "Menu p " + "where p.id <> ";
		
		for(Menu menusito:menus) {
			hql+=""+menusito.getId();
			hql+=""+" and p.id <>";
		}
		hql+=""+" 0";
		
		// select * from vista c where c.Menu.id_menu = ?
		try {
			session.getTransaction().begin();
			obj = (List<Menu>) session.createQuery(hql).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		} 
		return obj;
	}
	
	@Override
	public Object getNoJumps(String entityName, String column, int id) {
		Session session = getCurrentSession();
		Object obj = null;
		String sql = "select replace(replace(replace((select n." + column + " from " + entityName + " n where n.id_"
				+ entityName + " = " + id + "),chr(10),''),chr(13),''),chr(34),chr(39))";
		try {
			session.getTransaction().begin();
			obj = session.createNativeQuery(sql).list().get(0);
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.print(e);
			if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE
					|| session.getTransaction().getStatus() == TransactionStatus.MARKED_ROLLBACK) {
				session.getTransaction().rollback();
			}
		}
		return obj;
	}






	
	
	
	
}
