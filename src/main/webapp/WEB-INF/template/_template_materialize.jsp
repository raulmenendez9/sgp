
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

.posicion
{
	float:right;
	margin-right: 10px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport">
<meta name="description" content="">
<meta name="author" content="BMIRANDA">

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
      <a class="modal-trigger posicion" href="#modal1"><i class="material-icons">exposure</i></a>
      
      
      
      <ul class="side-nav grey darken-2" id="mobile-demo">
        <li class="sidenav-header grey darken-2">
          <div class="row">
            <div class="col s3">
                <img src="https://78.media.tumblr.com/39d03bb413c70e6f50641561f64030cf/tumblr_otu2u7Vxd61u8xhwoo2_250.png" width="48px" height="48px" alt="" class="circle responsive-img valign profile-image">
            </div>
            <div class="col s9">
                <a class="btn-flat dropdown-button waves-effect waves-light white-text" href="#" data-activates="menu-usuario">${usuarioactual.username}<i class="mdi-navigation-arrow-drop-down right"></i></a>
            </div>
          </div>
        </li>        
        <c:forEach items="${menusdelrolx}" var="menx">
         <li class="white">
          <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header  waves-effect waves-blue "><i class="fa ${menx[1]} fa-fw"></i>${menx[0]} <i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
                <div class="collapsible-body z-depth-3">
                  <ul>
                		<c:forEach items="${vistasx}" var="v">
	                		<c:choose>
	                		<c:when test="${menx[2] == v[1]}">
	                		 	<li><a class="waves-effect waves-blue" href="${v[3]}"><i class="fa ${v[4] } fa-fw"></i>${v[0]}</a></li>
	                		 </c:when>
	                		 </c:choose>	
                		</c:forEach>
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
	<%@ include file = "/WEB-INF/template/articulo.jsp" %>
</body>


<ul id='menu-usuario' class='dropdown-content'>
	<li><c:url value="/logout" var="logoutUrl" />
		<form id="logout" action="${logoutUrl}" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form> <a href="javascript:document.getElementById('logout').submit()">
			Cerrar sesión
	</a></li>
</ul>


<script type="text/javascript">
	$(window).load(function()
		{
		$(".loader").fadeOut("fast");
		$('select').material_select();
	    $('.modal').modal();
	    $('.dropdown-button').dropdown({
	        inDuration: 300,
	        outDuration: 225,
	        constrainWidth: false, // Does not change width of dropdown to that of the activator
	        hover: false, // Activate on hover
	        gutter: 10, // Spacing from edge
	        belowOrigin: false, // Displays dropdown below the button
	        alignment: 'left', // Displays dropdown with edge aligned to the left of button
	        stopPropagation: false // Stops event propagation
	      }
	    );
		   
		});
</script>
<script type="text/javascript">
	//asignar los estilos y paginacion a la tabla
	$(document).ready(function() {
		
		
		
		$('#tabla').DataTable({
			scrollY: true,
		    scroller: {
		       			loadingIndicator: true
		   			  },
			pagingType : "full_numbers",
			stateSave : true,
			responsive : true,
			language : {
				"url" : "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
		}
	});//fin DataTable

					

						
});//fin function
</script>
<script>
function toast() {
	Materialize.toast('Guardado', 4000,'#558b2f light-green darken-3','rounded');
	}
	
</script>

</html>
