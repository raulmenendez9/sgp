<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div id="contenido" class="card-panel hoverable">

<c:if test="${createtipoS}">	
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="/sgp/proyecto/add/"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>

<a class="waves-effect waves-light btn-floating modal-trigger green" href="#upload"><i class="material-icons" aria-hidden="true">cloud_upload</i></a>

		
		<hr>	
	 	<div class="container">	
<c:if test="${readtipoS}">	
			<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Responsable</th>
						<th>Tipo Proyecto</th>
						<th>Duracion <br>[dias]</br></th>
						<th>Opciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${proyectos}" var="proyecto">
						<tr style="color:#0B0B61;">
							<td>${proyecto.solicitud.titulo }</td>
							 <td>${proyecto.solicitud.usuario.username }</td>
							 <td>${proyecto.solicitud.tipoProyecto.nombre }</td>
							 <td>${proyecto.duracion }</td>
		
							<td style="width:20%;">
						
							<c:if test="${updatetipoS}">	
									<a class="modal-trigger tooltipped" href="#-${proyecto.codProyecto}" data-position="left" data-tooltip="Actualizar"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipoS}">		
							<a class="tooltipped" href="/sgp/proyectos/delete/${proyecto.codProyecto}" data-toggle="modal"data-target="#"" onclick="Borrar('${proyecto.codProyecto}');" data-position="bottom" data-tooltip="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;
							<a class="tooltipped" href="/sgp/matriz/${proyecto.codProyecto}" data-position="bottom" data-tooltip="Matriz"><i class="fa fa-th-large red-text" aria-hidden="true"></i></a>&nbsp;
							<a class="tooltipped" href="/sgp/pi/${proyecto.codProyecto}" data-position="right" data-tooltip="Indicador"><i class="fa fa-line-chart green-text"></i></a>
									
							</c:if>						
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</c:if>		
	</div>
</div>
<!-- SUBIDA DE ARCHIVO -->
<div id="upload" class="modal white darken-4">
	<div class="modal-header"></div>
<div id="contenido" class="card-panel hoverable">

 <div class="container-fluid">
  <div class="row-fluid">
   <div class="col-md-6">
     <fieldset style="border-radius:15px;">
     <form method="POST" action="/sgp/uploadFile?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
     
     
     <div class = "row">
     
               <label>Documento:</label>
     <div class = "file-field input-field">
     
                  <div class = "btn">
                  <i class="material-icons left">cloud_upload</i>
                     <span>seleccionar archivo</span>
                     <input type = "file" class="form-control" name="file"/>
                  </div>
                  
                  <div class = "file-path-wrapper">
                     <input class = "file-path validate" type = "text"
                        placeholder = "Ningún archivo seleccionado" />
                  </div>
               </div>
               
            </div>

      <!--  <div class="form-group">
       <label for="Documento">Documento: </label>
       
       <input  type="file" class="form-control" name="file"/> 
      </div>
      <div class="form-group">-->
       <input type="submit" class="form-control btn btn-success" value="Subir"/>
       </fieldset>
      </div>
     </form>
   </div>
  </div>
 </div>
 </div>
 
 <!-- TERMINA SUBIDA -->


<!-- /.col-lg-12 -->


<c:forEach items="${proyectos}" var="proyecto">
<div id="-${proyecto.codProyecto}" class="modal white darken-4">
<div class="modal-header"></div>
	<div class="modal-content">
	
<form:form method="post" modelAttribute="proyectoForm"
			action="/sgp/proyectosadd" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
  
			
			
			
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
			<!--  </div>-->
	
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



<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.tooltipped');
    var instances = M.Tooltip.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.tooltipped').tooltip();
  });
</script>




