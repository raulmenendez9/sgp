<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">

<hr>
	<div class="container">
	
			<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Descripción</th>
						<th>Progreso</th>
						<th>Fecha Inicio</th>
						
						
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${actividades}" var="actividad">
						<tr style="color:#0B0B61;">
							<td>${actividad.nombre }</td>
				
							 	<td>${actividad.descripcion}</td>
							 	<td><div class="progress">
      						<div class="determinate" style="width:${actividad.estado}%"></div>
      						</div>
  							</td>
  							<td><fmt:formatDate value="${actividad.fechaInicio }" pattern="dd-MM-YYYY"/></td>
						</tr>
					</c:forEach>
							
				</tbody>
				<tfoot>
				<tr>
				<td><B>Avance del proyeto: "${promedio}"</B></td>
				
				<td></td>
				<td></td>
				<td>
				<c:if test="${promedio==100}">
				<a class="btn-floating btn-large waves-effect waves-light green tooltipped" href="/sgp/proyectos/end/${idProyecto}" data-position="left" data-tooltip="Finalizar"><i class="material-icons">beenhere</i></a>
				</c:if>
				</td>
				</tr>
				</tfoot>
				
			</table>
			
			
				
			
				

	</div>
</div>