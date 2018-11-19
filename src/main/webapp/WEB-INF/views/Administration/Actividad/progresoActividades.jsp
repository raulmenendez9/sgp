<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
	<div class="container">
		<c:if test="${readactividadP}">
		
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Nombre Proyecto</th>
					    
					    <th>Nombre Actividad</th>
					    <th>Fecha Inicio</th>
					    <th>Fecha Fin</th>
					    <th>Esatado de avance</th>
					    <th>Opcion</th>
					    
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vistaprogre}" var="vistaprogreso">
						<tr style="color:#0B0B61;">
							<td>${vistaprogreso[2] }</td>
							<td>${vistaprogreso[3] }</td>
							<td>${vistaprogreso[6] }</td>
							<td>${vistaprogreso[5] }</td>
							<td>
							
							<c:if test= "${vistaprogreso[4] =='Iniciado'}">
							<div class="progress">
      						<div class="determinate" style="width: 0%"></div>
  							</div>
  							
  							</c:if>
  							<c:if test= "${vistaprogreso[4] =='Intermedio'}">
							<div class="progress">
      						<div class="determinate" style="width: 50%"></div>
  							</div>
  							
  							</c:if>
  							<c:if test= "${vistaprogreso[4] =='Finalizado'}">
							<div class="progress">
      						<div class="determinate" style="width: 100%"></div>
  							</div>
  							</c:if>
  							</td>
  							
							
							<td width="5%">
							<a class="" href="/sgp/actividades" data-toggle="modal"data-target="#""><i class="fa fa-folder" aria-hidden="true">  Ir a actividades</i></a>
							
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>