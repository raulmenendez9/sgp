<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<a class="waves-effect waves-light btn-floating modal-trigger green" href="/sisconta/rolesadd"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
<hr>
<div class="container">

		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Nombre 	</th>
					<th>Funciones</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${roles}" var="rol">
					<tr style="color:#0B0B61;">
						<td>${rol.nombre }</td>
						<td>${rol.descripcion }</td>
						<td width="5%">
						<a class="" href="/sisconta/rolesupdate/${rol.idRol }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
						<a class="" href="/sisconta/rolesdelete/${rol.idRol }" ><i class="fa fa-trash" aria-hidden="true"></i></a>							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

