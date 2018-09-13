<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

</head>

<!-- Modal Trigger -->
  

<div id="contenido" class="card-panel hoverable">
<c:if test="${createtipoP}">
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>
<c:if test="${readtipoP}">
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>

<hr>
	 	<div class="container">
		<c:if test="${readtipoP}">
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Nombre del tipo de Proyecto</th>
					<th>Opción </th>				
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tipoproyectos}" var="tipoProyecto">
					<tr>
						<td>${tipoProyecto.nombre }</td>						
						
						<td>
							<c:if test="${updatetipoP}">	
									<a class=" modal-trigger" href="#-${tipoProyecto.idTipoProyecto }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoP}">		
									<a class="" href="/sgp/tipoproyectos/delete/${tipoProyecto.idTipoProyecto }" data-toggle="modal"data-target="#" ><i class="fa fa-trash" aria-hidden="true"></i></a>
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
		<!-- 		<h4>Agregar Tipo de Proyecto</h4> -->
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="tipoProyectoForm"
			action="/sgp/tipoproyectos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" value="${tipoProyecto.nombre }"
						placeholder="Nombre" id="nombre" type="text" class="validate"
						required="required" />

				</div>
				
			</div>

			

			
			
			<form:hidden id="idTipoProyecto" path="idTipoProyecto" value="${tipoProyecto.idTipoProyecto}" />

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

<c:forEach items="${tipoproyectos}" var="tipoProyecto">

	<!-- Modal Structure -->
	<div id="-${tipoProyecto.idTipoProyecto }" class="modal  white darken-4">
		<div class="modal-header">
			<!-- 		<h4>Agregar Empresa</h4> -->
		</div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="tipoProyectoForm"
				action="/sgp/tipoproyectos/add" autocomplete="off" accept-charset="ISO-8859-1">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="nombre" value="${tipoProyecto.nombre }"
							placeholder="Nombre" id="nombre" type="text" class="validate"
							required="required" />
					</div>
					
				</div>

				

				
				<form:hidden path="idTipoProyecto" value="${tipoProyecto.idTipoProyecto}" />

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

