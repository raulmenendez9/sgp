<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div id="contenido" class="card-panel hoverable">
<div class="container">

					<form method="post" action="/sisconta/rolesadd" class="form-horizontal"
						id="rolForm" onsubmit="return validar();">
						<div class="container">

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div class="form-group">
							<label class="control-label col-sm-2">Nombre: </label>
							<div class="col-sm-10">
								<input name="nombre" class="form-control" id="nombre"
									placeholder="Nombre" type="text" value="${rol1.nombre}" required="required"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">Descripción: </label>
							<div class="col-sm-10">
								<textarea name="descripcion" id="descripcion"
									class="form-control" cols="100" rows='50' required="required"
									placeholder="Descripción"></textarea>
							</div>
						</div>

						<input type="hidden" name="idRol" value="${rol1.idRol}" />
						
						
<!-- 		============================================================================ -->
<!-- 		TERMINA NOMBRE Y FUNCIONES Y SE EMPIEZAN A LISTAR LOS MENUS Y SUS VISTAS -->
<!-- 		=========================================================================== -->
		
						


						
						<h6>${msj_listaDeDisponibles}</h6>
						<h6>${msg_menudispvacio}</h6> 
						<hr>
						<div class="collection">
							<c:forEach items="${menusdeagregacion}" var="menu">
							<!-- RECORRER LOS MENUS Y SUS VISTAS -->
								
      								 <li class="collection-item">
      								 <div class="row">  
      								 			<div class="col s3">
									 				<c:choose>
														<c:when test="${menu.activo}">
															 <input type="checkbox" id="${menu.id }" name="menuactivo-${menu.id }"  checked="checked"/>
															 <label for="${menu.id }">Activar menu ${menu.nombre }:</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox" id="${menu.id }" name="menuactivo-${menu.id }"/>
															<label for="${menu.id }">>Activar menu ${menu.nombre }</label>
														</c:otherwise>
													</c:choose>
												</div> 
												
												
												<div class="col s9">
													<a class="waves-effect waves-light btn modal-trigger" href="#-${menu.id}"><i class="fa ${menu.icono } fa-fw" ></i>Editar Vistas del menu ${menu.nombre}</a>
												</div>
													
									 </div>	
									 </li>
										
								<!-- 	lista de menus -->
								
								
								<div id="-${menu.id}" class="modal white darken-4">
								<div class="container center">
										<div class="modal-header">
										
													<h5 class="center-align"><i class="fa ${menu.icono } fa-fw"></i><b>${menu.nombre}</b></h5>
													<p class="center-align">Editar permisos del Rol ${rol1.nombre} para el menu ${menu.nombre}</p>
										</div>
								</div>

										<!-- vistas -->

										<!-- Modal content-->
										<div class="modal-content">
										<ul class="collection">

												<!-- el modal body es la lista de vistas -->
													<c:forEach items="${vistas}" var="vista">
													
													<c:if test="${estoyguardando==true}">
													
												<!-- ACTUALIZANDO -->
														<c:choose>
														<c:when test="${(vista.menu.id == menu.id)}"> 
																<!--******************************MOSTRAR EL CONTENIDO DE LAS VISTAS SU FORM EN SU DEFECTO -->

																<h6 >
																	<i class="fa  ${vista.icon} fa-fw"></i><b>
																		${vista.url} </b>
																</h6>

																<ul class="collection">

																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}" />
																		<!-- inicio lista 1 -->

																		<!-- **************************************CREATE -->
																		<div class="container center ">
																			<div class="container center ">
																		<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${false}">
																						 <input type="checkbox" id="create-${vista.idVista }" name="create-${vista.idVista }"  checked="checked"/>
																						 <label for="create-${vista.idVista }">: Crear</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="create-${vista.idVista }" name="create-${vista.idVista }"/>
																						 <label for="create-${vista.idVista }">: Crear</label>
																					</c:otherwise>
																				</c:choose>
																		</div>
																		
																		<!--**************************************/CREATE -->

																		<!-- ****************************************READ   -->
																				<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${false}">
																						 <input type="checkbox" id="read-${vista.idVista }" name="read-${vista.idVista }"  checked="checked"/>
																						 <label for="read-${vista.idVista }">: Leer</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="read-${vista.idVista }" name="read-${vista.idVista }"/>
																						 <label for="read-${vista.idVista }">: Leer</label>
																					</c:otherwise>
																				</c:choose>
																			</div>
																		<!--****************************************/READ   -->
																	<!-- FIN LISTA 1 -->

																		<!-- inicio lista 2 -->

																		<!--**************************************UPDATE -->
																				<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${false}">
																						 <input type="checkbox" id="update-${vista.idVista }" name="update-${vista.idVista }"  checked="checked"/>
																						 <label for="update-${vista.idVista }">: Modificar</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="update-${vista.idVista }" name="update-${vista.idVista }"/>
																						 <label for="update-${vista.idVista }">: Modificar</label>
																					</c:otherwise>
																				</c:choose>

																		</div>
																		<!--**************************************/UPDATE -->

																		<!-- ****************************************DELETE   -->
																			<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${false}">
																						 <input type="checkbox" id="delete-${vista.idVista }" name="delete-${vista.idVista }"  checked="checked"/>
																						 <label for="delete-${vista.idVista }">: Borrar</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="delete-${vista.idVista }" name="delete-${vista.idVista }"/>
																						 <label for="delete-${vista.idVista }">: Borrar</label>
																					</c:otherwise>
																				</c:choose>
																		</div>
																	
																	
																	</div><!-- FIN CONTAINER -->
																		<!--****************************************/DELETE   -->
																	<input type="hidden" name="idVista-${vista.idVista }"
																		value="${vista.idVista}" />
																</ul>
																<!--****************************************************** FIN CONTENIDO  VISTA ********************** -->
															</c:when>
															
														</c:choose>
														
														</c:if>
														<c:forEach items="${permisos}" var="permiso">
														<c:if test="${estoyactualizando==true}">
													
												<!-- ACTUALIZANDO -->
														<c:choose>
														<c:when test="${(permiso.vista.idVista == vista.idVista && vista.menu.id == menu.id && permiso.rol.idRol == rol1.idRol)}"> 
																<!--******************************MOSTRAR EL CONTENIDO DE LAS VISTAS SU FORM EN SU DEFECTO -->
															
																<h5>
																	<i class="fa  ${vista.icon} fa-fw"></i><b>
																		${vista.url}</b>
																</h5>

																<ul class="collection">

																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}" />
																		<!-- inicio lista 1 -->

																		<!-- **************************************CREATE -->
																		<div class="container center ">
																		<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.c && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="create-${vista.idVista }" name="create-${vista.idVista }"  checked="checked"/>
																						 <label for="create-${vista.idVista }">: Crear</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="create-${vista.idVista }" name="create-${vista.idVista }"/>
																						 <label for="create-${vista.idVista }">: Crear</label>
																					</c:otherwise>
																				</c:choose>
																		</div>
																		<!--**************************************/CREATE -->

																		<!-- ****************************************READ   -->
																			<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.r && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="read-${vista.idVista }" name="read-${vista.idVista }"  checked="checked"/>
																						 <label for="read-${vista.idVista }">: Leer</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="read-${vista.idVista }" name="read-${vista.idVista }"/>
																						 <label for="read-${vista.idVista }">: Leer</label>
																					</c:otherwise>
																				</c:choose>
																			</div>
																		
																		<!--****************************************/READ   -->
																	<!-- FIN LISTA 1 -->

																		<!-- inicio lista 2 -->

																		<!--**************************************UPDATE -->
																		<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.u && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="update-${vista.idVista }" name="update-${vista.idVista }"  checked="checked"/>
																						 <label for="update-${vista.idVista }">: Modificar</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="update-${vista.idVista }" name="update-${vista.idVista }"/>
																						 <label for="update-${vista.idVista }">: Modificar</label>
																					</c:otherwise>
																				</c:choose>

																		</div>
																		<!--**************************************/UPDATE -->

																		<!-- ****************************************DELETE   -->
																		<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.d && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="delete-${vista.idVista }" name="delete-${vista.idVista }"  checked="checked"/>
																						 <label for="delete-${vista.idVista }">: Borrar</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="delete-${vista.idVista }" name="delete-${vista.idVista }"/>
																						 <label for="delete-${vista.idVista }">: Borrar</label>
																					</c:otherwise>
																				</c:choose>
																		</div>
																		<!--****************************************/DELETE   -->
																		</div>
																	<!-- FIN LISTA 2 -->
																	<input type="hidden" name="idVista-${vista.idVista }"
																		value="${vista.idVista}" />
																</ul>
																<!--****************************************************** FIN CONTENIDO  VISTA ********************** -->
															</c:when>
															
														</c:choose>
														
														</c:if>
														</c:forEach><!-- fin permisos -->
													</c:forEach><!-- fin vistas -->

																	<div class="container center">
																		<div class="modal-footer">
																			<a href="#!"
																				class=" btn modal-action modal-close waves-effect waves-light white-text"><i
																				class="fa fa-reply" aria-hidden="true"></i> Cerrar </a>
																		</div>
																	</div>

												<!-- FINAL LIST GROUP -->
											</ul>

										<!-- fin vistas -->
									</div>
								</div>
							</c:forEach>
						</div>



