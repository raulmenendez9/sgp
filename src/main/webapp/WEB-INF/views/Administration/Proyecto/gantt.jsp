<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>



<link href="<c:url value="${context }/resources/vendor/jsgantt_v12/jsgantt.css"/>" rel="stylesheet" type="text/css" />
 <script src="<c:url value="${context }/resources/vendor/jsgantt_v12/jsgantt.js" />"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
 

</head>


   
</head>
<body>
<h1 align="center" style="font-family: sans-serif;">Diagrama Gantt de Actividades</h1>
<br>
<br>

	
<div style="position:relative" class="gantt" id="GanttChartDIV"></div>

</body>
</html>

<script type="text/javascript" >

var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');
var colores = new Array();
colores=['f600f6','ff6666', '0000ff', '990000', 'ff0000', '00ff00','f600f6','ff6666', '0000ff', '990000', 'ff0000', '00ff00'];
var j=0;
var cadena = new Array();
var cadena=['${actividad} '  ];
var nombr = cadena.toString().slice(1);
var nombres=nombr.split(",");

var cadena2 = new Array();
var cadena2=['${fechainicio}'];
var f=cadena2.toString().slice(1);
var fechainicio = f.split(",");

var cadena3 = new Array();
var cadena3=['${fechafin} '];
var f2=cadena3.toString().slice(1);
var fechafin = f2.split(",");

var cadena4 = new Array();
var cadena4=['${estado} '];
var f3=cadena4.toString().slice(1);
var duracion = f3.split(",");

var cadena5 = new Array();
var cadena5=['${codigo} '];
var f4=cadena5.toString().slice(1);
var id = f4.split(",");

g.setShowDur(0); // Show/Hide Duration (0/1)
g.setShowComp(0); // Show/Hide % Complete(0/1)
g.setCaptionType('Resource'); // Set to Show Caption
g.setDateInputFormat('yyyy-mm-dd');


if( g ) {
	      
	     
	    for ( i in nombres )
		 {  
	       
	g.AddTaskItem(new JSGantt.TaskItem(id[i], nombres[i], fechainicio[i], fechafin[i], colores[i], "link", 0, "", duracion[i], 0, 3, 1));
		 
	
		 } 


 
	  g.Draw();	
	  g.DrawDependencies();

}
else
{
  alert("not defined");
}

</script>







</div>

