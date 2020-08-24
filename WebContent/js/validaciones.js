function goBack() {
  window.history.back();
}
	
	function ConfirmA(event) {
	//Ingresamos un mensaje a mostrar
	var mensaje = confirm("¿Estas seguro de eliminar?");
	//Detectamos si el usuario acepto el mensaje
	if (mensaje) {
	alert("¡Alumno eliminado!");
	}
	//Detectamos si el usuario denegó el mensaje
	else {
	event.preventDefault();
	return false;
	}
	}
	
	function ConfirmD(event) {
	//Ingresamos un mensaje a mostrar
	var mensaje = confirm("¿Estas seguro de eliminar?");
	//Detectamos si el usuario acepto el mensaje
	if (mensaje) {
	alert("¡Docente eliminado!");
	}
	//Detectamos si el usuario denegó el mensaje
	else {
	event.preventDefault();
	return false;
	}
	}
	
	function ConfirmC(event) {
	//Ingresamos un mensaje a mostrar
	var mensaje = confirm("¿Estas seguro de eliminar?");
	//Detectamos si el usuario acepto el mensaje
	if (mensaje) {
	alert("¡Curso eliminado!");
	}
	//Detectamos si el usuario denegó el mensaje
	else {
	event.preventDefault();
	return false;
	}
	}
	
	
	
	
	
	
 function showLocalidades()
      {
    	var selec= document.getElementById('provincia');
    	var selecLoca= document.getElementById('localidad');
    	 
    	
    	  var userInput = selec.selectedIndex;
    	 // var selected = loca.options[loca.selectedIndex].value;
    	
    	 for(var i=0; i< selecLoca.length ;i++){
    		 
    		 var loca= selecLoca[i];
    		
    		 if(userInput != loca.id)
       	  {
    			 loca.style.display='none';

       	  }else{
       		loca.style.display='';

       	  } 
    	 }    		 

      }



  