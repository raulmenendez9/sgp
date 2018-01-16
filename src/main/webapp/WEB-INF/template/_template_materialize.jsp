<!DOCTYPE>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!-- *********************************************************** -->

<!-- ESTA PANTALLA LA HEREDAN TODAS LAS VISTAS -->
<!-- LAS VISTAS SE ASIGNAN EN EL ARCHIVO tiles-default.xml -->
<!-- CONTIENE ESTILOS LAS IMPORTACIONES CSS Y JS NECESARIAS -->

<!-- *********************************************************** -->




<html lang="es">
<!-- ****************IMPORTACIONES****************************** -->
<head>
<style type="text/css">
body{
	background-image: url(<c:url value="/resources/img/background.jpg" />); 
}
.loader {
    position: fixed;
    left: 0px;
    top: 75px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url(<c:url value="/resources/img/cargando2.gif" />) 50% 50% no-repeat rgb(249,249,249);
    opacity: .9; 
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport">
<meta name="description" content="">
<meta name="author" content="">

<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<!-- Definición de Apache Tiles para el titulo de la página -->
<title><tiles:getAsString name="titulo" /></title>
<link rel="icon" href="<c:url value="/resources/img/one.ico" />" />

<tiles:insertAttribute name="cabecera" />

<script type="text/javascript">
 $(document).ready(function(){
	  $('.button-collapse').sideNav({
	      menuWidth: 300, // Default is 300
	      edge: 'left', // Choose the horizontal origin
	      closeOnClick: false, // Closes side-nav on <a> clicks, useful for Angular/Meteor
	      draggable: true // Choose whether you can drag to open on touch screens
	    }
	  );
	  // START OPEN
// 	  $('.button-collapse').sideNav('show');
	});
 </script>
 </head>
 
 <!-- ****************/ FIN IMPORTACIONES****************************** -->
 
 <body>
<div class="loader">
</div>
 <nav>
    <div class="nav-wrapper">
      <a href="#" data-activates="mobile-demo" class="button-collapse show-on-large"><i class="material-icons">menu</i></a>
      <a href="/sisconta" class="brand-logo" ><tiles:getAsString name="titulo" /></a>
      
      
      <ul class="side-nav grey darken-2" id="mobile-demo">
        <li class="sidenav-header blue">
          <div class="row">
            <div class="col s4">
                <img src="https://78.media.tumblr.com/39d03bb413c70e6f50641561f64030cf/tumblr_otu2u7Vxd61u8xhwoo2_250.png" width="48px" height="48px" alt="" class="circle responsive-img valign profile-image">
            </div>
            <div class="col s8">
                <a class="btn-flat dropdown-button waves-effect waves-light white-text" href="#" data-activates="profile-dropdown">${usuarioactual.username}<i class="mdi-navigation-arrow-drop-down right"></i></a>
            </div>
          </div>
        </li>        
        <c:forEach items="${menusdelrolx}" var="menx">
         <li class="white">
          <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header  waves-effect waves-blue "><i class="fa ${menx.icono} fa-fw"></i>${menx.nombre} <i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
                <div class="collapsible-body z-depth-3">
                  <ul>
                		<c:forEach items="${vistasx}" var="vitax">
	                		<c:choose>
	                		<c:when test="${menx.id == vitax.menu.id }">
	                		 	<li><a class="waves-effect waves-blue" href="${vitax.url}"><i class="fa ${vitax.icon } fa-fw"></i>${vitax.nombre }</a></li>
	                		 </c:when>
	                		 </c:choose>
                		</c:forEach>
                    <li><div class="divider"></div></li>
                  </ul>
                </div>
              </li>
          </ul>
        </li>
        </c:forEach>
      </ul>
    </div>
  </nav>

<!-- Gitter Chat Link -->
<div class="fixed-action-btn"><a class="btn-floating btn-large red" href="#"><i class="large material-icons">chat</i></a></div>
	<!--  ***************** CONTENIDO DE LA PAGINA ********************** -->
		<div class="row">
			<div class="col s12">
						<tiles:insertAttribute name="content" />
			</div>
		</div>				
	<!--  ***************** /CONTENIDO DE LA PAGINA ********************** -->

</body>


<script type="text/javascript">
	$(window).load(function()
		{
		    $(".loader").fadeOut("fast");
		    $('.modal').modal();
		});
</script>

</html>
