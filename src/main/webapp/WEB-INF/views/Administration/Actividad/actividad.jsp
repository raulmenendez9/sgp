<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<c:if test="${createactividadP}">	
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>	
		
		<hr>	
	 	<div class="container">	
<c:if test="${readactividadP}">	
			<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Proyecto</th>
						
						<th>Progreso</th>
						<th>Fecha Inicio</th>
						<th>Opciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${actividades}" var="actividad">
						<tr style="color:#0B0B61;">
							<td>${actividad.nombre }</td>
							<td>${actividad.proyecto.solicitud.titulo }</td>
							 	
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
						
							<a class="" href="/sgp/tareas" data-toggle="modal"data-target="#""><i class="fa fa-edit" aria-hidden="true"></i></a>					
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</c:if>		
	</div>
</div>




<!-- /.col-lg-12 -->

<div id="agregar" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="actividadForm"
			action="/sgp/actividades/add" id="idActividad" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" class="form-control" placeholder="Nombre"
						type="text" id="nombre" value="${actividad.nombre}" />

				</div>
				
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="descripcion" class="form-control" placeholder="Descripción"
						type="text" id="descripcion" value="${actividad.descripcion }" />
				</div>
			</div>
			
			
			
			

			<div class="row">
				<div class="input-field col s12">
					<form:select path="codProyecto" class="form-control" required="true">
						<option value="" disabled selected>Seleccione un proyecto</option>
						<c:forEach items="${proyectos}" var="p">
							<c:choose>
								<c:when test="${actividad.proyecto.codProyecto == p.codProyecto}">
									<form:option value="${p.codProyecto }" label="${p.solicitud.titulo}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codProyecto }" label="${p.solicitud.titulo}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
	
			<div class="row">
				<div class="input-field col s12">
				<label for="estado">Ingrese valor de 1 a 100 de acuerdo al progreso de la actividad</label>
				<br>
				
					<form:input path="estado" class="form-control" placeholder="Ingrese valor de 1 a 100 de acuerdo al progreso de la actividad"
						 id="estado" type="number" min="0" max="100"  value="${actividad.estado }" />
				</div>
			</div>
           
			
	
			
			<label for="FechaInicio">Fecha Inicio:</label>
			<div class="date">
			 
				<div class="input-field col s6">
					
				 
					<form:input path="fechaInicio" class="form-control" placeholder="fecha"
						type="date" id="fechaInicio" value="${proyecto.fechaInicio}" required="required"/>
				</div>
			
			</div>
			
			
			<label for="FechaFin">Fecha Fin:</label>
			<div class="date">
				<div class="input-field col s6">
				
					<form:input path="fechaFin" class="form-control" placeholder="fecha"
						type="date" id="fechaFin" value="${proyecto.fechaFin}" required="required"/>
				</div>
			</div>
			
					<form:hidden path="idActividad" value="${actividad.idActividad}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text" onclick="toast();">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>




<c:forEach items="${actividades}" var="actividad">
<div id="-${actividad.idActividad}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
				<form:form method="post" modelAttribute="actividadForm"
			action="/sgp/actividades/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" class="form-control" placeholder="Nombre"
						type="text" id="nombre" value="${actividad.nombre}" />

				</div>
				
			</div>
			


			
			<div class="row">
				<div class="input-field col s12">
					<form:select path="codProyecto" class="form-control" required="true">
						<option value="" disabled selected>Seleccione un proyecto</option>
						<c:forEach items="${proyectos}" var="p">
							<c:choose>
								<c:when test="${actividad.proyecto.codProyecto == p.codProyecto}">
									<form:option value="${p.codProyecto }" label="${p.solicitud.titulo}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codProyecto }" label="${p.solicitud.titulo}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="descripcion" class="form-control" placeholder="Descripción"
						type="text" id="descripcion" value="${actividad.descripcion }" />
				</div>
			</div>
		
				<div class="row">
				<div class="input-field col s12">
				<label for="estado">Ingrese valor de 1 a 100 de acuerdo al progreso de la actividad</label>
				<br>
					<form:input path="estado" class="form-control" placeholder="Ingrese valor de 1 a 100 de acuerdo al progreso de la actividad"
						 id="estado" type="number" min="0" max="100"  value="${actividad.estado }" />
				</div>
			</div>
			
			<form:hidden path="idActividad" value="${actividad.idActividad}" />
				
				<label for="FechaInicio">Fecha Inicio:</label>
				
			<div class="date">
			 
				<div class="input-field col s6">
				 
					<form:input path="fechaInicio" class="form-control" placeholder="fecha"
						type="date" id="fechaact1" value="${actividad.fechaInicio}" required="required"/>
				</div>
			
			</div>
				<label for="FechaFin">Fecha Fin:</label>
			
			<div class="date">
				<div class="input-field col s6">
				
					<form:input path="fechaFin" class="form-control" placeholder="fecha"
						type="date" id="fechaact2" value="${actividad.fechaFin}" required="required"/>
				</div>
			</div>
			
			

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text" onclick="toast();">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>
</c:forEach>

<script>
function confirmDel(){
	  var agree=confirm("¿Realmente desea eliminarlo? ");
	  if (agree) return true ;
	  return false;
	}

</script>


<script>

    document.getElementById("fechaact1").disabled = true;
    document.getElementById("fechaact2").disabled = true;

</script>

