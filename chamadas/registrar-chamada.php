<div class="modal fade bd-example-modal-lg" id="registrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Registrar chamada</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="registrar.php" method="POST" id="formulario">
					<div class="form-group">
						<table class="table table-borderless tabela-registro">
							<input type="hidden" value="True" name="registrar_chamado">
							<tr>
								<td><label class="col-form-label">Código da chamada:</label></td>
								<td><input type="text" class="form-control" value="" name="codigo" maxlength="44" placeholder="EX: 000000000" autocomplete="off" required></td>
							</tr>	
							<tr>
								<td><label class="col-form-label">Empresa:</label></td>
								<td><input type="text" class="form-control" value="" name="empresa" maxlength="100" placeholder="EX: Empresa" autocomplete="off" required></td>
							</tr>
								<td><label class="col-form-label">Descrição:</label></td>
								<td><textarea class="form-control" value="" name="descricao" maxlength="255" autocomplete="off" required></textarea></td>
							</tr>	

						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-success">Registrar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
