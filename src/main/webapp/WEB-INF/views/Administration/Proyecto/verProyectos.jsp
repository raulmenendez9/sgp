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
					    
					    <th>Duración en días</th>
					    <th>Opcion</th>
					    
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vistapros}" var="vistapro">
						<tr style="color:#0B0B61;">
							<td>${vistapro[0] }</td>
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

<c:forEach items="${vistaproyecto}" var="vistaproyecto">
<div id="-${vistaproyecto[0]}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">

  
			<form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/verProyectos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
			
			
			<div class="row">
			<fieldset style="border-radius:15px;">
			<legend> <h5 style="text-align: center; "> Datos Generales</h5></legend>
				<div class="input-field col s12">
					
					<div class="row">
				<div class="input-field col s12">
				<B>Nombre del proyecto:</B>
					<input  name="titulo"
						type="text" id="titulo" value="${vistaproyecto[1]}" readonly="true"/>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Justificación:</B>
					<input  name="titulo"
						type="text" id="justificacion" value="${vistaproyecto[2]}" readonly="true"/>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Ambito de impacto:</B>
					<input name="ambito impacto" id="ambitoImpacto"  value="${vistaproyecto[3] }" required="true" readonly="true" >
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Antecedentes:</B>
					<input name="antecedentes" id="antecedentes"  value="${vistaproyecto[4] }" required="true" readonly="true" >
				</div>
			</div>

			
			<div class="row">
				<div class="input-field col s12">
				<B>Linea base:</B>
					<input  name="linea base" 
						type="text" id="lineabase" value="${vistaproyecto[5] }" required="required" readonly="true"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
				<B>Objetivo general:</B>
					<input  name="objgeneral" 
						type="text" id="objgeneral" value="${vistaproyecto[9] }" required="required" readonly="true"/>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Objetivos especificos:</B>
					<input  name="objesp1" 
						type="text" id="objesp1" value="${vistaproyecto[10] }" required="required" readonly="true"/>
						<input  name="objesp2" 
						type="text" id="objesp2" value="${vistaproyecto[11] }" required="required" readonly="true"/>
				</div>
			</div>
			

				<div class="row">
				<div class="input-field col s12">
				<B>Medidas:</B>
					<input name="medidas" id="medidas"  value="${vistaproyecto[6] }" required="true" readonly="true" >
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Tipo de proyecto:</B>
					<input name="tipoproyecto" id="tipoproyecto"  value="${vistaproyecto[20] }" required="true" readonly="true" >
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
				<B>Metodologia:</B>
					<input name="metodologia" id="metodologia"  value="${vistaproyecto[7] }" required="true" readonly="true" >
				</div>
			</div>
			
			
			
			

            <h5 style="text-align: center; "> Tiempo y financiamiento</h5>
			
				</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Duración del proyecto:</B>
					<input name="duracion" id="duracion"  value="${vistaproyecto[16] }" required="true" readonly="true" >
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Tipo de finaciamiento:</B>
					<input name="tipofinan" id="tipofinan"  value="${vistaproyecto[15] }" required="true" readonly="true" >
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
				<B>Monto aprobado:</B>
					<input name="montoapro" id="montoapro"  value="${vistaproyecto[8] }" required="true" readonly="true" >
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
				<B>Patrocinadores:</B>
					<input name="patrocinadres" id="patrocinadores"  value="${vistaproyecto[12] }" required="true" readonly="true" >
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
				<B>Patrocinadores:</B>
					<input name="patrocinadores" id="patrocinadores"  value="${vistaproyecto[12] }" required="true" readonly="true" >
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
				<B>Planteamiento:</B>
					<input name="planteamiento" id="planteamiento"  value="${vistaproyecto[13] }" required="true" readonly="true" >
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Resumen:</B>
					<input name="resumen" id="resumen"  value="${vistaproyecto[14] }" required="true" readonly="true" >
				</div>
			</div>	
			
			<h5 style="text-align: center; "> Actividades</h5>
			<div class="row">
				<div class="input-field col s12">
					<input name="actividad" id="actividad"  value="${vistaproyecto[17] }" required="true" readonly="true" >
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>tareas:</B>
					<input name="tarea" id="tarea"  value="${vistaproyecto[18] }" required="true" readonly="true" >
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
				<B>Recursos:</B>
					<input name="recursos" id="recursos"  value="${vistaproyecto[19] }" required="true" readonly="true" >
				</div>
			</div>
				
				
				</div>
			</div>
			
	
			
				
			</div>
		</form:form>
</c:forEach>
