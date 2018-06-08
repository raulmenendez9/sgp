<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
	
</head>

<!-- Modal Trigger -->

<div id="contenido" class="card-panel hoverable">
<c:if test="${create}">
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar Mensaje</a>&nbsp;&nbsp;
</c:if>
<c:if test="${read}">
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>
<hr>
	 	<div class="container">
		<c:if test="${read}">
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Nombre de redactor</th>
					<th>Asunto</th>
					<th>Texto</th>
					<th>Fecha</th>
					<th width="5%">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mensajes}" var="mensaje">
					<tr>
						<td>${mensaje.usuarioRedactor }</td>
						<td>${mensaje.asunto }</td>
						<td>${mensaje.mensaje }</td>
						<td>${mensaje.fechaEnvio }</td>
						<td width="5%">
							<c:if test="${update}">	
									<a class=" modal-trigger" href="#-${mensaje.idMensaje }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${delete}">		
									<a class="" href="/sgp/mensajes/delete/${mensaje.idMensaje }" data-toggle="modal"data-target="#" ><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
		</div>
</div>
<!-- Modal Structure -->
<div id="agregar" class="modal white darken-4">
	<div class="modal-header">
		<!-- 		<h4>Agregar mensaje</h4> -->
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="mensajeForm"
			action="/sgp/mensajes/add" id="registro" autocomplete="off">
<!--  
			<div class="row">
				<div class="input-field col s6">
					<form:input path="usuarioRedactor" value="${mensaje.usuarioRedactor }"
						placeholder="Nombre del redactor" id="usuarioRedactor" type="text" class="validate"
						required="required" />

				</div>
				-->
			<div class="row">
				<div class="input-field col s12">
					<form:select path="idUsuario" class="form-control" required="true">
						<option value="" disabled selected>Selecione un Usuario</option>
						<c:forEach items="${usuarios}" var="p">
							<c:choose>
								<c:when test="${mensaje.usuarioRedactor.idUsuario == p.idUsuario}">
									<form:option value="${p.username }" label="${p.username}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.username }" label="${p.username}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
			
				<div class="input-field col s6">
					<form:input path="asunto" value="${mensaje.asunto }"
						placeholder="asunto" id="asunto" type="text"
						class="validate" required="required" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="fechaEnvio" value="${mensaje.fechaEnvio }"
						placeholder="fecha" id="fecha" type="date"
						class="datepicker" required="required" />
				</div>
			</div>

			<div class="row ">
				<label>Mensaje</label>
				<div class="input-field col s12">
					<form:input path="mensaje" value="${mensaje.mensaje }"
						placeholder="Mensaje" id="mensaje" type="text"
						class="validate" />
				</div>
			</div>
			
			<form:hidden id="idMensaje" path="idMensaje" value="${mensaje.idMensaje}" />

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
<c:forEach items="${mensajes}" var="mensaje">

	<!-- Modal Structure -->
	<div id="-${mensaje.idmensaje }" class="modal  white darken-4">
		<div class="modal-header">
			<!-- 		<h4>Agregar Mensaje</h4> -->
		</div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="mensajeForm"
				action="/sgp/mensajes/add" autocomplete="off">

	<!--  			<div class="row">
					<div class="input-field col s6">
						<form:input path="usuarioRedactor" value="${mensaje.usuarioRedactor }"
							placeholder="Nombre de redactor" id="usuarioRedactor" type="text" class="validate"
							required="required" />
					</div>
				-->	
				<div class="row">
				<div class="input-field col s12">
					<form:select path="idUsuario" class="form-control" required="true">
						<option value="" disabled selected>Selecione un Usuario</option>
						<c:forEach items="${usuarios}" var="p">
							<c:choose>
								<c:when test="${mensaje.usuarioRedactor.idUsuario == p.idUsuario}">
									<form:option value="${p.username }" label="${p.username}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.username }" label="${p.username}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
					<div class="input-field col s6">
						<form:input path="asunto" value="${mensaje.asunto }"
							placeholder="Asunto" id="asunto" type="text"
							class="validate" required="required" />
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<form:input path="fechaEnvio" value="${mensaje.fechaEnvio }"
							placeholder="Fecha" id="fecha" type="date"
							class="datepicker" required="required" />
					</div>
				</div>

				<div class="row ">
					<label>Mensaje</label>
					<div class="input-field col s12">
						<form:input path="mensaje" value="${mensaje.mensaje }"
							placeholder="Mensaje"   id="mensaje" type="text"
							class="validate" required="required" />
					</div>

				</div>
				<form:hidden path="idMensaje" value="${mensaje.idMensaje}" />

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
	<script>
		CKEDITOR.replace('${mensaje.idMensaje}-mensaje',
							{
								TOOLBAR : 'BASIC',
							}
						);
		CKEDITOR.instances['${mensaje.idMensaje}-mensaje'].setData("${mensaje.mensaje}");
	</script>
</c:forEach>

<script type="text/javascript">
$(document).ready(function() {	


	//asignar el editor de texto al textarea de alcances
	CKEDITOR.replace( 'mensaje', 
			    { 
		        TOOLBAR : 'BASIC', 
			    }); 					

						
});

$('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
  });
</script>
<script> 
	</script>