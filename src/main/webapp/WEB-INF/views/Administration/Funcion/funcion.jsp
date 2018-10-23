<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

</head>

<!-- Modal Trigger -->
  

<div id="contenido" class="card-panel hoverable">
<c:if test="${createfuncionR}">
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>
<c:if test="${readfuncionR}">
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>

<hr>
	 	<div class="container">
		<c:if test="${readfuncionR}">
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Descripción</th>
					<th>Opción </th>				
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${funciones}" var="funcion">
					<tr>
						<td>${funcion.nombre }</td>						
						<td>${funcion.descripcion}</td>
						<td>
							<c:if test="${updatefuncionR}">	
									<a class=" modal-trigger" href="#-${funcion.idFuncion }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletefuncionR}">		
									<a class="" href="/sgp/funciones/delete/${funcion.idFuncion }" data-toggle="modal"data-target="#" onclick="Borrar('${funcion.idFuncion}');"><i class="fa fa-trash" aria-hidden="true"></i></a>
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
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="funcionForm"
			action="/sgp/funciones/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
					<form:input path="nombre" value="${funcion.nombre }"
						placeholder="Funcion a ingresar" id="nombre" type="text" class="validate"
						required="required" />
				</div>
				<div class="input-field col s6">
					<form:input path="descripcion" value="${funcion.descripcion }"
						placeholder="Descripción" id="descripcion" type="text" class="validate"
						required="required" />
				</div>
			</div>

			<form:hidden id="idFuncion" path="idFuncion" value="${funcion.idFuncion}" />

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

<c:forEach items="${funciones}" var="funcion">

	<!-- Modal Structure -->
	<div id="-${funcion.idFuncion }" class="modal  white darken-4">
		<div class="modal-header">
			<!-- 		<h4>Agregar Empresa</h4> -->
		</div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="funcionForm"
				action="/sgp/funciones/add" autocomplete="off" accept-charset="ISO-8859-1">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="nombre" value="${funcion.nombre }"
							placeholder="Nombre" id="nombre" type="text" class="validate"
							required="required" />
					</div>
					
				</div>
                 
                 <div class="row">
					<div class="input-field col s6">
						<form:input path="descripcion" value="${funcion.descripcion }"
							placeholder="Descripción..." id="descripcion" type="text" class="validate"
							required="required" />
					</div>
					
				</div>
				

				
				<form:hidden path="idFuncion" value="${funcion.idFuncion}" />

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




<script>

function Borrar(idFuncion)
{

 var resul = confirm('¿Desea borrar la  seleccionada?');
 if(resul=true)
	 {
	   location.href="/sgp/funciones/delete/"+idFuncion;
	 }
 else (resul=false)
 {
	 location.href="/sgp/funciones";
	}
 
} 

</script>
