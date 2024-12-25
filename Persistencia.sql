-- Clientes
INSERT INTO Cliente (nome, telefone, email, endereco) VALUES
('João Silva', '(11) 98765-4321', 'joao.silva@email.com', 'Rua A, 123'),
('Maria Souza', '(21) 99876-5432', 'maria.souza@email.com', 'Av. B, 456');

-- Veículos
INSERT INTO Veiculo (cliente_id, placa, modelo, marca, ano) VALUES
(1, 'ABC-1234', 'Civic', 'Honda', 2020),
(2, 'XYZ-5678', 'Corolla', 'Toyota', 2021);

-- Serviços
INSERT INTO Servico (descricao, preco) VALUES
('Troca de óleo', 200.00),
('Revisão completa', 800.00);

-- Funcionários
INSERT INTO Funcionario (nome, funcao) VALUES
('Carlos Santos', 'Mecânico'),
('Ana Lima', 'Supervisora');

-- Ordens de Serviço
INSERT INTO OrdemServico (cliente_id, veiculo_id, data_abertura, valor_total) VALUES
(1, 1, '2024-12-20 09:00:00', 1000.00),
(2, 2, '2024-12-21 14:00:00', 800.00);

-- Serviços Realizados
INSERT INTO ServicoRealizado (ordem_servico_id, servico_id, funcionario_id, quantidade) VALUES
(1, 1, 1, 1),
(1, 2, 2, 1),
(2, 2, 1, 1);

-- Pagamentos
INSERT INTO Pagamento (ordem_servico_id, metodo, valor, data_pagamento) VALUES
(1, 'Pix', 1000.00, '2024-12-20 10:00:00'),
(2, 'Cartão', 800.00, '2024-12-21 15:00:00');
