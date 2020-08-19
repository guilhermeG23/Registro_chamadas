<?php
//Chamando o banco e funcoes para cadastrar a visita
include("../banco/banco.php");
include("../funcoes/funcoes-gerais.php");

#Alterar chamada
if (isset($_POST["alterar_chamada"]) and $_POST["alterar_chamada"] == "True") {
    if (isset($_POST["id_chamada"]) and isset($_POST["codigo_chamada"]) and isset($_POST["empresa"])) {        
        $valores = ["e1" => $_POST["codigo_chamada"], "e2" => $_POST["empresa"], "e3" => $_POST["id_chamada"]];
        $conexao_banco->prepare('update todos_chamados set Empresa = :e1, Codigo_Chamada = :e2 where ID_Chamada = :e3')->execute($valores);
    }
    header("Location: atualizar.php?controle=" . $_POST["retorno"]);
    die();
}  

#Registrar chamado
if (isset($_POST["registrar_chamado"]) and $_POST["registrar_chamado"] == "True") {
    if (isset($_POST["codigo"]) and isset($_POST["empresa"]) and isset($_POST["descricao"])) {
        #Insert
        $conexao_banco->prepare('insert into todos_chamados values (0,?,?)')->execute([$_POST["empresa"], $_POST["codigo"]]);

        $chamado_demonstracao = "";
        $status_demonstracao = "";

        $query1 = "select ID_Chamada as chamado from todos_chamados order by ID_Chamada desc limit 1";
        $chamados = $conexao_banco->query($query1);
        foreach ($chamados as $chamada) {
            $chamado_demonstracao = $chamada["chamado"];
        }

        #Insert
        $conexao_banco->prepare('insert into status_chamados values (0,?,?,?,?)')->execute([$chamado_demonstracao, $_POST["descricao"], 1, date("Y-m-d H:i:s")]);

        $query2 = "select ID_Status as status from status_chamados order by ID_Status desc limit 1";
        $status = $conexao_banco->query($query2);
        foreach ($status as $statu) {
            $status_demonstracao = $statu["status"];
        }
        
        #Insert
        $conexao_banco->prepare('insert into controle_chamados values (0,?,?)')->execute([$chamado_demonstracao, $status_demonstracao]);

    }

    header("Location: index.php");
    die();
}

#Registrar historico
if (isset($_POST["registrar_chamada"]) and $_POST["registrar_chamada"] == "True") {
    if (isset($_POST["id_chamada"]) and isset($_POST["status"]) and isset($_POST["descricao"])) {

        $conexao_banco->prepare('insert into status_chamados values (0,?,?,?,?)')->execute([$_POST["id_chamada"], $_POST["descricao"], $_POST["status"], date("Y-m-d H:i:s")]);

        $revisao_demonstracao = "";
        $query = "select ID_Status as status from status_chamados order by ID_Status desc limit 1";
        $revisoes = $conexao_banco->query($query);
        foreach ($revisoes as $revisao) {
            $revisao_demonstracao = $revisao["status"];
        }

        $valores = ["e1" => $revisao_demonstracao, "e2" => $_POST["id_chamada"]];
        $conexao_banco->prepare('update controle_chamados set PK_Status = :e1 where PK_Chamada = :e2')->execute($valores);

    }
    header("Location: atualizar.php?controle=" . $_POST["retorno"]);
    die();

}

#Deletar chamada
if (isset($_POST["deletar_chamada"]) and $_POST["deletar_chamada"] == "True") {
    if (isset($_POST["deletar_id_chamada"])) {
        $conexao_banco->prepare('delete from controle_chamados where PK_Chamada = ?')->execute([$_POST["deletar_id_chamada"]]);
        $conexao_banco->prepare('delete from status_chamados where PK_Chamada = ?')->execute([$_POST["deletar_id_chamada"]]);
        $conexao_banco->prepare('delete from todos_chamados where ID_Chamada = ?')->execute([$_POST["deletar_id_chamada"]]);
    }
    header("Location: index.php");
    die();
}

#Alterar historico
if (isset($_POST["alterar_historico"]) and $_POST["alterar_historico"] == "True") {
    if (isset($_POST["id_historico"]) and isset($_POST["data"]) and isset($_POST["status"]) and isset($_POST["descricao"])) {        
	$valores = ["e1" => $_POST["id_historico"], "e2" => $_POST["data"], "e3" => $_POST["status"], "e4" => $_POST["descricao"]];
	$conexao_banco->prepare('update status_chamados set Descricao = :e4, Status_Chamada = :e3, Data_Status = :e2 where ID_Status = :e1')->execute($valores);
    }
    header("Location: atualizar.php?controle=" . $_POST["retorno"]);
    die();
}

#Deletar historico
if (isset($_POST["deletar_historico"]) and $_POST["deletar_historico"] == "True") {

    if (isset($_POST["valor_historico"])) {

        $query = "select * from controle_chamados where PK_Chamada = " . $_POST["retorno"] . " and PK_Status = " . $_POST["valor_historico"] . " limit 1";

        $chamados = $conexao_banco->query($query);
        if ($chamados->rowCount() == 1) {
            $revisao_demonstracao = "";
            $query = "select ID_Status as status from status_chamados where PK_Chamada = " . $_POST["retorno"] . " order by ID_Status desc limit 2";
            $historicos = $conexao_banco->query($query);
            foreach ($historicos as $historico) {
                $revisao_demonstracao = $historico["status"];
            }
            $conexao_banco->prepare('update controle_chamados set PK_Status = ? where PK_Chamada = ?')->execute([$revisao_demonstracao, $_POST["retorno"]]);
           
            $conexao_banco->prepare('delete from status_chamados where ID_Status = ?')->execute([$_POST["valor_historico"]]);

        } else {
            $conexao_banco->prepare('delete from status_chamados where ID_Status = ?')->execute([$_POST["valor_historico"]]);
        }

    }
    header("Location: atualizar.php?controle=" . $_POST["retorno"]);
    die();
}

#Redirecionamento
include("../chamadas/fechando-banco.php");
header("Location: index.php");
die();
