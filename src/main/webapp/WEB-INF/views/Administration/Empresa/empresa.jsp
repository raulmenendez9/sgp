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
  <!-- Modal Structure -->
  <div id="agregar" class="modal modal-fixed-footer">
    <div class="modal-content">
      <h4>CABECERA</h4>
      <p>CUERPO PARA EL FORMULARIO</p>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Agree</a>
    </div>
  </div>
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
							<a data-toggle="modal" data-target="#"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							<a data-eliminar="" name="eliminar-nivel" href="#" data-toggle="modal"data-target="#"><i class="fa fa-trash" aria-hidden="true"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
	</div>






<script type="text/javascript">
$(document).ready(function() {
    	$('#example').DataTable( {
    			pagingType: "full_numbers",
// 				dom: 'Bfrtip',
//     			buttons: [
//       						{
//         					 extend: 'collection',
//         					 text: 'Exportar a..',
//         					 buttons: [ 'excelHtml5','print']
//       						}
//       					  ],
    			stateSave: true,
    			responsive : true,
				language: {"url": "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"}
    			} );//fin DataTable
    			
    			
    	 $('.modal').modal();
} );//fin function
</script>

<script type="text/javascript"> 
// 	CKEDITOR.replace( 'txt-agregar', 
// 		    { 
// 	        toolbar : 'Basic', 
// 		    }); 
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
