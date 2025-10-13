# Exercicio 3 - PROVA 1
xi<-c(0,1,2,3,4,5,6,7)
fi<-c(2,25,15,10,3,2,1,2)

#media
xifi<-xi*fi
n<-sum(fi)
soma<-sum(xifi)
media<-soma/n
cat("Média:", media)

#moda
posicao_maior<-which.max(fi)#retorna posição de maior valor
cat("Maior Posição:", posicao_maior)
moda<-xi[posicao_maior]#retorna o valor da posição_maior
cat("Moda:", moda)

#mediana
fac<-cumsum(fi)
cat("FAC:", fac)
pos<-n/2
cat("Posição", pos)

posicao<-which(fac>=pos)[1] #[1] posicao do vetor
cat("Posição:", posicao)
mediana<-xi[posicao]
cat("Mediana:", mediana)

#Criando a função resumo de dados
resumoDados<-function(x=x, f=f)
{
  #media
  xifi<-x*f
  n<-sum(f)
  soma<-sum(xifi)
  media<-round(soma/n, 2)
  
  #moda
  posicao_maior<-which.max(f)
  moda<-x[posicao_maior]
  
  #mediana
  fac<-cumsum(f)
  pos<-n/2
  posicao<-which(fac>=pos)[1]
  mediana<-x[posicao]
  
  resultado<-c(media, moda, mediana)
  names(resultado)<-c("Média", "Moda", "Mediana")
  resultado
}

resumoDados(xi, fi)
