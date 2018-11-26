<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--  
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
-->
<div id="contenido" class="card-panel hoverable">

	<c:if test="${createind2}">
		<a class="waves-effect waves-light btn-floating modal-trigger green"
			href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>

	<hr>
	<div class="container">
		<c:if test="${readind2}">
			<table id="tabla" class="display hover cell-border" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Descripcion</th>
						<th>Proyecto</th>
						<th>Variable Impacto 1</th>
						<th>Variable Impacto 2</th>
						<th>Indicador Ideal</th>
						<th>Opcion</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${indicadores}" var="indicador">
						<tr style="color: #0B0B61;">
							<td>${indicador.nombre }</td>
							<td>${indicador.descripcion }</td>
							<td>${indicador.proyecto.solicitud.titulo}</td>
							<td>${indicador.variableImpacto.nomVariable}</td>
							<td>${indicador.variableImpacto2.nomVariable}</td>
							<td>${indicador.indicadorR}</td>
							

							<td width="5%"><c:if test="${updateind2}">
									<a class="modal-trigger" href="#-${indicador.idIndicador}"><i
										class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
							</c:if> <c:if test="${deleteind2}">
									<a class=""
										href="/sgp/indicadores/delete/${indicador.idIndicador}"
										data-toggle="modal" data-target="#"
										" onclick="Borrar('${indicador.idIndicador}');"><i
										class="fa fa-trash" aria-hidden="true"></i></a>
								</c:if> 
								<!-- Link to open the modal-->
 							 	<!--  <a data-toggle="modal fade" href="#myModal">Ayuda</a>-->
 							 		Ayuda<a class="modal-trigger" href="#myModal"><i class="fa fa-search"  aria-hidden="true"></i></a>&nbsp;
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>

<!-- /.col-lg-12 -->

<div id="agregar" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="indicadorForm"
			action="/sgp/indicadores/add" id="registro" autocomplete="off"
			accept-charset="ISO-8859-1">

			<div class="row">
				<div class="input-field col s12">
					<h5 style="text-align: center;">Datos de Indicador</h5>
					<div class="row">
						<div class="input-field col s12">
							<form:input path="nombre" value="${indicador.nombre }"
								id="nombre" type="text" class="validate" required="required" />
							<label for="nombre">Nombre del indicador</label>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:textarea path="descripcion" id="descripcion"
						class="materialize-textarea" rows="8" cols="80"
						value="${indicador.descripcion }" required="required"
						style="font-size:15px;" />
					<label for="descripcion">Descripcion</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<form:select path="codProyecto" id="form-indicador"
						class="form-control" required="true">
						<option value="" disabled selected>Seleccione Proyecto</option>
						<c:forEach items="${proyectos}" var="i">
							<c:choose>
								<c:when
									test="${indicador.proyecto.codProyecto == i.codProyecto}">
									<form:option value="${i.codProyecto}"
										label="${i.solicitud.titulo}" selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${i.codProyecto }"
										label="${i.solicitud.titulo}" var="selec" />
								</c:otherwise>
							</c:choose>

						</c:forEach>

					</form:select>
				</div>

			</div>

			<div class="row">
				<h5 style="text-align: center;">Cálculo de Indicador Ideal</h5>
				<div class="input-field col s6">

					<form:select path="idVariableImpacto" id="form-indicador"
						class="form-control" required="true">
						<option value="" disabled selected>Seleccione Variable
							Impacto 1</option>
						<c:forEach items="${variableImpactos}" var="i">
							<c:choose>
								<c:when
									test="${indicador.variableImpacto.idVariableImpacto == i.idVariableImpacto}">
									<form:option value="${i.idVariableImpacto }"
										label="${i.nomVariable}" selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${i.idVariableImpacto }"
										label="${i.nomVariable}" var="selec" />
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</form:select>
				</div>
				<div class="input-field col s4">
					<form:input path="datoa" id="num1" type="number" placeholder="Valor de variable" />
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<form:select path="idVariableImpacto2" id="form-indicador"
						class="form-control" required="true">
						<option value="" disabled selected>Seleccione Variable
							Impacto 2</option>
						<c:forEach items="${variableImpactos}" var="i">
							<c:choose>
								<c:when
									test="${indicador.variableImpacto2.idVariableImpacto2 == i.idVariableImpacto}">
									<form:option value="${i.idVariableImpacto }"
										label="${i.nomVariable}" selected="true" />
								</c:when>
								<c:otherwise>
									<form:option value="${i.idVariableImpacto }"
										label="${i.nomVariable}" var="selec" />
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</form:select>
				</div>
				<div class="input-field col s4">
					<form:input path="datob" id="num2" type="number" placeholder="Valor de variable" />
					<!-- FUNCION DE IDENTIFICACION -->

				</div>
			</div>
			<div>
				<h4>
					Operacion:

					<h5 id="demo" class="center-align red-text"></5>
				</h4>
			</div>
			<center>

				<input type="button" onmousemove="myFunction(event)"
					class=" btn blue modal-actionwaves-effect waves-light white-text"
					value="Suma" id="suma" onclick="operaciones('sumar');"> <input
					type="button" onmousemove="restarmove(event)"
					class=" btn blue modal-actionwaves-effect waves-light white-text"
					value="restar" onclick="operaciones('restar');"> <input
					type="button" onmousemove="multiplicarmove(event)"
					class=" btn blue modal-actionwaves-effect waves-light white-text"
					value="multiplicar" onclick="operaciones('multiplicar');">
				<input type="button" onmousemove="dividirmove(event)"
					class=" btn blue modal-actionwaves-effect waves-light white-text"
					value="dividir" onclick="operaciones('dividir');">
			</center>
			<div class="row">
				<div class="input-field col s12">
					<h5 style="text-align: left;">Indicador Ideal</h5>
					<form:input path="indicadorR" class="form-control"
						placeholder="Indicador Real" type="text"
						value="${indicador.indicadorR}" required="required" id="resultado" />
				</div>
			</div>

			<form:hidden id="idIndicador" path="idIndicador"
				value="${indicador.idIndicador}" />

			<div class="center">
				<form:button type="submit"
					class=" btn green modal-actionwaves-effect waves-light white-text"
					onclick="toast();">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </form:button>

				<form:button href="#!"
					class=" btn red modal-action modal-close waves-effect waves-light white-text">
					<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
			</div>
		</form:form>
	</div>
