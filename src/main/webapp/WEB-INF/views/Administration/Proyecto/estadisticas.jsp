<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${readestadistic}">
<div class="container">
		<iframe width="933" height="700" src="https://app.powerbi.com/view?r=eyJrIjoiZjk1ZmViNDEtMDdiMC00NGExLWE0YzItODRhNzhkMmQ5M2VlIiwidCI6ImQyMWMzYjFiLTU3YzktNDZhNi1iMGE5LTI2OGVhNjgyN2ZlZCIsImMiOjR9" frameborder="0" allowFullScreen="true"></iframe>
	</div>
</c:if>