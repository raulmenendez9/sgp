package com.sisbam.sisconta.controller.variety;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbcp2.BasicDataSource;
import org.postgresql.jdbc2.optional.SimpleDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sisbam.sisconta.configuration.HibernateConf;

import freemarker.core.ParseException;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

/**
	
 * CLASE PARA GENERAR REPORTES
 * 
 * Paso #1 hacer el reporte en JasperStudio
 * Paso #2 ya despues de tener el formato de plantilla compilar en archivo.jasper y guardar en la ruta correspondiente
 * 
 * @author B.Miranda
 * @param  Model: modelo
 * @param  request: para la session	
 * @param  response: para mostrar reporte
 * @param  nombreReporte: nombre del reporte sin la extension, guardado en src/main/webapp/resources/Reportes/nombrereporte
 * @param  hmParams: Hash map parameters, si el reporte necesita parametros como el titulo o algun filtro para la consulta enviarlos por aqui	
 */


@Controller
public class ReportesController {

public void genearReporte(	Model 					model,			
							HttpServletRequest 		request,
							HttpServletResponse 	response,
							String 					nombreReporte,	//-nombre del reporte guardado en /resources/Reportes/
							HashMap<String,Object>  hmParams		//-mapa con los parametros que necesite el reporte
						 	) throws ParseException,Exception {		//-los throws son para que la clase ExceptionsController 
																	//se coma el error y no le muestre al usuario un error feo del tomcat
		
		//inicializa una conexion
		Connection conn = null;
		//obtiene los datos de conexion a la BD por medio de hibernate para no tener que ponerlos de nuevo
		HibernateConf datosDeConexionBD = new HibernateConf();
		//Basic datasorce es una clase de propiedades solo contiene nombre de la base driver usado, etc
		BasicDataSource datosConex = (BasicDataSource) datosDeConexionBD.restDataSource();
			
			//se obtiene el reporte como objeto atravez del archivo .jasper ya generado
			InputStream reportStream = request.getSession().getServletContext().getResourceAsStream("/resources/Reportes/"+nombreReporte+".jasper");
				
			//se intenta obtener el flujo de vista
			try (ServletOutputStream servletOutputStream = response.getOutputStream()) {
				//conexion a la BD
			     Class.forName(datosConex.getDriverClassName());
			     conn = DriverManager.getConnection(datosConex.getUrl(),datosConex.getUsername(),datosConex.getPassword());
					
			     //le digo al servidor que ya no muestre .jsp si no que pase el navegador a modo pdf
			     response.setContentType("application/pdf");
			     //Jasper se encarga de mapear el pdf
			     JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, hmParams, conn);
			     servletOutputStream.flush();
		         servletOutputStream.close();
		         //se cierra la conexion
		         conn.close();
			}
			catch(Exception e) {
				
			}
		
	}
	
	
}
