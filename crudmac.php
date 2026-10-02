<?php
include'../../conectabanco.php';

// Processa o formulário
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $idmac = $_POST["id"] ?? "";
    $nome = $_POST["nome"] ?? "";
    $ativo = $_POST["ativo"] ?? "";
    if (!empty($idmac) && !empty($nome)) {
        $sql = "INSERT INTO macnicolas (idmacnicolas, nome, ativo)
                VALUES (:id, :nome, :ativo)";
        
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":id", $idmac);
        $stmt->bindParam(":nome", $nome);
        $stmt->bindParam(":ativo", $ativo);
        $stmt->execute();
        // Redireciona para evitar reinclusão com F5
            header("Location: ".$_SERVER['PHP_SELF']."?status=sucesso");
            exit();        
    } else {
    }
}
?>
<html>
        <link rel="stylesheet" href="https://projeto4.migueldebarba.com.br/tools/style.css">
    <!-- Formulário -->

<div class = "container">
<form method="post" action="">
    <label>IdMAC:</label>
    <input type="text" name="id" required><br><br>

    <label>Nome:</label>
    <input type="text" name="nome" required><br><br>
    
    <input type="checkbox" id = "ativo" name="ativo" value = 1>
    <label for="ativo">Ativo</label>
    
    <button type="submit">Salvar</button>
</form>
    
</div>
<div class ="container">
<h3>Placas MAC</h3>
<table border="1">
<tr>
</tr>

<?php

// DELETE
if (isset($_GET["delete"])) {
    $idmac = $_GET["delete"];
    $sql = "DELETE FROM macnicolas WHERE idmacnicolas = :idmac";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":idmac", $idmac);
    $stmt->execute();
}

// UPDATE
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["acao"]) &&
$_POST["acao"] === "update") {
    $idmac = $_POST["idmac"];
    $novoNome = $_POST["novoNome"];
    $novoAtivo = $_POST["novoAtivo"];

    $sql = "UPDATE macnicolas SET nome=:novoNome, ativo=:novoAtivo WHERE idmacnicolas = :idmac";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":idmac", $idmac);
    $stmt->bindParam(":novoNome", $novoNome);
    $stmt->bindParam(":novoAtivo", $novoAtivo);
    $stmt->execute();
}
$sql = 'SELECT idmacnicolas,nome, ativo FROM macnicolas';
$resultado = $conn->query($sql);
foreach ($resultado as $row) {
    echo "<tr>";

    echo "<td>
            <!-- Formulário UPDATE -->
            <form method='post' action='' style='display:inline;'>
                <input type='hidden' name='acao' value='update'>
                <input type='hidden' name='idmac' value='$row[0]'>
                <label>Nome:<input type='text' name='novoNome' value='$row[1]'>
                <label>Ativo:<input type='number' id = 'novoAtivo' name='novoAtivo' value='$row[2]'>
                <button type='submit'>Atualizar</button>
            </form>
            <!-- Link DELETE -->
            <a  href='?delete=$row[0]' onclick=\"return confirm('Deseja excluir?')\">Excluir</a>
          </td>
          </tr>";
}
?>
</table>
</div>
</html>
