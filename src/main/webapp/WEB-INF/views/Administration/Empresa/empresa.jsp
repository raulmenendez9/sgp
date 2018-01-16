<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>

<!-- Modal Trigger -->
  

<div id="contenido" class="card-panel hoverable">
<c:if test="${create}">
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>
<c:if test="${read}">
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>
<hr>
	 	<div class="container">
		<c:if test="${read}">
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
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
							<c:if test="${update}">	
									<a class=" modal-trigger" href="#-${empresa.idEmpresa }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${delete}">		
									<a class="" href="/sisconta/empresas/delete/${empresa.idEmpresa }" data-toggle="modal"data-target="#" ><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
		</div>
</div>


<!-- Modal Structure -->
<div id="agregar" class="modal white darken-4">
	<div class="modal-header">
		<!-- 		<h4>Agregar Empresa</h4> -->
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="empresaForm"
			action="/sisconta/empresas/add" id="registro" autocomplete="off">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" value="${empresa.nombre }"
						placeholder="Nombre" id="nombre" type="text" class="validate"
						required="required" />

				</div>
				<div class="input-field col s6">
					<form:input path="politicas" value="${empresa.politicas }"
						placeholder="Politicas" id="politicas" type="text"
						class="validate" required="required" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="objetivos" value="${empresa.objetivos }"
						placeholder="Objetivos" id="objetivos" type="text"
						class="validate" required="required" />
				</div>
			</div>

			<div class="row ">
				<label>Alcance</label>
				<div class="input-field col s12">
					<form:textarea path="alcance" value="${empresa.alcance }"
						placeholder="Alcance" cols="10" rows='10' id="alcance" type="text"
						class="validate" />
				</div>
			</div>
			
			<form:hidden id="idEmpresa" path="idEmpresa" value="${empresa.idEmpresa}" />

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
</div>

<c:forEach items="${empresas}" var="empresa">

	<!-- Modal Structure -->
	<div id="-${empresa.idEmpresa }" class="modal  white darken-4">
		<div class="modal-header">
			<!-- 		<h4>Agregar Empresa</h4> -->
		</div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="empresaForm"
				action="/sisconta/empresas/add" autocomplete="off">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="nombre" value="${empresa.nombre }"
							placeholder="Nombre" id="nombre" type="text" class="validate"
							required="required" />
					</div>
					<div class="input-field col s6">
						<form:input path="politicas" value="${empresa.politicas }"
							placeholder="Politicas" id="politicas" type="text"
							class="validate" required="required" />
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<form:input path="objetivos" value="${empresa.objetivos }"
							placeholder="Objetivos" id="objetivos" type="text"
							class="validate" required="required" />
					</div>
				</div>

				<div class="row ">
					<label>Alcance</label>
					<div class="input-field col s12">
						<form:textarea path="alcance" value="${empresa.alcance }"
							placeholder="Alcance" cols="10" rows='10'
							id="${empresa.idEmpresa }-alcance" type="text" class="validate" />
					</div>

				</div>
				<form:hidden path="idEmpresa" value="${empresa.idEmpresa}" />

				<div class="center">
					<form:button type="submit"
						class=" btn green modal-actionwaves-effect waves-light white-text">
						<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar </form:button>

					<form:button href="#!"
						class=" btn red modal-action modal-close waves-effect waves-light white-text">
						<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
				</div>
			</form:form>
		</div>
	</div>
	<script>
		CKEDITOR.replace('${empresa.idEmpresa}-alcance',
							{
								TOOLBAR : 'BASIC',
							}
						);
		CKEDITOR.instances['${empresa.idEmpresa}-alcance'].setData("${empresa.alcance}");
	</script>
</c:forEach>

<script type="text/javascript">
$(document).ready(function() {	


	//asignar el editor de texto al textarea de alcances
	CKEDITOR.replace( 'alcance', 
			    { 
		        TOOLBAR : 'BASIC', 
			    }); 					

						
});
</script>