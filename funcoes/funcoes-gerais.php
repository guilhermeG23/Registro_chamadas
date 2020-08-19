<?php

#Arrumando a data
function data($data) {
	//Ajuste da data
	if(strlen($data) >= 10) {
		$retorno = substr($data,8,2) . "/" . substr($data,5,2) . "/" .  substr($data,0,4);
	} else {
		$retorno = "";
	}
	return $retorno;
}

#status
function status($status) {
	if ($status == "1") {
		$status = "Aberto";
	} else {	
		$status = "Fechado";
	}
	return $status;
}

