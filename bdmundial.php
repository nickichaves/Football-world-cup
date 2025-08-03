<?php
/**Esta classe gere as operações realizadas sobre uma base de dados de uma
Edição do Mundial.*/

class BDMundial {
  /**Variável da classe que permite guardar a ligação à base de dados.*/
  var $conn;

  /**Função para ligar à BD do Mundial
   @return Um valor indicando qual o resultado da ligação à base de dados.*/
   function ligarBD() {
      $this->conn = mysqli_connect("localhost", "root", "", "projeto_v2");
	  if(!$this->conn){
		return -1;
	  }
	}
 
 /**Executa um determinado comando SQL, retornando o seu resultado.  
 @param sql_command Comando SQL a ser executado pela função
 @return O resultado do comando SQL.*/
  function executarSQL($sql_command) {
    $resultado = mysqli_query( $this->conn, $sql_command);
    return $resultado;
 }
 
 /**Devolve o número de registos de uma determinada tabela numa base de dados
 @param tabela O nome da tabela onde se deseja verificar o numero de registos.
 @return O numero de registos da tabela.*/
 function numero_tuplos($tabela) {
     $tuplos=0;
	 $rs=$this->executarSQL("SELECT * FROM $tabela");
	 return mysqli_num_rows($rs);  
 }
 
 /**Fecha a ligação à base de dados*/
 function fecharBD() {
 mysqli_close($this->conn);
 }

}



/**Esta classe implementa a gestão de produtos na base de dados da Loja. Permite
efectuar toda uma série de operações sobre a tabela de produtos, nomeadamente
operações de introdução, remoção, consulta e alteração de produtos.*/

class JogadoresMundial extends BDMundial {
 /**Esta variável da classe é responsável pelas operações directas na Base de dados.*/
 var $db_mundial;
 /**Inicializa os jogadores do mundial, e as variáveis da classe.*/
 
 function JogadoresMudial() {
    $this->db_mundial = new BDMundial;
	$this->db_mundial->ligarBD(); 
 }
 


 /**Permite a introdução de um novo jogador na base de dados.
 @param nome O nome do novo jogador a introduzir.
 @param data A data de nascimento do novo jogador a introduzir.
 @param naturalidade A naturalidade do novo jogador a introduzir.
 @param clube O clube do novo jogador a introduzir.
 @param camisola O numero da camisola do novo jogador a introduzir.
 @param posicao A posicao do novo jogador a introduzir.
 @param internacionalizacoes O numero de internacionalizacoes do novo jogador a introduzir.
 @param estado O estado inicial do novo jogador a introduzir.*/
 
 function novoJogador($ElementoComitiva_Numero, $NomeClube, $Selecao_Pais, $Selecao_Ano, $NumCamisola, $NumInternacionalizacoes, $Estado, $Posicao, $Nome, $Nascimento, $N_Golos, $N_Assistencias, $N_Jogos_Sem_Sofrer) {
    $sql = "INSERT INTO jogadorSelecao VALUES ($ElementoComitiva_Numero, $NomeClube, $Selecao_Pais, $Selecao_Ano, $NumCamisola, $NumInternacionalizacoes, $Estado, $Posicao, $Nome, $Nascimento, $N_Golos, $N_Assistencias, $N_Jogos_Sem_Sofrer)";
    $this->db_mundial->executarSQL($sql);
 }



/* coloco todas as primary keys aqui?*/


 /**Apaga um determinado produto da base de dados.
 @param codigo O codigo do produto a apagar.*/
 function apagarJogador($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
 $sql = "DELETE FROM jogadorSelecao WHERE pais = $Selecao_Pais, ano = $Selecao_Ano, camisola = $NumCamisola";
 $this->db_mundial->executarSQL($sql);
 }



/**Altera um determinado produto na base de dados
  @param codigo O codigo do produto a ser alterado
  @param designacao A nova designacao do produto
  @param preco O novo preço do produto.*/
  
  function alterarProduto($ElementoComitiva_Numero, $NomeClube, $Selecao_Pais, $Selecao_Ano, $NumCamisola, $NumInternacionalizacoes, $Estado, $Posicao, $Nome, $Nascimento, $N_Golos, $N_Assistencias, $N_Jogos_Sem_Sofrer) {
  $sql = "UPDATE jogadorselecao SET numero_comitiva ='$ElementoComitiva_Numero', clube = '$NomeClube', internacionalizacoes = '$NumInternacionalizacoes', estado = '$Estado', posicao = '$Posicao', nome = '$Nome', nascimento = '$Nascimento', golos = '$N_Golos', assistencias = '$N_Assistencias', jogos_s_sofrer = '$N_Jogos_Sem_Sofrer' WHERE pais = $Selecao_Pais, ano = $Selecao_Ano, camisola = $NumCamisola";
  $this->db_mundial->executarSQL($sql);
  }



