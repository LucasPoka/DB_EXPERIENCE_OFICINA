SELECT * FROM Cliente;

SELECT * FROM OrdemServico WHERE valor_total > 900;

SELECT id, valor_total, valor_total * 0.15 AS imposto FROM OrdemServico;

SELECT nome, funcao FROM Funcionario ORDER BY nome ASC;

SELECT cliente_id, COUNT(*) AS total_ordens
FROM OrdemServico
GROUP BY cliente_id
HAVING total_ordens > 1;

SELECT os.id AS OS_ID, c.nome AS Cliente, v.modelo AS Veiculo, s.descricao AS Servico, sr.quantidade
FROM ServicoRealizado sr
JOIN OrdemServico os ON sr.ordem_servico_id = os.id
JOIN Cliente c ON os.cliente_id = c.id
JOIN Veiculo v ON os.veiculo_id = v.id
JOIN Servico s ON sr.servico_id = s.id;
