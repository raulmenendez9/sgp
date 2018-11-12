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
						<th>Descripción</th>
						<th>Estado</th>
						<th>Fecha Inicio</th>
						<th>Opciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${actividades}" var="actividad">
						<tr style="color:#0B0B61;">
							<td>${actividad.nombre }</td>
				
							 	<td>${actividad.descripcion}</td>
							 	<td>${actividad.estado}</td>
							 	<td>${actividad.fechaInicio}</td>
							
							
							<td width="5%">
							<c:if test="${updateactividadP}">	
									<a class="modal-trigger" href="#-${actividad.idActividad}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deleteactividadP}">		
									<a class="" href="/sgp/actividades/delete/${actividad.idActividad}" data-toggle="modal"data-target="#"" onclick="Borrar('${actividad.idActividad}');"><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>	
							
							<a class="" href="/sgp/tareas" data-toggle="modal"data-target="#""><i class="fa fa-edit" aria-hidden="true">Registro de tareas</i></a>					
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
				<div class="input-field col s6">
			
               <form:select path="estado" id="estado" class="form-control" value="${actvidad.estado }" required="required">
				<option value="" disabled selected>Estado de la Actividad</option>
				<option value="Iniciado">Iniciado</option>
				<option value="Intermedio">Intermedio</option>
				<option value="Finalizado">Finalizado</option>
				
						
				</form:select>
           
			
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
				<div class="input-field col s6">
			
               <form:select path="estado" id="estado" class="form-control" value="${actvidad.estado }" required="required">
				<option value="" disabled selected>Estado de la Actividad</option>
				<option value="Iniciado">Iniciado</option>
				<option value="Intermedio">Intermedio</option>
				<option value="Finalizado">Finalizado</option>
				
						
				</form:select>
           
			
            </div>
			</div>
			
			<form:hidden path="idActividad" value="${actividad.idActividad}" />
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
function Borrar(idActividad)
{

 var resul = confirm('¿Desea borrar la actividad seleccionada?');
 if(resul=true)
	 {
	   location.href="/sgp/actividades/delete/"+idActividad;
	 }
 else (resul=false)
 {
	 location.href="/sgp/actividades";
	}
 
} 

</script>




