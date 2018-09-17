<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<!-- 
<c:if test="${createtipoS}">	
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>
-->	
<c:if test="${readtipoS}">		
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>			
		<hr>	
	 	<div class="container">	
<c:if test="${readtipoS}">	
			<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Titulo</th>
						<th>Estado</th>
						<th>Usuario</th>
						<th>Fecha</th>
						<th>Justificacion</th>
						<th>Objeto</th>
						<th>Opcion</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${solicitudes}" var="solicitud">
						<tr style="color:#0B0B61;">
							<td>${solicitud.titulo }</td>
							 <td>${solicitud.estado }</td>
							<td>${solicitud.usuario.username }</td>
							<td>${solicitud.fecha }</td>
							<td>${solicitud.justificacion }</td>
							<td>${solicitud.objeto }</td>
							<td width="5%">
							<c:if test="${updatetipoS}">	
									<a class="modal-trigger" href="#-${solicitud.codSolicitud}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoS}">		
									<a class="" href="/sgp/solicitudes/delete/${solicitud.codSolicitud}" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
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
		<form:form method="post" modelAttribute="solicitudForm"
			action="/sgp/solicitudes/add" id="codSolicitud" autocomplete="off" accept-charset="UTF-8">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="titulo" class="form-control" placeholder="Titulo"
						type="text" id="titulo" value="${solicitud.titulo }" />

				</div>
				<div class="input-field col s6">
					<form:input path="estado" class="form-control"
						placeholder="Estado" type="text" id="estado"
						value="${solicitud.estado}" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:select path="idUsuario" class="form-control" required="true">
						<option value="" disabled selected>Selecione el usuario</option>
						<c:forEach items="${usuarios}" var="p">
							<c:choose>
								<c:when test="${solicitud.usuario.idUsuario == p.idUsuario}">
									<form:option value="${p.idUsuario }" label="${p.username}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idUsuario }" label="${p.username}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div class="date">
				<div class="input-field col s6">
					<form:input path="fecha" class="form-control" placeholder="fecha"
						type="date" id="fecha" value="${solicitud.fecha }" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="justificacion" class="form-control" placeholder="Justificacion"
						type="text" id="justificacion" value="${solicitud.justificacion }" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="objeto" class="form-control" placeholder="Objeto"
						type="text" id="objeto" value="${solicitud.objeto }" />
				</div>
			</div>
			
			<form:hidden path="codSolicitud" value="${solicitud.idSolicitud}" />

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




<c:forEach items="${solicitudes}" var="solicitud">
<div id="-${solicitud.codSolicitud}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="solicitudForm"
			action="/sgp/solicitudes/add" id="registro" autocomplete="off" accept-charset="UTF-8">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="titulo" class="form-control" placeholder="Titulo"
						type="text" id="titulo" value="${solicitud.titulo}" readonly="true"/>

				</div>
				<div class="input-field col s6">
					<form:select path="estado" class="form-control" placeholder="${solicitud.estado }" id="estado">
					<option value=" " disabled selected>Seleccionar</option>
					<option value="${solicitud.estado=true}">Aprobado</option>
					<option value="${solicitud.estado=false}">Rechazado</option>
					</form:select>
			
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:select path="idUsuario" class="form-control" required="true">
						<option value="" disabled selected>Selecione un usuario</option>
						<c:forEach items="${usuarios}" var="p">
							<c:choose>
								<c:when test="${solicitud.usuario.idUsuario == p.idUsuario}">
									<form:option value="${p.idUsuario }" label="${p.username}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idUsuario }" label="${p.username}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
			
				<div class="input-field col s6">
					<form:select path="idTipoProyecto" class="form-control" required="true">
						<option value="" disabled selected>Selecione un tipo de proyectos</option>
						<c:forEach items="${tiposProyectos}" var="p">
							<c:choose>
								<c:when test="${solicitud.tipoProyecto.idTipoProyecto == p.idTipoProyecto}">
									<form:option value="${p.idTipoProyecto }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idTipoProyecto }" label="${p.nombre}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
				
			<div class="date">
				<div class="input-field col s6">
					<form:input path="fecha" class="form-control" placeholder="fecha"
						type="date" id="fecha" value="${solicitud.fecha }" readonly="true"/>
				</div>
			</div>
			

			<div class="row">
				<div class="input-field col s12">
					<form:input path="justificacion" class="form-control" placeholder="Justificacion"
						type="text" id="justificacion" value="${solicitud.justificacion }" readonly="true" />
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objeto" class="form-control" placeholder="Objeto"
						type="text" id="objeto" value="${solicitud.objeto }" readonly="true"/>
				</div>
			</div>
			
			<form:hidden path="codSolicitud" value="${solicitud.codSolicitud}" />

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