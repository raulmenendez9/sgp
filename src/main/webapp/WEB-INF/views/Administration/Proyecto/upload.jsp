 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="contenido" class="card-panel hoverable">

 <div class="container-fluid">
  <div class="row-fluid">
   <div class="col-md-6">
     
     <form method="POST" action="/sgp/uploadFile?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
     
     <div class = "row">
               <label>Documento:</label>
     <div class = "file-field input-field">
     
                  <div class = "btn">
                  <i class="material-icons left">cloud_upload</i>
                     <span>seleccionar archivo</span>
                     <input type = "file" class="form-control" name="file"/>
                  </div>
                  
                  <div class = "file-path-wrapper">
                     <input class = "file-path validate" type = "text"
                        placeholder = "Ningún archivo seleccionado" />
                  </div>
               </div>
            </div>

      <!--  <div class="form-group">
       <label for="Documento">Documento: </label>
       
       <input  type="file" class="form-control" name="file"/> 
      </div>
      <div class="form-group">-->
       <input type="submit" class="form-control btn btn-success" value="Subir"/>
      </div>
     </form>
   </div>
  </div>
 </div>
