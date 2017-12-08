	
<script>
	$(document).ready(function() {
		$('#dataTables-menu').DataTable({
			responsive : true,
			language: {"url": "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"}
		});
		
		$('a[name="eliminar-menu"]').click(function() {
			return confirm("¿Desea eliminar este registro?");
		});
	});
	
	function validar(){
    	var est = document.getElementById('us').value;
    	var isopa = document.getElementById('pass').value;
    	if(est===''){
    		$('#alerta').show('fade');
    		$('#linkClose').click(function(){
    			$('#alerta').hide('fade');	
    		})
    		setTimeout(function(){
    			$('#alerta').hide('fade');
    		},2000);
    	return false;}
    	if(isopa===''){
    		$('#alerta2').show('fade');
    		$('#linkClose2').click(function(){
    			$('#alerta2').hide('fade');	
    		})
    		setTimeout(function(){
    			$('#alerta2').hide('fade');
    		},2000);
    	return false;}
    	return true;
    }
	
	  $(function() {
	    $('#toggle-one').bootstrapToggle();
	  })
	  
	  $("#formulario_eliminar").submit(function(event){
	event.preventDefault();
	var id_eliminar = $('#hdn_id_eliminar').val();
	window.location.href = "/sisconta/menus/delete/" + id_eliminar;
});
	
</script>