# Questão de Normalização

## Alugueis de carros

| Data       | Cod_Cliente | Nome_Cliente | Cod_Funcionario | Nome_Funcionario | Cod_Veiculo | Modelo_Veiculo | Marca_Veiculo | Aluguel_Valor | Aluguel_Tempo | Endereco_Cliente      | Endereco_Funcionario  |
| ---------- | ----------- | ------------ | --------------- | ---------------- | ----------- | -------------- | ------------- | ------------- | ------------- | --------------------- | --------------------- |
| 2025-01-01 | 101         | João         | 11              | Carlos           | 201         | Fusca          | Volkswagen    | 100,00        | 2 dias        | Rua A, 123, São Paulo | Rua B, 456, São Paulo |
| 2025-01-05 | 101         | João         | 14              | Beatriz          | 202         | Gol            | Volkswagen    | 120,00        | 3 dias        | Rua A, 123, São Paulo | Rua F, 678, Curitiba  |

## Sistema de Matrícula de Alunos

| Cod_Aluno | Nome_Aluno | Cod_Curso | Nome_Curso | Cod_Professor | Nome_Professor | Semestre | Cod_Materia | Nome_Materia | Preco_Materia | Preco_Desconto | Total_Matricula | Forma_Pagamento | Status_Matricula | Tipo_Aluno | Campus | Periodo |
| --------- | ---------- | --------- | ---------- | ------------- | -------------- | -------- | ----------- | ------------ | ------------- | -------------- | --------------- | --------------- | ---------------- | ---------- | ------ | ------- |
| 101       | João       | 2001      | Engenharia | 3001          | Carlos         | 2025-1   | 5001        | Cálculo I    | 1000,00       | 100,00         | 900,00          | Cartão          | Ativa            | Regular    | SP     | Noturno |
| 102       | Maria      | 2002      | Medicina   | 3002          | Beatriz        | 2025-1   | 5002        | Biologia     | 1500,00       | 150,00         | 135,00          | Boleto          | Inativa          | Regular    | RJ     | Diurno  |

# Sistema de vendas de Produtos

| Cod_Venda | Cod_Cliente | Nome_Cliente | Cod_Produto | Produto_Nome | Produto_Preco | Quantidade | Cod_Funcionario | Funcionario_Nome | Funcionario_Salario | Data_Venda | Metodo_Pagamento | Status_Venda | Desconto |
| --------- | ----------- | ------------ | ----------- | ------------ | ------------- | ---------- | --------------- | ---------------- | ------------------- | ---------- | ---------------- | ------------ | -------- |
| 101       | 1           | João         | 1           | Smartphone   | 1500,00       | 2          | 1               | Carlos           | 5000,00             | 2025-01-15 | Cartão           | Completa     | 10,00    |
| 102       | 2           | Maria        | 2           | Tablet       | 800,00        | 1          | 2               | Beatriz          | 6000,00             | 2025-01-16 | Boleto           | Cancelada    | 0,00     |
| 103       | 1           | João         | 3           | Notebook     | 2500,00       | 1          | 1               | Carlos           | 5000,00             | 2025-01-17 | Cartão           | Completa     | 20,00    |
