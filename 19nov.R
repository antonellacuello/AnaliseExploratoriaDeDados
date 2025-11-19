library(readr)
library(dplyr)
df_dengue_2020 <- read_csv("df_dengue_2020.csv")
df_dengue_2021 <- read_csv("df_dengue_2021.csv")
df_dengue_2022 <- read_csv("df_dengue_2022.csv")
df_dengue_2023 <- read_csv("df_dengue_2023.csv")
#df_dengue_2024 <- read_csv("df_dengue_2024.csv")

dados_selecionados_2020 <- df_dengue_2020 %>% select(DT_OBITO, 
                                                     ID_MUNICIP,
                                                     IDADEanos, 
                                                     CS_SEXO,
                                                     CS_RACA,
                                                     CS_ESCOL_N,
                                                     CS_GESTANT,
                                                     EVOLUCAO,
                                                     SG_UF_NOT)
rm(df_dengue_2020)

dados_RJ<-dados_selecionados_2020 %>% filter(SG_UF_NOT =="Rio de Janeiro")
dados_RJ_2020 <- dados_selecionados_2020

rm(dados_RJ, dados_selecionados_2020)

save.image("trabalho-final.RData")

str(dados_RJ_2020) #estrutura dos meus dados
summary(dados_RJ_2020)
boxplot(dados_RJ_2020$IDADEanos)
summary(dados_RJ_2020$IDADEanos)
table(dados_RJ_2020$IDADEanos)

table(dados_RJ_2020$CS_SEXO)
