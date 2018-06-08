package com.sisbam.sgp.configuration;

import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class SpringMVCInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(javax.servlet.ServletContext servletContext) throws ServletException {
        
        AnnotationConfigWebApplicationContext dispatcherContext = new AnnotationConfigWebApplicationContext();
        /* dispatcherContext.register(ServletContext.class);
         * De esta forma se registra una clase que contiene las configuraciones del Servlet
         */
        // setConfigLocation: Toma la ruta como la de configuracion en lugar de registrar clase por clase
        dispatcherContext.setConfigLocation("com.sisbam.sgp.configuration");


        servletContext.addListener(new ContextLoaderListener(dispatcherContext));
        servletContext.addListener(new RequestContextListener());
        
        ServletRegistration.Dynamic dispatcher = servletContext
        		.addServlet("dispatcher", new DispatcherServlet(dispatcherContext));
        
        System.out.println(" (   (   (                *                     )     )                     (         ");
        System.out.println(" )\\ ))\\ ))\\ )  *   )    (  `    (         (  ( /(  ( /(   *   )   (      (  )\\ )  ");
        System.out.println("(()/(()/(()/(` )  /((   )\\))(   )\\        )\\ )\\()) )\\())` )  /(   )\\   ( )\\(()/( ( ");
        System.out.println(" /(_))(_))(_))( )(_))\\ ((_)()((((_)(    (((_|(_)\\ ((_)\\  ( )(_)|(((_)( )((_)/(_)))\\  ");
        System.out.println(" /(_))(_))(_))( )(_))\\ ((_)()() (((_)(    (((_|(_)\\ ((_)\\  ( )(_)|(((_)( )((_)/(_)))\\   \n" + 
        		"(_))(_))(_)) (_(_()|(_)(_()((_)\\ _ )\\   )\\___ ((_) _((_)(_(_()) )\\ _ )((_)_(_)) ((_ ");
        System.out.println("/ __|_ _/ __||_   _| __|  \\/  (_)_\\(_) ((/ __/ _ \\| \\| ||_   _| (_)_\\(_) _ ) |  | __| ");
        System.out.println("\\__ \\| |\\__ \\  | | | _|| |\\/| |/ _ \\    | (_| (_) | .` |  | |    / _ \\ | _ \\ |__| _|  ");
        System.out.println("|___/___|___/  |_| |___|_|  |_/_/ \\_\\    \\___\\___/|_|\\_|  |_|   /_/ \\_\\|___/____|___| \n");
        
   		dispatcher.setLoadOnStartup(1);
  		dispatcher.addMapping("/");        
    }

}
