C1:

CREATE VIEW EdicaoComMaisParticipantes (edicao, elementocomitiva) 
AS SELECT edicao.Ano, COUNT(*) AS "# Total_Participantes"
FROM elementocomitiva, edicao, comitiva
WHERE edicao.Ano = elementocomitiva.Comitiva_Ano AND comitiva.Pais=elementocomitiva.Comitiva_Pais
GROUP BY edicao.Designacao;

SELECT edicao.Designacao, Total_Participantes
FROM EdicaoComMaisParticipantes 
WHERE total_participantes >= ALL (select Total_Participantes FROM
EdicaoComMaisParticipantes)

OU

CREATE VIEW ParticipantesPorEdicao (edicao, Total_Participantes)
AS SELECT edicao.Ano, COUNT(*) AS "# Total_Participantes"
FROM elementocomitiva, edicao, comitiva
WHERE edicao.Ano = elementocomitiva.Comitiva_Ano AND comitiva.Pais=elementocomitiva.Comitiva_Pais
GROUP BY edicao.Designacao;

CREATE VIEW EdicaoComMaisParticipantes 
As SELECT ParticipantesPorEdicao.edicao
WHERE total_participantes = (SELECT max(total_participantes) FROM ParticipantesPorEdicao)



C2:

CREATE VIEW SelecaoComMaiorPatrocinio (selecao, patrocinio)
AS SELECT selecao, p.Montante, c.Patrocinador_Oficial_sigla
FROM selecao s, patrocinio p, comitiva c
WHERE s.Pais=p.Comitiva_Pais_ AND s.Pais=c.Pais AND s.;

SELECT selecao, montante FROM SelecaoComMaiorPatrocinio
WHERE montante >= ALL(SELECT montante FROM SelecaoComMaiorPatrocinio);



C3:

CREATE VIEW PercentagemPatrocinadores (comitiva, patrocinio)
AS SELECT comitiva, SUM(p.Montante) AS "# Total_Montante"
FROM patrocinio p, comitiva c
WHERE  c.Pais=p.Comitiva_Pais_;

SELECT comitiva, patrocinio.Patrocinador_Sigla_, (patrocinio.Montante/Total_Montante) * 100 
FROM PercentagemPatrocinadores



C4:

CREATE VIEW JogadoresSemJogos(jogadorjogo, EstadoJogador) 
AS SELECT j.JogadorSelecao, j.EstadoJogador
FROM jogadorjogo j, jogo, selecao
WHERE j.Jogo_numero=jogo.Numero AND selecao.Pais=jogadorselecao.Selecao_Pais AND jogadorselecao.NumCamisola=jogadorjogo=JogadorSelecao_NumCamisola 
AND j.EstadoJogador="Dispensado" OR j.EstadoJogador="Lesionado" OR j.EstadoJogador="Castigado"
GROUP BY edicao, jogadorjogo.JogadorSelecao_Pais, jogadorjogo.JogadorSelecao_NumCamisola



C5:

CREATE VIEW MaiorNumeroDeSusbstituicoes (jogadoremcampo, subtituicao)
AS SELECT jogadoremcampo.JogadorSelecao_NumCamisola, COUNT(*) AS "# Total_Substituicoes" 
FROM substituicao, edicao e, jogadoremcampo jc, jogadorjogo jj, jogadorselecao js, selecao s
WHERE jc.JogadorSelecao_NumCamisola=jj.JogadorSelecao_NumCamisola AND jj.JogadorSelecao_NumCamisola=js.NumCamisola AND js.Selecao_Pais=s.Pais AND s.Ano=e.Ano AND jc.JogadorSelecao_NumCamisola=substituicao.Substituido_JogadorSelecao_NumCamisola OR jc.JogadorSelecao_NumCamisola=substituicao.Substituto_JogadorSelecao_NumCamisola;

SELECT jogadoremcampo, Total_Substituicoes
FROM MaiorNumeroDeSusbstituicoes 
WHERE total_substituicoes >= ALL (select Total_Substituicoes FROM MaiorNumeroDeSusbstituicoes)



C6:

CREATE VIEW MaiorNumeroDePenalizacoes (jogadoremcampo, penalizacao)
AS SELECT jogadoremcampo.Numero, COUNT(*) AS "# Total_Penalizacoes" 
FROM penalizacao, jogadoremcampo, jogo, jogadorjogo
WHERE jogadoremcampo.Jogo_numero=penalizacao.Jogo_Numero AND jogadoremcampo.Jogo_Numero=jogadorjogo.Jogo_Numero AND jogadorjogo.Jogo_Numero=jogo.Numero ;

SELECT jogadoremcampo, Total_Penalizacoes
FROM MaiorNumeroDePenalizacoes 
WHERE total_penalizacoes >= ALL (select Total_Penalizacoes FROM MaiorNumeroDePenalizacoes)



C7:

CREATE VIEW MaiorNumeroDeVermelhos (jogadoremcampo, penalizacao)
AS SELECT edicao.Ano, jogadoremcampo.JogadorSelecao_NumCamisola, COUNT(*) AS "# Total_Vermelhos" 
FROM penalizacao p, edicao e, jogadoremcampo jc, jogadorjogo jj, jogadorselecao js, selecao s
WHERE p.Tipo_Penalizacao='Vermelho' AND p.Jogo_Numero=jc.Jogo_Numero AND jj.Jogo_Numero=js.Jogo_Numero AND js.Selecao_Pais=s.Pais AND s.Ano=e.Ano
GROUP BY edicao.Ano;

SELECT jogadoremcampo, Total_Vermelhos
FROM MaiorNumeroDeVermelhos 
WHERE total_vermelhos >= ALL (SELECT Total_Vermelhos FROM MaiorNumeroDeVermelhos)
HAVING edicao.Ano >= ALL (SELECT Total_Vermelhos FROM MaiorNumeroDeVermelhos)



C8:

CREATE VIEW selecaoPorGrupo (grupo, selecao)
AS SELECT g.Letra, e.Designacao, s.Pais
FROM grupo g, edicao e, selecao s
WHERE e.Ano=g.Edicao_Ano AND g.Letra=s.Grupo_Letra
GROUP BY g.Letra, s.Pais    