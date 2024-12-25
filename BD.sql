CREATE DATABASE Oficina;

USE Oficina;

-- Tabela de Clientes
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(255) UNIQUE,
    endereco VARCHAR(255)
);

-- Tabela de Veículos
CREATE TABLE Veiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    ano INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- Tabela de Serviços
CREATE TABLE Servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de Funcionários
CREATE TABLE Funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    funcao VARCHAR(255) NOT NULL
);

-- Tabela de Ordens de Serviço (OS)
CREATE TABLE OrdemServico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    data_abertura DATETIME NOT NULL,
    data_fechamento DATETIME,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(id)
);

-- Tabela de Serviços Realizados (Relaciona OS e Serviços)
CREATE TABLE ServicoRealizado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ordem_servico_id INT NOT NULL,
    servico_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (ordem_servico_id) REFERENCES OrdemServico(id),
    FOREIGN KEY (servico_id) REFERENCES Servico(id),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(id)
);

-- Tabela de Pagamentos
CREATE TABLE Pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ordem_servico_id INT NOT NULL,
    metodo ENUM('Cartão', 'Dinheiro', 'Pix') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    FOREIGN KEY (ordem_servico_id) REFERENCES OrdemServico(id)
);
