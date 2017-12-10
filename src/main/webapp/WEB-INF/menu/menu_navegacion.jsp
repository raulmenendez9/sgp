<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<li class="metismenu"><div class container><IMG SRC="${pageContext.request.contextPath}/resources/img/coin.png" class="img-responsive" width="110%"> </div></li>

<c:forEach items="${menusdelrolx}" var="menx">
	<li class="metismenu"><a href="#"><i class="fa ${menx.icono} fa-fw"></i> ${menx.nombre} <span class="fa arrow"></span></a> 
	<c:forEach items="${vistasx}" var="vitax">
			<c:choose>
				<c:when test="${menx.id == vitax.menu.id }">
					<ul class="nav nav-second-level">
						<li><a href="${vitax.url}"><i class="fa ${vitax.icon } fa-fw"></i>${vitax.nombre }</a></li>
					</ul>
				</c:when>
			</c:choose>
		</c:forEach></li>
</c:forEach>