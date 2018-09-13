<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div id="contenido" class="card-panel hoverable">
<c:if test="${createvistasx23}">	
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>	
<c:if test="${readvistasx23}">		
		<a class="waves-effect waves-light btn-floating modal-trigger red darken-3" href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>PDF</a>
		<a class="waves-effect waves-light btn-floating modal-trigger green darken-3" href="#"><i class="fa fa-file-excel-o" aria-hidden="true"></i> EXCEL</a>
</c:if>			
		<hr>	
	 	<div class="container">	
<c:if test="${readvistasx23}">	
			<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
					    <th>Nombre</th>
						<th>URL</th>
						<th>icono</th>
						<th>Menu</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vistas}" var="vista">
						<tr style="color:#0B0B61;">
							<td>${vista.nombre  }</td>
							<td>${vista.url  }</td>
							<td><li><i class="fa ${vista.icon } fa-fw"></i>&nbsp; ${vista.icon }</li></td>
							<td>${vista.menu.nombre }</td>

						<td width="10%">
						<center>
							<c:if test="${updatevistasx23}">	
									<a class="modal-trigger" href="#-${vista.idVista }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							<c:if test="${deletevistasx23}">		
									<a class="" href="/sgp/vistas/delete/${vista.idVista }" data-toggle="modal"data-target="#""><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>	
						</center>						
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
		<form:form method="post" modelAttribute="vistaForm"
			action="/sgp/vistas/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
				<form:input path="nombre" class="form-control" placeholder="Nombre de la vista"
										type="text" id="usn" value="${vista.nombre }" required="required"/>

				</div>
				<div class="input-field col s6">
				<form:input path="url" class="form-control"
										placeholder="URL" type="text" id="us"
										value="${vista.url }" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
				<form:input path="icon" class="form-control"
										placeholder="fa-icon" type="text" id="us"
										value="${vista.icon }" />
				</div>
			</div>
			
			
						<div class="row">
							<div class="input-field col s12">

								<form:select path="idMenu" class="form-control" required="true">
									<option value="" disabled selected>Seleccione un menu</option>
									<c:forEach items="${menus}" var="m">
										<c:choose>
											<c:when test="${vista.menu.id == m.id}">
												<form:option value="${m.id }" label="${m.nombre} "
													selected="true" />
											</c:when>
											<c:otherwise>
												<form:option value="${m.id }" label="${m.nombre}" />
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</form:select>
							</div>
						</div>



						<form:hidden id="idVista" path="idVista" value="${vista.idVista}" />

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
			
<c:forEach items="${vistas}" var="vista">
<div id="-${vista.idVista}" class="modal white darken-4">
	<div class="modal-header">
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="vistaForm"
			action="/sgp/vistas/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s6">
				<form:input path="nombre" class="form-control" placeholder="Nombre de la vista"
										type="text" id="usn" value="${vista.nombre }" required="required"/>

				</div>
				<div class="input-field col s6">
				<form:input path="url" class="form-control"
										placeholder="URL" type="text" id="us"
										value="${vista.url }" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
				<form:input path="icon" class="form-control"
										placeholder="fa-icon" type="text" id="us"
										value="${vista.icon }" />
				</div>
			</div>
			
			
						<div class="row">
							<div class="input-field col s12">

								<form:select path="idMenu" class="form-control" required="true">
									<option value="" disabled selected>Seleccione un menu</option>
									<c:forEach items="${menus}" var="m">
										<c:choose>
											<c:when test="${vista.menu.id == m.id}">
												<form:option value="${m.id }" label="${m.nombre} "
													selected="true" />
											</c:when>
											<c:otherwise>
												<form:option value="${m.id }" label="${m.nombre}" />
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</form:select>
							</div>
						</div>



						<form:hidden id="idVista" path="idVista" value="${vista.idVista}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>			
</c:forEach>			
			

<!-- /.col-lg-12 -->



