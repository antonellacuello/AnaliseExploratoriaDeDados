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