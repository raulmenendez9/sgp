<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-lg-12">
	<div class="container col-sm-12">
		<div class="table-responsive">
			<h1>Registro de Usuarios</h1>
			<br>
			<c:choose>
				<c:when test="${create}">
					<a data-toggle="modal" class="btn btn-success"
								data-target="#-addusuario"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar</a>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
			<hr>
			<c:choose>
				<c:when test="${read}">
					<table width="100%" class="table table-bordered table-hover tabla"
						id="dataTables-example" id="dataTables-usuario">
						<thead>
							<tr>
								<th>Username</th>
								<th>Rol</th>
								<th>Empresa</th>
								<th>Empleado</th>
								<th>Activo</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${usuarios}" var="usuario">
								<tr style="color: #0B0B61;">
									<td>${usuario.username  }</td>
									<td>${usuario.rol.nombre }</td>
									<td>${usuario.empresa.nombre }</td>
									<td>${usuario.empleado.nombre } ${usuario.empleado.apellidos }</td>

									<td><c:choose>
											<c:when test="${usuario.activo == true }">
												Si
											</c:when>
											
											<c:otherwise>
												No
											</c:otherwise>
										</c:choose></td>
									<td>
									<!--boton actualizar -->
										<c:choose>
											<c:when test="${update}">
												<a data-toggle="modal" data-target="#-${usuario.idUsuario}"><span
													class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
												</a>&nbsp;
											</c:when>
										</c:choose>
									<!-- /fin boton actualizar -->	
									<!--boton eliminar -->
										 <c:choose>
											<c:when test="${delete}">
												<a data-eliminar="${usuario.idUsuario}"
													name="eliminar-nivel" href="#" data-toggle="modal"
													data-target="#modal_eliminar"><span
													class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
											</c:when>
										</c:choose>
									<!-- /fin boton eliminar -->
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
			</c:choose>
			
			
			<c:forEach items="${usuarios}" var="usuario">
			<!-- Modal -->
						<div id="-${usuario.idUsuario}" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="color:#0B0B61; text-align: center;">Editar a ${usuario.username }</h4>
									</div>
									<div class="modal-body">
										<form:form method="post" modelAttribute="usuarioForm"
							action="/sisconta/usuarios/add" class="form-horizontal"
							onsubmit="return validar();">


							<div class="form-group">
								<label class="control-label col-sm-4">Username: </label>
								<div class="col-sm-8">
									<form:input path="username" class="form-control"
										placeholder="Username" type="text" id="us-${usuario.idUsuario }"
										value="${usuario.username }" />
								</div>
							</div>
							

							<div class="form-group">
								<label class="control-label col-sm-4">Contraseña: </label>
								<div class="col-sm-8">
									<form:password path="password" class="form-control"
										placeholder="Contraseña" id="pass-${usuario.password }"
										value="${usuario.password }" />
								</div>
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
										
											<form:checkbox path="activo" checked="true" data-toggle="toggle" />
										</c:when>
										<c:otherwise>
											<form:checkbox path="activo" data-toggle="toggle" />
										</c:otherwise>
									</c:choose>

								</div>
							</div>

							<form:hidden path="idUsuario" value="${usuario.idUsuario}" />

									<div class="text-center">
										<hr>
										<br> 
										<form:button type="submit" class="btn btn-primary">
											<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Actualizar</form:button>
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
			
			
			<div id="-addusuario" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="color:#0B0B61; text-align: center;">Agregar Usuario</h4>
									</div>
									<div class="modal-body">
										<form:form method="post" modelAttribute="usuarioForm"
							action="/sisconta/usuarios/add" class="form-horizontal"
							onsubmit="myFunction();">


							<div class="form-group">
								<label class="control-label col-sm-4">Username: </label>
								<div class="col-sm-8">
									<form:input path="username" class="form-control"
										placeholder="Username" type="text" id="us"
										value="${usuario.username }" />
								</div>
							</div>
							

							<div class="form-group">
								<label class="control-label col-sm-4">Contraseña: </label>
								<div class="col-sm-8">
									<form:password path="password" class="form-control"
										placeholder="Contraseña" id="pass"
										value="${usuario.password }" />
								</div>
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
										
											<form:checkbox path="activo" checked="true" data-toggle="toggle" />
										</c:when>
										<c:otherwise>
											<form:checkbox path="activo" data-toggle="toggle" />
										</c:otherwise>
									</c:choose>

								</div>
							</div>

							<form:hidden path="idUsuario" value="${usuario.idUsuario}" />

								<div class="text-center">
									<hr>
									<br>
									<form:button type="submit" class="btn btn-primary" >
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

<div id="snackbar">Some text some message..</div>

<script>
function myFunction() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
</script>
