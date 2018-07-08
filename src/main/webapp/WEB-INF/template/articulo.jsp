
	<style>
	* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	
	font-size:22px;
}
li{
	list-style:none;
}

.posi
{	
	background-color: rgba(0,0,255,0.01);
	float:right;
}

#calculadora{
	width: 434px;
	height: 300px;
	margin:auto;
	padding:2px;
	background-color: #65D277;
	border-radius: 10px;
	box-shadow: 8px 8px 5px 5px;
}
.input-valor{
	margin:18px auto;
	width:95%;
	height:45px;
	font-size: 30px;
	overflow:hidden;
	text-align: right;
	color:#48484D;
	padding: 4px;
	background-color:#fff;
	box-shadow: inset -1px -1px 4px 1px #eee;
	border-radius: 12px;
}
.key li{
	width:90px;
	height:30px;
	border-radius:3px;
	color:#fff;
	background-color:#6C73FA;
	cursor:pointer;
	float:left;
	margin: 0px -3px 15px 18px;
	line-height: 30px;
	text-align: center;
	box-shadow: 0px 3px 1px 0px #444651;
}
.key li:hover{
	background-color: #BEF9F0;
	color: #6C73FA;
	transition:0.2s;
}
.key li:active{
	box-shadow: 0px 1px 1px 0px #444651;
}
.verificar{
	width: 93.4% !important;
}


</style>

  <!-- Modal Structure -->
  <div id="modal1" class="modal bottom-sheet posi">
    
	
		  <!-- Modal Trigger -->
	<div id="container">
		<section id="calculadora">
			<!-- Input e clear -->
			<header class="top">
				<div class="input-valor"></div>
			</header>
			<ul class="key">
				<li>7</li>
				<li>8</li>
				<li>9</li>
				<li class="operador">/</li>
				<li>4</li>
				<li>5</li>
				<li>6</li>
				<li class="operador">*</li>
				<li>1</li>
				<li>2</li>
				<li>3</li>
				<li class="operador">-</li>
				<li>0</li>
				<li>.</li>
				<li class="operador">+</li>
				<li>c</li>
				<li class="verificar">=</li>
			</ul>
		</section>
	</div>
	
  </div>
		
	<!-- Funciones materialize-->
	<script>
		$(document).ready(function(){
    // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
    	$('.modal').modal({
    	      dismissible: true, // Modal can be dismissed by clicking outside of the modal
    	      opacity: .5, // Opacity of modal background
    	      inDuration: 300, // Transition in duration
    	      outDuration: 200, // Transition out duration
    	      startingTop: '4%', // Starting top style attribute
    	      endingTop: '10%', // Ending top style attribute
    	      ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
    	        alert("Ready");
    	        console.log(modal, trigger);
    	      },
    	      complete: function() { alert('Closed'); } // Callback for Modal close
    	    });
  });
	</script>
	<!-- calcu -->
	
	<!-- -->
	<script>
	// pego os elementos li e div input
var btn 	  = document.querySelectorAll(".key li"),
	input 	  = document.querySelector(".input-valor"),
	operador  = document.querySelectorAll(".operador");

// Percorro o array para usar todas as informações
for(var i = 0; i < btn.length; i++){
	document.onkeypress = function(event){
		var key = event.charCode; // Mudança de keyCode para charCode, por que o firefox não aceitou keyCode
		//console.log(key);
		//console.log(String.fromCharCode(47));
		for(var e = 0; e <= 10; e++){
			if(key === (48+e)){
				input.innerHTML += e;
			}
		}
		switch (key){
			case 42:
				input.innerHTML += "*";
				break;
			case 43:
				input.innerHTML += "+";
				break;
			case 45:
				input.innerHTML += "-";
				break;
			case 46:
				input.innerHTML += ".";
				break;
			case 47:
				input.innerHTML += "/";
				break;
			case 13:
			case 61:
				var equacao = input.innerHTML;
				if(equacao){
					try {
						input.innerHTML = eval(equacao);
					} catch (e) {
						alert('Erro na expressão');

					} 
				}
				break;
			case 67:
			case 99:
				input.innerHTML = "";
				break;						
			default:
				//console.log("Procurando erros?");
				break;
		}
	};
	btn[i].addEventListener('click',function(){
		var btnVal 	 = this.innerHTML,
			inputVal = input.innerHTML;
		//console.log(btnVal);

		// crio um clear caso o c for clicado
		switch (btnVal){
			case "c":
				input.innerHTML = "";
				break;
			case "=":
				// Crio a variável de equação aqui eu utilizo a função eval do javascript
				var equacao = inputVal;
				
				if(equacao){
					try {
						input.innerHTML = eval(equacao);
					} catch (e) {
						alert('Erro na expressão');

					} 
				}
				break;
			default:
				input.innerHTML += btnVal;
				break;	
		}

	});
}
		</script>

