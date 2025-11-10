#install.packages("remotes")
#install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
#install.packages("remotes")
#remotes::install_github("danicat/read.dbc")
#library(read.dbc)
#pkgbuild::has_build_tools(debug = TRUE)
#install.packages("pkgbuild")
#remotes::install_github("danicat/read.dbc")
remotes::install_github("rfsaldanha/microdatasus")
setwd("C:/Users/PC/Desktop/dados-lept")

library(read.dbc)
library(microdatasus)

LeptBr24<-read.dbc::read.dbc("LEPTBR24.dbc")
LeptBr23<-read.dbc::read.dbc("LEPTBR23.dbc")
LeptBr22<-read.dbc::read.dbc("LEPTBR22.dbc")

save.image("dados_lidos.RData")

#FILTRAGEM BASEADA NO COD DO IBGE DO RS
Lepto_RS_22 <- subset(LeptBr22, (SG_UF == 43))
Lepto_RS_23 <- subset(LeptBr23, (SG_UF == 43))
Lepto_RS_24 <- subset(LeptBr24, (SG_UF == 43))

rm(LeptBr22, LeptBr23, LeptBr24)

#verificando se as variaveis estao corretas 
Lepto_RS_24$ID_MUNICIP<-as.numeric(paste(Lepto_RS_24$ID_MUNICIP))
Lepto_RS_23$ID_MUNICIP<-as.numeric(paste(Lepto_RS_23$ID_MUNICIP))
Lepto_RS_22$ID_MUNICIP<-as.numeric(paste(Lepto_RS_22$ID_MUNICIP))

#verificando se estamos somente nos municipios do RS
summary(Lepto_RS_24$ID_MUNICIP)
summary(Lepto_RS_23$ID_MUNICIP)
summary(Lepto_RS_22$ID_MUNICIP)

library(dplyr)

Lepto_RS_24<-Lepto_RS_24%>%filter(ID_MUNICIP>429999)#garantir só RS
Lepto_RS_23<-Lepto_RS_23%>%filter(ID_MUNICIP>429999)#garantir só RS
Lepto_RS_22<-Lepto_RS_22%>%filter(ID_MUNICIP>429999)#garantir só RS

#selecionando as var a serem utilizadas
Lepto_RS_24_filtro<-Lepto_RS_24%>%select(DT_NOTIFIC,SG_UF,NU_ANO,ID_MUNICIP,ANO_NASC,ANT_CB_LAM,EVOLUCAO)
Lepto_RS_23_filtro<-Lepto_RS_23%>%select(DT_NOTIFIC,SG_UF,NU_ANO,ID_MUNICIP,ANO_NASC,ANT_CB_LAM,EVOLUCAO)
Lepto_RS_22_filtro<-Lepto_RS_22%>%select(DT_NOTIFIC,SG_UF,NU_ANO,ID_MUNICIP,ANO_NASC,ANT_CB_LAM,EVOLUCAO)

#verificando os dados
summary(Lepto_RS_24_filtro)
summary(Lepto_RS_23_filtro)
summary(Lepto_RS_22_filtro)

str(Lepto_RS_24_filtro)

Lepto_RS_24_filtro$Dia <- as.numeric(format(Lepto_RS_24_filtro$DT_NOTIFIC, format = "%d"))
Lepto_RS_24_filtro$Mes <- as.numeric(format(Lepto_RS_24_filtro$DT_NOTIFIC, format = "%m"))
Lepto_RS_24_filtro$Ano <- as.numeric(format(Lepto_RS_24_filtro$DT_NOTIFIC, format = "%Y"))

str(Lepto_RS_24_filtro)