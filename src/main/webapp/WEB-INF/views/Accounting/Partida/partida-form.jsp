<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
.embed-container {
    position: relative;
    padding-bottom: 40.25%;
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

<div id="contenido" class="card-panel hoverable">
	<form:form method="post" modelAttribute="partidaForm"
			action="/sisconta/partida/add" id="registro" autocomplete="off">

				<div class="row">
						<div class="input-field col s6">
							<form:select path="mesAtrabajar" class="form-control"
								required="true">
								<option value="xx" disabled selected>Mes a trabajar</option>
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
							<form:select path="mesAtrabajar" class="form-control" required="true">
								<option value="xx" disabled selected>Tipo de partida</option>
								<option value="ingreso">Ingreso</option>
								<option value="egreso">Egreso</option>
								<option value="comp">comp</option>
							</form:select>
						</div>
						
						
				</div>
			
		<BR>					  
<!-- 					  IFRAMRE -->
<center>
		<div class="embed-container">
		<iframe src="/sisconta/partidas/mostrarCuentas" width="auto" height="500px">
		</iframe>
		</div>
</center>		
		<hr><br>			  
					  
					  
					  <div class="row">
					    <div class="col s12">
					      <div class="row">
						   <label>Descripcion</label>
								<div class="input-field col s12">
									<form:textarea path="descripcion" value=""
										placeholder="" cols="10" rows='10' id="descripcion" type="text"
										class="validate" />
								</div>
							</div>
						</div>
					</div>
			
			
			
					<form:hidden id="idPartida" path="idPartida" value="${partida.idPartida}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
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

