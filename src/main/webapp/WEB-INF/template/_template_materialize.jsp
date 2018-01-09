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




<style>

input{
width:200px;height:15px
}


 th{ 
 background-color:#2c3e50; 
 color:#ecf0f1 
 } 
.nav-wrapper{
background-color:#2980b9;
}

 table{ 
 background-color:#2c3e50; 
 } 

body{
background-image: url(<c:url value="/resources/img/background.jpg" />); 
}

// FIX SIDENAV SPACING
.side-nav li>a {
  padding: 0 16px;
}
//FIX SIDEBAR DIVIDERS
.side-nav .divider {
  margin:0;
  height:8px;
  border-bottom:1px solid #e0e0e0;
  background-color: transparent;
}

// SIDENAV HEADER
.sidenav-header {
background: url("../images/user-bg.jpg") no-repeat center center;
background-size: cover;
margin-bottom: 0px;
padding: 15px 0 0 15px;
  .row {
    margin-bottom: 0;
  }
}
.sidenav-footer {
margin-bottom: 0px;
padding: 0;
  .row {
    margin-bottom: 0;
    .social-icons {
      a {
        opacity: 0.5;
        padding: 0;
        text-align:center;
        &:hover {
          background-color:inherit;
          opacity: 1;
        }
      }
    }
  }
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


<!-- MATERIALIZE -->
<link  href="<c:url value="/resources/vendor/materialize/css/materialize.min.css"/>"rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/vendor/materialize/js/materialize.min.js"/>" /></script>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	



<!-- DATATABLES -->

<%-- <link href="<c:url value="/resources/vendor/newdatatables/datatables.min.css"/>" rel="stylesheet" type="text/css" /> --%>
<%-- <script src="<c:url value="resources/vendor/newdatatables/datatables.min.js"/>" /></script> --%>

<link href="<c:url value="/resources/vendor/datatables/css/jquery.dataTables.min.css"/>"rel="stylesheet" type="text/css" />	
<script src="<c:url value="resources/vendor/datatables/js/jquery.dataTables.min.js"/>" /></script>
<%-- <link href="<c:url value="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"/>" rel="stylesheet" type="text/css" /> --%>
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
      <a href="https://codepen.io/collection/nbBqgY/" class="brand-logo" target="_blank">${titulo} SISTEMA CONTABLE</a>
      <ul class="right hide">
        <li><a href="https://codepen.io/collection/nbBqgY/" target="_blank">Sass</a></li>
        <li><a href="https://codepen.io/collection/nbBqgY/" target="_blank">Components</a></li>
        <li><a href="https://codepen.io/collection/nbBqgY/" target="_blank">Javascript</a></li>
        <li><a href="https://codepen.io/collection/nbBqgY/" target="_blank">Mobile</a></li>
      </ul>
      
      <ul class="side-nav grey darken-2" id="mobile-demo">
        
        
        <li class="sidenav-header blue">
          <div class="row">
            <div class="col s4">
                <img src="https://gravatar.com/avatar/961997eb7fd5c22b3e12fb3c8ca14e11?s=80&d=https://codepen.io/assets/avatars/user-avatar-80x80-bdcd44a3bfb9a5fd01eb8b86f9e033fa1a9897c3a15b33adfc2649a002dab1b6.png" width="48px" height="48px" alt="" class="circle responsive-img valign profile-image">
            </div>
            <div class="col s8">
                <a class="btn-flat dropdown-button waves-effect waves-light white-text" href="#" data-activates="profile-dropdown">Jay<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <ul id="profile-dropdown" class="dropdown-content">
                    <li><a href="#"><i class="material-icons">person</i>Profile</a></li>
                    <li><a href="#"><i class="material-icons">settings</i>Setting</a></li>
                    <li><a href="#"><i class="material-icons">help</i>Help</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="material-icons">lock</i>Lock</a></li>
                    <li><a href="#"><i class="material-icons">exit_to_app</i>Logout</a></li>
                </ul>
            </div>
          </div>
        </li>
        
        <li class="blue">
          <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header white-text waves-effect waves-blue "><i class="material-icons white-text ">language</i>Language <i class="material-icons right white-text" style="margin-right:0;">arrow_drop_down</i></a>
                <div class="collapsible-body z-depth-3">
                  <ul>
                    <li><a class="waves-effect waves-blue" href="#">English</a></li>
                    <li><a class="waves-effect waves-blue" href="#">العربية</a></li>
                    <li><a class="waves-effect waves-blue" href="#">中文</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Čeština</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Nederlands</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Français</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Deutsch</a></li>
                    <li><a class="waves-effect waves-blue" href="#">한국어</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Português</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Русский</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Español</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Svenska</a></li>
                    <li><a class="waves-effect waves-blue" href="#">ภาษาไทย</a></li>
                    <li><a class="waves-effect waves-blue" href="#">Türkçe</a></li>
                    <li><div class="divider"></div></li>
                  </ul>
                </div>
              </li>
          </ul>
        </li>
        
        
        
        <li class="white">
          <ul class="collapsible collapsible-accordion">
            <li>
              <a class="collapsible-header waves-effect waves-blue"><i class="material-icons">folder_special</i>Layouts <i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
              <div class="collapsible-body">
                <ul>
                  <li><a class="waves-effect waves-blue" href="#"><i class="material-icons">fullscreen</i>Full Screen<span class="new badge right yellow grey lighten-1" data-badge-caption="updated"></span></a></li>
                  <li><a class="waves-effect waves-blue" href="#"><i class="material-icons">swap_horiz</i>Horizontal Menu<span class="new badge right yellow darken-3"></span></a></li>
                  <li><div class="divider"></div></li>
                </ul>
              </div>
            </li>
          </ul>
        </li>
        <li class="white">
          <ul class="collapsible collapsible-accordion">
            <li>
              <a class="collapsible-header waves-effect waves-blue"><i class="material-icons">folder_open</i>A submenu <i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
              <div class="collapsible-body">
                <ul>
                  <li><a class="waves-effect waves-blue" href="#"><i class="material-icons">fullscreen</i>Full Screen</a></li>
                  <li><a class="waves-effect waves-blue" href="#"><i class="material-icons">swap_horiz</i>Horizontal Menu</a></li>
                  <li><div class="divider"></div></li>
                </ul>
              </div>
            </li>
          </ul>
        </li>
        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">mail</i>Menu item</a></li>
        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">call</i> Menu item</a></li>
        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">android</i> Menu item</a></li>
        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">dialpad</i> Menu item</a></li>
        <li class="white"><div class="divider"></div></li>
        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">language</i> Menu item<span class="new badge right yellow darken-3"></span></a></li>
        
        <li class="sidenav-footer grey darken-2">
          <div class="row">  
            <div class="social-icons">
              <div class="col s2">
                <a href="#"><i class="fa fa-lg fa-linkedin-square"></i></a>
              </div>
              <div class="col s2">
                <a href="#"><i class="fa fa-lg fa-facebook-official"></i></a>
              </div>
              <div class="col s2">
                <a href="#"><i class="fa fa-lg fa-twitter"></i></a>
              </div>
              <div class="col s2">
                <a href="#"><i class="fa fa-lg fa-google-plus"></i></a>
              </div>
              <div class="col s2">
                <a href="#"><i class="fa fa-lg fa-pinterest"></i></a>
              </div>
              <div class="col s2">
                <a href="#"><i class="fa fa-lg fa-youtube"></i></a>
              </div>
            </div>
          </div>
        </li>
      </ul>
      
    </div>
  </nav>

<!-- Gitter Chat Link -->
<div class="fixed-action-btn"><a class="btn-floating btn-large red" href="https://gitter.im/Dogfalo/materialize" target="_blank"><i class="large material-icons">chat</i></a></div>

	<!--  ***************** CONTENIDO DE LA PAGINA ********************** -->
			
						<!-- Definición de Apache Tiles para el contenido principal -->
						<tiles:insertAttribute name="content" />
			
			<!-- /.container-fluid -->
	<!--  ***************** /CONTENIDO DE LA PAGINA ********************** -->

</body>
</html>
