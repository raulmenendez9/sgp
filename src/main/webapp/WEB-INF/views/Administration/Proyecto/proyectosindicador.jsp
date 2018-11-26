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
						<th>Nombre</th>
						<th>Descripcion</th>
						
						<th>Variable Impacto 1</th>
						<th>Variable Impacto 2</th>
						<th>Indicador Ideal </th>
						<th>Indicador Real</th>
						<th>Evaluar</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${indicadores}" var="indicador">
						<tr style="color: #0B0B61;">
							<td>${indicador.nombre }</td>
							<td>${indicador.descripcion }</td>
							
							<td>${indicador.variableImpacto.nomVariable}</td>
							<td>${indicador.variableImpacto2.nomVariable}</td>
							<td>${indicador.indicadorR}</td>
							<td>${indicador.indicadorReal}</td>
							<td>
					<a class="" href="/sgp/indact/${indicador.idIndicador}"><i class="fa fa-superscript" aria-hidden="true"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

	</div>
</div>
