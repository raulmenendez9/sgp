<!DOCTYPE>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport">
<meta name="description" content="">
<meta name="author" content="">
<!-- Definición de Apache Tiles para el titulo de la página -->
<title><tiles:getAsString name="titulo" /></title>


<!-- pdf -->
<script src="<c:url value="resources/Report/button.html5.min.js" />"></script>
<script src="<c:url value="resources/Report/buttons.flash.min.js" />"></script>
<script src="<c:url value="resources/Report/buttons.print.min.js" />"></script>
<script src="<c:url value="resources/Report/dataTables.buttons.min.js" />"></script>
<script src="<c:url value="resources/Report/jszip.min.js" />"></script>
<script src="<c:url value="resources/Report/pdfmake.min.js" />"></script>
<script src="<c:url value="resources/Report/vfs_fonts.js" />"></script>

<!-- fin pdf -->



<!-- Librerias CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet" type="text/css" /> 
<link href="<c:url value="/resources/vendor/metisMenu/metisMenu.min.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/dist/css/sb-admin-2.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css" />
<link rel="icon" href="<c:url value="/resources/img/one.ico" />" />

<link
	href="<c:url value="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/vendor/datatables-responsive/dataTables.responsive.css"/>"
	rel="stylesheet" type="text/css" />
	<link
	href="<c:url value="/resources/vendor/bootstrap/dist/bootstrap-toggle.min.css"/>"
	rel="stylesheet" type="text/css" />
	
<link
	href="<c:url value="/resources/vendor/sigpaai/estilos.css"/>"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0"> <!-- Navigation -->
			
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Alternar navegación</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="col-sm-12">
			<a class="navbar-brand" href="/sgp"><i class="fa fa-usd" aria-hidden="true"></i> SISTEMA GESTOR DE PROYECTOS <i class="fa fa-usd" aria-hidden="true"></i></a>
			</div>
			
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<!-- Definición de Apache Tiles para menu_usuario -->
					<tiles:insertAttribute name="menu_usuario" />
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<!-- Definición de Apache Tiles para menu_navegacion -->
					<tiles:insertAttribute name="menu_navegacion" />
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<!-- Definición de Apache Tiles para el contenido principal -->
						<tiles:insertAttribute name="content" />
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>

	<!-- Librerias JavaScript -->
	
	
  <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>" /></script>

		<script src="<c:url value="resources/vendor/ckeditor/ckeditor.js"/>" /></script>

 
  <script src="<c:url value=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>" /></script>
<!-- <script
		src="<c:url value="resources/vendor/bootstrap/js/bootstrap.min.js"/>" /></script> -->
	<script
		src="<c:url value="resources/vendor/metisMenu/metisMenu.min.js"/>" /></script>
	<script src="<c:url value="resources/dist/js/sb-admin-2.js"/> "></script>
	<script
		src="<c:url value="resources/vendor/datatables/js/jquery.dataTables.min.js"/> "></script>
	<script
		src="<c:url value="resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"/> "></script>
	<script
		src="<c:url value="resources/vendor/datatables-responsive/dataTables.responsive.js"/> "></script>
	
	<script src="<c:url value="	resources/vendor/bootstrap/dist/bootstrap-toggle.min.js"/> "></script>
	
	
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true,
				language: {"url": "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"}
			});
		});
	</script>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modal_eliminar" aria-labelledby="modalDescripcion">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header panel-encabezado">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalDescripcion">
        <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>&nbsp;
        Está realizando la acción de eliminar</h4>
      </div>
      <form id="formulario_eliminar" method="post">
      <div class="modal-body">
        <p>¿Desea eliminar este registro?&hellip;</p>
        <input type="hidden" name="hdn_id_eliminar" id="hdn_id_eliminar" />        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <input type="submit" class="btn btn-danger" value="Eliminar" />
      </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
$('#modal_eliminar').on('show.bs.modal', function (event) {
	//href="/sigpaai/nivelessatisfaccion/delete/${nivelsatisfaccion.idNivelSatisfaccion}"
	var button = $(event.relatedTarget) // Button that triggered the modal
	var id_eliminar = button.data('eliminar');
	$('#hdn_id_eliminar').val(id_eliminar);	
});
</script>

	<tiles:insertAttribute name="content_javascript" />


<!-- Modal Indicadores -->
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">¿Qué son y cómo se construyen los indicadores en la evaluación de impacto?</h4>
        </div>
        <div class="modal-body">
          <p>Un indicador es una comparación entre dos o más tipos de datos que sirve para elaborar una medida cuantitativa o una observación cualitativa. Esta comparación arroja un valor, una magnitud o un criterio, que tiene significado para quien lo analiza.
          </p>
          <p>Los indicadores se utilizan en diversos ámbitos. Un ejemplo básico de indicador es el porcentaje. Otros indicadores comunes pueden ser la tasa de empleo, la tasa de desempleo, la tasa de actividad, la tasa de informalidad, por mencionar algunos.
          </p>
          <img class="responsive-img" src="resources/img/indicador1.png" style="width:300px; height:100"><br><br>
          <p>Los indicadores para medir el incremento de proyectos se determinan a través de variables de impacto como se detalla a continuación:
          </p>
           <img class="responsive-img" src="resources/img/indicador2.png" style="width:400; height:100">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>



</body>
</html>