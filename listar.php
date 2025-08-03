<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>BD Mundiais - Listar</title></head>
<body background=#ffffff>
<p><h3>Listagem de edições de mundiais</h3></p>
<?php
require('projeto_parte2.php');

$produtos = new ProdutosLoja();
$produtos->listarProdutos();
$produtos->fecharBDProdutos();
?>
<br>
<a href="menu.html">voltar ao menu</a>
</body>
</html>