</div>


<c:forEach items="${indicadores}" var="indicador">
<div id="-${indicador.idIndicador}" class="modal white darken-4">
	<div class="modal-header"></div>
	<div class="modal-content">

  <form:form method="post" modelAttribute="indicadorForm"
			action="/sgp/indicadores/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
			
			
			<div class="row">
				<div class="input-field col s12">
					<h5 style="text-align: center;">Datos de Indicador</h5>
					<div class="row">
						<div class="input-field col s6">
							<form:input path="nombre" value="${indicador.nombre }"
								placeholder="Nombre" id="nombre" type="text" class="validate"
								required="required" />
						</div>
					</div>
				</div>
				</div>
					
					<div class="row">
						<div class="input-field col s12">
							<form:input path="descripcion" id="descripcion"
								class="form-control" placeholder="Descripcion" rows="8"
								cols="80" value = "${indicador.descripcion}" required="required"
								style="font-size:15px;" />
						</div>
					</div>
					
						<div class="row">
							<div class="input-field col s12">
								<form:select path="codProyecto" id="form-indicador"
									class="form-control" required="true">
									<option value="" disabled selected>Seleccione Proyecto</option>
									<c:forEach items="${proyectos}" var="i">
										<c:choose>
											<c:when
												test="${indicador.proyecto.codProyecto == i.codProyecto}">
												<form:option value="${i.codProyecto}"
													label="${i.solicitud.titulo}" selected="true" />
											</c:when>
											<c:otherwise>
												<form:option value="${i.codProyecto }"
													label="${i.solicitud.titulo}" var="selec" />
											</c:otherwise>
										</c:choose>

									</c:forEach>

								</form:select>
							</div>
							
							</div>


								<div class="row">
								<h5 style="text-align: center;">Cálculo de Indicador Ideal</h5>
									<div class="input-field col s6">
									
										<form:select path="idVariableImpacto" id="form-indicador"
											class="form-control" required="true">
											<option value="" disabled selected>Seleccione Variable Impacto 1</option>
											<c:forEach items="${variableImpactos}" var="i">
												<c:choose>
													<c:when
														test="${indicador.variableImpacto.idVariableImpacto == i.idVariableImpacto}">
														<form:option value="${i.idVariableImpacto }"
															label="${i.nomVariable}" selected="true" />
													</c:when>
													<c:otherwise>
														<form:option value="${i.idVariableImpacto }"
															label="${i.nomVariable}" var="selec" />
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</form:select>
									
									</div>
									<div class="input-field col s4">
									<form:input path="datoa" id="num1" type="text"  value="${indicador.datoa}" placeholder="Valor de variable"/>
									</div>
									
									</div>
									
									<div class="input-field col s6">
									
										
										<form:select path="idVariableImpacto2" id="form-indicador"
											class="form-control" required="true">
											<option value="" disabled selected>Seleccione Variable Impacto 2</option>
											<c:forEach items="${variableImpactos}" var="i">
												<c:choose>
													<c:when
														test="${indicador.variableImpacto2.idVariableImpacto == i.idVariableImpacto}">
														<form:option value="${i.idVariableImpacto }"
															label="${i.nomVariable}" selected="true" />
													</c:when>
													<c:otherwise>
														<form:option value="${i.idVariableImpacto}"
															label="${i.nomVariable}" var="selec" />
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</form:select>
									</div>
									<div class="input-field col s4">
									<form:input path="datob" type="text" id="num3" value="${indicador.datob}" placeholder="Valor de variable"/>
									</div>
									</div>
									<div>
		<h4>Operacion:
		
		<h5 id="demo" class="center-align red-text"/>
		
		</h4>
			</div>
		<center>
		
		<input type="button" onmousemove="myFunction(event)"  class=" btn blue modal-actionwaves-effect waves-light white-text" value="Suma" id="suma" onclick="operaciones('sumar');">
		<input type="button" onmousemove="restarmove(event)" class=" btn blue modal-actionwaves-effect waves-light white-text" value="restar" onclick="operaciones('restar');">
		<input type="button" onmousemove="multiplicarmove(event)" class=" btn blue modal-actionwaves-effect waves-light white-text" value="multiplicar" onclick="operaciones('multiplicar');">
		<input type="button" onmousemove="dividirmove(event)" class=" btn blue modal-actionwaves-effect waves-light white-text" value="dividir" onclick="operaciones('dividir');">
	</center>
	<div class="row">
