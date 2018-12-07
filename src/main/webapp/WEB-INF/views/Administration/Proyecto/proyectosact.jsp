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
						
						<th>Opciones</th>
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
  							
							
							<td width="5%">
							<c:if test="${updateactividadP}">	
									<a class="modal-trigger" href="#-${actividad.idActividad}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deleteactividadP}">		
									<a class="" href="/sgp/actividades/delete/${actividad.idActividad}" data-toggle="modal"data-target="#" onclick="return confirmDel('${actividad.idActividad}');" id="resultado"><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>
						
							<a class="" href="/sgp/tareas" data-toggle="modal"data-target="#""><i class="fa fa-edit" aria-hidden="true">Registro de tareas</i></a>					
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<B>Promedio de progreso de Actividades:</B>
				
			<div class="row">
				<div class="input-field col s6">
					<input name="promedio" id="promedio"  value="${promedio}" required="true" readonly="true" >
					
				</div>
				</div>
				

	</div>
</div>