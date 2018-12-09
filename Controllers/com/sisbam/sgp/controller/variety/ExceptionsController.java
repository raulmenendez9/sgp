package com.sisbam.sgp.controller.variety;

import java.io.IOException;
import java.sql.SQLException;

import java.lang.ClassCastException;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.http.HTTPException;

import org.apache.velocity.exception.ResourceNotFoundException;
import org.hibernate.HibernateException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;


@ControllerAdvice
public class ExceptionsController {

	
	//COMERNTAR ESTOS METODOS CUANDO SE ESTE DEPURANDO, PARA OBTENER UN ERROR MAS DETALLADO

	 @ExceptionHandler(Exception.class)
	    public String exceptionHandler(){
	        return "Variety/Error";
	    }
	 
	 @ExceptionHandler(ClassCastException.class)
	    public String exceptionClassCastHandler(){
	        System.err.println("Error: cierre sesion cada vez que haga cambios");
	        return "redirect:/sgp";
	    }
	 
	 @ExceptionHandler(SQLException.class)
		public String handleSQLException(HttpServletRequest request, Exception ex){
		 	request.getSession().setAttribute("error",ex);
			return "Variety/Error";
		}
	 
	 @ExceptionHandler(HTTPException.class)
		public String httperror(HttpServletRequest request, Exception ex){
		 	request.getSession().setAttribute("error",ex);
			return "Variety/Error";
		}
	 
	 @ResponseStatus(HttpStatus.CONFLICT)  // 409
	    @ExceptionHandler(DataIntegrityViolationException.class)
	    public String handleConflict() {
	        // Nothing to do
		 return "Variety/Error";
	    }
	 
	 
	 @ExceptionHandler(ResourceNotFoundException.class)
	    public String handleResourceNotFoundException() {
	        return "Variety/Error";
	 }
	 
	 @ExceptionHandler(HibernateException.class)
	    public String errorBDException() {
		 
	        return "Variety/Error";
	 }
	 
	 
	 @ResponseStatus(HttpStatus.NOT_FOUND)
	 @ExceptionHandler(RuntimeException.class)
	    public String http404() {
	        // Nothing to do
		 return "Variety/Error";
	    }
	 
	 
	
}


