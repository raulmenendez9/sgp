<!DOCTYPE>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html lang="es">
<!-- ****************IMPORTACIONES****************************** -->
<head>
<style type="text/css">
body{
background-image: url(<c:url value="/resources/img/background.jpg" />); 
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport">
<meta name="description" content="">
<meta name="author" content="">
<!-- Definición de Apache Tiles para el titulo de la página -->
<title><tiles:getAsString name="titulo" /></title>
<link rel="icon" href="<c:url value="/resources/img/one.ico" />" />
<%-- <script src="<c:url value="resources/vendor/jquery/jquery.js"/>" /></script> --%>
<script src="//code.jquery.com/jquery-1.12.4.js" ></script>

<link  href="<c:url value="/resources/vendor/estilos/style.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />

<!-- MATERIALIZE -->
<link  href="<c:url value="/resources/vendor/materialize/css/materialize.min.css"/>"rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/vendor/materialize/js/materialize.min.js"/>" /></script>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	


<!-- DATATABLES -->

<%-- <link href="<c:url value="/resources/vendor/newdatatables/datatables.min.css"/>" rel="stylesheet" type="text/css" /> --%>
<%-- <script src="<c:url value="resources/vendor/newdatatables/datatables.min.js"/>" /></script> --%>

<link href="<c:url value="/resources/vendor/datatables/css/jquery.dataTables.min.css"/>"rel="stylesheet" type="text/css" />	
<script src="<c:url value="resources/vendor/datatables/js/jquery.dataTables.min.js"/>" /></script>
<link href="<c:url value="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/vendor/datatables-responsive/dataTables.responsive.css"/>" rel="stylesheet" type="text/css" />
<script src="<c:url value="resources/vendor/datatables-responsive/dataTables.responsive.js"/> "></script>

<link href="<c:url value="/resources/vendor/newdatatables/Buttons/css/buttons.dataTables.css"/>" rel="stylesheet" type="text/css" />
<script src="<c:url value="resources/vendor/newdatatables/Buttons/js/dataTables.buttons.js"/> "></script>
<script src="<c:url value="resources/vendor/newdatatables/Buttons/js/buttons.print.js"/> "></script>

<script src="<c:url value="resources/vendor/datatables/datatables.min.js"/> "></script>
<link href="<c:url value="/resources/vendor/datatables/datatables.min.css"/>" rel="stylesheet" type="text/css" />


<%-- <script src="<c:url value="resources/vendor/newdatatables/JSZip/jszip.js"/> "></script> --%>
<%-- <script src="<c:url value="resources/vendor/newdatatables/pdfmake/pdfmake.js"/> "></script> --%>
<!-- <script src="//code.jquery.com/jquery-1.12.4.js" ></script> -->
<!-- <link href="//cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet">	 -->
<!-- <link href="https://cdn.datatables.net/1.10.16/css/dataTables.material.min.css" rel="stylesheet">	 -->
<!-- <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" ></script> -->
<!-- <script src="https://cdn.datatables.net/1.10.16/js/dataTables.material.min.js" ></script> -->

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
 
 
 <!-- ****************/IMPORTACIONES****************************** -->
 
 <body>
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
			
						<!-- Definición de Apache Tiles para el contenido principal -->
						<tiles:insertAttribute name="content" />
			
			<!-- /.container-fluid -->
	<!--  ***************** /CONTENIDO DE LA PAGINA ********************** -->

</body>
</html>
