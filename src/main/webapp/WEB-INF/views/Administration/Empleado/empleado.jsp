<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<c:if test="${createempleadox02}">	
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>	
<c:if test="${readempleadox02}">		
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>			
		<hr>	
	 	<div class="container">	
<c:if test="${readempleadox02}">	
			<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Empresa</th>
						<th>Puesto</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empleados}" var="empleado">
						<tr style="color:#0B0B61;">
							<td>${empleado.nombre } ${empleado.apellidos }</td>
							<td>${empleado.empresa.nombre }</td>
							<td>${empleado.puesto }</td>
							
							<td width="5%">
							<c:if test="${updateempleadox02}">	
									<a class="modal-trigger" href="#-${empleado.idEmpleado}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deleteempleadox02}">		
									<a class="" href="/sgp/empleados/delete/${empleado.idEmpleado}" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
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
		<form:form method="post" modelAttribute="empleadoForm"
			action="/sgp/empleados/add" id="registro" autocomplete="off" accept-charset="UTF-8">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" class="form-control" placeholder="Nombre"
						type="text" id="nomact" value="${empleado.nombre }" />

				</div>
				<div class="input-field col s6">
					<form:input path="apellidos" class="form-control"
						placeholder="Apellidos" type="text" id="apellidos"
						value="${empleado.apellidos }" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:select path="idEmpresa" class="form-control" required="true">
						<option value="" disabled selected>Selecione una empresa</option>
						<c:forEach items="${empresas}" var="p">
							<c:choose>
								<c:when test="${empleado.empresa.idEmpresa == p.idEmpresa}">
									<form:option value="${p.idEmpresa }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idEmpresa }" label="${p.nombre}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="puesto" class="form-control" placeholder="Puesto"
						type="text" id="puesto" value="${empleado.puesto }" />
				</div>
			</div>

			<form:hidden path="idEmpleado" value="${empleado.idEmpleado}" />

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




<c:forEach items="${empleados}" var="empleado">
<div id="-${empleado.idEmpleado}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="empleadoForm"
			action="/sgp/empleados/add" id="registro" autocomplete="off" accept-charset="UTF-8">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" class="form-control" placeholder="Nombre"
						type="text" id="nomact" value="${empleado.nombre }" />

				</div>
				<div class="input-field col s6">
					<form:input path="apellidos" class="form-control"
						placeholder="Apellidos" type="text" id="apellidos"
						value="${empleado.apellidos }" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:select path="idEmpresa" class="form-control" required="true">
						<option value="" disabled selected>Selecione una empresa</option>
						<c:forEach items="${empresas}" var="p">
							<c:choose>
								<c:when test="${empleado.empresa.idEmpresa == p.idEmpresa}">
									<form:option value="${p.idEmpresa }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idEmpresa }" label="${p.nombre}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="puesto" class="form-control" placeholder="Puesto"
						type="text" id="puesto" value="${empleado.puesto }" />
				</div>
			</div>

			<form:hidden path="idEmpleado" value="${empleado.idEmpleado}" />

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
















