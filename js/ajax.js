//Input com ajax no formulario
$(document).ready(function(){
//Recebe o value do input id rg
$("input[name='rg']").blur(function(){
	//Variaveis input
	var $visitante = $("input[name='visitante']");
	var $empresa = $("input[name='empresa']");
	var $receber = $("input[name='receber_visita']");

	//Capturando os valores
	var visitante_valor = document.getElementById('visitante').value;
	var empresa_valor = document.getElementById('empresa').value;
	var receber_valor = document.getElementById('receber_visita').value;

	//Mensagem temporaria caso demore a procura
	$visitante.val('Carregando...');
	$empresa.val('Carregando...');
	$receber.val('Carregando...');
	//Json de resposta
	//Usa uma funcao para pesquisar
	//Procura pelo campo rg
	$.getJSON( '../funcoes/ajax-resposta.php', { rg: $( this ).val() },
		//Funcao de retorno de valor procurando pelo arquivo json
		function( json ) {
			
			//Zerando os valores
			$visitante.val('');
			$empresa.val('');
			$receber.val('');
		
			/*
			 * console.log(json);
			 * console.log(visitante_valor);
			 * console.log(json.visitante);
			 * console.log(json.visitante.length != 0);
			 * console.log(json.visitante.length);
			*/	
			
			//Os else sao por seguranca para na carregar nada dentro do campo
			if(json.visitante.length != 0) {
				$visitante.val(json.visitante);
			} else {
				$visitante.val(visitante_valor);
			}
			if(json.empresa.length != 0) {
				$empresa.val(json.empresa);
			} else {
				$empresa.val(empresa_valor);
			}
			if(json.receber.length != 0) {
				$receber.val(json.receber);
			} else {
				$receber.val(receber_valor);
			}
		}
	);
	});
});