  /**Lista todos os jogadores da base de dados*/
  function listarJogadores() {
	  echo "<table border=1 cellpadding=0 cellspacing=0>\n";
	  $result_set = $this->db_mundial->executarSQL("SELECT * FROM jogadorselecao");
	  $tuplos = mysqli_num_rows($result_set);  // old: $this->db_loja->numero_tuplos("produto");
	  if ($tuplos > 0) {
		  for($registo=0; $registo < $tuplos; $registo++) {
			  echo "<tr>\n";
			  $row = mysqli_fetch_assoc($result_set);
			  $this->escreveJogador($row["ElementoComitiva_Numero "], $row["NomeClube"], $row["Selecao_Pais "], $row["Selecao_Ano"], $row["NumCamisola "], $row["NumInternacionalizacoes"], $row["Estado"], $row["Posicao"], $row["Nome"], $row["Nascimento"], $row["N_Golos"], $row["N_Assistencias"], $row["N_Jogos_Sem_Sofrer"]);
			  echo "</tr>\n";    
		  }
	   echo "</table>\n";
	  }
	  else {
		  echo "N&atilde;o foram encontrados produtos";
	  }
  }



/**Lista todos os jogadores da base de dados cuja designação contiver o valor do parâmetro*/
  function pesquisarProdutos($filtro) {
	  echo "<table border=1 cellpadding=0 cellspacing=0>\n";
	  $result_set = $this->db_mundial->executarSQL("SELECT * FROM jogadorselecao WHERE nome LIKE '%$filtro%'");
	  $n_r =0;
	  while($row = mysqli_fetch_assoc($result_set)){
		$n_r =1;
		echo "<tr>\n";
		$this->escreveJogador($row["ElementoComitiva_Numero "], $row["NomeClube"], $row["Selecao_Pais"], $row["Selecao_Ano"], $row["NumCamisola"], $row["NumInternacionalizacoes"], $row["Estado"], $row["Posicao"], $row["Nome"], $row["Nascimento"], $row["N_Golos"], $row["N_Assistencias"], $row["N_Jogos_Sem_Sofrer"]);
		echo "</tr>\n";    
	  }
	  echo "</table>\n";
	  if($n_r ==0)
		  echo "N&atilde;o foram encontrados produtos";
	  
  }



