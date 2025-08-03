<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>BD Mundial - Listar Edicões</title></head>
<body background=#ffffff>
<p><h3>Listagem de edições</h3></p>
<?php
require('bdmundial.php');

$clientes = new Edicoes;
$clientes->ClientesLoja();
$clientes->listarClientes();
$clientes->fecharBDClientes();
?>
<br>
<a href="menu.html">voltar ao menu</a>
</body>
</html>