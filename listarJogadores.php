<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>BD Mundial - Listar Jogadores</title></head>
<body background=#ffffff>
<p><h3>Listagem de jogadores</h3></p>
<?php
require('bdmundial.php');

$clientes = new JogadoresMundial;
$clientes->JogadoresMudial();
$clientes->listarJogadores();
$clientes->fecharBDJogadores();
?>
<br>
<a href="menu.html">voltar ao menu</a>
</body>
</html>