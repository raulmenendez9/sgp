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
						<th>Responsable</th>
						<th>Descripción</th>
						<th>Duración <br>[días]</br></th>
						<th>Prioridad</th>
						<th>Opcion</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tareas}" var="tarea">
						<tr style="color:#0B0B61;">
							<td>${tarea.nombre }</td>
							<td>${tarea.recurso.nombre}</td>
							 <td>${tarea.descripcion }</td>
							 <td>${tarea.duracion }</td>
							 <td>${tarea.prioridad }</td>
							
							 
							<td width="5%">
							<c:if test="${updatetipoS}">	
									<a class="modal-trigger" href="#-${tarea.idTarea}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoS}">		
									<a class="" href="/sgp/tareas/delete/${tarea.idTarea}" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
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
				
				
				<div class="row">
				<div class="input-field col s12">
					<form:input path="nombre" class="form-control" placeholder="Nombre."
						type="text" id="nombre" value="${tarea.nombre }" required="required"/>
				</div>
			   </div>
			   
			   	<div class="row">
				<div class="input-field col s12">
					<form:input path="descripcion" class="form-control" placeholder="Descripción"
						type="text" id="descripcion" value="${tarea.descripcion}" required="required"/>
				</div>
			   </div>
			   
			   
			   
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
			   
			   
				
				<div class="date">
			 
				<div class="input-field col s6">
				 
					<form:input path="fechaInicio" class="form-control" placeholder="fecha"
						type="date" id="fechaInicio" value="${tarea.fechaInicio}" required="required"/>
				</div>
			
			</div>
			
			<div class="date">
				<div class="input-field col s6">
				
					<form:input path="fechaFin" class="form-control" placeholder="fecha"
						type="date" id="fechaFin" value="${tarea.fechaFin}" required="required"/>
				</div>
			</div>
			
			
			<input type="button" class=" btn blue modal-actionwaves-effect waves-light white-text" value="Calcular Duracion de tarea" onclick="calcularDias();">
			<div class="row">
			
			<div  class="input-field col s12">
			<form:input path="duracion" class="form-control" placeholder="Duracion"
						type="text"   value="${tarea.duracion}" required="required" id="resultado"/>
			</div>
			</div>
			
			
			<form:select path="prioridad" id="prioridad" class="form-control" value="${tarea.prioridad }" required="true">
+				<option value="" disabled selected>Seleccione una Prioridad</option>
+				<option value="Baja">Baja</option>
+				<option value="Media">Media</option>
+				<option value="Alta">Alta</option>			
+		    </form:select>
				
				
			<form:hidden path="idTarea" value="${tarea.idTarea}" />	
				
			
					
					
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




<!-- /.col-lg-12 -->


<c:forEach items="${tareas}" var="tarea">
<div id="-${tarea.idTarea}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">

  	<form:form method="post" modelAttribute="tareaForm"
			action="/sgp/tareas/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
           
			<div class="row">
				<div class="input-field col s12">
				
				
				<div class="row">
				<div class="input-field col s12">
					<form:input path="nombre" class="form-control" placeholder="Nombre."
						type="text" id="nombre" value="${tarea.nombre }" required="required"/>
				</div>
			   </div>
			   
			   	<div class="row">
				<div class="input-field col s12">
					<form:input path="descripcion" class="form-control" placeholder="Descripción"
						type="text" id="descripcion" value="${tarea.descripcion}" required="required"/>
				</div>
			   </div>
			   
			   
			   
				
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
			   
				
				<div class="date">
			 
				<div class="input-field col s6">
				 
					<form:input path="fechaInicio" class="form-control" placeholder="fecha"
						type="date" id="fechaInicio" value="${tarea.fechaInicio}" required="required"/>
				</div>
			
			</div>
			
			<div class="date">
				<div class="input-field col s6">
				
					<form:input path="fechaFin" class="form-control" placeholder="fecha"
						type="date" id="fechaFin" value="${tarea.fechaFin}" required="required"/>
				</div>
			</div>
			
			
			<input type="button" class=" btn blue modal-actionwaves-effect waves-light white-text" value="Calcular Duracion tarea" onclick="calcularDias();">
			<div class="row">
			
			<div  class="input-field col s12">
			<form:input path="duracion" class="form-control" placeholder="Duracion"
						type="text"   value="${tarea.duracion}" required="required" id="resultado"/>
			</div>
			</div>
			
			
			<form:select path="prioridad" id="prioridad" class="form-control" value="${tarea.prioridad }" required="true">
+				<option value="" disabled selected>Seleccione una Prioridad</option>
+				<option value="Baja">Baja</option>
+				<option value="Media">Media</option>
+				<option value="Alta">Alta</option>			
+		    </form:select>
				
				
			<form:hidden path="idTarea" value="${tarea.idTarea}" />	
				
			
					
					
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







<script  type="text/javascript">
function calcularDias()
{
	var fechaInicial=document.getElementById("fechaInicio").value;
	var fechaFinal=document.getElementById("fechaFin").value;
	var resultado="";
	
	
	inicial=fechaInicial.split("-");
	finals=fechaFinal.split("-");
	// obtenemos las fechas en milisegundos
	var dateStart=new Date(inicial[0],(inicial[1]-1),inicial[2]);
	var dateEnd=new Date(finals[0],(finals[1]-1),finals[2]);
        if(dateStart<dateEnd)
        {
			// la diferencia entre las dos fechas, la dividimos entre 86400 segundos
			// que tiene un dia, y posteriormente entre 1000 ya que estamos
			// trabajando con milisegundos.
			resultado=(((dateEnd-dateStart)/86400)/1000);
		}else{
			resultado="La fecha inicial es posterior a la fecha final";
		}
        
	
	document.getElementById("resultado").value=resultado;
}

</script>