<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div id="contenido" class="card-panel hoverable">
<c:if test="${createmenux23}">	
		<a class="waves-effect waves-light btn-floating modal-trigger green" href="#agregar"><i class="fa fa-plus-circle" aria-hidden="true"></i>Agregar</a>&nbsp;&nbsp;
</c:if>	
<c:if test="${readmenux23}" >			
		<hr>	
<div class="container">	 
<ul class="collection">
	<c:forEach items="${menus}" var="menu"> 
		<li class="collection-item avatar">
		<i class="fa ${menu.icono } fa-fw circle" style="color: white"></i>&nbsp;  
		<span class="title">${menu.nombre} :</span>
		<c:if test="${updatemenux23}" >	
			<a class=" right btn-floating btn-large waves-effect waves-light" href="/sgp/menus/delete/${menu.id }" data-toggle="modal" data-target="#"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp; &nbsp;
			</c:if>	
		<c:if test="${deletemenux23}">	
			<a class="modal-trigger right btn-floating btn-large waves-effect waves-light" href="#-${menu.id }"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
		</c:if>	
		
		 <hr>
			<c:forEach items="${vistas}"
				var="vista">
				<c:if test="${vista.menu.id == menu.id}">
					<a href="${vista.url}" class="list-group-item"> <i
						class="fa  ${vista.icon} fa-fw"></i><b> ${vista.url}</b>
					</a>
					<br>
				</c:if>
			</c:forEach></li>
			
	</c:forEach>
</ul>
</div>
</c:if>	
</div>



<c:forEach items="${menus}" var="menu">

	<div id="-${menu.id}" class="modal white darken-4">
		<div class="modal-header"></div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="menuForm"
				action="/sgp/menus/add" id="registro" autocomplete="off" accept-charset="UTF-8">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="nombre" class="form-control"
							placeholder="Nombre del menu" type="text" id="usn"
							value="${menu.nombre }" required="required" />

					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<form:input path="icono" class="form-control"
							placeholder="FA ICON" type="text" id="usn"
							value="${menu.icono }" required="required" />

					</div>
				</div>
					<form:hidden id="id" path="id" value="${menu.id}" />

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


</c:forEach>



	<div id="agregar" class="modal white darken-4">
		<div class="modal-header"></div>
		<div class="modal-content">
			<form:form method="post" modelAttribute="menuForm"
				action="/sgp/menus/add" id="registro" autocomplete="off" accept-charset="UTF-8">

				<div class="row">
					<div class="input-field col s6">
						<form:input path="nombre" class="form-control"
							placeholder="Nombre del menu" type="text" id="usn"
							value="${menu.nombre }" required="required" />

					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<form:input path="icono" class="form-control"
							placeholder="FA ICON" type="text" id="usn"
							value="${menu.icono }" required="required" />

					</div>
				</div>




					<form:hidden id="id" path="id" value="${menu.id}" />

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


