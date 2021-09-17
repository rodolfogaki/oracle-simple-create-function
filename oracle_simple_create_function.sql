CREATE OR REPLACE FUNCTION get_valor_venda(
    in_id_produto PLS_INTEGER
) 
RETURN NUMBER
IS
    valor_venda NUMBER(11,2) := 0;
BEGIN
    select a.valor_compra + ((a.valor_compra*a.percentual_lucro) / 100)
      into valor_venda
      from produto a
     where a.id_produto = in_id_produto
    ;

    RETURN valor_venda;
END;

/*
-- CRIACAO DE TABELAS
CREATE TABLE produto_categoria (
    id_categoria NUMBER(11) NOT NULL,
    descricao VARCHAR2(100) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE produto (
    id_produto NUMBER(11) NOT NULL,
    id_categoria NUMBER(11) NOT NULL,
    descricao VARCHAR2(100) NOT NULL,
    valor_compra NUMBER(11,2) NOT NULL,
    percentual_lucro NUMBER(11) NOT NULL,
    PRIMARY KEY (id_produto),
    CONSTRAINT FK_id_categoria FOREIGN KEY (id_categoria)
    REFERENCES produto_categoria(id_categoria)
);

-- INCLUSAO DE INFORMACOES
insert into produto_categoria values (1,'Bebidas');
insert into produto values (1,1,'Coca-Cola 2L',3.50,35);
insert into produto values (2,1,'Bohemia 350ML',1.50,70);
*/