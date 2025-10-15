#Exercício 4
li<-c(0,4,8,12,16)
ls<-c(4,8,12,16,20)
fi<-c(8,15,24,20,13)
xi=pm<-(li+ls)/2

#Media
xifi<-xi*fi
n<-sum(fi)
media<-sum(xifi)/n
cat("Média:", media)

#Moda
posicao_maior<-which.max(fi)

#delta 1 = fiMo - fiAnt
delta1<-fi[posicao_maior]-fi[posicao_maior-1]
delta1

#delta 2 = fiMo - fiPost
delta2<-fi[posicao_maior]-fi[posicao_maior+1]
delta2

liMo<-li[posicao_maior]
h<-ls[posicao_maior]-li[posicao_maior]
moda<-round(liMo+(delta1/(delta1+delta2))*h,2)
moda

#Mediana
#Classe da Me
fac<-cumsum(fi)
pos<-n/2
posicao<-which(fac>=pos)[1]
liMe<-li[posicao]
h<-ls[posicao]-li[posicao]
soma_fiAnt<-fac[posicao-1]

mediana<-liMe+((pos-soma_fiAnt)/fi[posicao])*h
cat("Mediana:", mediana)

tabela<-cbind(li,ls,fi,xi,fac)
tabela

#Variância
xi2fi<-xifi*xi
tabela<-cbind(tabela,xi2fi)
tabela
variancia<-(1/(n-1))*(sum(xi2fi)-((sum(xifi)^2)/n))
variancia

#Desvio Padrão
desviopadrao<-sqrt(variancia)

#Coneficiente de Variação
coefVariacao<-(desviopadrao/media)*100

nomes<-c("Média", "Moda", "Mediana", "Var", "DP", "CV")
resumo_agrupado<-round(c(media, moda, mediana, variancia, desviopadrao, coefVariacao), 2)

names(resumo_agrupado)<-nomes
resumo_agrupado

resumo_dados_agrupados<-function(li,ls,fi)
{
  xi<-(li+ls)/2
  n<-sum(fi)
  
  #media
  xifi<-xi*fi
  media<-sum(xifi)/n
  
  #moda
  posicao_maior<-which.max(fi)
  delta1<-fi[posicao_maior]-fi[posicao_maior-1]
  delta2<-fi[posicao_maior]-fi[posicao_maior+1]
  liMo<-li[posicao_maior]
  h<-ls[posicao_maior]-lI[posicao_maior]
  moda<-round(liMo+(delta1/(delta1+delta2))*h,2)
  
  #mediana
  fac<-cumsum(fi)
  pos<-n/2
  posicao<-which(fac>=pos)[1]
  liMe<-li[posicao]
  h<-ls[posicao]-li[posicao]
  soma_ant<-fac[posicao-1]
  mediana<-liMe+((pos-soma_ant)/fi[posicao])*h
  
  #variancia
  xi2fi<-xifi*xi
  variancia<-(1/(n-1))*(sum(xi2fi)-((sum(xifi)^2)/n))
  
  #desvio padrao
  desviopadrao<-sqrt(variancia)
  
  #coeficiente de variacao
  coef_vari<-desviopadrao/media*100
  
  #tabela da distribibuição de frequencia
  tabela<-cbind(li,ls,fi,xi,fac,xi2fi)
  
  #resumo dos dados
  nomes<-c("Media","Moda","Mediana","Var","DP","CV")
  resumo_agrupado<-round(c(media,moda,mediana,variancia,
                           desviopadrao,coef_vari),2)
  names(resumo_agrupado)<-nomes
  #resumo_agrupado
  return(list(distribuicao_de_frequencia=tabela,resumo=resumo_agrupado))
}

li<-c(0,4,8,12,16)
ls<-c(4,8,12,16,20)
freq<-c(8,15,24,20,13)

resumo_dados_agrupados(li,ls,freq)
resumo_dados_agrupados(lim_inf = li,lim_sup = ls,fi=freq)
resumo_dados_agrupados(ls,li,freq)
resumo_dados_agrupados(fi=freq,lim_sup = ls,lim_inf = li)
