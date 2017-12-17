package com.sisbam.sisconta.dao;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import com.sisbam.sisconta.entity.security.Menu;
import com.sisbam.sisconta.entity.security.Permisos;
import com.sisbam.sisconta.entity.security.Rol;
import com.sisbam.sisconta.entity.security.Vista;

/**
 * @author Omar
 * Interface para la implementacion de el patron DAO
 * este contiene los metodos necesarios para la gestion de objetos
 * con la base de datos.
 */
public interface Dao {

	/*
	 * entityName: String que contiene el nombre de la clase del objeto que se va a persistir.
	 * obj: Este es un objeto tipo Object, hecho de esta forma para la implementacion
	 * 		de un patron DAO de forma generica el cual se utilizara para la gestion de
	 * 		todos las entidades.
	 */
	
	/*
	 * Save:
	 * Utilizado para guardar un objeto.
	 */
    public void save(String entityName, Object obj);
    
    /*
     * Update:
     *  Utilizado para actualizar un objeto.
     */
    public void update(String entityName, Object obj);
    
    /*
     * getByID:
     * Utilizado para la obtencion de un objeto mediante un ID especifico. 
     */
    public Object getById(String entityName, int id) throws ClassNotFoundException;
    
    public Object getByName(String entityName, String column, String name);
    
    /*
     * Detele:
     * Utilizado para eliminar un objeto. 
     */
    public void delete(String entityName, Object obj);
    
    /*
     * GetAll:
     * Utilizado para la obtencion de una lista de objetos de timpo "entityName". 
     */
    public List<?> getAll(String entityName);
    
    //Para obtener un listado con registros filtrados por un campo
    public List<?> getListByName(String entityName, String column, String name);
    
  //Para obtener un listado con registros filtrados por m�ltiples campos
    public List<?> getListFilter(String entityName, List<String> columns, List<String> values);
    
    public List<?> getListFilterByDate(String entityName,String column_date,String date1,String date2);
    
    public List<?> getListByAlumno(String entityName, String column, String name);
    
    public List<?> getInstancesById(String entityName,String Instance,String InstanceColumnId, int InstanceId);
    
    public List<?> executeNativeQuery(String query);
    
    public List<Menu> getMenusByUser(Principal user);
    public List<Menu> getMenusByRol(Rol rol);
    public List<Menu> getMenusByDistict(List<Menu> menus);    
    public Permisos getPermisosByVistaAndRol(Vista vista, Rol rol);
    
    public Object getNoJumps(String entityName, String column, int id);
    
    public void procedimiento(String proc, int id);
    
    
}
