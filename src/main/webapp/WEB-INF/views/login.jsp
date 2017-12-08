<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<title>Sistema de Gestión de Riesgos</title>
	
    <link href="<c:url value="/resources/vendor/sigpaai/login.css"/>" rel="stylesheet"  type="text/css" /> 
    <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet"  type="text/css" /> 
    <link href="<c:url value="/resources/vendor/metisMenu/metisMenu.min.css"/>" rel="stylesheet"  type="text/css" /> 
    <link href="<c:url value="/resources/dist/css/sb-admin-2.css" />" rel="stylesheet"  type="text/css" /> 
    <link href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css" />" rel="stylesheet"  type="text/css" /> 
    <link rel="icon" href="<c:url value="/resources/img/one.ico" />" /> 
</head>
<body class="logbody" id="wrapper">
<div id="wrapper">
<div class="jumbotron boxlogin">
<h3 style="text-align:center; color:#0B0B61;">Sistema contable</h3>
	<div th:if="${param.error}" id="alerta" class="alert alert-danger collapse">
           <label> Usuario o contraseña no válidos</label>
        </div>
        <form th:action="@{/login}" method="post" onsubmit="return validar();">
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            <label style="color:#0B0B61;"> Nombre de usuario :  </label>
            <div class="input-group">
  			<span class="input-group-addon">
  			<span class="glyphicon glyphicon-user"></span>
  			</span>
            <input type="text" name="username" class="form-control"/>
            </div>
            <label style="color:#0B0B61;"> Contraseña: </label>
            <div class="input-group">
  			<span class="input-group-addon">
  			<span class="glyphicon glyphicon-lock"></span>
  			</span>
            <input type="password" id=""name="password" class="form-control"/>
            </div>
            <br>
            <input type="submit" value="Ingresar" class="btn btn-success"/>
        </form>
        </div>
        </div>
</body>

<script>
		
	</script>
</html>
