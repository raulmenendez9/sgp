<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-lg-8">
	<h1>Registro de Menus</h1>
	<br>
	<a data-toggle="modal" data-target="#-addmenu" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Menu</a>
	<a data-toggle="modal" data-target="#-addvista" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Vista</a>
	<a href="/sisconta/roles/add" class="btn  btn-default" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Rol</a><hr>
	
</div>
<div class="list-group col-sm-8">
	<c:forEach items="${menus}" var="menu">  <!-- RECORRER LOS MENUS Y SUS VISTAS -->
		<table width="100%" class="table table-bordered table-hover tabla"
			id="dataTables-example${menu.id}">

			<tbody>
				<tr>
					<td>
						<button type="button" class="list-group-item" data-toggle="modal"
							data-target="#-${menu.id}">
								<i class="fa ${menu.icono } fa-fw" style="color: #0B0B61"></i>&nbsp;
							
							<h4>${menu.nombre}</h4>
						</button>
					</td>

					<td style="color: #0B0B61" width="60">
						<p style="text-align: right;">
							<a href="/sisconta/menus/update/${menu.id}"><span
								class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>&nbsp;
							<a data-eliminar="${menu.id}" name="eliminar-nivel" href="#"
								data-toggle="modal" data-target="#modal_eliminar"><span
								class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
						<p>
					</td>
				</tr>

			</tbody>
		</table>
		<!-- 	lista de menus -->
		
	</c:forEach>
	
</div>

<c:forEach items="${menus}" var="menu"> 
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
									<c:if test="${vista.menu.id == menu.id}">
										<a href="${vista.url}" class="list-group-item">
											<h5 style="color: #0B0B61">
												<i class="fa  ${vista.icon} fa-fw"></i><b> ${vista.url}</b>
											</h5>
										</a>
									</c:if>
							</c:forEach>
						</div>
					</div>

				</div>
				<!-- fin vistas -->
			</div>
		</div>
		</c:forEach>

<!-- ****************** AÑADIR VISTA ************* -->

<!-- Modal -->
<div id="-addvista" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title" style="color:#0B0B61; text-align: center;">Agregar Vista</h4>
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

							<div class="form-group">
								<label class="control-label col-sm-4">Url: </label>
								<div class="col-sm-8">
									<form:input path="url" class="form-control"
										placeholder="URL" type="text" id="us"
										value="${vista.url }" required="required"/>
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

<!-- Modal -->
<div id="-addmenu" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title" style="color:#0B0B61; text-align: center;">Agregar Menu</h4>
      </div>
      <div class="modal-body">
        	<form:form method="post" modelAttribute="menuForm"
							action="/sisconta/menus/add" class="form-horizontal"
							onsubmit="return validar();">


							<div class="form-group">
								<label class="control-label col-sm-4">Nombre del Menu: </label>
								<div class="col-sm-8">
									<form:input path="nombre" class="form-control"
										placeholder="Nombre" type="text" id="us"
										value="${menu.nombre }" required="required"/>
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
							
							

							

							<form:hidden path="id" value="${menu.id}" />
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

<!-- EDITAR EL MENU -->

<c:forEach items="${menus}" var="menu"> 
	<div id="-${menu.id }" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title" style="color:#0B0B61; text-align: center;">Editar el Menu ${menu.nombre }</h4>
      </div>
      <div class="modal-body">
        	<form:form method="post" modelAttribute="menuForm"
							action="/sisconta/menus/add" class="form-horizontal"
							onsubmit="return validar();">


							<div class="form-group">
								<label class="control-label col-sm-4">Nombre del Menu: </label>
								<div class="col-sm-8">
									<form:input path="nombre" class="form-control"
										placeholder="Nombre" type="text" id="us"
										value="${menu.nombre }" required="required"/>
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

							<form:hidden path="id" value="${menu.id}" />
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
<!-- /.col-lg-12 -->

