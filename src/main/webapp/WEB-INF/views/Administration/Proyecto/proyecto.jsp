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
						<th>Responsable</th>
						<th>Tipo Proyecto</th>
						<th>Duraci�n <br>[d�as]</br></th>
						
						<th>Opci�n</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${proyectos}" var="proyecto">
						<tr style="color:#0B0B61;">
							<td>${proyecto.solicitud.titulo }</td>
							 <td>${proyecto.solicitud.usuario.username }</td>
							 	<td>${proyecto.solicitud.tipoProyecto.nombre }</td>
							 <td>${proyecto.duracion }</td>
							
							 
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
			action="/sgp/proyectos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
           
			<div class="row">
			 <h5 style="text-align: center; "> Datos Generales</h5>
				<div class="input-field col s12">
					<form:select path="codSolicitud" id="form-proyecto" class="form-control" required="true"  >
						<option value="" disabled selected>Seleccione un titulo</option>
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
					
					
	
					<form:select path="ambitoImpacto" id="ambitoImpacto" class="form-control" value="${proyecto.ambitoImpacto }" required="true">
+				<option value="" disabled selected>Elige un �rea de impacto</option>
+				<option value="nacional">Nacional</option>
+				<option value="regional">Regional</option>
+				<option value="academico">Ac�demico</option>			
+		    </form:select>
			
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
						type="decimal" id="montoAprobado" value="${proyecto.montoAprobado }" required="required"/>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="patrocinadores"  id="patrocinadores" class="form-control" placeholder="Patrocinadores"
					rows="8" cols="80"	 value="${proyecto.patrocinadores }" required="required"  style="font-size:15px;"/>
				</div>
			</div>
			
			
			<form:hidden path="codProyecto" value="${proyecto.codProyecto}" />
			
					
					 <h5 style="text-align: center; "> Protocolo del Proyecto</h5>
					
					<div class="row">
				<div class="input-field col s12">
					<form:textarea path="resumen" id="resumen" class="form-control" placeholder="Resumen..."
						 rows="8" cols="80"  value="${proyecto.resumen }" required="required" style="font-size:15px;"/>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="planteamiento" id="planteamiento"  class="form-control" placeholder="Planteamiento del problema"
						rows="8" cols="80" value="${proyecto.planteamiento }" required="required" style="font-size:15px;"/>
				</div>
			</div>
			
			
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="antecedentes" id="antecedentes" class="form-control" placeholder="Antecedentes del proyecto"
						rows="8" cols="80"  value="${proyecto.antecedentes }" required="required"  style="font-size:15px;"/>
				</div>
			</div>
					
					
					<div class="row">
				<div class="input-field col s12">
					<form:textarea path="metodologia" id="metodologia" class="form-control" placeholder="Metodologia o Tecnicas"
					rows="8" cols="80"	 value="${proyecto.metodologia }" required="required"  style="font-size:15px;"/>
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




<!-- /.col-lg-12 -->


<c:forEach items="${proyectos}" var="proyecto">
<div id="-${proyecto.codProyecto}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">

  <form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/proyectos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
			
			
			
			<div class="row">
			 <h5 style="text-align: center; "> Datos Generales</h5>
				<div class="input-field col s12">
					
			
			<form:hidden path="codSolicitud" value="${proyecto.solicitud.codSolicitud}" />	
					
					
					<form:select path="ambitoImpacto" id="ambitoImpacto" class="form-control" value="${proyecto.ambitoImpacto }" required="true">
+				<option value="" disabled selected>Elige un �rea de impacto</option>
+				<option value="nacional">Nacional</option>
+				<option value="regional">Regional</option>
+				<option value="academico">Ac�demico</option>			
+		    </form:select>

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