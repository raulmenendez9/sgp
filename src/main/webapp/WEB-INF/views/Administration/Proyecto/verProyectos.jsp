<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
	<div class="container">
		<c:if test="${readvistaprox23}">
		
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Proyecto</th>
					    <th>Actividades</th>
					    <th>Duración en días</th>
					    <th>Opcion</th>
					    
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vistapros}" var="vistapro">
						<tr style="color:#0B0B61;">
							<td>${vistapro[0] }</td>
							<td>${vistapro[3] }</td>
							<td>${vistapro[2] }</td>
							
							<td width="5%">
							<c:if test="${updatevistaprox23}">	
									<a class="modal-trigger" href="#-${vistapro[1]}"><i class="fa fa-eye" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>

<c:forEach items="${proyectos}" var="proyecto">
<div id="-${proyecto.codProyecto}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">

  <form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/verProyectos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
			
			
			
			<div class="row">
			 <h5 style="text-align: center; "> Datos Generales</h5>
				<div class="input-field col s12">
					
			
			<form:hidden path="codSolicitud" value="${proyecto.solicitud.codSolicitud}" />	
					
					
					<form:select path="ambitoImpacto" id="ambitoImpacto" class="form-control" value="${proyecto.ambitoImpacto }" required="true" readonly="true">
+				<option value="" disabled selected>Elige un area de impacto</option>
+				<option value="nacional">Nacional</option>
+				<option value="regional">Regional</option>
+				<option value="academico">Academico</option>			
+		    </form:select>

			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="lineaBase" class="form-control" placeholder="Linea Base"
						type="text" id="objetivoE1" value="${proyecto.lineaBase }" required="required" readonly="true"/>
				</div>
			</div>
			

				<div class="row">
				<div class="input-field col s12">
					<form:input path="objeitovG" class="form-control" placeholder="Objetivo General."
						type="text" id="objeitovG" value="${proyecto.objeitovG }" required="required" readonly="true"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE1" class="form-control" placeholder="Objetivo Especifico"
						type="text" id="objetivoE1" value="${proyecto.objetivoE1 }" required="required" readonly="true"/>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE2" class="form-control" placeholder="Objetivo Especifico"
						type="text" id="objetivoE2" value="${proyecto.objetivoE2 }" required="required" readonly="true"/>
				</div>
			</div>
			

            <h5 style="text-align: center; "> Tiempo y financiamiento</h5>
			
				</div>
			<div class="date">
			 
				<div class="input-field col s6">
				 
					<form:input path="fechaInicio" class="form-control" placeholder="fecha"
						type="date" id="fechaInicio" value="${proyecto.fechaInicio}" required="required" readonly="true"/>
				</div>
			
			</div>
			
			
			<div class="date">
				<div class="input-field col s6">
				
					<form:input path="fechaFin" class="form-control" placeholder="fecha"
						type="date" id="fechaFin" value="${proyecto.fechaFin}" required="required" readonly="true"/>
				</div>
			</div>
			
			
			
			
			<input type="button" class=" btn blue modal-actionwaves-effect waves-light white-text" value="Calcular Duracion del proyecto" onclick="calcularDias(); " readonly="true">
			<div class="row">
				
			<div  class="input-field col s12">
			<form:input path="duracion" class="form-control" placeholder="Duracion"
						type="text"   value="${proyecto.duracion}" required="required" id="resultado" readonly="true"/>
				</div>
				</div>
				
			<form:select path="tipoFinanciamiento" id="tipofinanciamiento" class="form-control" value="${proyecto.tipoFinanciamiento }" required="true" readonly="true">
				<option value="" disabled selected>Elige un tipo de financiamiento</option>
				<option value="donacion">Donacion</option>
				<option value="aporte">Aporte</option>
				
						
				</form:select>
				
			
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="montoAprobado" class="form-control" placeholder="MontoAprobado."
						type="number" id="montoAprobado" value="${proyecto.montoAprobado }" required="required" readonly="true"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="patrocinadores" id="patrocinadores" class="form-control" placeholder="Patrocinadores"
					rows="8" cols="80"	 value="${proyecto.patrocinadores }" required="required"  style="font-size:15px;" readonly="true"/>
				</div>
			</div>
			
			
			<form:hidden path="codProyecto" value="${proyecto.codProyecto}" />
			
			
					
					 <h5 style="text-align: center; "> Protocolo del Proyecto</h5>
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="resumen" id="resumen" class="form-control" placeholder="Resumen..."
						 rows="8" cols="80"  value="${proyecto.resumen }" required="required" style="font-size:15px;" readonly="true"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="planteamiento" id="planteamiento" class="form-control" placeholder="Planteamiento del problema"
						rows="8" cols="80" value="${proyecto.planteamiento }" required="required" style="font-size:15px;" readonly="true"/>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="antecedentes"  id="antecedentes" class="form-control" placeholder="Antecedentes del proyecto"
						rows="8" cols="80"  value="${proyecto.antecedentes }" required="required"  style="font-size:15px;" readonly="true"/>
				</div>
			</div>
				
				
			
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="metodologia" id="metodologia" class="form-control" placeholder="Metodologia o Tecnicas"
					rows="8" cols="80"	 value="${proyecto.metodologia }" required="required"  style="font-size:15px;" readonly="true"/>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="medidaSostenibilidad" class="form-control" placeholder="Medida de sostenibilidad"
						type="text" id="ms" value="${proyecto.medidaSostenibilidad }" required="required" readonly="true"/>
				</div>
			</div>			
				
				</div>
			</div>
	
			
				
			</div>
		</form:form>
</c:forEach>
