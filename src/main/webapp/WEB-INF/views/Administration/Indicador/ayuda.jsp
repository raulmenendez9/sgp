<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div id="agregar" class="modal white darken-4">
	<div class="modal-header">
	</div>
	<div class="modal-content">
		<form:form method="post" modelAttribute="indicadorForm"
			action="/sgp/indicadores/ayuda" id="registro" autocomplete="off" accept-charset="ISO-8859-1">

			
		</form:form>
	</div>
</div>
