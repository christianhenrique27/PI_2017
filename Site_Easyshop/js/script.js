function aviso(){
	
	alert("Informe a sua mensagem e entraremos em contato.")
}


function multiplicacao(){

	//debugger

	var n = 10

	var m = prompt("Digite o multiplicador")

	resultado = n * m

	alert("O resultado é " + resultado + "......")

}


function validar(){

	var nome = document.getElementById("txt_nome").value
	//var nome = $("#txt_nome").val()


	if(nome == ""){
		//alert("Informe o nome")
		
		document.getElementById("txt_nome").style.borderColor = "red"
		// $("#txt_nome").css('border-color','red')


		document.getElementById("msg_nome").innerHTML = "<b>Informe o nome</b>"
		// $("#msg_nome").html("<b>Informe o nome</b>")


		return false
	}

	var email = document.getElementById("txt_email").value

	if(email == ""){
		alert("Informe o e-mail")
		return false;
	}



	return true
}


function mostrarImagens(){
	$(".lancamentos img").show(5000, centralizarImagens)
}


function centralizarImagens(){
	$(".lancamentos img").css("display", "block")
}


