<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<c:if test="${create}">
				<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
			</c:if>
			<hr>
	 	<div class="container">

			
				<c:if test="${read}">
					<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
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
								<tr>
									<td>${usuario.username  }</td>
									<td>${usuario.rol.nombre }</td>
									<td>${usuario.empresa.nombre }</td>
									<td>${usuario.empleado.nombre } ${usuario.empleado.apellidos }</td>

									<td>
										<c:if test="${usuario.activo == true }">
												Si
										</c:if>
										<c:if test="${usuario.activo == false }">
												No
										</c:if>
									</td>
											<td width="5%">
													<c:if test="${update}">	
															<a class="modal-trigger" href="#-${usuario.idUsuario}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
													</c:if>
													<c:if test="${delete}">		
															<a class="" href="/sisconta/usuarios/delete/${usuario.idUsuario}" data-toggle="modal" data-target="#"><i class="fa fa-trash" aria-hidden="true"></i></a>
													</c:if>						
											</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>







<div id="agregar" class="modal white darken-4">
	<div class="modal-header">
		<!-- 		<h4>Agregar Empresa</h4> -->
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="usuarioForm"
			action="/sisconta/usuariosadd" id="registro" autocomplete="off">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="username" class="form-control"
								placeholder="Username" type="text" id="us-${usuario.idUsuario }"
								value="${usuario.username }" required="required"/>

				</div>
				<div class="input-field col s6">
					<form:password path="password" class="form-control"
								placeholder="Contraseña" id="pass-${usuario.password }" required="required" />
					
				</div>
			</div>

					<div class="row">
						<div class="input-field col s12">
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

					<div class="row">
						<div class="input-field col s12">
							<form:select path="idEmpleado" class="form-control"
								required="true">
								<option value="" disabled selected>Selecione el empleado</option>
								<c:forEach items="${empleados}" var="r">
									<c:choose>
										<c:when test="${usuario.empleado.idEmpleado == r.idEmpleado}">
											<form:option value="${r.idEmpleado }"
												label="${r.nombre} ${r.apellidos}" selected="true" />
										</c:when>
										<c:otherwise>
											<form:option value="${r.idEmpleado }"
												label="${r.nombre} ${r.apellidos}" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
					</div>


					<div class="row">
						<div class="input-field col s6">
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
						
						<!-- Switch -->
						  <div class="col s6 switch center">
						    <label>
						      Activo
						      <input type="checkbox" name="activo">
						      <span class="lever"></span>
						    </label>
						  </div>
					</div>


					<form:hidden id="idUsuario" path="idUsuario" value="${usuario.idUsuario}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>





<c:forEach items="${usuarios}" var="usuario">
<div id="-${usuario.idUsuario }" class="modal white darken-4">
	<div class="modal-header">
		<!-- 		<h4>Agregar Empresa</h4> -->
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="usuarioForm"
			action="/sisconta/usuariosadd" id="registro" autocomplete="off">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="username" class="form-control"
								placeholder="Username" type="text" id="us-${usuario.idUsuario }"
								value="${usuario.username }" required="required"/>

				</div>
				<div class="input-field col s6">
					<form:password path="password" class="form-control"
								placeholder="Contraseña" id="pass-${usuario.password }" required="required" />
					
				</div>
			</div>

					<div class="row">
						<div class="input-field col s12">
							<form:select path="idRol" class="form-control" required="true" id="idRol-${usuario.idUsuario }">
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

					<div class="row">
						<div class="input-field col s12">
							<form:select path="idEmpleado" class="form-control" required="true" id="idEmpleado-${usuario.idUsuario }">
								<option value="" disabled selected>Selecione el empleado</option>
								<c:forEach items="${empleados}" var="r">
									<c:choose>
										<c:when test="${usuario.empleado.idEmpleado == r.idEmpleado}">
											<form:option value="${r.idEmpleado }"
												label="${r.nombre} ${r.apellidos}" selected="true" />
										</c:when>
										<c:otherwise>
											<form:option value="${r.idEmpleado }"
												label="${r.nombre} ${r.apellidos}" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
					</div>


					<div class="row">
						<div class="input-field col s6">
							<form:select path="idEmpresa" class="form-control" required="true" id="idEmpresa-${usuario.idUsuario }">
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
						
						<c:choose>
							<c:when test="${usuario.activo}">
									<div class="col s6 switch center">
										<label> Activo <input checked type="checkbox"
											name="activo-${usuario.idUsuario}"> <span
											class="lever"></span>
										</label>
									</div>
								</c:when>
							<c:otherwise>
									<div class="col s6 switch center">
										<label> Activo <input type="checkbox"
											name="activo-${usuario.idUsuario}"> <span
											class="lever"></span>
										</label>
									</div>
							</c:otherwise>
						</c:choose>
						<!-- Switch -->
							
						  
					</div>

					<form:hidden id="idUsuario" path="idUsuario" value="${usuario.idUsuario}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>
</c:forEach>







			
			
	</div>
</div>

<!-- /.col-lg-12 -->

