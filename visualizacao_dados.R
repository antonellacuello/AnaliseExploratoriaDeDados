library(MASS)
View(Cars93)

# histograma
hist(Cars93$Price)
hist(Cars93$Price,
  xlab = 'Preço (x $1.000)',
  xlim = c(0,70),
  main = 'Preço de 93 modelos de carros em 1993',
  ylab = 'Frequência'
  )

#hist(Cars93$Price,
#  xlab = 'Preço (x $1.000)',
#  xlim = c(0,70),
#  main = 'Preço de 93 modelos de carros em 1993',
#  probability = TRUE,
#  ylim = C(0,0.07))

# adicionar linha no gráficos já pronto
lines(density(Cars93$Price))

# tabela para visualizar e resumir os tipos
tipo <- table(Cars93$Type)

# grafico de barras
barplot(tipo)

barplot(tipo,
  xlab = 'Tipo',
  ylab = 'Frequência',
  ylim = c(0,25),
  main = 'Título',
  axis.lty = 'solid',
  density = c(5,10,20,30,7,50),
  angle = c(0,45,90,11,36,30),
  col = 'brown'
  )

# grafico de torta
pie(tipo)

library(RColorBrewer)
minhapaleta <- brewer.pal(6, 'Accent')

pie(tipo, col = minhapaleta)

plot(Cars93$Horsepower,
  Cars93$MPG.city,
  xlab = 'Cavalos de Potência',
  ylab = 'MPG',
  main = 'Potência x MPG (cidade)'
  )

# pode-se atribuir o valor da variável aos
plot(Cars93$Horsepower,
  Cars93$MPG.city,
  xlab = 'Cavalos de Potência',
  ylab = 'MPG',
  main = 'Potência x MPG (cidade)',
  pch = as.character(Cars93$Cylinders)
  )

boxplot(Cars93$Horsepower~Cars93$Cylinders,
  xlab = 'Cilindros',
  ylab = 'Potência',
  #col = minhapaleta

  )

boxplot(Cars93$Price)
summary(Cars93$Price)