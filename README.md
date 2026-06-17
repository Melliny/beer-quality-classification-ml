# 🍺 Classificação da Qualidade de Cervejas com Ciência de Dados

📌 **Sobre o Projeto** Este projeto foi desenvolvido como trabalho acadêmica da disciplina de Ciência de Dados, com o objetivo de aplicar técnicas de análise de dados e Machine Learning para classificar a qualidade de cervejas a partir de avaliações presentes em uma base de dados pública.

O projeto utiliza Python e R para realizar todo o processo de:
* Coleta e carregamento dos dados
* Tratamento e limpeza da base
* Análise exploratória
* Visualização de dados
* Criação da variável alvo
* Treinamento de modelos de classificação
* Avaliação dos resultados

---

## 📂 Base de Dados

A base utilizada foi o dataset Beer Reviews Dataset, disponível no Kaggle:  
🔗 https://www.kaggle.com/datasets/rdoume/beerreviews

A base contém avaliações de cervejas realizadas por usuários, incluindo informações como:
* Aroma
* Aparência
* Paladar
* Teor alcoólico
* Nota geral
* Estilo da cerveja

---

## 🎯 Objetivo

O objetivo principal do projeto é classificar cervejas entre:
* Excelente (1): nota maior ou igual a 4.0
* Comum (0): nota menor que 4.0

A classificação foi realizada utilizando atributos numéricos relacionados às avaliações sensoriais das cervejas.

---

## 🛠️ Tecnologias Utilizadas

* Python e R
* Pandas e NumPy
* Matplotlib e Seaborn
* Scikit-learn
* Google Colab e RStudio

---

## 📊 Etapas do Projeto

1. **Importação das Bibliotecas:** Foram utilizadas bibliotecas para manipulação, visualização e modelagem de dados.
2. **Carregamento da Base:** O dataset foi carregado automaticamente no ambiente de desenvolvimento.
3. **Amostragem dos Dados:** Como a base original possui muitos registros, foi utilizada uma amostra de 1% dos dados para reduzir o custo computacional.
4. **Análise Exploratória:** Foram analisados a estrutura da base, tipos de dados, valores ausentes e a distribuição das variáveis.
5. **Tratamento dos Dados:** Incluiu a renomeação de colunas, tratamento de valores ausentes e a criação da variável alvo.
6. **Modelagem:** Foram utilizadas técnicas de aprendizado supervisionado (Naive Bayes, Árvore de Decisão e Random Forest) para prever a qualidade das cervejas.
7. **Avaliação:** Os modelos foram avaliados utilizando métricas de classificação como acurácia, precisão, recall e F1-score.

---

## 📈 Resultados e Aprendizados

O projeto demonstrou como técnicas de Ciência de Dados podem ser utilizadas para identificar padrões em avaliações de cervejas e realizar classificações automáticas com base em características sensoriais. Durante o desenvolvimento foram consolidados conceitos de Análise Exploratória de Dados (EDA), pré-processamento, visualização e classificação supervisionada.

---

## 🚀 Como Executar

### 💻 Ambiente Python (.ipynb):
1. Clone o repositório utilizando o comando: git clone URL_DO_REPOSITORIO
2. Acesse a pasta do projeto utilizando o comando: cd nome-do-repositorio
3. Instale as dependências utilizando o comando: pip install pandas numpy matplotlib seaborn scikit-learn
4. Execute o notebook abrindo o arquivo .ipynb no Google Colab ou Jupyter Notebook.
5. Execute as células em ordem sequencial.

### 💻 Ambiente R (.R):
1. Abra o arquivo Breja3.R dentro do RStudio.
2. Instale os pacotes necessários utilizando o comando: install.packages(c("dplyr", "caret", "e1071", "rpart", "randomForest"))
3. Execute o script para visualizar as matrizes de confusão e métricas de desempenho no console.

---

## 👩‍💻 Autora
* **Bianca Melliny de Lima Vaz** — Atividade acadêmica desenvolvida para a disciplina de Ciência de Dados.
