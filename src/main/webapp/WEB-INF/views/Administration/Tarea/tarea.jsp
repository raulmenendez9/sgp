<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div id="contenido" class="card-panel hoverable">

<c:if test="${createtipoS}">	
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>

		
		<hr>	
	 	<div class="container">	
<c:if test="${readtipoS}">	
			<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Nombre</th>
					    <th>Descripcion</th>
					    <th>Opción</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tareas}" var="tarea">
						<tr style="color:#0B0B61;">
							<td>${tarea.nombre}</td>
							<td>${tarea.descripcion}</td>		
							 
							<td width="5%">
							<c:if test="${updatetipoS}">	
									<a class="modal-trigger" href="#-${tarea.idTarea}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoS}">		
									<a class="" href="/sgp/tareas/delete/${tarea.idTarea}" data-toggle="modal"data-target="#"" onclick="Borrar('${tarea.idTarea}');"><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>						
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
		<form:form method="post" modelAttribute="tareaForm"
			action="/sgp/tareas/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
           
			<div class="row">
				<div class="input-field col s12">
				
		           <form:select path="idActividad"  class="form-control" required="true"  >
						<option value="" disabled selected>Seleccione Actividad</option>
						<c:forEach items="${actividades}" var="p">
							<c:choose>
								<c:when test="${tarea.actividad.idActividad == p.idActividad}">
									<form:option value="${p.idActividad }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idActividad }" label="${p.nombre}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
			   
			   
					<form:select path="idRecurso"  class="form-control" required="true"  >
						<option value="" disabled selected>Seleccione un Recurso</option>
						<c:forEach items="${recursos}" var="p">
							<c:choose>
								<c:when test="${tarea.recurso.idRecurso == p.idRecurso}">
									<form:option value="${p.idRecurso }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idRecurso }" label="${p.nombre}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="nombre de recurso" class="form-control" placeholder="Nombre."
						type="text" id="nombre" value="${tarea.nombre }" required="required"/>
				</div>
			   </div>
			   
			   
			   	<div class="row">
				<div class="input-field col s12">
					<form:input path="descripcion" class="form-control" placeholder="Descripcion."
						type="text" id="descripcion" value="${tarea.descripcion }" required="required"/>
				</div>
			   </div>
			   
			   	
				
				
			<form:hidden path="idTarea" value="${tarea.idTarea}" />	
			
				

		

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




<!-- /.col-lg-12 -->



<c:forEach items="${tareas}" var="tarea">
<div id="-${tarea.idTarea}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">

  		<form:form method="post" modelAttribute="tareaForm"
			action="/sgp/tareas/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
           
			<div class="row">
				<div class="input-field col s12">
				
		           <form:select path="idActividad"  class="form-control" required="true"  >
						<option value="" disabled selected>Seleccione Actividad</option>
						<c:forEach items="${actividades}" var="p">
							<c:choose>
								<c:when test="${tarea.actividad.idActividad == p.idActividad}">
									<form:option value="${p.idActividad }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idActividad }" label="${p.nombre}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
			   
			   
					<form:select path="idRecurso"  class="form-control" required="true"  >
						<option value="" disabled selected>Seleccione un Recurso</option>
						<c:forEach items="${recursos}" var="p">
							<c:choose>
								<c:when test="${tarea.recurso.idRecurso == p.idRecurso}">
									<form:option value="${p.idRecurso }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idRecurso }" label="${p.nombre}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="nombre" class="form-control" placeholder="Nombre."
						type="text" id="nombre" value="${tarea.nombre }" required="required"/>
				</div>
			   </div>
			   
			   
			   	<div class="row">
				<div class="input-field col s12">
					<form:input path="descripcion" class="form-control" placeholder="Descripcion."
						type="text" id="descripcion" value="${tarea.descripcion }" required="required"/>
				</div>
			   </div>
			   
			   	
				
				
			<form:hidden path="idTarea" value="${tarea.idTarea}" />	
			
				

		

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
function Borrar(idTarea)
{

 var resul = confirm('¿Desea borrar la tarea seleccionada?');
 if(resul=true)
	 {
	   location.href="/sgp/tareas/delete/"+idTarea;
	 }
 else (resul=false)
 {
	 location.href="/sgp/tareas";
	}
 
} 

</script>