  /**Escreve os detalhes de um determinado produto
  @param codigo O codigo do produto
  @param designacao A designacao do produto
  @param preco O preço do produto*/
  function escreveJogador($nome, $data, $clube, $camisola, $posicao, $internacionalizacoes, $estado ) {
  printf("<td>$nome</td><td>$data</td><td>$clube</td><td>$camisola</td><td>$posicao</td><td>$internacionalizacoes</td><td>$estado</td><form action=\"apagar.php\" method=post><td><input type=hidden name=camisola value=$camisola><input type=submit value=Apagar></td></form><form action=\"alterar.php\" method=post><td><input type=hidden name=camisola value=$camisola><input type=submit value=Alterar></td></form>\n");
  }



  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return O nome de um determinado produto*/
  function devolveNumeroComitiva($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT ElementoComitiva_Numero FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["ElementoComitiva_Numero"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return A data de um determinado produto*/
  function devolveNomeClube($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT NomeClube FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["NomeClube"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return A naturalidade de um determinado produto*/
  function devolveNumInternacionalizacoes($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT NumInternacionalizacoes FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["NumInternacionalizacoes"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return O clube de um determinado produto*/
  function devolveEstado($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT Estado FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["Estado"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return A camisola de um determinado produto*/
  function devolvePosicao($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT Posicao FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["Posicao"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return A posicao de um determinado produto*/
  function devolveNome($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT Nome FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["Nome"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return As internacionalizacoes de um determinado produto*/
  function devolveNascimento($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT Nascimento FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["Nascimento"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return O estado de um determinado produto*/
  function devolveGolos($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT N_Golos FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["N_Golos"];
    }
  
  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return O estado de um determinado produto*/
  function devolveAssistencias($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT N_Assistencias FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["N_Assistencias"];
    }

  /**Devolve o campo designacao de um determinado produto
  @param codigo O codigo do produto
  @return O estado de um determinado produto*/
  function devolveJogos_Sem_Sofrer($Selecao_Pais, $Selecao_Ano, $NumCamisola) {
    $sql="SELECT N_Jogos_Sem_Sofrer FROM jogadorselecao WHERE Selecao_Pais  = $Selecao_Pais, Selecao_Ano  = $Selecao_Ano, NumCamisola  = $NumCamisola";
    $result_set = $this->db_mundial->executarSQL($sql);
    $row = mysqli_fetch_assoc($result_set);
    return $row["N_Jogos_Sem_Sofrer"];
    }

  /**Corta a ligação à base de dados*/
  function fecharBDJogadores() {
  $this->db_mundial->fecharBD();
  }
}





 /* FIQUEI AQUI!!!! */

 class Edicoes extends BDMundial {
  /**Esta variável da classe é responsável pelas operações directas na Base de dados.*/
  var $db_mundial;
  /**Inicializa as edições do mundial, e as variáveis da classe.*/
  
  function EdicoesMundial() {
    $this->db_mundial = new BDMundial;
    $this->db_mundial->ligarBD(); 
  }
  
  /**Permite a introdução de um novo cliente na base de dados.
  @param codigo Um c�digo num�rico para identificar o novo cliente.
  @param nome 
  @param morada 
  @param email
  */
  
  function novaEdicao($ano, $designacao, $orcamento, $organizador_1, $organizador_2, $total_selecoes) {
     $sql = "INSERT INTO cliente VALUES ($ano, '$designacao', '$orcamento', '$organizador_1', '$organizador_2','$total_selecoes)";
     $this->db_mundial->executarSQL($sql);
  }
  
  /**Apaga um determinado cliente da base de dados.
  @param codigo O codigo do cliente a apagar.*/
  function apagarEdicao($codigo) {
  $sql = "DELETE FROM cliente WHERE codigo = $codigo";
  $this->db_mundial->executarSQL($sql);
  }
 
 /**Altera um determinado cliente na base de dados
   @param codigo O codigo do cliente a ser alterado
   @param nome   O novo valor para o nome
   @param morada A nova morada do cliente.
   @param email  O nome email do cliente
  */
   
   function alterarEdicao($codigo, $nome, $morada, $email) {
   $sql = "UPDATE cliente SET nome = '$nome', morada = '$morada', email = '$email' WHERE codigo = $codigo ";
   $this->db_mundial->executarSQL($sql);
   }
 
   /**Lista todos os produtos da base de dados*/
   function listarEdicao() {
     echo "<table border=1 cellpadding=0 cellspacing=0>\n";
     $result_set = $this->db_mundial->executarSQL("SELECT * FROM cliente");
     $tuplos = mysqli_num_rows($result_set);  // old: $this->db_loja->numero_tuplos("produto");
     if ($tuplos > 0) {
       for($registo=0; $registo < $tuplos; $registo++) {
         echo "<tr>\n";
         $row = mysqli_fetch_assoc($result_set);
         $this->escreveCliente($row["codigo"], $row["nome"], $row["morada"], $row["email"]);
         echo "</tr>\n";    
       }
     }
     else {
       echo "N&atilde;o foram encontrados clientes";
     }
   }
     
   /**Escreve os detalhes de um determinado cliente
   @param codigo 
   @param nome 
   @param morada 
   @param email
   */
   function escreveEdicao($codigo, $nome, $morada, $email) {
   printf("<td>$codigo</td><td>$nome</td><td>$morada</td><td>$email</td><form action=\"apagarCliente.php\" method=post><td><input type=hidden name=codigo value=$codigo><input type=submit value=Apagar></td></form><form action=\"alterarCliente.php\" method=post><td><input type=hidden name=codigo value=$codigo><input type=submit value=Alterar></td></form>\n");
   }
 
   /** Obt�m da BD o nome de um determinado cliente
   @param codigo O codigo do produto
   @return A designacao de um determinado produto*/
   function devolveNome($codigo) {
   $sql="SELECT nome FROM cliente WHERE codigo=$codigo";
   $result_set = $this->db_mundial->executarSQL($sql);
   $row = mysqli_fetch_assoc($result_set);
   return $row["nome"];
   }
   function devolveMorada($codigo) {
   $sql="SELECT morada FROM cliente WHERE codigo=$codigo";
   $result_set = $this->db_mundial->executarSQL($sql);
   $row = mysqli_fetch_assoc($result_set);
   return $row["morada"];
   }
   function devolveEmail($codigo) {
   $sql="SELECT email FROM cliente WHERE codigo=$codigo";
   $result_set = $this->db_mundial->executarSQL($sql);
   $row = mysqli_fetch_assoc($result_set);
   return $row["email"];
   }
   
   /**Corta a ligação à base de dados*/
   function fecharBDClientes() {
   $this->db_mundial->fecharBD();
   }
 }











class ClientesLoja extends BDMundial {
 /**Esta variável da classe é responsável pelas operações directas na Base de dados.*/
 var $db_loja;
 /**Inicializa os clientes da loja, e as variáveis da classe.*/
 
 function ClientesLoja() {
    $this->db_loja = new BDLoja;
	$this->db_loja->ligarBD(); 
 }
 
 /**Permite a introdução de um novo cliente na base de dados.
 @param codigo Um c�digo num�rico para identificar o novo cliente.
 @param nome 
 @param morada 
 @param email
 */
 
 function novoCliente($codigo, $nome, $morada, $email) {
    $sql = "INSERT INTO cliente VALUES ($codigo, '$nome', '$morada', '$email')";
    $this->db_loja->executarSQL($sql);
 }
 
 /**Apaga um determinado cliente da base de dados.
 @param codigo O codigo do cliente a apagar.*/
 function apagarCliente($codigo) {
 $sql = "DELETE FROM cliente WHERE codigo = $codigo";
 $this->db_loja->executarSQL($sql);
 }

/**Altera um determinado cliente na base de dados
  @param codigo O codigo do cliente a ser alterado
  @param nome   O novo valor para o nome
  @param morada A nova morada do cliente.
  @param email  O nome email do cliente
 */
  
  function alterarCliente($codigo, $nome, $morada, $email) {
  $sql = "UPDATE cliente SET nome = '$nome', morada = '$morada', email = '$email' WHERE codigo = $codigo ";
  $this->db_loja->executarSQL($sql);
  }

  /**Lista todos os produtos da base de dados*/
  function listarClientes() {
	  echo "<table border=1 cellpadding=0 cellspacing=0>\n";
	  $result_set = $this->db_loja->executarSQL("SELECT * FROM cliente");
	  $tuplos = mysqli_num_rows($result_set);  // old: $this->db_loja->numero_tuplos("produto");
	  if ($tuplos > 0) {
		  for($registo=0; $registo < $tuplos; $registo++) {
			  echo "<tr>\n";
			  $row = mysqli_fetch_assoc($result_set);
			  $this->escreveCliente($row["codigo"], $row["nome"], $row["morada"], $row["email"]);
			  echo "</tr>\n";    
		  }
	  }
	  else {
		  echo "N&atilde;o foram encontrados clientes";
	  }
  }
	  
  /**Escreve os detalhes de um determinado cliente
  @param codigo 
  @param nome 
  @param morada 
  @param email
  */
  function escreveCliente($codigo, $nome, $morada, $email) {
	printf("<td>$codigo</td><td>$nome</td><td>$morada</td><td>$email</td><form action=\"apagarCliente.php\" method=post><td><input type=hidden name=codigo value=$codigo><input type=submit value=Apagar></td></form><form action=\"alterarCliente.php\" method=post><td><input type=hidden name=codigo value=$codigo><input type=submit value=Alterar></td></form>\n");
  }

  /** Obt�m da BD o nome de um determinado cliente
  @param codigo O codigo do produto
  @return A designacao de um determinado produto*/
  function devolveNome($codigo) {
  $sql="SELECT nome FROM cliente WHERE codigo=$codigo";
  $result_set = $this->db_loja->executarSQL($sql);
  $row = mysqli_fetch_assoc($result_set);
  return $row["nome"];
  }
  function devolveMorada($codigo) {
  $sql="SELECT morada FROM cliente WHERE codigo=$codigo";
  $result_set = $this->db_loja->executarSQL($sql);
  $row = mysqli_fetch_assoc($result_set);
  return $row["morada"];
  }
  function devolveEmail($codigo) {
  $sql="SELECT email FROM cliente WHERE codigo=$codigo";
  $result_set = $this->db_loja->executarSQL($sql);
  $row = mysqli_fetch_assoc($result_set);
  return $row["email"];
  }
  
  /**Corta a ligação à base de dados*/
  function fecharBDClientes() {
  $this->db_loja->fecharBD();
  }
}
?>




