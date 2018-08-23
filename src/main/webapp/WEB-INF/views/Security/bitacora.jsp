<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
	<div class="container">
		<c:if test="${readbitacorax23}">
		
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Fecha</th>
					    <th>Usuario</th>
					    <th>Accion</th>
					    <th>Tabla</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bitacoras}" var="bitacora">
						<tr style="color:#0B0B61;">
							<td>${bitacora[2] }</td>
							<td>${bitacora[5] }</td>
							<td>${bitacora[1] }</td>
							<td>${bitacora[4] }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>