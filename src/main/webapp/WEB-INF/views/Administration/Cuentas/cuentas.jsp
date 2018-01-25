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
					<th>Codigo</th>
					<th>Description</th>
					<th>Nombre</th>
					<th>Saldo Acreedor</th>
					<th>Saldo Deudor</th>
					<th width="5%">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cuentas}" var="cuenta">
					<tr>
						<td>${cuenta.codigo }</td>
						<td>${cuenta.description }</td>
						<td>${cuenta.nombre}</td>
						<td>${cuenta.saldoAcreedor }</td>
						<td>${cuenta.saldoDeudor }</td>
						<td width="5%">
							<c:if test="${update}">	
									<a class=" modal-trigger" href="#-${cuenta.idCuentaContable }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${delete}">		
									<a class="" href="/sisconta/cuentas/delete/${cuenta.idCuentaContable }" data-toggle="modal"data-target="#" ><i class="fa fa-trash" aria-hidden="true"></i></a>
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
		<!-- 		<h4>Agregar Cuentas</h4> -->
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="cuentaForm"
			action="/sisconta/cuentas/add" id="registro" autocomplete="off">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="codigo" value="${cuenta.codigo}"
						placeholder="Cuenta Codigo" id="codigo" type="text" class="validate"
						required="required" />

				</div>
					<div class="input-field col s12">
					<form:input path="cuentaPadre" value="${cuenta.cuentaPadre}"
						placeholder="Cuenta Mayor" id="cuentaPadre" type="text"
						class="validate" required="required" />
					</div>
			
				<div class="input-field col s6">
					<form:textarea path="description" value="${cuenta.description }"
						placeholder="description" id="description" cols="10" rows="10" type="text"
						class="validate" required="required" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<form:input path="nombre" value="${cuenta.nombre}"
						placeholder="nombre" id="nombre" type="text"
						class="validate" required="required" />
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="saldoAcreedor" value="${cuenta.saldoAcreedor}"
						placeholder="Haber" id="haber" type="number" min="0"
						class="validate" required="required" />
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="saldoDeudor" value="${cuenta.saldoDeudor}"
						placeholder="Debe" id="debe" type="number" min="0"
						class="validate" required="required" />
				</div>
			</div>


			
			<form:hidden id="idCuentaContable" path="idCuentaContable" value="${cuenta.idCuentaContable}" />

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

<c:forEach items="${cuentas}" var="cuenta">

	<!-- Modal Structure -->
	<div id="-${cuenta.idCuentaContable }" class="modal  white darken-4">
		<div class="modal-header">
			<!-- 		<h4>Agregar Cuenta</h4> -->
		</div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="cuentaForm"
				action="/sisconta/cuentas/add" autocomplete="off">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="codigo" value="${cuenta.codigo }"
							placeholder="Codigo" id="codigo" type="text" class="validate"
							required="required" />
					</div>
						<div class="input-field col s12">
							<form:input path="cuentaPadre" value="${cuenta.cuentaPadre}"
									placeholder="Cuenta Mayor" id="cuentaPadre" type="text"
									class="validate" required="required" />
						</div>
					
			
				</div>

				<div class="row">
					<div class="input-field col s12">
						<form:input path="nombre" value="${cuenta.nombre }"
							placeholder="nombre" id="nombre" type="text"
							class="validate" required="required" />
					</div>
				</div>

			
				<div class="input-field col s6">
					<form:textarea path="description" value="${cuenta.description }"
						placeholder="description" id="description" cols="10" rows="10" type="text"
						class="validate" required="required" />
				</div>
				
				<div class="row">
				<div class="input-field col s12">
					<form:input path="saldoAcreedor" value="${cuenta.saldoAcreedor}"
						placeholder="Haber" id="haber" type="number" min="0"
						class="validate" required="required" />
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s12">
					<form:input path="saldoDeudor" value="${cuenta.saldoDeudor}"
						placeholder="Debe" id="debe" type="number" min="0"
						class="validate" required="required" />
				</div>
			</div>
			
				<form:hidden path="idCuentaContable" value="${cuenta.idCuentaContable}" />

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
		CKEDITOR.replace('description',
							{
								TOOLBAR : 'BASIC',
							}
						);
		CKEDITOR.instances['description'].setData("${cuenta.description}");
	</script>
</c:forEach>

<script type="text/javascript">
$(document).ready(function() {	


	//asignar el editor de texto al textarea de alcances
	CKEDITOR.replace( 'description', 
			    { 
		        TOOLBAR : 'BASIC', 
			    }); 					

						
});
</script>