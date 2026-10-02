<?php
include'../../conectabanco.php';

// Processa o formulário
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $idled = $_POST["id"] ?? "";
    $nome = $_POST["nome"] ?? "";
    $pinor = $_POST["pinor"] ?? "";
    $pinog = $_POST["pinog"] ?? "";
    $pinob = $_POST["pinob"] ?? "";
    if (!empty($nome)) {
        $sql = "INSERT INTO lednicolas ( idlednicolas, nome, pinor, pinog, pinob)
                VALUES (:id, :nome, :pinor, :pinog, :pinob)";
        
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":id", $idled);
        $stmt->bindParam(":nome", $nome);
        $stmt->bindParam(":pinor", $pinor);
        $stmt->bindParam(":pinog", $pinog);
        $stmt->bindParam(":pinob", $pinob);
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


    <label>Nome:  </label>
    <input type="text" name="nome" required><br><br>
    

    <label>Pino R:</label>
    <input type="number" name="pinor" required><br><br>
    
    <label>Pino G:</label>
    <input type="number" name="pinog" required><br><br>
    
    <label>Pino B:</label>
    <input type="number" name="pinob" required><br><br>
    

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
    $sql = "DELETE FROM lednicolas WHERE idlednicolas = :idled";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":idled", $idled);
    $stmt->execute();
}

// UPDATE
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["acao"]) &&
$_POST["acao"] === "update") {
    $idled = $_POST["id"];
    $nome = $_POST["nome"];
    $pinor = $_POST["pinor"];
    $pinog = $_POST["pinog"];
    $pinob = $_POST["pinob"];

    $sql = "UPDATE lednicolas SET nome=:novoNome, pinor:novoPinor, pinog:novoPinog, pinob:novoPinob WHERE idlednicolas = :idled";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":id", $idled);
    $stmt->bindParam(":nome", $nome);
    $stmt->bindParam(":pinor", $pinor);
    $stmt->bindParam(":pinog", $pinog);
    $stmt->bindParam(":pinob", $pinob);
    $stmt->execute();
}
$sql = 'SELECT idlednicolas,nome, pinor, pinog, pinob FROM lednicolas';
$resultado = $conn->query($sql);
foreach ($resultado as $row) {
    echo "<tr>";

    echo "<td>
            <!-- Formulário UPDATE -->
            <form method='post' action='' style='display:inline;'>
                <input type='hidden' name='acao' value='update'>
                <input type='hidden' name='idled' value='$row[0]'>
                <label>Nome:<input type='text' name='novoNome' value='$row[1]'><br><br>
                <label>Pino R:<input type='number' name='novoPinor' value='$row[2]'><br><br>
                <label>Pino G:<input type='number' name='novoPinog' value='$row[3]'><br><br>
                <label>Pino B:<input type='number' name='novoPinob' value='$row[4]'><br><br>
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
