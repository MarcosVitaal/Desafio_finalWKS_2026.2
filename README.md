[README.md](https://github.com/user-attachments/files/31607385/README.md)
# Desafio Final WKS 26.2 — Clínica Rare

## Sobre o projeto

Este projeto reúne diferentes etapas de análise de dados para a Clínica Rare, utilizando banco de dados, SQL, Python com Machine Learning e Power BI.

O objetivo é organizar os dados da clínica e gerar informações que ajudem no acompanhamento dos pacientes, consultas, pagamentos e resultados financeiros.

## Estrutura do projeto

```text
Desafio_Final_WKS_26.2/
├── 1_Modelagem/
│   ├── Modelo_Conceitual_ER.png
│   └── Modelo_Logico.txt
├── 2_SQL/
│   ├── clinica_care.sql
│   └── Analise_Consultas.docx
├── 3_Python/
│   ├── analise_clinica.ipynb
│   └── dados_limpos.csv
├── 4_Power_BI/
│   ├── Dashboard_ClinicaCare.pbix
│   ├── dados.csv
│   └── Insights_Dashboard.docx
└── README.md
```

## 1. Modelagem

Foi criado um modelo conceitual com as principais entidades da clínica:

- Paciente
- Convênio
- Médico
- Registros de consultas
- Prontuários eletrônicos
- Funcionários
- Pagamentos

O modelo lógico apresenta as tabelas, seus campos, chaves primárias, chaves estrangeiras e relacionamentos.

## 2. SQL

O banco foi desenvolvido em MySQL no schema `clinica_rare`.

O script contém:

- criação das tabelas;
- inserção e atualização dos dados;
- consultas para análise das informações.

Entre as consultas realizadas estão análises de pagamentos, pacientes, convênios, consultas e funcionários.

## 3. Python e Machine Learning

O notebook realiza o tratamento e a análise dos dados com foco em **risco de inadimplência**.

Foram utilizadas etapas de preparação dos dados, criação de variáveis, treinamento do modelo e avaliação dos resultados.

Também é gerado um dataset tratado para utilização nas análises.

## 4. Power BI

O dashboard apresenta informações sobre:

- atendimentos por especialidade;
- faturamento por dia;
- evolução do faturamento;
- atrasos de pagamento;
- distribuição por tipo de plano.

## Principais insights

A análise mostrou maior procura por **Pneumologia e Gastroenterologia** e maior participação do **plano Empresarial (41,7%)**. Também foram observadas variações no faturamento e atrasos de pagamento geralmente curtos.

## Recomendações

Com base nos resultados, foram sugeridas ações como ampliar horários das especialidades mais procuradas, utilizar lembretes de pagamento e fortalecer o relacionamento com clientes empresariais.

## Tecnologias utilizadas

- MySQL
- Python
- Google Colab
- Power BI
- GitHub
