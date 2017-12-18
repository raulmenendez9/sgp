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
<title>Agregar nuevo rol</title>

<!-- Librerias CSS -->
<c:import url="/WEB-INF/menu/librerias_css.jsp"></c:import>
<link href="<c:url value="/resources/vendor/sigpaai/estilos.css"/>"
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
					<div class="col-lg-12"></div>

					<br />
					<!-- Definición de Apache Tiles para el contenido principal -->

					<h1 class="text-center">Agregar Rol</h1>

					<form method="post" action="/sisconta/roles/add" class="form-horizontal"
						id="rolForm" onsubmit="return validar();">
						<div class="container">

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div class="form-group">
							<label class="control-label col-sm-2">Nombre: </label>
							<div class="col-sm-10">
								<input name="nombre" class="form-control" id="nombre"
									placeholder="Nombre" type="text" value="${rol1.nombre}" required="required"/>
							</div>
						</div>
						<div id="alerta" class="alert alert-danger collapse">
							<a id="linkClose" href="#" class="close">&times;</a><strong>ERROR</strong>campo
							obligatorio
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">Descripción: </label>
							<div class="col-sm-10">
								<textarea name="descripcion" id="descripcion"
									class="form-control" cols="100" rows='50' required="required"
									placeholder="Descripción"></textarea>
							</div>
						</div>
						<div id="alerta2" class="alert alert-danger collapse">
							<a id="linkClose2" href="#" class="close">&times;</a> <strong>ERROR
							</strong>campo obligatorio
						</div>

						<div id="result" class="alert alert-success collapse">
							<a id="linkClose" href="#" class="close">&times;</a> <strong>ERROR
							</strong>campo obligatorio
						</div>

						<input type="hidden" name="idRol" value="${rol1.idRol}" />
						
						


						
						<h3>${msj_listaDeDisponibles}</h3>
						<h4>${msg_menudispvacio}</h4>
						<hr>
						<div class="list-group">
						
						
						
						
						
							<c:forEach items="${menusdeagregacion}" var="menu">
								<!-- RECORRER LOS MENUS Y SUS VISTAS -->
								<table width="100%"
									class="table table-bordered table-hover tabla"
									id="dataTables-example" id="dataTables-menu">

									<tbody>
										<tr>
											<td style="color: #0B0B61" width="60"><label
												class="control-label col-sm-2">Activo: </label>
												<div class="col-sm-10" onsubmit="validar('${menu.id }');">
													<c:choose>
														<c:when test="${menu.activo}">
															<input type="checkbox" name="menuactivo-${menu.id }"
																id="${menu.id }" 
																checked="checked" />
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="menuactivo-${menu.id }"
																id="${menu.id }"/>
														</c:otherwise>
													</c:choose>

												</div></td>
											<td>
												<button type="button" class="list-group-item"
													data-toggle="modal" data-target="#-${menu.id}">
													<p>
														<i class="fa ${menu.icono } fa-fw" style="color: #0B0B61"></i>&nbsp;
													<h5>${menu.nombre} </h5>
													</p>
												</button>
											</td>

											<td style="color: #0B0B61" width="60">
												<p style="text-align: right;">
													<a href="/sisconta/menus/update/${menu.id}"><span
														class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>&nbsp;
													<a data-eliminar="${menu.id}" name="eliminar-nivel"
														href="#" data-toggle="modal" data-target="#modal_eliminar"><span
														class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
												<p>
											</td>
										</tr>

									</tbody>
								</table>
								<!-- 	lista de menus -->
								<div id="-${menu.id}" class="modal fade" role="dialog">
									<div class="modal-dialog">

										<!-- vistas -->

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title" style="color: #0B0B61;">
													<i class="fa ${menu.icono } fa-fw" style="color: #0B0B61"></i><b>${menu.nombre} </b>
												</h4>
											</div>

											<div class="modal-body">
												<!-- el modal body es la lista de vistas -->
												<div class="list-group">
													<c:forEach items="${vistas}" var="vista">
													
													<c:if test="${estoyguardando==true}">
													
												<!-- ACTUALIZANDO -->
														<c:choose>
														<c:when test="${(vista.menu.id == menu.id)}"> 
																<!--******************************MOSTRAR EL CONTENIDO DE LAS VISTAS SU FORM EN SU DEFECTO -->

																<h5 style="color: #0B0B61">
																	<i class="fa  ${vista.icon} fa-fw"></i><b>
																		${vista.url} </b>
																</h5>

																<div class="list-group-item">

																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}" />
																	<div class="list-group-item">
																		<!-- inicio lista 1 -->

																		<!-- **************************************CREATE -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Crear:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${false}">
																						<input type="checkbox" id="create-${vista.menu.id }"
																							name="create-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="create-${vista.menu.id }"
																							name="create-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--**************************************/CREATE -->

																		<!-- ****************************************READ   -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Leer: </label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${false}">
																						<input type="checkbox" id="read-${vista.menu.id }"
																							name="read-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="read-${vista.menu.id }"
																							name="read-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--****************************************/READ   -->
																	</div>
																	<!-- FIN LISTA 1 -->

																	<div class="list-group-item">
																		<!-- inicio lista 2 -->

																		<!--**************************************UPDATE -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Modificar:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${false}">
																						<input type="checkbox" id="update-${vista.menu.id }}"
																							name="update-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="update-${vista.menu.id }"
																							name="update-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>

																		</div>
																		<!--**************************************/UPDATE -->

																		<!-- ****************************************DELETE   -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Borrar:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${false}">
																						<input type="checkbox" id="delete-${vista.menu.id }"
																							name="delete-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="delete-${vista.menu.id }"
																							name="delete-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--****************************************/DELETE   -->
																	</div>
																	<!-- FIN LISTA 2 -->
																	<input type="hidden" name="idVista-${vista.idVista }"
																		value="${vista.idVista}" />
																</div>
																<!--****************************************************** FIN CONTENIDO  VISTA ********************** -->
															</c:when>
															
														</c:choose>
														
														</c:if>
														<c:forEach items="${permisos}" var="permiso">
														<c:if test="${estoyactualizando==true}">
													
												<!-- ACTUALIZANDO -->
														<c:choose>
														<c:when test="${(permiso.vista.idVista == vista.idVista && vista.menu.id == menu.id && permiso.rol.idRol == rol1.idRol)}"> 
																<!--******************************MOSTRAR EL CONTENIDO DE LAS VISTAS SU FORM EN SU DEFECTO -->
															
																<h5 style="color: #0B0B61">
																	<i class="fa  ${vista.icon} fa-fw"></i><b>
																		${vista.url}</b>
																</h5>

																<div class="list-group-item">

																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}" />
																	<div class="list-group-item">
																		<!-- inicio lista 1 -->

																		<!-- **************************************CREATE -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Crear:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																				
																					<c:when test="${permiso.c && permiso.rol.idRol == rol1.idRol}">
																						
																						<input type="checkbox" id="create-${vista.menu.id }"
																							name="create-${vista.idVista }" checked="checked" />
																					</c:when>
																				
																					<c:otherwise>
																						<input type="checkbox" id="create-${vista.menu.id }"
																							name="create-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--**************************************/CREATE -->

																		<!-- ****************************************READ   -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Leer: </label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${permiso.r && permiso.rol.idRol == rol1.idRol}">
																						<input type="checkbox" id="read-${vista.menu.id }"
																							name="read-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="read-${vista.menu.id }"
																							name="read-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--****************************************/READ   -->
																	</div>
																	<!-- FIN LISTA 1 -->

																	<div class="list-group-item">
																		<!-- inicio lista 2 -->

																		<!--**************************************UPDATE -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Modificar:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${permiso.u && permiso.rol.idRol == rol1.idRol}">
																						<input type="checkbox" id="update-${vista.menu.id }"
																							name="update-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="update-${vista.menu.id }"
																							name="update-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>

																		</div>
																		<!--**************************************/UPDATE -->

																		<!-- ****************************************DELETE   -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Borrar:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${permiso.d && permiso.rol.idRol == rol1.idRol}">
																						<input type="checkbox" id="delete-${vista.menu.id }"
																							name="delete-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="delete-${vista.menu.id }"
																							name="delete-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--****************************************/DELETE   -->
																	</div>
																	<!-- FIN LISTA 2 -->
																	<input type="hidden" name="idVista-${vista.idVista }"
																		value="${vista.idVista}" />
																</div>
																<!--****************************************************** FIN CONTENIDO  VISTA ********************** -->
															</c:when>
															
														</c:choose>
														
														</c:if>
														</c:forEach><!-- fin permisos -->
													</c:forEach><!-- fin vistas -->

													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>

												</div>
												<!-- FINAL LIST GROUP -->
											</div>

										</div>
										<!-- fin vistas -->
									</div>
								</div>
							</c:forEach>
						</div>

						<hr>
						<h3>${msj_listaActuales}</h3>
						<h4>${msg_menudispvacio}</h4>
						<hr>
						<div class="list-group">
						
						
						
						
						
							<c:forEach items="${menusDisponibles}" var="menu">
								<!-- RECORRER LOS MENUS Y SUS VISTAS -->
								<table width="100%"
									class="table table-bordered table-hover tabla"
									id="dataTables-example" id="dataTables-menu">

									<tbody>
										<tr>
											<td style="color: #0B0B61" width="60"><label
												class="control-label col-sm-2">Activo: </label>
												<div class="col-sm-10" onsubmit="validar('${menu.id }');">
													<c:choose>
														<c:when test="${menu.activo}">
															<input type="checkbox" name="menuactivo-${menu.id }"
																id="${menu.id }" 
																checked="checked" />
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="menuactivo-${menu.id }"
																id="${menu.id }"/>
														</c:otherwise>
													</c:choose>

												</div></td>
											<td>
												<button type="button" class="list-group-item"
													data-toggle="modal" data-target="#-${menu.id}">
													<p>
														<i class="fa ${menu.icono } fa-fw" style="color: #0B0B61"></i>&nbsp;
													<h5>${menu.nombre} </h5>
													</p>
												</button>
											</td>

											<td style="color: #0B0B61" width="60">
												<p style="text-align: right;">
													<a href="/sisconta/menus/update/${menu.id}"><span
														class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>&nbsp;
													<a data-eliminar="${menu.id}" name="eliminar-nivel"
														href="#" data-toggle="modal" data-target="#modal_eliminar"><span
														class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
												<p>
											</td>
										</tr>

									</tbody>
								</table>
								<!-- 	lista de menus -->
								<div id="-${menu.id}" class="modal fade" role="dialog">
									<div class="modal-dialog">

										<!-- vistas -->

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title" style="color: #0B0B61;">
													<i class="fa ${menu.icono } fa-fw" style="color: #0B0B61"></i><b>${menu.nombre}</b>
												</h4>
											</div>

											<div class="modal-body">
												<!-- el modal body es la lista de vistas -->
												<div class="list-group">
													<c:forEach items="${vistas}" var="vista">
													
													<c:if test="${estoyguardando==true}">
													
												<!-- ACTUALIZANDO -->
														
														
														</c:if>
														<c:forEach items="${permisos}" var="permiso">
														<c:if test="${estoyactualizando==true}">
													
												<!-- ACTUALIZANDO -->
														<c:choose>
														<c:when test="${(permiso.vista.idVista == vista.idVista && vista.menu.id == menu.id && permiso.rol.idRol == rol1.idRol)}"> 
																<!--******************************MOSTRAR EL CONTENIDO DE LAS VISTAS SU FORM EN SU DEFECTO -->
															
																<h5 style="color: #0B0B61">
																	<i class="fa  ${vista.icon} fa-fw"></i><b>
																		${vista.url} </b>
																</h5>

																<div class="list-group-item">

																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}" />
																	<div class="list-group-item">
																		<!-- inicio lista 1 -->

																		<!-- **************************************CREATE -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Crear:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																				
																					<c:when test="${permiso.c && permiso.rol.idRol == rol1.idRol}">
																						
																						<input type="checkbox" id="create-${vista.menu.id }"
																							name="create-${vista.idVista }" checked="checked" />
																					</c:when>
																				
																					<c:otherwise>
																						<input type="checkbox" id="create-${vista.menu.id }"
																							name="create-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--**************************************/CREATE -->

																		<!-- ****************************************READ   -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Leer: </label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${permiso.r && permiso.rol.idRol == rol1.idRol}">
																						<input type="checkbox" id="read-${vista.menu.id }"
																							name="read-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="read-${vista.menu.id }"
																							name="read-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--****************************************/READ   -->
																	</div>
																	<!-- FIN LISTA 1 -->

																	<div class="list-group-item">
																		<!-- inicio lista 2 -->

																		<!--**************************************UPDATE -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Modificar:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${permiso.u && permiso.rol.idRol == rol1.idRol}">
																						<input type="checkbox" id="update-${vista.menu.id }"
																							name="update-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="update-${vista.menu.id }"
																							name="update-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>

																		</div>
																		<!--**************************************/UPDATE -->

																		<!-- ****************************************DELETE   -->
																		<div class="form-group">
																			<label class="control-label col-sm-2">Borrar:
																			</label>
																			<div class="col-sm-10">
																				<c:choose>
																					<c:when test="${permiso.d && permiso.rol.idRol == rol1.idRol}">
																						<input type="checkbox" id="delete-${vista.menu.id }"
																							name="delete-${vista.idVista }" checked="checked" />
																					</c:when>
																					<c:otherwise>
																						<input type="checkbox" id="delete-${vista.menu.id }"
																							name="delete-${vista.idVista }" />
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																		<!--****************************************/DELETE   -->
																	</div>
																	<!-- FIN LISTA 2 -->
																	<input type="hidden" name="idVista-${vista.idVista }"
																		value="${vista.idVista}" />
																</div>
																<!--****************************************************** FIN CONTENIDO  VISTA ********************** -->
															</c:when>
															
														</c:choose>
														
														</c:if>
														</c:forEach><!-- fin permisos -->
													</c:forEach><!-- fin vistas -->

													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>

												</div>
												<!-- FINAL LIST GROUP -->
											</div>

										</div>
										<!-- fin vistas -->
									</div>
								</div>
							</c:forEach>
						</div>




						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar
						</button>
						<button type="submit" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancelar
						</button>
						</div>
					</form>


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
	<script type="text/javascript">
		CKEDITOR.replace('descripcion', {
			toolbar : 'Basic',
			uiColor : '#ffffff'
		});
		
		
		
		
	</script>
	<script type="text/javascript">
		// 	CKEDITOR.instances['cuerpo'].insertHtml(document.getElementById("cuerpo_as"));
		CKEDITOR.instances['descripcion'].setData("${rol1.descripcion}");
		
		
		
	</script>
	<script
		src="<c:url value="${context}/resources/vendor/bootstrap/dist/bootstrap-toggle.min.js"/> "></script>
	<script>
	$(function() {
		$('#toggle-one').bootstrapToggle();
	})

	</script>
<!-- 	<script type="text/javascript"> -->
<!-- 	function validar(menuid) { -->
<!-- 		if(document.getElementById(menuid).checked==false){ -->
<!-- 			$("[id*=create]").prop('checked',false); -->
<!-- 			$("[id*=read]").prop('checked',false); -->
<!-- 			$("[id*=update]").prop('checked',false); -->
<!-- 			$("[id*=delete]").prop('checked',false); -->
			
<!-- 			$("[id*=create]").hide(); -->
<!-- 			$("[id*=read]").hide(); -->
<!-- 			$("[id*=update]").hide(); -->
<!-- 			$("[id*=delete]").hide(); -->
			
<!-- 		} -->
<!-- 		else{ -->
<!-- 			$("[id*=create]").show(); -->
<!-- 			$("[id*=read]").show(); -->
<!-- 			$("[id*=update]").show(); -->
<!-- 			$("[id*=delete]").show(); -->
<!-- 		} -->
		
<!-- 	} -->
	
<!-- 	</script> -->




</body>
</html>