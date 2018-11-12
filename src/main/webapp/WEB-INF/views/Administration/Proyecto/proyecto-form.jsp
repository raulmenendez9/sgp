<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
<div class="container">
		<form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/proyectos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
           
         
			<div class="row">  
			 <fieldset style="border-radius:15px;">
			 <legend><h5 style="text-align: center; "> Datos Generales</h5></legend>
				
				<div class="input-field col s12">
			<form:select path="codSolicitud" id="form-proyecto" class="form-control" required="required"  >
						<option value="" disabled selected>Seleccione un titulo</option>
						<c:forEach items="${solicitudes}" var="p">
							<c:choose>
								<c:when test="${proyecto.solicitud.codSolicitud == p[0]}">
									<form:option value="${p[0] }" label="${p[5]}"
										selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${p[0]}" label="${p[5]}" var="selec"/>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
						
					</form:select>
												
					<form:select path="ambitoImpacto" id="ambitoImpacto" class="form-control" value="${proyecto.ambitoImpacto }" required="required">
+				<option value="" disabled selected>Elige un area de impacto</option>
+				<option value="nacional">Nacional</option>
+				<option value="regional">Regional</option>
+				<option value="academico">Academico</option>			
+		    </form:select>
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="objeitovG" class="validate"
						type="text" id="objeitovG" value="${proyecto.objeitovG }" required="required"/>
						<label for="objeitovG">Objetivo General</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE1" class="validate" 
						type="text" id="objetivoE1" value="${proyecto.objetivoE1 }" required="required"/>
					<label for="objetivoE1">Objetivo Especifico 1 (OBLIGATORIO)</label>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE2" class="validate" 
						type="text" id="objetivoE2" value="${proyecto.objetivoE2 }" required="required"/>
					<label for="objetivoE2">Objetivo Especifico 2 (OBLIGATORIO)</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE3" class="validate" 
						type="text" id="objetivoE3" value="${proyecto.objetivoE3 }" required="required"/>
					<label for="objetivoE3">Objetivo Especifico 3 (OBLIGATORIO)</label>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE4" class="validate" 
						type="text" id="objetivoE4" value="${proyecto.objetivoE4 }"/>
					<label for="objetivoE4">Objetivo Especifico 4 (OPCIONAL)</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE5" class="validate" 
						type="text" id="objetivoE2" value="${proyecto.objetivoE5 }" />
					<label for="objetivoE5">Objetivo Especifico 5 (OPCIONAL)</label>
				</div>
			</div>
			
			
				</div>
				</fieldset>
				
				<fieldset style="border-radius:15px;">
				<legend><h5 style="text-align: center; "> Tiempo y financiamiento</h5></legend>
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
			<form:input path="duracion" class="form-control" placeholder="En dias"
						type="text"   value="${proyecto.duracion}" required="required" id="resultado"/>
				</div>
				</div>
				
				<form:select path="tipoFinanciamiento" id="tipofinanciamiento" class="form-control" value="${proyecto.tipoFinanciamiento }" required="required">
				<option value="" disabled selected>Elige un tipo de financiamiento</option>
				<option value="donacion">Donacion</option>
				<option value="aporte">Aporte</option>
				
						
				</form:select>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="montoAprobado" class="form-control" 
						type="number" id="montoAprobado" value="${proyecto.montoAprobado }" required="required"/>
					<label for="montoAprobado">Monto Asigando</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="patrocinadores"  id="patrocinadores" class="materialize-textarea"
					rows="8" cols="80"	 value="${proyecto.patrocinadores }" required="required"  style="font-size:15px;"/>
					<label for="patrocinadores">Patrocinadores</label>
				</div>
			</div>
			</fieldset>
			
			<form:hidden path="codProyecto" value="${proyecto.codProyecto}" />
			
	<fieldset style="border-radius:15px;">
					 <legend><h5 style="text-align: center; "> Protocolo del Proyecto</h5></legend>
					
					<div class="row">
				<div class="input-field col s12">
					<form:textarea path="resumen" id="resumen" class="materialize-textarea" 
						 rows="8" cols="80"  value="${proyecto.resumen }" required="required" style="font-size:15px;"/>
						 <label for="resumen">Resumen</label>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="planteamiento" id="planteamiento"  class="materialize-textarea" 
						rows="8" cols="80" value="${proyecto.planteamiento }" required="required" style="font-size:15px;"/>
						<label for="planteamiento">Planteamiento</label>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="antecedentes" id="antecedentes" class="materialize-textarea"
						rows="8" cols="80"  value="${proyecto.antecedentes }" required="required" style="font-size:15px;"/>
						<label for="antecedentes">Antecedentes</label>
				</div>
			</div>
					
					
					<div class="row">
				<div class="input-field col s12">
					<form:textarea path="metodologia" id="metodologia" class="materialize-textarea" 
					rows="8" cols="80"	 value="${proyecto.metodologia }" style="font-size:15px;"/>
					<label for="metodologia">Metodologia</label>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="medidaSostenibilidad" class="materialize-textarea" 
						type="text" id="ms" value="${proyecto.medidaSostenibilidad }"/>
						<label for="medidaSostenibilidad">Medida de sostenibilidad</label>
				</div>
			</div>
					
					
				</div>
			
			
			

			<br>
			
			

		</fieldset>

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
		
	
		<!-- /.col-lg-12 -->


