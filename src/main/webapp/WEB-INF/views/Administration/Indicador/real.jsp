<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div id="contenido" class="card-panel hoverable">
<div class="container">
  <form:form method="post" modelAttribute="indicadorForm"
			action="/sgp/ind/add" id="registro" autocomplete="off" accept-charset="ISO-8859-1">
			
	
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
									<form:input path="datoc" id="num1" type="text"  value="${indicador.datoc}" placeholder="Valor de variable"/>
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
									<form:input path="datod" id="num2" type="text"  value="${indicador.datod}" placeholder="Valor de variable"/>
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
				<h5 style="text-align: left;">Indicador Real</h5>
			<form:input path="indicadorReal" class="form-control" placeholder="Indicador Real"	type="text"   value="${indicador.indicadorR}" required="required" id="resultado"/>
		</div>
	</div>

					<form:hidden id="idIndicador" path="idIndicador" value="${indicador.idIndicador}" />
					
					<form:hidden id="datoa" path="datoa" value=" ${ indicador.datoa }" />
										
					<form:hidden id="datob" path="datob" value=" ${ indicador.datob }" />
											
											
					<form:hidden id="indicadorR" path="indicadorR" value=" ${indicador.indicadorR}" />

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
	