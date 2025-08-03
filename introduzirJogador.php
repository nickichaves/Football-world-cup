<html>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<head><title>BD Mundial - Introduzir Jogador</title>
</head>
<body background=#ffffff>
<?php
require('bdmundial.php');

$jogador = new JogadoresMundial;
$jogador->JogadoresMudial();
$jogador->novoJogador($_POST["nome"], $_POST["data"], $_POST["clube"], $_POST["camisola"], $_POST["posicao"], $_POST["internacionalizacoes"], $_POST["estado"]);
$jogador->fecharBDJogadoresMundial();
?>
<br>
<a href="comitiva.html">voltar</a>
</body>
</html>