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
			<a class="navbar-brand" href="/sisconta">Sistema Contable</a>
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
						<h1 class="text-center">Agregar Usuario</h1>

						<form:form method="post" modelAttribute="usuarioForm"
							action="/sisconta/usuarios/add" class="form-horizontal"
							onsubmit="return validar();">


							<div class="form-group">
								<label class="control-label col-sm-4">Username: </label>
								<div class="col-sm-8">
									<form:input path="username" class="form-control"
										placeholder="Username" type="text" id="us"
										value="${usuario.username }" />
								</div>
							</div>
							<div id="alerta" class="alert alert-danger collapse">
								<a id="linkClose" href="#" class="close">&times;</a> <strong>ERROR</strong>campo
								obligatorio
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Contraseña: </label>
								<div class="col-sm-8">
									<form:password path="password" class="form-control"
										placeholder="Contraseña" id="pass"
										value="${usuario.password }" />
								</div>
							</div>
							<div id="alerta2" class="alert alert-danger collapse">
								<a id="linkClose2" href="#" class="close">&times;</a> <strong>ERROR
									</strong>campo obligatorio
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Rol: </label>
								<div class="col-sm-8">
									<form:select path="idRol" class="form-control" required="true">
									<option value="" disabled selected>Selecione el rol</option>
										<c:forEach items="${roles}" var="r">
											<c:choose>
												<c:when test="${usuario.rol.idRol == r.idRol}">
													<form:option value="${r.idRol }" label="${r.nombre}"
														selected="true" />
												</c:when>
												<c:otherwise>
													<form:option value="${r.idRol }" label="${r.nombre}" />
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-sm-4">Empleado: </label>
								<div class="col-sm-8">
									<form:select path="idEmpleado" class="form-control" required="true">
									<option value="" disabled selected>Selecione el Empleado</option>
										<c:forEach items="${empleados}" var="r">
											<c:choose>
												<c:when test="${usuario.empleado.idEmpleado == r.idEmpleado}">
													<form:option value="${r.idEmpleado }" label="${r.nombre} ${r.apellidos}"
														selected="true" />
												</c:when>
												<c:otherwise>
													<form:option value="${r.idEmpleado }" label="${r.nombre} ${r.apellidos}" />
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-sm-4">Empresa a la que pertenece el usuario: </label>
								<div class="col-sm-8">
									<form:select path="idEmpresa" class="form-control" required="true">
									<option value="" disabled selected>Selecione la empresa</option>
										<c:forEach items="${empresas}" var="e">
											<c:choose>
												<c:when test="${usuario.empresa.idEmpresa == e.idEmpresa}">
													<form:option value="${e.idEmpresa }" label="${e.nombre}"
														selected="true" />
												</c:when>
												<c:otherwise>
													<form:option value="${e.idEmpresa }" label="${e.nombre}" />
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Activo: </label>
								<div class="col-sm-8">
									<c:choose>
										<c:when test="${usuario.activo }">
											<form:checkbox path="activo" checked="true" id="toggle-one" />
										</c:when>
										<c:otherwise>
											<form:checkbox path="activo" id="toggle-one" />
										</c:otherwise>
									</c:choose>

								</div>
							</div>

							<form:hidden path="idUsuario" value="${usuario.idUsuario}" />

							<form:button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar</form:button>
							<form:button type="submit" class="btn btn-default"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancelar</form:button>

						</form:form>


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

	<script
		src="<c:url value="${context}/resources/vendor/bootstrap/dist/bootstrap-toggle.min.js"/> "></script>

	<script>
		function validar() {
			var est = document.getElementById('us').value;
			var isopa = document.getElementById('pass').value;
			if (est === '') {
				$('#alerta').show('fade');
				$('#linkClose').click(function() {
					$('#alerta').hide('fade');
				})
				setTimeout(function() {
					$('#alerta').hide('fade');
				}, 2000);
				return false;
			}
			if (isopa === '') {
				$('#alerta2').show('fade');
				$('#linkClose2').click(function() {
					$('#alerta2').hide('fade');
				})
				setTimeout(function() {
					$('#alerta2').hide('fade');
				}, 2000);
				return false;
			}
			return true
		}

		$(function() {
			$('#toggle-one').bootstrapToggle();
		})
	</script>

</body>
</html>