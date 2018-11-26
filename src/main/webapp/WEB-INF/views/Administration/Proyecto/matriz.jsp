<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">

	
	<hr>
	<div class="container">
	
			<table id="tabla" class="display hover cell-border" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th>Indicador</th>
						<th>Indicador Ideal</th>
						<th>Indicador Real</th>
						<th>Real < Ideal </th>
						<th>Real = Ideal</th>
						<th> Real > Ideal </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${indicadores}" var="indicador">
						<tr style="color: #0B0B61;">
							<td>${indicador.nombre }</td>
							<td>${indicador.indicadorR}</td>
							<td>${indicador.indicadorReal}</td>
							<td <c:if test="${indicador.indicadorR > indicador.indicadorReal } "> style="background-color:Skyblue;"</c:if>>
								<h5 class="white-text">Menor</h5>
							</td>
							<td <c:if test="${indicador.indicadorR == indicador.indicadorReal}"> style="background-color:green;"</c:if>>
								<h5 class="white-text">Igual</h5>
							</td>
							<td <c:if test="${indicador.indicadorR < indicador.indicadorReal}"> style="background-color:red;"</c:if>>
								<h5 class="white-text">Mayor</h5>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

	</div>
</div>

<script>
	$('td:eq(Mayor), tr:eq(2), tr:eq(3)', '.myTable').find('td:first').css('background', 'red')
</script>