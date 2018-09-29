<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

</head>

<!-- Modal Trigger -->
  

<div id="contenido" class="card-panel hoverable">
<c:if test="${createtipov}">
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>
<c:if test="${readtipov}">
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>

<hr>
	 	<div class="container">
		<c:if test="${readtipov}">
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Nombre de la variable de Impacto</th>
					<th>Descripción</th>
					<th>Opción </th>				
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${variableImpactos}" var="variableImpacto">
					<tr>
						<td>${variableImpacto.nomVariable }</td>
						<td>${variableImpacto.descripcion }</td>						
						
						<td>
							<c:if test="${updatetipov}">	
									<a class=" modal-trigger" href="#-${variableImpacto.idVariableImpacto }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletetipov}">		
									<a class="" href="/sgp/variableImpactos/delete/${variableImpacto.idVariableImpacto }" data-toggle="modal"data-target="#" ><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>						
						</td>
						
						
												
					
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
		</div>
</div>

<div id="agregar" class="modal white darken-4">
	<div class="modal-header">
		<!-- 		<h4>Agregar Variable de Impacto</h4> -->
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="variableImpactoForm"
			action="/sgp/variableImpactos/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s12">
					<form:input path="nomVariable" value="${variableImpacto.nomVariable }"
						placeholder="Nombre" id="nombreVariable" type="text" class="validate"
						required="required" />

				</div>
				
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="descripcion" id="descripcion" class="form-control" placeholder="Descripcion"
						 rows="8" cols="80"  value="${variableImpacto.descripcion }" required="required" style="font-size:15px;"/>
				</div>
			</div>

			

			
			
			<form:hidden id="idVariableImpacto" path="idVariableImpacto" value="${variableImpacto.idVariableImpacto}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text" onclick="toast();">
					<i class="fa fa-floppy-o" aria-hidden="true" ></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>
<c:forEach items="${variableImpactos}" var="variableImpacto">

	<!-- Modal Structure -->
	<div id="-${variableImpacto.idVariableImpacto}" class="modal  white darken-4">
		<div class="modal-header">
			
		</div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="variableImpactoForm"
				action="/sgp/variableImpactos/add" autocomplete="off" accept-charset="ISO-8859-1">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="nomVariable" value="${variableImpacto.nomVariable }"
							placeholder="Nombre de la variable " id="nomVariable" type="text" class="validate"
							required="required" />
					</div>
					
				</div>
				
				<div class="row">
				<div class="input-field col s12">
					<form:input path="descripcion" id="descripcion" class="form-control" placeholder="Descripcion"
						 rows="8" cols="80"  value="${variableImpacto.descripcion }" required="required" style="font-size:15px;"/>
				</div>
			</div>
			

				

				
				<form:hidden path="idVariableImpacto" value="${variableImpacto.idVariableImpacto}" />

				<div class="center">
					<form:button type="submit"
						class=" btn green modal-actionwaves-effect waves-light white-text" onclick="toast();">
						<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar </form:button>

					<form:button href="#!"
						class=" btn red modal-action modal-close waves-effect waves-light white-text">
						<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
				</div>
			</form:form>
		</div>
	</div>

</c:forEach>
