<?php
$procurar = "";
if (isset($_POST["pesquisar_status"]) and $_POST["pesquisar_status"] == "0") { 
	$procurar = "where Status_Chamada = 0";
} elseif (isset($_POST["codigo_chamado"]) and strlen($_POST["codigo_chamado"]) > 0){
	$procurar = "where Codigo_Chamada like '%" . $_POST["codigo_chamado"] . "%'";
} else {
	$procurar = "where Status_Chamada = 1";
}	
$query = "select Codigo_Chamada as codigo, Empresa as empresa, Status_Chamada as status, Data_Status as data, ID_Controle as controle from controle_chamados inner join status_chamados on controle_chamados.PK_Status = status_chamados.ID_Status inner join todos_chamados on controle_chamados.PK_Chamada = todos_chamados.ID_Chamada " . $procurar . " order by ID_Controle desc;";
