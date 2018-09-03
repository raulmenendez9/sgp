<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.sql.*" %>
<% Class.forName("org.postgresql.Driver"); %>

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
						<th>Encargado</th>
						<th>Duracion</th>
						<th>Estado</th>
						<th>Opcion</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${proyectos}" var="proyecto">
						<tr style="color:#0B0B61;">
							<td>${proyecto.solicitud.titulo }</td>
							 <td>${proyecto.solicitud.usuario.username }</td>
							 <td>${proyecto.duracion }</td>
							 <td>${proyecto.estado }</td>
							<td width="5%">
							<c:if test="${updatetipoS}">	
									<a class="modal-trigger" href="#-${proyecto.codProyecto}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoS}">		
									<a class="" href="/sgp/proyectos/delete/${proyecto.codProyecto}" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
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
		<form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/proyectos/add" id="codProyecto" autocomplete="off" accept-charset="UTF-8">
           
			<div class="row">
			 <h5 style="text-align: center; "> Datos Generales</h5>
				<div class="input-field col s12">
					<form:select path="solicitud" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione un titulo</option>
						<c:forEach items="${solicitudes}" var="p">
							<c:choose>
								<c:when test="${proyecto.solictud.codSolicitud == p.codSolicitud}">
									<form:option value="${p.codSolicitud }" label="${p.titulo}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codSolicitud }" label="${p.titulo}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					
					<form:select path="usuario" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione Encargado</option>
						<c:forEach items="${usuarios}" var="p">
							<c:choose>
								<c:when test="${proyecto.usuario.idUsuario == p.idUsuario}">
									<form:option value="${p.idUsuario }" label="${p.username}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idUsuario }" label="${p.username}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					<form:select path="solicitud" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione un estado</option>
						<c:forEach items="${solicitudes}" var="p">
							<c:choose>
								<c:when test="${proyecto.solictud.codSolicitud == p.codSolicitud}">
									<form:option value="${p.codSolicitud }" label="${p.estado}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codSolicitud }" label="${p.estado}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					
					
                     
                     
                     
				
					
					
					<form:select path="solicitud" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione una justificacion</option>
						<c:forEach items="${solicitudes}" var="p">
							<c:choose>
								<c:when test="${proyecto.solictud.codSolicitud == p.codSolicitud}">
									<form:option value="${p.codSolicitud }" label="${p.justificacion}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codSolicitud }" label="${p.justificacion}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					<form:select path="tipoProyecto" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione un tipo de Proyecto</option>
						<c:forEach items="${tipoproyectos}" var="p">
							<c:choose>
								<c:when test="${proyecto.tipoproyecto.idTipoProyecto == p.idTipoProyecto}">
									<form:option value="${p.idTipoProyecto }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idTipoProyecto }" label="${p.nombre}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="ambitoImpacto" class="form-control" placeholder="Objeto"
						type="text" id="ambitoImpacto" value="${proyecto.ambitoImpacto }" />
				</div>
			</div>
			
			 <h5 style="text-align: center; "> Tiempo y financiamiento</h5>
			
				</div>
			<div class="date">
			 
				<div class="input-field col s6">
				 
					<form:input path="fechaInicio" class="form-control" placeholder="fecha"
						type="date" id="fechaInicio" value="${proyecto.fechaInicio}" required="required"/>
				</div>
			
			</div>
			
			<div class="date">
				<div class="input-field col s6">
				
					<form:input path="fechaFin" class="form-control" placeholder="fecha"
						type="date" id="fechaFin" value="${proyecto.fechaFin}" required="required"/>
				</div>
			</div>
			
			
			<input type="button" class=" btn blue modal-actionwaves-effect waves-light white-text" value="Calcular Duracion del proyecto" onclick="calcularDias();">
			<div class="row">
				
			<div  class="input-field col s12">
			<form:input path="duracion" class="form-control" placeholder="Duracion"
						type="text"   value="${proyecto.duracion}" required="required" id="resultado"/>
				</div>
				</div>
				

			<div class="row">
				<div class="input-field col s12">
					<form:input path="montoAprobado" class="form-control" placeholder="MontoAprobado"
						type="number" id="montoAprobado" value="${proyecto.montoAprobado }" required="required"/>
				</div>
			</div>
			
			
			<form:hidden path="codProyecto" value="${proyecto.codProyecto}" />
			
					
					 <h5 style="text-align: center; "> Protocolo del Proyecto</h5>
					
					<div class="row">
				<div class="input-field col s12">
					<form:textarea path="resumen" class="form-control" placeholder="Resumen..."
						 rows="8" cols="80" id="resumen" value="${proyecto.resumen }" required="required" style="font-size:15px;"/>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="planteamiento" class="form-control" placeholder="Planteamiento del problema"
						rows="8" cols="80" id="planteamiento" value="${proyecto.planteamiento }" required="required" style="font-size:15px;"/>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="antecedentes" class="form-control" placeholder="Antecedentes del proyecto"
						rows="8" cols="80" id="antecedentes" value="${proyecto.antecedentes }" required="required"  style="font-size:15px;"/>
				</div>
			</div>
					
					
					<div class="row">
				<div class="input-field col s12">
					<form:textarea path="metodologia" class="form-control" placeholder="Metodologia o Tecnicas"
					rows="8" cols="80"	id="metodologia" value="${proyecto.metodologia }" required="required"  style="font-size:15px;"/>
				</div>
			</div>
					
					
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








