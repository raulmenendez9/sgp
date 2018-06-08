<!DOCTYPE>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="es">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport">
<meta name="description" content="">
<meta name="author" content="">
<title></title>

<!-- Librerias CSS -->
<c:import url="/WEB-INF/menu/librerias_css.jsp"></c:import>
<link href="<c:url value="${context }/resources/vendor/bootstrap/dist/bootstrap-toggle.min.css"/>" rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/vendor/sigpaai/estilos.css"/>"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<!-- Navigation -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Alternar navegación</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			<div class="col-sm-12">
			<a class="navbar-brand" href="/sgp">Sistema Gestor de Proyectos</a>
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
						<c:import url="/WEB-INF/menu/menu_usuario.jsp"></c:import>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<!-- Definición de Apache Tiles para menu_navegacion -->
						<c:import url="/WEB-INF/menu/menu_navegacion.jsp"></c:import>

					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<br />
						<!-- Definición de Apache Tiles para el contenido principal -->
						<div class="text-center col-sm-8">
						
						<h1 class="text-center">Agregar Menu</h1>
						<hr>
						<form:form method="post" modelAttribute="menuForm"
							action="/sgp/menus/add" class="form-horizontal"
							onsubmit="return validar();">


							<div class="form-group">
								<label class="control-label col-sm-4">Nombre del Menu: </label>
								<div class="col-sm-8">
									<form:input path="nombre" class="form-control"
										placeholder="Nombre" type="text" id="us"
										value="${menu.nombre }" />
								</div>
							</div>

							

							<div class="form-group">
								<label class="control-label col-sm-4">Icono: </label>
								<div class="col-sm-8">
									<form:input path="icono" class="form-control"
										placeholder="fa-icon" type="text" id="us"
										value="${menu.icono }" />
								</div>
							</div>
							<div class="text-center">
							<div class="form-group">
							<a href="/sgp/vistas/add" class="btn btn-primary">+Añadir Vista</a>
							</div>
							</div>
							

							<form:hidden path="id" value="${menu.id}" />

							<form:button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar</form:button>
							<form:button type="submit" class="btn btn-default"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancelar</form:button>

						</form:form>

</div>
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
	<c:import url="/WEB-INF/menu/librerias_js.jsp"></c:import>

	

</body>
</html>