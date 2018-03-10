<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<c:if test="${createpartidasx23}" >
				<a class="waves-effect waves-light btn-floating modal-trigger green" href="/sisconta/partidas/add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
			</c:if>
			<hr>
	 	<div class="container">
			<c:if test="${readpartidasx23}">
				<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Fecha</th>
							<th>ID</th>
							<th>Descripcion</th>
							<th>Cargos</th>
							<th>Abonos</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${partidas}" var="p">
							<tr>
								<td>${p.fecha  }</td>
								<td>${p.id }</td>
								<td>${p.descripcion }</td>
								<td>${p.saldoAcreedor }</td>
								<td>${p.saldoDeudor }</td>
	
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
</div>
</div>