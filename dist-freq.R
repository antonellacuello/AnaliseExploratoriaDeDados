####criando distribui�ao de frequencia no r 

install.packages("fdth")#instalar

library(fdth)#carregar

library(dplyr)

dados<-c(151  , 152  , 154  , 155 , 158 , 159 , 159 , 160 ,  161  , 161 ,
161  , 162  , 163  , 163 , 163 , 164 , 165 , 165 ,  165  , 166,
166  , 166  , 166  , 167 , 167 , 167 , 167 , 167 ,  168  , 168 ,
168  , 168  , 168  , 168 , 168 , 168 , 168 , 168 ,  169  , 169 ,
169  , 169  , 169  , 169 , 169 , 169 , 170 , 170 ,  170  , 170 ,
173  , 173  , 174  , 174 , 174 , 175 , 175 , 175 ,  175  , 176 ,
176  , 176  , 176  , 177 , 177 , 177 , 177 , 178 ,  178  , 178 ,
179  , 179  , 180  , 180 , 180 , 180 , 181 , 181 ,  181  , 182 ,
182  , 182  , 183  , 184 , 185 , 186 , 187 , 188 ,  190  , 190 )

dados<-dados/100

table(dados)

#criar a distribui�ao de frequencia com fdth
distribuicao<-fdt(dados)
print(distribuicao)


#
n<-length(dados)
n

AT<-max(dados)-min(dados)
AT

#calcula o n�mero de classes
k<-1+(3.3*log10(n))
k

#arredondar o k
ceiling(k) #arredonda para cima
floor(k)   #arredonda para baixo
round(k,digits = 2) #arredond com dois decimais

k_a<-ceiling(k)
k_a


#criar o tamanho dos intervalos de classe
h<-round(AT/k_a,2)
h

#criar a distribui�ao estabelecendo o minimo e maximo
comeco=round(min(dados),2)#arredonda para baixo a altura m�nima
fim=k_a*h+comeco

d<-fdt(dados,start=comeco,end=fim,h=h)
print(d)


#distribuicao com 5 classes
k<-5

h<-round(AT/k,digits = 2)
h

comeco=round((min(dados),2)#arredonda para baixo a idade m�nima
fim=k*h+comeco

d2<-fdt(dados,start=comeco,end=fim,h=h)
print(d2)