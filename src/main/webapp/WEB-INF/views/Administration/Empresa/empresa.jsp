<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="col-lg-12">

	<div class="container col-sm-12">
		<div class="table-responsive">
		<h1>Registro de Empresas</h1>
	<br>
	<a data-toggle="modal" data-target="#-agregar" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar</a>
	<hr>
			<table width="100%"
				class="table table-bordered table-hover tabla"
				id="dataTables-example" id="dataTables-empresa">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Politicas</th>
						<th>Objetivos</th>
						<th>Alcance</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empresas}" var="empresa">
						<tr style="color: #0B0B61;">
							<td>${empresa.nombre }</td>
							<td>${empresa.politicas }</td>
							<td>${empresa.objetivos }</td>
							<td>${empresa.alcance }</td>

							<td><a data-toggle="modal"
								data-target="#-${empresa.idEmpresa}"><span
									class="glyphicon glyphicon-pencil" aria-hidden="true" ></span></a>&nbsp;
								<a data-eliminar="${empresa.idEmpresa}" name="eliminar-nivel"
								href="#" data-toggle="modal" data-target="#modal_eliminar"><span
									class="glyphicon glyphicon-trash" aria-hidden="true" ></span></a></td>
						</tr>

						<!-- 						TERMINA LA TABLA Y EMPIEZA EL MODAL -->





						


					</c:forEach>
				</tbody>
			</table>
			
			
			<c:forEach items="${empresas}" var="empresa">
			<!-- Modal -->
						<div id="-${empresa.idEmpresa}" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="color:#0B0B61; text-align: center;">${empresa.nombre }</h4>
									</div>
									<div class="modal-body">
										<form:form method="post" modelAttribute="empresaForm"
											action="/sisconta/empresas/update/${empresa.idEmpresa }" class="form-horizontal"
											onsubmit="return validar();">

										
											<div class="form-group">
												<label class="control-label col-sm-4">Nombre: </label>
												<div class="col-sm-8">
													<form:input path="nombre"  class="form-control"
														placeholder="Nombre" type="text" id="us"
														 required="required" value="${empresa.nombre}"/>
												</div>
											</div>
											

											<div class="form-group">
												<label class="control-label col-sm-4">Razon Social:
												</label>
												<div class="col-sm-8">
													<form:input path="politicas" class="form-control"
														placeholder="Razon Social" type="text" id="us"
														value="${empresa.politicas }" />
												</div>
											</div>
											

											<div class="form-group">
												<label class="control-label col-sm-4">Objetivos: </label>
												<div class="col-sm-8">
													<form:input path="objetivos" class="form-control"
														placeholder="Objetivos" type="text" id="us"
														value="${empresa.objetivos }" />
												</div>
											</div>
											

											<div class="form-group">
												<label class="control-label col-sm-4">Alcance: </label>
												<div class="col-sm-8">
													<form:textarea path="alcance" class="form-control"
														placeholder="Alcance" type="text" id="${empresa.idEmpresa }"
														value="${empresa.alcance }" />
												</div>
											</div>




											<div class="text-center">
											<hr><br>
											<form:button type="submit" class="btn btn-primary">
												<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar</form:button>
											<form:button type="submit" class="btn btn-default"
												data-dismiss="modal">
												<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancelar</form:button>
											</div>

										</form:form>
									</div>
									
								</div>

							</div>
						</div>
				
				

			</c:forEach>
			
			<div id="-agregar" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="color:#0B0B61; text-align: center;">Agregar Una Empresa</h4>
									</div>
									<div class="modal-body">
										<form:form method="post" modelAttribute="empresaForm"
											action="/sisconta/empresas/add" class="form-horizontal"
											onsubmit="return validar();">


											<div class="form-group">
												<label class="control-label col-sm-4">Nombre: </label>
												<div class="col-sm-8">
													<form:input path="nombre" class="form-control"
														placeholder="Nombre" type="text" id="us"
														value="${empresa.nombre }" required="required"/>
												</div>
											</div>
									

											<div class="form-group">
												<label class="control-label col-sm-4">Razon Social:
												</label>
												<div class="col-sm-8">
													<form:input path="politicas" class="form-control"
														placeholder="Razon Social" type="text" id="us"
														value="${empresa.politicas }" />
												</div>
											</div>
											

											<div class="form-group">
												<label class="control-label col-sm-4">Objetivos: </label>
												<div class="col-sm-8">
													<form:input path="objetivos" class="form-control"
														placeholder="Objetivos" type="text" id="us"
														value="${empresa.objetivos }" />
												</div>
											</div>
											

											<div class="form-group">
												<label class="control-label col-sm-4">Alcance: </label>
												<div class="col-sm-8">
													<form:textarea path="alcance" class="form-control"
														placeholder="Alcance" type="text" id="txt-agregar"
														value="${empresa.alcance }" />
												</div>
											</div>




											<form:hidden path="idEmpresa" value="${empresa.idEmpresa}" />
											<div class="text-center">
											<hr>
											<form:button type="submit" class="btn btn-primary"  id="ward">
												<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar</form:button>
											<form:button type="submit" class="btn btn-default"
												data-dismiss="modal">
												<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancelar</form:button>
											</div>
											

										</form:form>
									</div>
									
								</div>

							</div>
						</div>
			
			
			
			
			
		</div>
	</div>
</div>
<!-- /.col-lg-12 -->
<c:import url="/WEB-INF/menu/librerias_js.jsp"></c:import>
<script type="text/javascript">
	CKEDITOR.replace( 'txt-agregar',
		    {
		        toolbar : 'Basic',
		        uiColor : '#ffffff'
		    });
	</script>



<c:forEach items="${empresas}" var="empresa">
	<script type="text/javascript">
		CKEDITOR.replace('${empresa.idEmpresa}', {
			toolbar : 'Basic',
			uiColor : '#ffffff'
		});
	</script>
	<script type="text/javascript">
	CKEDITOR.instances['${empresa.idEmpresa}'].setData("${empresa.alcance}");
	</script>

</c:forEach>
<script type="text/javascript">
	

// 	CKEDITOR.instances['cuerpo'].insertHtml(document.getElementById("cuerpo_as"));
	CKEDITOR.instances['cuerpo'].setData("${cuerpo}");
	</script>
