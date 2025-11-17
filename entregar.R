install.packages("remotes")
install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
library(read.dbc)
library(dplyr)
remotes::install_github("rfsaldanha/microdatasus")
library(microdatasus)

library(stringr)

# Baixando os dados:

df_dengue_2020 = fetch_datasus(year_start = 2020, 
                               year_end = 2020, 
                               information_system = "SINAN-DENGUE")


# Processando os dados: olha as var e arruma de um jeito bonitinho

df_process_dengue_2020 = process_sinan_dengue(df_dengue_2020)


# Salvando os dados baixados:

data.table::fwrite(df_process_dengue_2020, "df_dengue_2020.csv", 
                   row.names = FALSE)

dados_selecionados_2020 <- dados_SIM %>% select(DTOBITO, 
                                           CODMUNRES, 
                                           IDADE, 
                                           SEXO, 
                                           RACACOR, 
                                           ESC, GRAVIDEZ, CAUSABAS_O)#faltou evoluçaõ

# descobrir var no console (df_process_dengue_2020$nomedavariavel)

dados_selecionados_2020 filter(SGUF== "RJ")