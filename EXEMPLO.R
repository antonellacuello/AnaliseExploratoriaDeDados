install.packages("remotes")
install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
library(read.dbc)
library(dplyr)
remotes::install_github("rfsaldanha/microdatasus")
library(microdatasus)

###############################################################
#Quando tiver problemas na instalação do pacote microdatasus
#Remova as credenciais existentes do git
#install.packages("gitcreds")
#library(gitcreds)

# Verifique se há credenciais salvas
#gitcreds_get()

# Se houver credenciais incorretas, delete-as
#gitcreds_delete()

# Agora tente instalar sem credenciais (para reposit?rios p?blicos)
#remotes::install_github("rfsaldanha/microdatasus")
#####################################################################

library(stringr)

# Baixando os dados:

df_dengue_2020 = fetch_datasus(year_start = 2020, 
                               year_end = 2020, 
                               information_system = "SINAN-DENGUE")

df_dengue_2021 = fetch_datasus(year_start = 2021, 
                               year_end = 2021, 
                               information_system = "SINAN-DENGUE",
                               uf = "RS")

# Processando os dados: olha as var e arruma de um jeito bonitinho

df_process_dengue_2020 = process_sinan_dengue(df_dengue_2020)


# Salvando os dados baixados:

data.table::fwrite(df_process_dengue_2020, "df_dengue_2020.csv", 
                   row.names = FALSE)

#Cid-10 Z73.0  (Problemas relacionados com a organiza??o do modo de vida, estado de exaustão vital). 

covid_sih <- dados_sih %>%  filter(DIAG_PRINC %in% c("B34"))

# Baixando dados do SIM - Baixar e processar dados do Sistema de Informa??o sobre Mortalidade (SIM)
dados_SIM <- fetch_datasus(year_start = 2020, 
                           year_end = 2024, 
                           uf = "RS", 
                           information_system = "SIM-DO")
dados_SIM <- process_sim(dados_SIM)
str(dados_SIM) #colunas, verificar dicionário de dados

# Selecionando colunas
dados_selecionados <- dados_SIM %>% select(IDADEanos,
                                           SEXO,CAUSABAS_O,
                                           RACACOR,DTOBITO,
                                           CODMUNRES)#no trabalho serão mais colunas, filtrar possiveis erros (se todos dados sao daquele estado)

#DTOBITO, DTNASC, SEXO, RACACOR, ESC, GRAVIDEZ,CAUSABAS_O, Tp.evolucao_caso

cidDengue <- dados_selecionados %>%  filter(CAUSABAS_O %in% c("A90"))#cid dengue

options(max.print=999999)

str(cidLesaoAuto)
cidLesaoAuto$IDADEanos<-as.numeric(cidLesaoAuto$IDADEanos)
cidLesaoAuto$DTOBITO<-as.Date(cidLesaoAuto$DTOBITO)

library(tidyverse)

cidLesaoAuto$DTOBITO <- as.Date(cidLesaoAuto$DTOBITO, "%Y-%m-%d")

#Transforma uma data em dia , m?s e ano ##
cidLesaoAuto$Dia<-as.numeric(format(cidLesaoAuto$DTOBITO, format = "%d"))
cidLesaoAuto$Mes<-as.numeric(format(cidLesaoAuto$DTOBITO, format = "%m"))
cidLesaoAuto$Ano<-as.numeric(format(cidLesaoAuto$DTOBITO, format = "%Y"))

library(dplyr)

#FILTRAR ESTADO DO: RS
cidLesaoAuto_RS<-subset(cidLesaoAuto,(SG_UF==43))

Lept_RS_Total_Todas_Variaveis<-Lept_RS_Total_Todas_Variaveis%>%filter(ID_MUNICIP>429999)#garantir só RS

Lept_RS_Total_VarSel<-Lept_RS_Total_Todas_Variaveis%>%select(DT_NOTIFIC,SG_UF,NU_ANO,ID_MUNICIP,ANO_NASC,ANT_CB_LAM,EVOLUCAO)
