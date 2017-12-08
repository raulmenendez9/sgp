<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<li><a href="#"><i class="glyphicon glyphicon-education"></i>
		Perfil de Usuario</a></li>
<li class="divider"></li>
<li><c:url value="/logout" var="logoutUrl" />
	<form id="logout" action="${logoutUrl}" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form> <a href="javascript:document.getElementById('logout').submit()"> <i
		class="fa fa-sign-out fa-fw"> </i>Cerrar sesión
</a></li>