<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="contenido" class="card-panel hoverable">
	<div class="container">
		<c:if test="${readvistaprox23}">
		
		<table id="tabla" class="display hover cell-border"  cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Proyecto</th>
					    
					    <th>Duración en días</th>
					    <th>Opcion</th>
					    
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vistapros}" var="vistapro">
						<tr style="color:#0B0B61;">
							<td>${vistapro[0] }</td>
							<td>${vistapro[2] }</td>
							
							<td width="5%">
							<c:if test="${updatevistaprox23}">	
									<a class="" href="/sgp/verproyectos/update/${vistapro[1]}"><i class="fa fa-eye" aria-hidden="true"></i></a>&nbsp;
							</c:if>
							
							<c:if test="${createvistaprox23}">	
		
		                           <a class="" href="/sgp/proyecto/gantt/${vistapro[1]}"><i class="fa fa-calendar" aria-hidden="true"></i></a>&nbsp;
                              </c:if>
							
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>

