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
			<br>
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
								<td>${p.idPartida }</td>
								<td>${p.descripcion }</td>
								<td>${p.saldoAcreedor }</td>
								<td>${p.saldoDeudor }</td>
								<td>
							<c:if test="${deletepartidasx23}">		
									<a class="" href="/sisconta/partidas/delete/${p.idPartida}" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>
							</td>	
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
</div>
</div>


<script type="text/javascript">
	//asignar los estilos y paginacion a la tabla
	$(document).ready(function() {
		$('#tablapartidas').DataTable({
			scrollY: true,
			stateSave : true,
			responsive : true,
			language : {
				"url" : "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
		}
	});//fin DataTable
						
});//fin function
</script>