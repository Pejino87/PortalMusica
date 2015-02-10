		function validaraltausu()
		{
   		//nombre
   			valorusu = document.getElementById("ponusu").value;
   			if( valorusu == null || valorusu.length == 0 || /^\s+$/.test(valorusu) ) {
   				alert('[ERROR] El campo debe tener un nombre usuario VALIDO');
   			  return false;
   			}
   		//contraseña
   			valorpwd = document.getElementById("ponpwd").value;
   			if( valorpwd == null || valorpwd.length < 4 || /^\s+$/.test(valorpwd) ) {
   				alert('[ERROR] La CONTRASEÑA debe tener un nombre VALIDO y MINIMO 4 CARACTERES');
   			  return false;
   			}
		}   
   
   		function validaraltacliente()
   		{	
   			//nombre
   			valornom = document.getElementById("ponnombre").value;
   			if( valornom == null || valornom.length == 0 || /^\s+$/.test(valornom) ) {
   				alert('[ERROR] El campo debe tener un nombre VALIDO');
   			  return false;
   			}
   			//apellidos
   			valorape = document.getElementById("ponape").value;
   			if( valorape == null || valorape.length == 0 || /^\s+$/.test(valorape) ) {
   				alert('[ERROR] El campo debe tener un apellido VALIDO');
   			  return false;
   			}
   						
   			//nif
   			valornif = document.getElementById("ponnif").value;
   			if( valornif == null || valornif.length != 9 || /^\s+$/.test(valornif) ) {
   				alert('[ERROR] El campo debe tener un nif VALIDA');
   			  return false;
   			}
   			//dirección
   			valordire = document.getElementById("pondire").value;
   			if( valordire == null || valordire.length == 0 || /^\s+$/.test(valordire) ) {
   				alert('[ERROR] El campo debe tener una DIRECCION VALIDA');
   			  return false;
   			}
   			//teléfono
   			valortele = document.getElementById("pontele").value;
   			if(valortele == null || valortele.length != 9 || isNaN(valortele) ) {
   				alert('[ERROR] El TELEFONO debe ser VALIDO');
   			  return false;
   			}
   			//email
   			if(!validarEmail(document.getElementById("poncorreo").value))	// validamos el correo valido
   		    { 
   			 alert("Ingrese un correo VALIDO");
   			 return false;
   			}		
   			//usuario
   			valornom1 = document.getElementById("ponusuCli").value;
   			if( valornom1 == null || valornom1.length == 0 || /^\s+$/.test(valornom1) ) {
   				alert('[ERROR] El campo debe tener un USUARIO VALIDO');
   			  return false;
   			}
   			
   			//contraseña
   			valorcontra = document.getElementById("poncontra").value;
   			if( valorcontra == null || valorcontra.length < 4 || /^\s+$/.test(valorcontra) ) {
   				alert('[ERROR] La CONTRASEÑA debe tener un nombre VALIDO y MINIMO 4 CARACTERES');
   			  return false;
   			}
   			//REPITA contraseña
   			valorcontra1 = document.getElementById("poncontra1").value;
   			if( valorcontra1 == null || valorcontra1.length < 4 || /^\s+$/.test(valorcontra1) ) {
   				alert('[ERROR] La CONTRASEÑA debe tener un nombre VALIDO y mínimo 4 CARACTERES');
   			  return false;
   			}
   			if (valorcontra != valorcontra1) {
   				alert('[ERROR] La CONTRASEÑA no es la misma.');
     			  return false;
   			}
   			
   		}
   		
   		function validaraltaempresa()
   		{	
   			//nombre
   			valornom = document.getElementById("ponnombreE").value;
   			if( valornom == null || valornom.length == 0 || /^\s+$/.test(valornom) ) {
   				alert('[ERROR] El campo debe tener un nombre VALIDO');
   			  return false;
   			}
   			
   			//razón social
   			valorraz = document.getElementById("ponrazonE").value;
   			if( valorraz == null || valorraz.length != 9 || /^\s+$/.test(valorraz) ) {
   				alert('[ERROR] El campo debe tener una RAZON SOCIAL VALIDA');
   			  return false;
   			}
   						
   			//dirección
   			valordire = document.getElementById("pondireE").value;
   			if( valordire == null || valordire.length == 0 || /^\s+$/.test(valordire) ) {
   				alert('[ERROR] El campo debe tener una DIRECCION válida');
   			  return false;
   			}
   			//teléfono
   			valortele = document.getElementById("ponteleE").value;
   			if(valortele == null || valortele.length != 9 || isNaN(valortele) ) {
   				alert('[ERROR] El TELEFONO debe ser VALIDO');
   			  return false;
   			}
   			//email
   			if(!validarEmail(document.getElementById("poncorreoE").value))	// validamos el correo valido
   		    { 
   			 alert("Ingrese un correo VALIDO");
   			 return false;
   			}		
   			//usuario
   			valornom = document.getElementById("ponusuE").value;
   			if( valornom == null || valornom.length == 0 || /^\s+$/.test(valornom) ) {
   				alert('[ERROR] El campo debe tener un Usuario VALIDO');
   			  return false;
   			}
   			
   			//contraseña
   			valorcontraE = document.getElementById("poncontraE").value;
   			if( valorcontraE == null || valorcontraE.length < 4 || /^\s+$/.test(valorcontraE) ) {
   				alert('[ERROR] La CONTRASEÑA debe tener un nombre VALIDO y MINIMO 4 CARACTERES');
   			  return false;
   			}
   			//REPITA contraseña
   			valorcontraE1 = document.getElementById("poncontraE1").value;
   			if( valorcontraE1 == null || valorcontraE1.length < 4 || /^\s+$/.test(valorcontraE1) ) {
   				alert('[ERROR] La CONTRASEÑA debe tener un nombre VALIDO y mínimo 4 CARACTERES');
   			  return false;
   			}
   			if (valorcontraE != valorcontraE1) {
   				alert('[ERROR] La CONTRASEÑA no es la misma.');
     			  return false;
   			}
   			
   			
   		}

   		function validarEmail(valor) {
   		  if (/(\w+)(\.?)(\w*)(\@{1})(\w+)(\.?)(\w*)(\.{1})(\w{2,3})/.test(valor)){
   			return true;
   		  } else {
   			return false;
   		  }
   		}