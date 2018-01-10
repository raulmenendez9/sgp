<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="UTF-8">
</head>

<!-- Modal Trigger -->
  

<div class="row">
<div class="col s12">
<div class="card-panel hoverable">
	  
<!-- boton añadir que abre una modal -->
<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
<hr>
 
		<table id="example" class="display hover cell-border"  cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Politicas</th>
					<th>Objetivos</th>
					<th>Alcance</th>
					<th width="5%">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${empresas}" var="empresa">
					<tr>
						<td>${empresa.nombre }</td>
						<td>${empresa.politicas }</td>
						<td>${empresa.objetivos }</td>
						<td>${empresa.alcance }</td>
						<td width="5%">
							<a class=" modal-trigger" href="#-${empresa.idEmpresa }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							<a class="" href="/sisconta/empresas/delete/${empresa.idEmpresa }" data-toggle="modal"data-target="#" onclick="borrar('${empresa.nombre }')"><i class="fa fa-trash" aria-hidden="true"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
	</div>

 
<!-- Modal Structure -->
<div id="agregar" class="modal modal-fixed-footer white darken-4">
	<div class="modal-header">
<!-- 		<h4>Agregar Empresa</h4> --> 
	</div> 
	<div class="modal-content">
		<form:form method="post" modelAttribute="empresaForm"
			action="/sisconta/empresas/add">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" value="${empresa.nombre }" placeholder="Nombre" id="nombre" type="text" class="validate" required="required"/>
				     
				</div>
				<div class="input-field col s6">
					<form:input path="politicas" value="${empresa.politicas }" placeholder="Politicas" id="politicas" type="text" class="validate" required="required"/>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivos" value="${empresa.objetivos }" placeholder="Objetivos" id="objetivos" type="text" class="validate" required="required"/>
				</div>
			</div>
			
			<div class="row ">
				<label >Alcance</label>
				<div class="input-field col s12">
					<form:textarea path="alcance" value="${empresa.alcance }" placeholder="Alcance" cols="10" rows='10' id="alcance" type="text" class="validate"/>
				</div>
				 
			</div>
			<form:hidden path="idEmpresa" value="${empresa.idEmpresa}" />

 
  

			<div class="center">
				<form:button type="submit"
					class="hoverable btn green modal-action waves-effect waves-green btn-flat white-text">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

				<form:button href="#!"
					class="hoverable btn red modal-action modal-close waves-effect waves-green btn-flat white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>

	</div>
	

</div>
 

<c:forEach items="${empresas}" var="empresa">
 
<!-- Modal Structure -->
<div id="-${empresa.idEmpresa }" class="modal modal-fixed-footer white darken-4">
	<div class="modal-header">
<!-- 		<h4>Agregar Empresa</h4> --> 
	</div> 
	<div class="modal-content">
		<form:form method="post" modelAttribute="empresaForm"
			action="/sisconta/empresas/add">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" value="${empresa.nombre }" placeholder="Nombre" id="nombre" type="text" class="validate" required="required"/>
				     
				</div>
				<div class="input-field col s6">
					<form:input path="politicas" value="${empresa.politicas }" placeholder="Politicas" id="politicas" type="text" class="validate" required="required"/>
					
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivos" value="${empresa.objetivos }" placeholder="Objetivos" id="objetivos" type="text" class="validate" required="required"/>
				    
				</div>
				 
			</div>
			
			<div class="row ">
				<label >Alcance</label>
				<div class="input-field col s12">
					<form:textarea path="alcance" value="${empresa.alcance }" placeholder="Alcance" cols="10" rows='10' id="${empresa.idEmpresa }-alcance" type="text" class="validate"/>
				</div>
				 
			</div>
			<form:hidden path="idEmpresa" value="${empresa.idEmpresa}" />

 
  

			<div class="center">
				<form:button type="submit"
					class="hoverable btn green modal-action waves-effect waves-green btn-flat white-text">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar </form:button>

				<form:button href="#!"
					class="hoverable btn red modal-action modal-close waves-effect waves-green btn-flat white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>

	</div>
	

</div>
	<script>
		CKEDITOR.replace('${empresa.idEmpresa}-alcance', {
			TOOLBAR : 'BASIC',
		});
		CKEDITOR.instances['${empresa.idEmpresa}-alcance']
				.setData("${empresa.alcance}");
	</script>

</c:forEach>




<script type="text/javascript">
	$(document).ready(function() {
		
		$('.modal').modal();
		
		$('#example').DataTable({
									pagingType : "full_numbers",
									// 				dom: 'Bfrtip',
									//     			buttons: [
									//       						{
									//         					 extend: 'collection',
									//         					 text: 'Exportar a..',
									//         					 buttons: [ 'excelHtml5','print']
									//       						}
									//       					  ],
									stateSave : true,
									responsive : true,
									language : {
										"url" : "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
								}
							});//fin DataTable
							
		CKEDITOR.replace( 'alcance', 
			    { 
		        TOOLBAR : 'BASIC', 
			    }); 					

						
});//fin function
</script>

<script type="text/javascript">
function borrar(nombre){
Materialize.toast('Se ha eliminado'+nombre, 4000)
}
</script>


<c:forEach items="${empresas}" var="empresa">
	<script type="text/javascript">
// 		CKEDITOR.replace('${empresa.idEmpresa}', {
// 			toolbar : 'Basic',
// 			uiColor : '#ffffff'
// 		});
	</script>
	<script type="text/javascript">
// 	CKEDITOR.instances['${empresa.idEmpresa}'].setData("${empresa.alcance}");
	</script>

</c:forEach>
<script type="text/javascript">


// 	CKEDITOR.instances['cuerpo'].insertHtml(document.getElementById("cuerpo_as"));
// 	CKEDITOR.instances['cuerpo'].setData("${cuerpo}");
	</script>
