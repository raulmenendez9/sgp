<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

</head>


<div id="contenido" class="card-panel hoverable">
<c:if test="${createtipoE}">
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>
<c:if test="${readtipoE}">
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>

<hr>
	 	<div class="container">
		<c:if test="${readtipoE}">
		<table id="tabla" class="display hover cell-border" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Especificación de Proyecto</th>
					<th>Opción </th>				
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${especificacionproyectos}" var="especificacionProyecto">
					<tr>
						<td>${especificacionProyecto.cantidadRegistro }</td>						
						
						<td>
							<c:if test="${updatetipoE}">	
									<a class=" modal-trigger" href="#-${especificacionProyecto.idEspecificacion }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoE}">		
									<a class="" href="/sgp/especificacionproyectos/delete/${especificacionProyecto.idEspecificacion }" data-toggle="modal"data-target="#" ><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>						
						</td>
												
					
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
		</div>
</div>


<div id="agregar" class="modal white darken-4">
	<div class="modal-header">
	
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="especificacionProyectoForm"
			action="/sgp/especificacionproyectos/add" id="registro" autocomplete="off" accept-charset="UTF-8">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="cantidadRegistro" value="${especificacionProyecto.cantidadRegistro }"
						placeholder="Cantidad de Registro" id="cantidadRegistro" type="number" class="validate"
						required="required" />

				</div>
				
			</div>

			

			
			
			<form:hidden id="idEspecificacion" path="idEspecificacion" value="${especificacionProyecto.idEspecificacion}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text" onclick="toast();">
					<i class="fa fa-floppy-o" aria-hidden="true" ></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>

<c:forEach items="${especificacionproyectos}" var="especificacionProyecto">

	<!-- Modal Structure -->
	<div id="-${especificacionProyecto.idEspecificacion }" class="modal  white darken-4">
		<div class="modal-header">
					
		</div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="especificacionProyectoForm"
				action="/sgp/especificacionproyectos/add" autocomplete="off" accept-charset="UTF-8">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="cantidadRegistro" value="${especificacionProyecto.cantidadRegistro }"
							placeholder="Cantidad de Registros" id="cantidadRegistro" type="number" class="validate"
							required="required" />
					</div>
					
				</div>

				

				
				<form:hidden path="idEspecificacion" value="${especificacionProyecto.idEspecificacion}" />

				<div class="center">
					<form:button type="submit"
						class=" btn green modal-actionwaves-effect waves-light white-text" onclick="toast();">
						<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar </form:button>

					<form:button href="#!"
						class=" btn red modal-action modal-close waves-effect waves-light white-text">
						<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
				</div>
			</form:form>
		</div>
	</div>

</c:forEach>