<c:forEach items="${proyectos}" var="proyecto">
<div id="-${proyecto.codProyecto}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
<form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/proyectosadd/${proyecto.codProyecto}" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
  
			
			
			
			<div class="row">
			 <h5 style="text-align: center; "> Datos Generales</h5>
				<div class="input-field col s12">
					
			
			<form:hidden path="codSolicitud" value="${proyecto.solicitud.codSolicitud}" />	
					
					
					<form:select path="ambitoImpacto" id="ambitoImpacto" class="form-control" value="${proyecto.ambitoImpacto }" required="true">
+				<option value="" disabled selected>Elige un area de impacto</option>
+				<option value="nacional">Nacional</option>
+				<option value="regional">Regional</option>
+				<option value="academico">Academico</option>			
+		    </form:select>

				<div class="row">
				<div class="input-field col s12">
					<form:input path="objeitovG" class="form-control" placeholder="Objetivo General."
						type="text" id="objeitovG" value="${proyecto.objeitovG }" required="required"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE1" class="form-control" placeholder="Objetivo Especifico"
						type="text" id="objetivoE1" value="${proyecto.objetivoE1 }" required="required"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE2" class="form-control" placeholder="Objetivo Especifico"
						type="text" id="objetivoE2" value="${proyecto.objetivoE2 }" required="required"/>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE3" class="form-control" placeholder="Objetivo Especifico"
						type="text" id="objetivoE3" value="${proyecto.objetivoE3 }" required="required"/>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE4" class="form-control" placeholder="Objetivo Especifico"
						type="text" id="objetivoE4" value="${proyecto.objetivoE4 }" />
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivoE5" class="form-control" placeholder="Objetivo Especifico"
						type="text" id="objetivoE5" value="${proyecto.objetivoE5 }" />
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
				
			<form:select path="tipoFinanciamiento" id="tipofinanciamiento" class="form-control" value="${proyecto.tipoFinanciamiento }" required="true">
				<option value="" disabled selected>Elige un tipo de financiamiento</option>
				<option value="donacion">Donacion</option>
				<option value="aporte">Aporte</option>
				
						
				</form:select>
				
			
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="montoAprobado" class="form-control" placeholder="MontoAprobado."
						type="number" id="montoAprobado" value="${proyecto.montoAprobado }" required="required"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="patrocinadores" id="patrocinadores" class="form-control" placeholder="Patrocinadores"
					rows="8" cols="80"	 value="${proyecto.patrocinadores }" required="required"  style="font-size:15px;"/>
				</div>
			</div>
			
			
			<form:hidden path="codProyecto" value="${proyecto.codProyecto}" />
			
			
					
					 <h5 style="text-align: center; "> Protocolo del Proyecto</h5>
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="resumen" id="resumen" class="form-control" placeholder="Resumen..."
						 rows="8" cols="80"  value="${proyecto.resumen }" required="required" style="font-size:15px;"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="planteamiento" id="planteamiento" class="form-control" placeholder="Planteamiento del problema"
						rows="8" cols="80" value="${proyecto.planteamiento }" required="required" style="font-size:15px;"/>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="antecedentes"  id="antecedentes" class="form-control" placeholder="Antecedentes del proyecto"
						rows="8" cols="80"  value="${proyecto.antecedentes }" required="required"  style="font-size:15px;"/>
				</div>
			</div>
				
				
			
					
					<div class="row">
				<div class="input-field col s12">
					<form:input path="metodologia" id="metodologia" class="form-control" placeholder="Metodologia o Tecnicas"
					rows="8" cols="80"	 value="${proyecto.metodologia }" required="required"  style="font-size:15px;"/>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="medidaSostenibilidad" class="form-control" placeholder="Medida de sostenibilidad"
						type="text" id="ms" value="${proyecto.medidaSostenibilidad }" required="required"/>
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


<script>

function Borrar(codProyecto)
{

 var resul = confirm('¿Desea borrar el proyecto seleccionado?');
 if(resul=true)
	 {
	   location.href="/sgp/proyectos/delete/"+codProyecto;
	 }
 else (resul=false)
 {
	 location.href="/sgp/proyectos";
	}
 
} 

</script>
		