<!-- 						+++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- 						APARTIR DE AQUI EMPIEZA EL UPDATE -->
<!-- 						+++++++++++++++++++++++++++++++++++++++++++++++ -->






						<hr>
						<h6>${msj_listaActuales}</h6>
						<h4>${msg_menudispvacio}</h4>
						<hr>
						<ul class="collection">
						
							<c:forEach items="${menusDisponibles}" var="menu">
								<!-- RECORRER LOS MENUS Y SUS VISTAS -->
								
      								 <li class="collection-item">
      								 <div class="row">  
      								 			<div class="col s3">
									 				<c:choose>
														<c:when test="${menu.activo}">
															 <input type="checkbox" id="${menu.id }" name="menuactivo-${menu.id }"  checked="checked"/>
															 <label for="${menu.id }">Activar menu ${menu.nombre }:</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox" id="${menu.id }" name="menuactivo-${menu.id }"/>
															<label for="${menu.id }">>Activar menu ${menu.nombre }</label>
														</c:otherwise>
													</c:choose>
												</div> 
												
												
												<div class="col s9">
													<a class="waves-effect waves-light btn modal-trigger" href="#-${menu.id}"><i class="fa ${menu.icono } fa-fw" ></i>Editar Vistas del menu ${menu.nombre}</a>
												</div>
													
									 </div>	
									 </li>
										
								<!-- 	lista de menus -->
								<div id="-${menu.id}" class="modal white darken-4">
								<div class="container center">
										<div class="modal-header">
										
													<h5 class="center-align"><i class="fa ${menu.icono } fa-fw"></i><b>${menu.nombre}</b></h5>
													<p class="center-align">Editar permisos del Rol ${rol1.nombre} para el menu ${menu.nombre}</p>
										</div>
								</div>
								

									<!-- vistas -->
										<!-- Modal content-->
										<div class="modal-content">
											
											<ul class="collection">
													<c:forEach items="${vistas}" var="vista">
													
													<c:if test="${estoyguardando==true}">
													
												<!-- ACTUALIZANDO -->
														
														
														</c:if>
														<c:forEach items="${permisos}" var="permiso">
														<c:if test="${estoyactualizando==true}">
													
												<!-- ACTUALIZANDO -->
														<c:choose>
														<c:when test="${(permiso.vista.idVista == vista.idVista && vista.menu.id == menu.id && permiso.rol.idRol == rol1.idRol)}"> 
																<!--******************************MOSTRAR EL CONTENIDO DE LAS VISTAS SU FORM EN SU DEFECTO -->
																<h6>
																	<i class="fa  ${vista.icon} fa-fw"></i><b>
																		${vista.url} -></b>
																</h6>

																<ul class="collection">

																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}" />
																		<!-- inicio lista 1 -->

																		<!-- **************************************CREATE -->
																		<div class="container center ">
																		<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.c && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="create-${vista.idVista }" name="create-${vista.idVista }"  checked="checked"/>
																						 <label for="create-${vista.idVista }">: Crear</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="create-${vista.idVista }" name="create-${vista.idVista }"/>
																						 <label for="create-${vista.idVista }">: Crear</label>
																					</c:otherwise>
																				</c:choose>
																		</div>
																		<!--**************************************/CREATE -->

																		<!-- ****************************************READ   -->
																			<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.r && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="read-${vista.idVista }" name="read-${vista.idVista }"  checked="checked"/>
																						 <label for="read-${vista.idVista }">: Leer</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="read-${vista.idVista }" name="read-${vista.idVista }"/>
																						 <label for="rear-${vista.idVista }">: Leer</label>
																					</c:otherwise>
																				</c:choose>
																			</div>
																		
																		<!--****************************************/READ   -->
																	<!-- FIN LISTA 1 -->

																		<!-- inicio lista 2 -->

																		<!--**************************************UPDATE -->
																		<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.u && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="update-${vista.idVista }" name="update-${vista.idVista }"  checked="checked"/>
																						 <label for="update-${vista.idVista }">: Modificar</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="update-${vista.idVista }" name="update-${vista.idVista }"/>
																						 <label for="update-${vista.idVista }">: Modificar</label>
																					</c:otherwise>
																				</c:choose>

																		</div>
																		<!--**************************************/UPDATE -->

																		<!-- ****************************************DELETE   -->
																		<div class="col sm3">
																				<c:choose>
																				
																					<c:when test="${permiso.d && permiso.rol.idRol == rol1.idRol}">
																						 <input type="checkbox" id="delete-${vista.idVista }" name="delete-${vista.idVista }"  checked="checked"/>
																						 <label for="delete-${vista.idVista }">: Borrar</label>
																					</c:when>
																				
																					<c:otherwise>
																						 <input type="checkbox" id="delete-${vista.idVista }" name="delete-${vista.idVista }"/>
																						 <label for="delete-${vista.idVista }">: Borrar</label>
																					</c:otherwise>
																				</c:choose>
																		</div>
																		<!--****************************************/DELETE   -->
																		</div>
																	<!-- FIN LISTA 2 -->
																	<input type="hidden" name="idVista-${vista.idVista }"
																		value="${vista.idVista}" />
																</ul>
																<!--****************************************************** FIN CONTENIDO  VISTA ********************** -->
															</c:when>
															
														</c:choose>
														
														</c:if>
														</c:forEach><!-- fin permisos -->
													</c:forEach><!-- fin vistas -->
																	<div class="container center">
																		<div class="modal-footer">
																			<a href="#!"
																				class=" btn modal-action modal-close waves-effect waves-light white-text"><i
																				class="fa fa-reply" aria-hidden="true"></i> Cerrar </a>
																		</div>
																	</div>

													</ul>

										</div>
										<!-- fin vistas -->
								</div>
							</c:forEach>
						</ul>



					<div class="container center">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
						</button>
						<a href="/sisconta/roles" class="btn btn-default" data-dismiss="modal">
						<i class="fa fa-reply" aria-hidden="true"></i>	 Cancelar
						</a>
					</div>
						
					</div>
					</form>






	<!-- Librerias JavaScript -->
	<script type="text/javascript">
		CKEDITOR.replace('descripcion', {
			toolbar : 'Basic',
			uiColor : '#ffffff'
		});
		
	</script>
	<script type="text/javascript">
		// 	CKEDITOR.instances['cuerpo'].insertHtml(document.getElementById("cuerpo_as"));
		CKEDITOR.instances['descripcion'].setData("${rol1.descripcion}");
		
		
		
	</script>
<!-- 	<script type="text/javascript"> -->
<!-- 	function validar(menuid) { -->
<!-- 		if(document.getElementById(menuid).checked==false){ -->
<!-- 			$("[id*=create]").prop('checked',false); -->
<!-- 			$("[id*=read]").prop('checked',false); -->
<!-- 			$("[id*=update]").prop('checked',false); -->
<!-- 			$("[id*=delete]").prop('checked',false); -->
			
<!-- 			$("[id*=create]").hide(); -->
<!-- 			$("[id*=read]").hide(); -->
<!-- 			$("[id*=update]").hide(); -->
<!-- 			$("[id*=delete]").hide(); -->
			
<!-- 		} -->
<!-- 		else{ -->
<!-- 			$("[id*=create]").show(); -->
<!-- 			$("[id*=read]").show(); -->
<!-- 			$("[id*=update]").show(); -->
<!-- 			$("[id*=delete]").show(); -->
<!-- 		} -->
		
<!-- 	} -->
	
<!-- 	</script> -->

</div>
		</div>


</body>
</html>