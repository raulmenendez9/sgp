<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div id="contenido" class="card-panel hoverable">

	<c:if test="${createtipoS}">
		<a class="waves-effect waves-light btn-floating modal-trigger green"
			href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>
	<hr>
	<div class="container">
		<c:if test="${readtipoS}">
			<table id="tabla" class="display hover cell-border" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Descripcion</th>
						<th>Proyecto</th>
						<th>Variable Impacto</th>
						<th>Opcion</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${indicadores}" var="indicador">
						<tr style="color: #0B0B61;">
							<td>${indicador.nombre }</td>
							<td>${indicador.descripcion }</td>
							<td>${indicador.proyecto.solicitud.titulo}</td>
							<td>${indicador.variableImpacto.nomVariable}</td>


						<td width="5%">
							<c:if test="${updatetipoS}">	
									<a class="modal-trigger" href="#-${indicador.idIndicador}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoS}">		
									<a class="" href="/sgp/indicadores/delete/${indicador.idIndicador}" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
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
		<form:form method="post" modelAttribute="indicadorForm"
			action="/sgp/indicadores/add" id="registro" autocomplete="off"
			accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s12">
					<h5 style="text-align: center;">Datos de Indicador</h5>
					<div class="row">
						<div class="input-field col s6">
							<form:input path="nombre" value="${indicador.nombre }"
								placeholder="Nombre" id="nombre" type="text" class="validate"
								required="required" />
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<form:textarea path="descripcion" id="descripcion"
								class="form-control" placeholder="Descripcion" rows="8"
								cols="80" value="${indicador.descripcion }" required="required"
								style="font-size:15px;" />
						</div>
						<div class="row">
							<div class="input-field col s12">
								<form:select path="codProyecto" id="form-indicador"
									class="form-control" required="true">
									<option value="" disabled selected>Seleccione Proyecto</option>
									<c:forEach items="${proyectos}" var="i">
										<c:choose>
											<c:when
												test="${indicador.proyecto.codProyecto == i.codProyecto}">
												<form:option value="${i.codProyecto}"
													label="${i.solicitud.titulo}" selected="true" />
											</c:when>
											<c:otherwise>
												<form:option value="${i.codProyecto }"
													label="${i.solicitud.titulo}" var="selec" />
											</c:otherwise>
										</c:choose>

									</c:forEach>

								</form:select>


								<div class="row">
									<div class="input-field col s12">
										<form:select path="idVariableImpacto" id="form-indicador"
											class="form-control" required="true">
											<option value="" disabled selected>Seleccione
												Variable Impacto</option>
											<c:forEach items="${variableImpactos}" var="i">
												<c:choose>
													<c:when
														test="${indicador.variableImpacto.idVariableImpacto == i.idVariableImpacto}">
														<form:option value="${i.idVariableImpacto }"
															label="${i.nomVariable}" selected="true" />
													</c:when>
													<c:otherwise>
														<form:option value="${i.idVariableImpacto }"
															label="${i.nomVariable}" var="selec" />
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</form:select>



										<form:hidden id="idIndicador" path="idIndicador"
											value="${indicador.idIndicador}" />

										<div class="center">
											<form:button type="submit"
												class=" btn green modal-actionwaves-effect waves-light white-text"
												onclick="toast();">
												<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

											<form:button href="#!"
												class=" btn red modal-action modal-close waves-effect waves-light white-text">
												<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
										</div>
		</form:form>
	</div>
</div>


<!-- /.col-lg-12 -->
					
<c:forEach items="${indicadores}" var="indicador">

	<!-- Modal Structure -->
	<div id="-${indicador.idIndicador}" class="modal white darken-4">
		<div class="modal-header"></div>
		<div class="modal-content">

			  <form:form method="post" modelAttribute="indicadorForm"
			action="/sgp/indicadores/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
			
				<div class="row">
					<div class="input-field col s12">
						<h5 style="text-align: center;">Datos Indicadores</h5>
					</div>
				</div>
						<div class="row">
							<div class="input-field col s12">
								<form:input path="nombre" value="${indicador.nombre }"
									placeholder="Nombre" id="nombre" type="text" class="validate"
									required="required" />
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<form:textarea path="descripcion" id="descripcion"
									class="form-control" placeholder="Descripcion" rows="8"
									cols="80" value="${indicador.descripcion }" required="required"
									style="font-size:15px;" />
							</div>
						</div>
			
							
							<form:select path="codProyecto" id="form-indicador"
									class="form-control" required="true">
									<option value="" disabled selected>Seleccione Proyecto</option>
									<c:forEach items="${proyectos}" var="i">
										<c:choose>
											<c:when
												test="${indicador.proyecto.codProyecto == i.codProyecto}">
												<form:option value="${i.codProyecto}"
													label="${i.solicitud.titulo}" selected="true" />
											</c:when>
											<c:otherwise>
												<form:option value="${i.codProyecto }"
													label="${i.solicitud.titulo}" var="selec" />
											</c:otherwise>
										</c:choose>

									</c:forEach>

								</form:select>

							

							<form:select path="idVariableImpacto" id="form-indicador"
											class="form-control" required="true">
											<option value="" disabled selected>Seleccione
												Variable Impacto</option>
											<c:forEach items="${variableImpactos}" var="i">
												<c:choose>
													<c:when
														test="${indicador.variableImpacto.idVariableImpacto == i.idVariableImpacto}">
														<form:option value="${i.idVariableImpacto }"
															label="${i.nomVariable}" selected="true" />
													</c:when>
													<c:otherwise>
														<form:option value="${i.idVariableImpacto }"
															label="${i.nomVariable}" var="selec" />
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</form:select>
							<form:hidden path="idIndicador" value="${indicador.idIndicador}" />


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



