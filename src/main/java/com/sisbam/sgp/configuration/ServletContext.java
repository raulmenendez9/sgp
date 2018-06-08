package com.sisbam.sgp.configuration;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/*
 * Clase que contiene la configuracion del servlet.
 * Los servlets reciben peticiones desde un navegador web, 
 * las procesan y devuelven una respuesta al navegador, normalmente en HTML. 
 * Para realizar estas tareas podr�n utilizar las clases incluidas en el lenguaje Java. 
 * Estos programas son los intermediarios entre el cliente 
 * (casi siempre navegador web) y los datos (BBDD).
 * Para mas informacion: http://www.losteatinos.es/servlets/servlet.html
 */
@Configuration
@EnableWebMvc
@Import(HibernateConf.class)
@ImportResource({ "classpath:web.xml" })
@ComponentScan(basePackages = "com.sisbam.sgp.configuration")
@ComponentScan(basePackages = "com.sisbam.sgp.controller")
@ComponentScan(basePackages = "com.sisbam.sgp.dao")
@ComponentScan(basePackages = "com.sisbam.sgp.entity")
public class ServletContext extends WebMvcConfigurerAdapter {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setViewClass(JstlView.class);
        internalResourceViewResolver.setPrefix("/WEB-INF/views/");
        internalResourceViewResolver.setSuffix(".jsp");
        //internalResourceViewResolver.setSuffix(".json");
        registry.viewResolver(internalResourceViewResolver);
        
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
            
    }
    
    
//      addViewControllers:
//      Metodo usado para redireccionar URL a vistas directamente,
//      sin necesidad de pasar por un controlador.
//      En este caso la URL "/" se le asigna la vista home.jsp directamente
//      y la ruta "/home" se le asigna la vista rol.jsp. 
//      
//      registry.addViewController("/home").setViewName("home");
//        registry.addViewController("/").setViewName("home");
//        registry.addViewController("/hello").setViewName("hello");
     
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
    }
}
