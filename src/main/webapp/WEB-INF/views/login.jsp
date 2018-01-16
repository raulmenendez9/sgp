<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<!-- </head> -->
<!-- <body class="logbody" id="wrapper"> -->
<!-- <div id="wrapper"> -->
<!-- <div class="jumbotron boxlogin"> -->
<!-- <h3 style="text-align:center; color:#0B0B61;">Sistema contable</h3> -->
<%-- <%-- 	<div th:if="${param.error}" id="alerta" class="alert alert-danger collapse"> --%> 
<!-- <!--            <label> Usuario o contraseña no válidos</label> --> 
<!-- <!--         </div> --> 

<!--         <form th:action="@{/login}" method="post" onsubmit="return validar();"> -->
<%--         	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/> --%>
<!--         	 <label style="color: #0B0B61;"> Nombre de usuario : -->
<!-- 				</label> -->
<!-- 				<div class="input-group"> -->
<!-- 					<span class="input-group-addon"> <span -->
<!-- 						class="glyphicon glyphicon-user"></span> -->
<!-- 					</span> <input type="text" name="username" class="form-control" /> -->
<!-- 				</div> -->
<!-- 				<label style="color: #0B0B61;"> Contraseña: </label> -->
<!-- 				<div class="input-group"> -->
<!-- 					<span class="input-group-addon"> <span -->
<!-- 						class="glyphicon glyphicon-lock"></span> -->
<!-- 					</span> <input type="password" id="" name="password" class="form-control" /> -->
<!-- 				</div> -->
<!-- 				<br> <input type="submit" value="Ingresar" class="btn btn-success" /> -->
<!-- 			</form> -->
<!--         </div> -->
<!--         </div> -->
<!-- </body> -->

<!--       <div class="row"> -->
<!--         <div class="col s12 m6"> -->
<!--           <div class="card blue-grey darken-1"> -->
<!--             <div class="card-content white-text"> -->
<!--               <span class="card-title">Card Title</span> -->
<!--               <p>I am a very simple card. I am good at containing small bits of information. -->
<!--               I am convenient because I require little markup to use effectively.</p> -->
<!--             </div> -->
<!--             <div class="card-action"> -->
<!--               <a href="#">This is a link</a> -->
<!--               <a href="#">This is a link</a> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->

<!-- <script> -->
		
<!-- 	</script> -->

<head>
<tiles:insertAttribute name="cabecera" />
  <style>
    body {
      display: flex;
      min-height: 100vh;
      flex-direction: column;
      background-image: url(<c:url value="/resources/img/background.jpg" />); 
    }

    main {
      flex: 1 0 auto;
    }


    .input-field input[type=date]:focus + label,
    .input-field input[type=text]:focus + label,
    .input-field input[type=email]:focus + label,
    .input-field input[type=password]:focus + label {
      color: #e91e63;
    }

    .input-field input[type=date]:focus,
    .input-field input[type=text]:focus,
    .input-field input[type=email]:focus,
    .input-field input[type=password]:focus {
      border-bottom: 2px solid #e91e63;
      box-shadow: none;
    }
  </style>
</head>

<body>
  <div class="section"></div>
  <main>
    <center>
<!--       <img class="responsive-img" style="width: 250px;" src="https://i.imgur.com/ax0NCsK.gif" /> -->
      <div class="section"></div>
	  <h5 class="indigo-text white-text">-SISTEMA CONTABLE-</h5>
      <h5 class="indigo-text white-text">Inicia secion con tu cuenta</h5>
      <h6 class="indigo-text white-text">si no tienes una, solicita una al administrador</h6>
      <div class="section"></div>

      <div class="container">
        <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

         <form th:action="@{/login}" method="post" onsubmit="return validar();">
         <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            <div class='row'>
              <div class='col s12'>
              </div>
            </div> 

            <div class='row'>
              <div class='input-field col s12'>
                <input  type='text' name='username' id='email' />
                <label for='email'>Ingresa tu nombre de usuario</label>
              </div>
            </div>

            <div class='row'>
              <div class='input-field col s12'>
                <input class='validate' type='password' name='password' id='password' />
                <label for='password'>Ingresa tu contraseña</label>
              </div>
              <label style='float: right;'>
								<a class='pink-text' href='#!'><b>¿olvidaste la contraseña?</b></a>
							</label>
            </div>

            <br />
            <center>
              <div class='row'>
                <button type='submit' value="Ingresar" name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Entrar</button>
              </div>
            </center>
          </form>
        </div>
      </div>
<!--       <a href="#!">Create account</a> -->
    </center>

    <div class="section"></div>
    <div class="section"></div>
  </main>

<!--   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script> -->
<!--   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script> -->
</body>
</html>
