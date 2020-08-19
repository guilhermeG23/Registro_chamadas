<?php

//$conexao_banco = mysqli_connect('banco', 'usuario', 'senha', 'database');
#$banco = '<modelo de banco>:host=<banco>;port=<porta>;dbname=<database>;charset=<charset>';
#$usuario = '';
#$senha = '';

$banco = 'mysql:host=eowyn;port=3306;dbname=chamados;charset=utf8';
$usuario = 'chamadas';
$senha = 'rr';

try {
	$conexao_banco = new PDO($banco, $usuario, $senha);
} catch (PDOException $erro_conexao) {
?>
	<div class="container abaixar-container">
		<div class="jumbotron jumbotron-fluid">
			<h1 class='display-4'>Aplicação está apresentando pequenos problemas no momento, já estamos verificando...</h1>
			<br>
			<hr class="my-4">
			<br>
			<p><b>Problema: </b><?=$erro_conexao;?></p>
		</div>
	</div>
<?php
	die();
}
