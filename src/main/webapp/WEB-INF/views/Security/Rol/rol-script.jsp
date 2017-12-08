<script>
	$(document).ready(function() {
		$('#dataTables-rol').DataTable({
			responsive : true,
			language: {"url": "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"}
		});
		
		$('a[name="eliminar-rol"]').click(function() {
			return confirm("¿Desea eliminar este registro?");
		});
		
		$('#rolForm').submit(function(){
			$.ajax({
				url:"/roles/add",
				type:'POST',
				success: function(data){
					$('#result').show('fade');
				}
			});
		});
	});
	
	
	function validar(){
    	var est = document.getElementById('nom').value;
    	var isopa = document.getElementById('des').value;
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

	$("#formulario_eliminar").submit(function(event){
		event.preventDefault();
		var id_eliminar = $('#hdn_id_eliminar').val();
		window.location.href = "/sisconta/roles/delete/" + id_eliminar;
	});

	
</script>