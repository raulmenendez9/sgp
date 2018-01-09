<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="UTF-8">
</head>

<div class="row">
	<div class="col s12">
	<div class="card-panel hoverable">
		<table id="example" class="display hover"  cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Politicas</th>
					<th>Objetivos</th>
					<th>Alcance</th>
					<!-- <th>&nbsp;</th> -->
				</tr>
			</thead>
			<!--         <tfoot> -->
			<!--             <tr> -->
			<!--                 <th>Name</th> -->
			<!--                 <th>Position</th> -->
			<!--                 <th>Office</th> -->
			<!--                 <th>Age</th> -->
			<!--                 <th>Start date</th> -->
			<!--                 <th>Salary</th> -->
			<!--             </tr> -->
			<!--         </tfoot> -->
			<tbody>
				<c:forEach items="${empresas}" var="empresa">
					<tr>
						<td>${empresa.nombre }</td>
						<td>${empresa.politicas }</td>
						<td>${empresa.objetivos }</td>
						<td>${empresa.alcance }</td>
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
				dom: 'Bfrtip',
    			buttons: [
      						{
        					 extend: 'collection',
        					 text: 'Exportar a..',
        					 buttons: [ 'excelHtml5','print']
      						}
      					  ],
    			stateSave: true,
    			responsive : true,
				language: {"url": "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"}
    			} );//fin DataTable
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
