<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
<div class="col-lg-12">
	<div class="container col-sm-12">
		<div class="table-responsive">
		<h1>Registro de Empleados</h1>
	<br>
	<a href="/sisconta/empleados/add" class="btn btn-success" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar</a>
	<hr>
			<table width="100%"
				class="table table-bordered table-hover tabla"
				id="dataTables-example" id="dataTables-empleado">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Empresa</th>
						<th>Puesto</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empleados}" var="empleado">
						<tr style="color:#0B0B61;">
							<td>${empleado.nombre } ${empleado.apellidos }</td>
							<td>${empleado.empresa.nombre }</td>
							<td>${empleado.puesto }</td>
							
							<td><a href="/sisconta/empleados/update/${empleado.idEmpleado}"><span class="glyphicon glyphicon-pencil" aria-hidden="true" /></a>&nbsp;
							<a data-eliminar="${empleado.idEmpleado}" 
								name="eliminar-nivel" href="#" data-toggle="modal" 
								data-target="#modal_eliminar"><span class="glyphicon glyphicon-trash" aria-hidden="true" /></a>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
<!-- /.col-lg-12 -->