<c:forEach items="${proyectos}" var="proyecto">
<div id="-${proyecto.codProyecto}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/proyectos/add" id="codProyecto" autocomplete="off" accept-charset="UTF-8">

			<div class="row">
				<div class="input-field col s12">
					<form:select path="solicitud" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione un titulo</option>
						<c:forEach items="${solicitudes}" var="p">
							<c:choose>
								<c:when test="${proyecto.solictud.codSolicitud == p.codSolicitud}">
									<form:option value="${p.codSolicitud }" label="${p.titulo}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codSolicitud }" label="${p.titulo}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					<form:select path="solicitud" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione un estado</option>
						<c:forEach items="${solicitudes}" var="p">
							<c:choose>
								<c:when test="${proyecto.solictud.codSolicitud == p.codSolicitud}">
									<form:option value="${p.codSolicitud }" label="${p.estado}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codSolicitud }" label="${p.estado}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					

					
					
					<form:select path="solicitud" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione una justificacion</option>
						<c:forEach items="${solicitudes}" var="p">
							<c:choose>
								<c:when test="${proyecto.solictud.codSolicitud == p.codSolicitud}">
									<form:option value="${p.codSolicitud }" label="${p.justificacion}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.codSolicitud }" label="${p.justificacion}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					
					<form:select path="tipoProyecto" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Selecione un tipo de Proyecto</option>
						<c:forEach items="${tipoproyectos}" var="p">
							<c:choose>
								<c:when test="${proyecto.tipoproyecto.idTipoProyecto == p.idTipoProyecto}">
									<form:option value="${p.idTipoProyecto }" label="${p.nombre}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p.idTipoProyecto }" label="${p.nombre}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</form:select>
					
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="ambitoImpacto" class="form-control" placeholder="Objeto"
						type="text"   id="ambitoImpacto" value="${proyecto.ambitoImpacto }" />
				</div>
			</div>
			
				</div>
			<div class="date">
				<div class="input-field col s6">
					<form:input path="fechaInicio" class="form-control" placeholder="fecha"
						type="date" id="fechaInicio" value="${proyecto.fechaInicio}" required="required"/>
				</div>
			</div>
			<div class="date">
				<div class="input-field col s6">
					<form:input path="fechaFin" class="form-control" placeholder="fecha"
						type="date" id="fechaFin" value="${proyecto.fechaFin}" required="required"/>
				</div>
			</div>
			<input type="button" class=" btn blue modal-actionwaves-effect waves-light white-text" value="Calcular Duracion del proyecto" onclick="calcularDias();">
			<div class="row">
				
			<div  class="input-field col s12">
			<form:input path="duracion" class="form-control" placeholder="Duracion"
						type="text"   value="${proyecto.duracion}" required="required" id="resultado"/>
				</div>
				</div>
				

			<div class="row">
				<div class="input-field col s12">
					<form:input path="montoAprobado" class="form-control" placeholder="MontoAprobado"
						type="number" id="montoAprobado" value="${proyecto.montoAprobado }" required="required"/>
				</div>
			</div>
			
			
			<form:hidden path="codProyecto" value="${proyecto.codProyecto}" />
			
					
					
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


