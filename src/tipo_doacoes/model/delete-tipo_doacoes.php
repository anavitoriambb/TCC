<?php
    // Instanciar o nosso banco de dados
    include('../../conexao/conn.php');
    // Coleta do ID que será excluído em nosso banco de dados
    $IDTIPO_DOACOES = $_REQUEST['IDTIPO_DOACOES'];
    // Gerar uma querie de exclusão no banco de dados
    $sql = "DELETE FROM TIPO_DOACOES WHERE IDTIPO_DOACOES = $IDTIPO_DOACOES";
    // Executar a querie 
    $resultado = $pdo->query($sql);
    // Testar o resultado da querie
    if($resultado){
        $dados = array(
            'tipo' => 'success',
            'mensagem' => 'Registro excluído com sucesso!'
        );
    } else{
        $dados = array(
            'tipo' => 'error',
            'mensagem' => 'Não foi possível excluir o registro'
        );
    }
    echo json_encode($dados);