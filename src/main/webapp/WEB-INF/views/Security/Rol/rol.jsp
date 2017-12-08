<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-lg-12">
	<h1>Registro de Roles</h1>
	<br>
	<div class="container col-sm-12">
	<a href="/sisconta/roles/add" class="btn btn-success" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Rol</a>
	<a href="/sisconta/menus/add" class="btn btn-warning" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Menu</a>
	<a href="/sisconta/vistas/add" class="btn btn-default" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar Vista</a><hr>
		<table class="table table-bordered table-hover tabla" id="dataTables-rol">
			<thead>
				<tr>
					<th>Nombre 

					</th>
					<th>Funciones</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${roles}" var="rol">
					<tr style="color:#0B0B61;">
						<td>${rol.nombre }</td>
						<td>${rol.descripcion }</td>
						<td><a href="/sisconta/roles/update/${rol.idRol}"><span class="glyphicon glyphicon-pencil" aria-hidden="true" /></a>&nbsp;
						<a data-eliminar="${rol.idRol}" 
								name="eliminar-nivel" href="#" data-toggle="modal" 
								data-target="#modal_eliminar"><span class="glyphicon glyphicon-trash" aria-hidden="true" /></a>								
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