<div  class="input-field col s12">
<h5 style="text-align: left;">Indicador Ideal</h5>
			<form:input path="indicadorR" class="form-control" placeholder="Indicador Real"
						type="text"   value="${indicador.indicadorR}" required="required" id="resultado"/>
				</div>
				</div>

										<form:hidden id="idIndicador" path="idIndicador"
											value="${indicador.idIndicador}" />
											
										
										<form:hidden id="datoc" path="datoc"
											value="${indicador.datoc}" />
										
										
										<form:hidden id="datod" path="datod"
											value="${indicador.datod}" />
											
											
										<form:hidden id="indicadorReal" path="indicadorReal"
											value="${indicador.indicadorReal}" />

										<div class="center">
											<form:button type="submit"
												class=" btn green modal-actionwaves-effect waves-light white-text"
												onclick="toast();">
												<i class="fa fa-floppy-o" aria-hidden="true"></i> Editar </form:button>

											<form:button href="#!"
												class=" btn red modal-action modal-close waves-effect waves-light white-text">
												<i class="fa fa-reply" aria-hidden="true"></i> Cerrar </form:button>
										</div>
		</form:form>
	</div>
</div>


</c:forEach>

<script type="text/javascript">
	function operaciones(op)

	{

		var ops = {

			sumar : function sumarNumeros(n1, n2) {
				return (parseInt(n1) + parseInt(n2));

			},

			restar : function restarNumeros(n1, n2) {

				return (parseInt(n1) - parseInt(n2));

			},

			multiplicar : function multiplicarNumeros(n1, n2) {

				return (parseInt(n1) * parseInt(n2));

			},

			dividir : function dividirNumeros(n1, n2) {

				return (parseInt(n1) / parseInt(n2));

			}

		};

		var num1 = document.getElementById("num1").value;

		var num2 = document.getElementById("num2").value;

		//Comprobamos si se ha introducido numeros en las cajas

		if (isNaN(parseFloat(document.getElementById('num1').value))) {

			alert("Indique un numero en 'numero1'");

			document.getElementById("num1").innerText = "0";

			document.getElementById("num1").focus();

		} else if (isNaN(parseFloat(document.getElementById('num2').value))) {

			alert("Indique un numero en 'numero2'");

			document.getElementById("num2").innerText = "0";

			document.getElementById("num2").focus();

		}

		else {

			//Si se han introducido los numeros en ambas cajas, operamos:

			switch (op) {

			case 'sumar':

				var resultado = ops.sumar(num1, num2);
				document.getElementById("resultado").value = resultado;
				break;

			case 'restar':

				var resultado = ops.restar(num1, num2);
				document.getElementById("resultado").value = resultado;
				break;

			case 'multiplicar':

				var resultado = ops.multiplicar(num1, num2);
				document.getElementById("resultado").value = resultado;
				break;

			case 'dividir':

				var resultado = ops.dividir(num1, num2);
				resultado = Number(resultado.toFixed(2));
				console.log(resultado);
				document.getElementById("resultado").value = resultado;

				break;

			}

		}

	}
