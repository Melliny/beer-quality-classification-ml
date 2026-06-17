# Instalar pacotes
# install.packages("dplyr")
# install.packages("caret")
# install.packages("e1071")
# install.packages("rpart")
# install.packages("randomForest") 

library(dplyr)
library(caret)
library(e1071)
library(rpart)
library(randomForest)

# 1. Carregar o arquivo 
dados_brutos <- read.csv("beer_reviews.csv")

# 2. Filtrar para 1% dos dados 
set.seed(42)
dados_amostra <- dados_brutos %>% sample_frac(0.01)

# 3. Pré-processamento e Limpeza
dados_amostra <- dados_amostra %>% select(-review_profilename)

# Criar a variável alvo 'qualidade'
dados_amostra$qualidade <- as.factor(ifelse(dados_amostra$review_overall >= 4.0, 1, 0))

# Selecionar apenas as colunas que importam para o modelo
colunas_modelo <- c("beer_abv", "review_aroma", "review_palate", "qualidade")
dados_finais <- dados_amostra[, colunas_modelo]

# Tratar valores nulos (NA) com a mediana
mediana_abv <- median(dados_finais$beer_abv, na.rm = TRUE)
dados_finais$beer_abv[is.na(dados_finais$beer_abv)] <- mediana_abv

# 4. Divisão Treino (80%) e Teste (20%)
index <- createDataPartition(dados_finais$qualidade, p = 0.8, list = FALSE)
treino <- dados_finais[index, ]
teste <- dados_finais[-index, ]

# 5. Treinar os Modelos
# Naive Bayes
modelo_nb <- naiveBayes(qualidade ~ ., data = treino)
pred_nb <- predict(modelo_nb, teste)

# Árvore de Decisão
modelo_dt <- rpart(qualidade ~ ., data = treino, method = "class")
pred_dt <- predict(modelo_dt, teste, type = "class")

# Random Forest
modelo_rf <- randomForest(qualidade ~ ., data = treino, ntree = 100)
pred_rf <- predict(modelo_rf, teste)

# 6. Gerar Matrizes de Confusão
cm_nb <- confusionMatrix(pred_nb, teste$qualidade)
cm_dt <- confusionMatrix(pred_dt, teste$qualidade)
cm_rf <- confusionMatrix(pred_rf, teste$qualidade)

# 7. Resultados e Cálculos de F1-score

print("--- Naive Bayes ---")
print(cm_nb)
prec_nb <- cm_nb$byClass["Pos Pred Value"]
rec_nb  <- cm_nb$byClass["Sensitivity"]
f1_nb   <- 2 * (prec_nb * rec_nb) / (prec_nb + rec_nb)
cat("F1-score:", round(f1_nb, 4), "\n\n")

print("--- Árvore de Decisão ---")
print(cm_dt)
prec_dt <- cm_dt$byClass["Pos Pred Value"]
rec_dt  <- cm_dt$byClass["Sensitivity"]
f1_dt   <- 2 * (prec_dt * rec_dt) / (prec_dt + rec_dt)
cat("F1-score:", round(f1_dt, 4), "\n\n")

print("--- Random Forest ---")
print(cm_rf)
prec_rf <- cm_rf$byClass["Pos Pred Value"]
rec_rf  <- cm_rf$byClass["Sensitivity"]
f1_rf   <- 2 * (prec_rf * rec_rf) / (prec_rf + rec_rf)
cat("F1-score:", round(f1_rf, 4), "\n\n")

# Tabela resumo final
resultados_r <- data.frame(
  Algoritmo = c("Naive Bayes", "Árvore de Decisão", "Random Forest"),
  Acuracia = c(cm_nb$overall["Accuracy"], cm_dt$overall["Accuracy"], cm_rf$overall["Accuracy"]),
  Precisao = c(prec_nb, prec_dt, prec_rf),
  Recall = c(rec_nb, rec_dt, rec_rf),
  F1_score = c(f1_nb, f1_dt, f1_rf)
)

print(resultados_r)
