<?php
#Recebendo o valor e ja garantindo o redirecionamento
$get_controle = $_GET["controle"];
if (strlen($get_controle) == 0) {
	header("Location: ./");
}
#Subindo a pagina
include_once("../banco/banco.php");
include_once("../funcoes/funcoes-gerais.php");
include_once("../chamadas/cabecalho-pagina.php");
include_once("../chamadas/menu.php");
include_once("../chamadas/registrar-chamada.php");
include_once("../chamadas/procurar-chamada.php");
include_once("../chamadas/contador-chamada.php");
include_once("../chamadas/ajuda.php");
include_once("../chamadas/pagina-corpo.php");
$chamadas = $conexao_banco->query('select ID_Chamada as chamada, Codigo_Chamada as codigo, Empresa as empresa from controle_chamados inner join status_chamados on controle_chamados.PK_Status = status_chamados.ID_Status inner join todos_chamados on controle_chamados.PK_Chamada = todos_chamados.ID_Chamada where ID_Controle = ' . $get_controle . ';');
$valor_chamada = "";
if ($chamadas->rowCount() > 0) {
?>
<h1>Detalhes</h1>
<table class="table table-bordered">
	<thead class="thead-light">
		<tr>
			<th>Código</th>
			<th>Empresa</th>
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
                		<th>
                		    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#alterar_chamada">Alterar chamada</button>
                		    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#adicionar_historico">Adicionar no histórico</button>
				    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deletar_chamada">Deletar chamada</button>
                		</th>
			</tr>
		<?php
		$valor_chamada = $chamada["chamada"];
		}
		?>
	</tbody>
</table>
<?php
} else {
?>
<h1>Nenhuma chamada registrada!</h1>
<?php
}
?>

<div class="modal fade bd-example-modal-lg" id="deletar_chamada" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Deletar chamada</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="registrar.php" method="POST">
					<input type="hidden" name="deletar_chamada" value="True">
                		        <input type="hidden" name="deletar_id_chamada" value="<?=$valor_chamada;?>">
 
				</div>
				<p class="texto-modal">Tem certeza que deseja realizar a ação?</p>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
					<button class="btn btn-warning my-2 my-sm-0" type="submit">Deletar</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade bd-example-modal-lg" id="alterar_chamada" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Alterar chamada</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="registrar.php" method="POST">
					<table class="table table-borderless">
						<?php
						$query = 'select Codigo_Chamada, Empresa from todos_chamados where ID_Chamada = ' . $valor_chamada . ';';
						$chamadas = $conexao_banco->query($query);
				        	foreach ($chamadas as $chamada) {
						?>
						<input type="hidden" name="id_chamada" value="<?=$valor_chamada;?>">
						<input type="hidden" name="retorno" value="<?=$get_controle;?>">
						<input type="hidden" name="alterar_chamada" value="True">
							<td><label class="col-form-label">Codigo:</label></td>
							<td><input type="text" class="form-control" value="<?=$chamada["Codigo_Chamada"]?>" name="codigo_chamada" maxlength="100" placeholder="EX: 000000000" autocomplete="off" required></td>
						</tr>	
						<tr>
							<td><label class="col-form-label">Empresa:</label></td>
							<td><input type="text" class="form-control" value="<?=$chamada["Empresa"];?>" name="empresa" maxlength="100" placeholder="EX: Empresa" autocomplete="off" required></td>
						</tr>
						<?php
						}
						?>	
					</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
				<button class="btn btn-success my-2 my-sm-0" type="submit">Alterar</button>
			</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade bd-example-modal-lg" id="adicionar_historico" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Adicionar ocorrencia</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="registrar.php" method="POST">
					<table class="table table-borderless">
					
						<input type="hidden" name="id_chamada" value="<?=$valor_chamada;?>">
						<input type="hidden" name="retorno" value="<?=$get_controle;?>">
						<input type="hidden" name="registrar_chamada" value="True">
						<tr>
							<td><label class="col-form-label">Status:</label></td>
							<td>
								<select name="status" class="form-control" required>
									<option value="...">...</option>
									<option value="0">Fechado</option>
									<option value="1">Aberto</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label class="col-form-label">Descrição:</label></td>
							<td><textarea class="form-control" name="descricao" placeholder="Descrição"></textarea></td>
						</tr>
					</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
				<button class="btn btn-success my-2 my-sm-0" type="submit">Registrar</button>
			</div>
			</form>
		</div>
	</div>
</div>


<?php
$historicos = $conexao_banco->query('select Data_Status as data, Status_Chamada as status, Descricao as descricao, ID_Status as ids from status_chamados where PK_Chamada = ' . $get_controle . ' order by ID_Status desc;');
if ($historicos->rowCount() > 0) {
?>
<h1>Histórico</h1>
<table class="table table-bordered">
    <thead class="thead-light">
        <tr>
            <th>Data</th>
            <th>Status</th>
            <th>Descrição</th>
            <th>Funções</th>
        </tr>
    </thead>
    <tbody class="corpo-tabela">
        <?php
        foreach ($historicos as $historico) {
        ?>
            <tr>
               	<th><?=data($historico["data"]);?></th>
		<th class="status<?=$historico["status"];?>"><?=status($historico["status"]);?></th>
                <th><?=$historico["descricao"];?></th>
                <th>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modificar_historico<?=$historico["ids"]?>">Alterar historico</button>

<div class="modal fade bd-example-modal-lg" id="modificar_historico<?=$historico["ids"]?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Alterar historico</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="registrar.php" method="POST">
					<table class="table table-borderless">
                		        	<input type="hidden" name="id_historico" value="<?=$historico["ids"]?>">
		                        	<input type="hidden" name="retorno" value="<?=$get_controle;?>">
                		        	<input type="hidden" name="alterar_historico" value="True">
						<tr>
							<td><label class="col-form-label">Data:</label></td>
							<td><input class="form-control" name="data" placeholder="Data"></textarea></td>
						</tr>
						<tr>
							<td><label class="col-form-label">Status:</label></td>
							<td>
								<select name="status" class="form-control" required>
									<option value="...">...</option>
									<option value="0">Fechado</option>
									<option value="1">Aberto</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label class="col-form-label">Descrição:</label></td>
							<td><textarea class="form-control" name="descricao" placeholder="Descrição"></textarea></td>
						</tr>
                    			</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
				<button class="btn btn-success my-2 my-sm-0" type="submit">Alterar</button>
			</div>
				</form>
		</div>
	</div>
</div>

                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deletar_historico<?=$historico["ids"]?>">Deletar histórico</button>

<div class="modal fade bd-example-modal-lg" id="deletar_historico<?=$historico["ids"]?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Deletar histórico</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="registrar.php" method="POST">
					<input type="hidden" name="valor_historico" value="<?=$historico["ids"];?>">
		            <input type="hidden" name="retorno" value="<?=$get_controle;?>">
 		       	    <input type="hidden" name="deletar_historico" value="True">
				</div>
				<p class="texto-modal">Tem certeza que deseja realizar a ação?</p>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
					<button class="btn btn-warning my-2 my-sm-0" type="submit">Deletar</button>
				</div>
			</form>
		</div>
	</div>
</div>


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
<h1>Nenhuma histórico da impressora</h1>
<?php
}
include_once("../chamadas/fechando-banco.php");
include_once("../chamadas/fim-corpo.php");