</script>

<script>
	function Borrar(idIndicador) {

		var resul = confirm('¿Desea borrar el indicador seleccionado?');
		if (resul = true) {
			location.href = "/sgp/indicadores/delete/" + idIndicador;
		} else
			(resul = false)
		{
			location.href = "/sgp/indicadores";
		}

	}
</script>

<script>
	$('#num1').focusout(function() {
		var x = $(this).val();
		document.getElementById('entrada').innerHTML = x;

	});

	$('#num2').focusout(function() {
		var y = $(this).val();
		document.getElementById('entrada2').innerHTML = y;
	});
</script>

<script>
	function myFunction(e) {
		var x = document.getElementById("num1").value;
		var y = document.getElementById("num2").value;
		var coor = "Suma : " + x + "+" + y + "";
		document.getElementById("demo").innerHTML = coor;
	}

	function restarmove(e) {
		var x = document.getElementById("num1").value;
		var y = document.getElementById("num2").value;
		var coor = "Restar : " + x + "-" + y + "";
		document.getElementById("demo").innerHTML = coor;
	}

	function multiplicarmove(e) {
		var x = document.getElementById("num1").value;
		var y = document.getElementById("num2").value;
		var coor = "Multiplicar : " + x + "x" + y + "";
		document.getElementById("demo").innerHTML = coor;
	}
	function dividirmove(e) {
		var x = document.getElementById("num1").value;
		var y = document.getElementById("num2").value;
		var coor = "Dividir : " + x + "/" + y + "";
		document.getElementById("demo").innerHTML = coor;
	}
	function clearCoor() {
		document.getElementById("demo").innerHTML = "";
	}
</script>

<!-- Modal Indicadores -->
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">¿Qué son y cómo se construyen los indicadores en la evaluación de impacto?</h4>
        </div>
        <div class="modal-body">
          <p>Un indicador es una comparación entre dos o más tipos de datos que sirve para elaborar una medida cuantitativa o una observación cualitativa. Esta comparación arroja un valor, una magnitud o un criterio, que tiene significado para quien lo analiza.
          </p>
          <p>Los indicadores se utilizan en diversos ámbitos. Un ejemplo básico de indicador es el porcentaje. Otros indicadores comunes pueden ser la tasa de empleo, la tasa de desempleo, la tasa de actividad, la tasa de informalidad, por mencionar algunos.
          </p>
          <img class="responsive-img" src="resources/img/indicador1.png" style="width:300px; height:100"><br><br>
          <p>Los indicadores para medir el incremento de proyectos se determinan a través de variables de impacto como se detalla a continuación:
          </p>
           <img class="responsive-img" src="resources/img/indicador2.png" style="width:400; height:100">
        </div>
        <div class="modal-footer">

              <button type="button" class="btn red modal-action modal-close waves-effect waves-light white-text" aria-hidden="true" data-dismiss="modal">Cerrar</button>
              

        </div>
      </div>
      
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>
	<tiles:insertAttribute name="content_javascript" />
