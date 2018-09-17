<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
						<th>Función</th>
						<th>Contacto</th>
						<th>Opciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${recursos}" var="recurso">
						<tr style="color:#0B0B61;">
							<td>${recurso.nombre }</td>
							 <td>${recurso.funcion.nombre }</td>
							 	<td>${recurso.email}</td>
							
							
							<td width="5%">
							<c:if test="${updatetipoS}">	
									<a class="modal-trigger" href="#-${recurso.idRecurso}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoS}">		
									<a class="" href="/sgp/recursos/delete/${recurso.idRecurso}" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
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
		<form:form method="post" modelAttribute="recursoForm"
			action="/sgp/recursos/add" id="idRecurso" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" class="form-control" placeholder="Nombre"
						type="text" id="nombre" value="${recurso.nombre}" />

				</div>
				
			</div>
			

			<div class="row">
				<div class="input-field col s12">
					<form:select path="idFuncion" class="form-control" required="true">
						<option value="" disabled selected>Seleccione una Función</option>
						<c:forEach items="${funciones}" var="p">
							<c:choose>
								<c:when test="${recurso.funcion.idFuncion == p.idFuncion}">
									<form:option value="${p.idFuncion }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idFuncion }" label="${p.nombre}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s6">
					<form:input path="email" class="form-control" placeholder="Email"
						type="email" id="email" value="${recurso.email }" />
				</div>
			</div>

			
			<form:hidden path="idRecurso" value="${recurso.idRecurso}" />

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




<c:forEach items="${recursos}" var="recurso">
<div id="-${recurso.idRecurso}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
				<form:form method="post" modelAttribute="recursoForm"
			action="/sgp/recursos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" class="form-control" placeholder="Nombre"
						type="text" id="nombre" value="${recurso.nombre}" />

				</div>
				
			</div>
			

			<div class="row">
				<div class="input-field col s12">
					<form:select path="idFuncion" class="form-control" required="true">
						<option value="" disabled selected>Seleccione una Función</option>
						<c:forEach items="${funciones}" var="p">
							<c:choose>
								<c:when test="${recurso.funcion.idFuncion == p.idFuncion}">
									<form:option value="${p.idFuncion }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idFuncion }" label="${p.nombre}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s6">
					<form:input path="email" class="form-control" placeholder="Email"
						type="email" id="email" value="${recurso.email }" />
				</div>
			</div>

			
			<form:hidden path="idRecurso" value="${recurso.idRecurso}" />

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






