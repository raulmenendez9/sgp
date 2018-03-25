<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
.embed-container {
    position: relative;
    padding-bottom: 100%;
    height: 0;
    overflow: hidden;
}
.embed-container iframe {
    position: relative;
    top:0;
    left: 0;
    width: 100%;
}
</style>

<div id="contenido" class="card-panel white">
	<form:form method="post" modelAttribute="partidaForm"
			action="/sisconta/partidasadd" id="registro" autocomplete="off" accept-charset="UTF-8">
				
				<div class="row">
				 	<div class="col s6">
						<label><h5>Mes a trabajar</h5></label>
					</div>
					<div class="col s6">
						<label><h5>Tipo de partida</h5></label>
					</div>
				</div>
				<div class="row">
						<div class="input-field col s6">
							<form:select path="mesAtrabajar" class="form-control" required="true">
								<option value="xx" disabled selected>Seleccionar mes</option>
								<option value="enero">Enero</option>
								<option value="febrero">Febrero</option>
								<option value="marzo">Marzo</option>
								<option value="abril">Abril</option>
								<option value="mayo">Mayo</option>
								<option value="junio">Junio</option>
								<option value="julio">Julio</option>
								<option value="agosto">Agosto</option>
								<option value="septiembre">Septiembre</option>
								<option value="octubre">Octubre</option>
								<option value="noviembre">Noviembre</option>
								<option value="diciembre">Diciembre</option>
							</form:select>
						</div>
						
						<div class="input-field col s6">
							<form:select path="tipoDePartida" class="form-control" required="true">
								<option value="xx" disabled selected>Seleccionar tipo de partida</option>
								<option value="ingreso">Ingreso</option>
								<option value="egreso">Egreso</option>
								<option value="comp">comp</option>
							</form:select>
						</div>
						
						
				</div>
			
		<BR>					  
					  
					<div class="row">
					 	<div class="col s6">
							<label><h5>Movimientos</h5></label>
						</div>
						<div class="col s6">
							<label><h5>Descripcion</h5></label>
						</div>
					</div>
					  <div class="row">
					  
					  
					  <div class="col s6">
								<div class="embed-container">
								<iframe src="/sisconta/partidas/mostrarCuentas" width="auto" height="900px" frameborder="0">
								</iframe>
								</div>
						</div>
					  
					    <div class="col s6">
					      <div class="row">
								<div class="input-field col s12">
									<form:textarea path="descripcion" value=""
										placeholder="" cols="50" rows='50' id="descripcion" type="text"
										class="validate" />
									<BR><Hr><br>	
									<form:hidden id="idPartida" path="idPartida" value="${partida.idPartida}" />	
									<div class="center">
										<form:button type="submit"
											class=" btn green waves-light white-text">
											<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>
					
										<a href="/sisconta/partidas" class=" btn red waves-effect waves-light white-text"><i class="fa fa-arrow-left" aria-hidden="true"></i> Regresar</a>
									</div>	
								</div>
							</div>
						</div>
					</div>
		</form:form>
</div>



<script type="text/javascript">
$(document).ready(function() {	


	//asignar el editor de texto al textarea de alcances
	CKEDITOR.replace( 'descripcion', 
			    { 
		        TOOLBAR : 'BASIC', 
			    }); 					
});
</script>

