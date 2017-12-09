<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-lg-12">
	<h1>Registro de Vistas ${context}</h1>
	<br>
	<div class="container col-sm-12">
	<a data-toggle="modal" data-target="#-addvista" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar</a>
	<a href="/sisconta/menus/add" class="btn btn-warning" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Menu</a>
	<a href="/sisconta/roles/add" class="btn btn-default" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Rol</a><hr>
		<div class="table-responsive">
			<table width="100%"
				class="table table-bordered table-hover tabla"
				id="dataTables-example" id="dataTables-vista">
				<thead>
					<tr>
					    <th>Nombre</th>
						<th>URL</th>
						<th>icono</th>
						<th>Menu</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vistas}" var="vista">
						<tr style="color:#0B0B61;">
							<td>${vista.nombre  }</td>
							<td>${vista.url  }</td>
							<td><li><i class="fa ${vista.icon } fa-fw"></i>&nbsp; ${vista.icon }</li></td>
							<td>${vista.menu.nombre }</td>

							<td><a data-toggle="modal"
								data-target="#-${vista.idVista}"><span
									class="glyphicon glyphicon-pencil" aria-hidden="true" ></span></a>&nbsp;
								<a data-eliminar="${vista.idVista}" name="eliminar-nivel"
								href="#" data-toggle="modal" data-target="#modal_eliminar"><span
									class="glyphicon glyphicon-trash" aria-hidden="true" ></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			
			<c:forEach items="${vistas}" var="vista">
			<!-- Modal -->
						<div id="-${vista.idVista}" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="color:#0B0B61; text-align: center;"> Editar la vista: ${vista.nombre}</h4>
									</div>
									<div class="modal-body">
										<form:form method="post" modelAttribute="vistaForm"
							action="/sisconta/vistas/add" class="form-horizontal"
							onsubmit="return validar();">


							<div class="form-group">
								<label class="control-label col-sm-4">Nombre: </label>
								<div class="col-sm-8">
									<form:input path="nombre" class="form-control" placeholder="Nombre de la vista"
										type="text" id="usn" value="${vista.nombre }" required="required"/>
								</div>
							</div>
							<div id="alerta" class="alert alert-danger collapse">
								<a id="linkClose" href="#" class="close">&times;</a> <strong>ERROR</strong>campo
								obligatorio
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Url: </label>
								<div class="col-sm-8">
									<form:input path="url" class="form-control"
										placeholder="URL" type="text" id="us"
										value="${vista.url }" />
								</div>
							</div>
							<div id="alerta" class="alert alert-danger collapse">
								<a id="linkClose" href="#" class="close">&times;</a> <strong>ERROR</strong>campo
								obligatorio
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Icono: </label>
								<div class="col-sm-8">
									<form:input path="icon" class="form-control"
										placeholder="fa-icon" type="text" id="us"
										value="${vista.icon }" />
								</div>
							</div>
							<div id="alerta" class="alert alert-danger collapse">
								<a id="linkClose" href="#" class="close">&times;</a> <strong>ERROR</strong>campo
								obligatorio
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Menu: </label>
								<div class="col-sm-8">
									<form:select path="idMenu" class="form-control" required="true">
									<option value="" disabled selected>Seleccione el Menu al cual pertenece esta vista</option>
										<c:forEach items="${menus}" var="m">
											<c:choose>
												<c:when test="${vista.menu.id == m.id}">
													<form:option value="${m.id }" label="${m.nombre} "
														selected="true" />
												</c:when>
												<c:otherwise>
													<form:option value="${m.id }" label="${m.nombre}" />
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</div>
							</div>
							


							<form:hidden path="idVista" value="${vista.idVista}" />
									<div class="text-center">
										<hr>
										<br>
										<form:button type="submit" class="btn btn-primary">
											<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar</form:button>
										<form:button type="submit" class="btn btn-default"
											data-dismiss="modal">
											<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancelar</form:button>
									</div>
								</form:form>
									</div>
									
								</div>

							</div>
						</div>
			
			</c:forEach>
			
			
			<!-- Modal -->
						<div id="-addvista" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="color:#0B0B61; text-align: center;"> Añadir Vista ${vista.nombre}</h4>
									</div>
									<div class="modal-body">
										<form:form method="post" modelAttribute="vistaForm"
							action="/sisconta/vistas/add" class="form-horizontal"
							onsubmit="return validar();">


							<div class="form-group">
								<label class="control-label col-sm-4">Nombre: </label>
								<div class="col-sm-8">
									<form:input path="nombre" class="form-control" placeholder="Nombre de la vista"
										type="text" id="usn" value="${vista.nombre }" required="required"/>
								</div>
							</div>
							<div id="alerta" class="alert alert-danger collapse">
								<a id="linkClose" href="#" class="close">&times;</a> <strong>ERROR</strong>campo
								obligatorio
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Url: </label>
								<div class="col-sm-8">
									<form:input path="url" class="form-control"
										placeholder="URL" type="text" id="us"
										value="${vista.url }" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Icono: </label>
								<div class="col-sm-8">
									<form:input path="icon" class="form-control"
										placeholder="fa-icon" type="text" id="us"
										value="${vista.icon }" />
								</div>
							</div>
							<div id="alerta" class="alert alert-danger collapse">
								<a id="linkClose" href="#" class="close">&times;</a> <strong>ERROR</strong>campo
								obligatorio
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Menu: </label>
								<div class="col-sm-8">
									<form:select path="idMenu" class="form-control" required="true">
									<option value="" disabled selected>Seleccione el Menu al cual pertenece esta vista</option>
										<c:forEach items="${menus}" var="m">
											<c:choose>
												<c:when test="${vista.menu.id == m.id}">
													<form:option value="${m.id }" label="${m.nombre} "
														selected="true" />
												</c:when>
												<c:otherwise>
													<form:option value="${m.id }" label="${m.nombre}" />
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</div>
							</div>
							


							<form:hidden path="idVista" value="${vista.idVista}" />
									<div class="text-center">
										<hr>
										<br>
										<form:button type="submit" class="btn btn-success">
											<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar</form:button>
										<form:button type="submit" class="btn btn-default"
											data-dismiss="modal">
											<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancelar</form:button>
									</div>
								</form:form>
									</div>
									
								</div>

							</div>
						</div>
			
			
		</div>
	</div>
</div>
<!-- /.col-lg-12 -->

