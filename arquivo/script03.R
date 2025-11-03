install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
setwd("C:\Users\IMEF\Downloads\arquivo")

LeptBr24<-read.dbc::read.dbc("LEPTBR24.dbc")
LeptBr23<-read.dbc::read.dbc("LEPTBR23.dbc")
LeptBr22<-read.dbc::read.dbc("LEPTBR22.dbc")

save.image("dados_lidos.RData")
