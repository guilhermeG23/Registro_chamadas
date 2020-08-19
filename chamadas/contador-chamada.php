<div class="modal fade bd-example-modal-lg" id="contador" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Contadores</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<table class="table table-borderless">
					<tr colspan="2">
						<h5 class="modal-title">Status</h5>
					</tr>
					<?php
					$query = "select Status_Chamada as tipo, count(Status_Chamada) as valores from status_chamados inner join controle_chamados on status_chamados.ID_Status = controle_chamados.PK_Status group by Status_chamada;";
					$contadores = $conexao_banco->query($query);
					foreach ($contadores as $contador) {
					?>
					<tr>
						<td><label class="col-form-label"><?=status($contador["tipo"]);?></label></td>
						<td><label class="col-form-label"><?=$contador["valores"];?></label></td>
					</tr>
					<?php
					}
					?>
				</table>
			</div>
		</div>
	</div>
</div>
