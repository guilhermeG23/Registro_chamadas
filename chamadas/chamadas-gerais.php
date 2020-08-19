<?php
$chamadas = $conexao_banco->query($query);
if ($chamadas->rowCount() > 0) {
?>
<table class="table table-bordered">
	<thead class="thead-light">
		<tr>
			<th>Código</th>
			<th>Empresa</th>
			<th>Status</th>
			<th>Ultima atualização</th>
			<th>Funções</th>
		</tr>
	</thead>
	<tbody class="corpo-tabela">
		<?php
		foreach ($chamadas as $chamada) {
		?>
			<tr>
				<th><?=$chamada["codigo"];?></th>
				<th><?=$chamada["empresa"];?></th>
				<th class="status<?=$chamada["status"];?>"><?=status($chamada["status"]);?></th>
				<th><?=data($chamada["data"]);?></th>
	            		<th>
    	    	    			<form action="atualizar.php" method="GET">
                			    <input type="hidden" name="controle" value="<?=$chamada["controle"];?>">
        	        		    <button type="submit" class="btn btn-primary">Atualizar</button>
            	    			</form>
	        		</th>
			</tr>
		<?php
		}
		?>
	</tbody>
</table>
<?php
} else {
?>
<h1>Nenhuma chamada a apresentar, verifique os métodos de pesquisa.</h1>
<?php
}
?>
