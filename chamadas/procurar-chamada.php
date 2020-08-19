<div class="modal fade bd-example-modal-lg" id="pesquisar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Pesquisa</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="index.php" method="POST">
					<table class="table table-borderless">
						<tr>
							<td><label class="col-form-label">Procurar código das chamadas:</label></td>
							<td><input type="text" class="form-control" name="codigo_chamado"></td>
						</tr>
						<tr>
							<td><label class="col-form-label">Status das chamadas:</label></td>
							<td>
								<select name="pesquisar_status" class="form-control">
									<option value="">...</option>
									<option value="1">Aberto</option>
									<option value="0">Fechado</option>
								</select>
							</td>
						</tr>
					</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
				<button class="btn btn-success my-2 my-sm-0" type="submit">Pesquisar</button>
			</div>
				</form>
		</div>
	</div>
</div>
