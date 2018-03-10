<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="<c:url value="${context}/resources/vendor/jquery/jquery-1.12.4.js"/>" /></script>
<!-- <script src="//code.jquery.com/jquery-1.12.4.js" ></script> -->

<link  href="<c:url value="${context}/resources/vendor/estilos/style.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="${context}/resources/vendor/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />

<!-- MATERIALIZE -->
<link  href="<c:url value="${context}/resources/vendor/materialize/css/materialize.min.css"/>"rel="stylesheet" type="text/css" />
<script src="<c:url value="${context}/resources/vendor/materialize/js/materialize.min.js"/>" /></script>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	
</head>

<body>

<div class="card-panel hoverable"  style="position: fixed; width: 100%; padding-top: 0px;">
<form:form action="/sisconta/partidas/procesarCuentas" method="post">

					<div class="row">
					    <div class="col s12">
					      <div class="row">
						        <div class="input-field col s4">
						          <input name="cuenta-contable" type="text" id="autocomplete-input" class="autocomplete">
						          <label for="autocomplete-input">Cuenta Contable</label>
						        </div>
						        
							    <div class="input-field col s3">
						          <input name="sa" placeholder="" id="first_name" type="text" class="validate">
						          <label for="first_name">Saldo Acreedor</label>
						       </div>
						       
						       <div class="input-field col s3">
						          <input name="sd" placeholder="" id="first_name2" type="text" class="validate">
						          <label for="first_name2">Saldo Deudor</label>
						       </div>
						       
						       <div class="input-field col s2">
						       <center>
						        <button type="submit" class="btn-floating btn-large waves-effect waves-light green"><i class="material-icons">add</i></a>
						        </center>
					           </div>
					      </div>
					    </div>
					  </div>
</form:form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<div class="row">
<div class="col s12">
  	<table class="striped"  cellspacing="0" width="100%">
<!--         <thead> -->
<!--           <tr> -->
<!--               <th width="20%">Codigo</th> -->
<!--               <th width="40%">Cuenta</th> -->
<!--               <th width="15%">Saldo Deudor</th> -->
<!--               <th width="15%">Saldo Acreedor</th> -->
<!--               <th width="10%">&nbsp;</th> -->
<!--           </tr> -->
<!--         </thead> -->
 <tbody>
<c:forEach items="${listaDeCuentasDiario}" var="lc">
	
		  <tr>
            <td width="10%">${lc.codigo}</td>
            <td width="50%">${lc.nombre}</td>
            <td width="10%" align="right">${lc.saldoAcreedor}</td>
            <td width="10%" align="right">${lc.saldoDeudor}</td>
            <td width="10%">
            <form:form action="/sisconta/partidas/eliminar" method="post">
            	<input type="text" style="display:none" value="${lc.codigo}" name="cuenta-contable"/>
            	<button type="submit"><i class="fa fa-trash" aria-hidden="true"></i></button>
            </form:form>
            </td>
          </tr>

</c:forEach>
		<tr>
            <td width="10%">&nbsp;</td>
            <td width="50%"><b>TOTAL:</b></td>
            <td width="10%" align="right"><b>${totalAcreedor}</b></td>
            <td width="10%" align="right"><b>${totalDeudor}</b></td>
            <td width="10%">&nbsp;</td>
		</tr>
		    
</tbody>
</table>

				
				
				<table class="striped"  cellspacing="0" width="100%">
				<tbody>
			          	<tr> <td width="100%" style="color: red"><center>${mensaje}</center></td></tr>
				</tbody>
				</table>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script>

$(document).ready(function() {
	 
	 $( "input.autocomplete ").autocomplete({
		    data: ${objString},
		    limit: 5, // The max amount of results that can be shown at once. Default: Infinity.
		    onAutocomplete: function(val) {
		      // Callback function when value is autcompleted.\
		      
		    },
		    minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
		  });	
});//fin function

	
</script>


</body>
</html>