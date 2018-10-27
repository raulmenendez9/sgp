<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<div class="container">

<c:forEach items="${vistaproyecto}" var="vistaproyecto">
<div id="-${vistaproyecto[0]}" >
	<div class="modal-header"></div>
	<div class="modal-content">

  
			<form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/verproyectos/update/" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
			
			
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
					<input  name="objesp3" 
						type="text" id="objesp3" value="${vistaproyecto[5] }" required="required" readonly="true"/>
				
			</div>
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
					<input name="tipoproyecto" id="tipoproyecto"  value="${vistaproyecto[17] }" required="true" readonly="true" >
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
				<B>Metodologia:</B>
					<input name="metodologia" id="metodologia"  value="${vistaproyecto[7] }" required="true" readonly="true" >
				</div>
			</div>
			
			
			
			

            <h5 style="text-align: center; "> Tiempo y financiamiento</h5>
			
				
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
			</fieldset>
			</div>
			
			<div class="row">
			<fieldset style="border-radius:15px;">	
			<legend> <h5 style="text-align: center; "> Actividades y Tareas</h5></legend>
		
			<c:forEach items="${verproyectos}" var="verproyectos">
			<div class="row">
			<fieldset style="border-radius:15px;">
			<B>Actividad:</B>
			<div class="row">
				<div class="input-field col s12">
					<input name="actividad" id="actividad"  value="${verproyectos[1] }" required="true" readonly="true" >
				</div>
			</div>
			
			<B>Tarea:</B>
			
			<div class="row">
				<div class="input-field col s12">
				
					<input name="tarea" id="tarea"  value="${verproyectos[2] }" required="true" readonly="true" >
					
				</div>
			</div>
			
			<B>Recurso:</B>
				
			<div class="row">
				<div class="input-field col s12">
					<input name="recursos" id="recursos"  value="${verproyectos[3] }" required="true" readonly="true" >
					
				</div>
				</div>
				</fieldset>
			</div>
			
			</c:forEach>
			</fieldset>
			
			
				
			
			</div>
					
			</div>
			
	
			
				
			</div>
		</form:form>
</c:forEach>
