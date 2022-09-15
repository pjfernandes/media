library(dplyr)

df<-read.csv("dados.txt", h=T, sep="\t")
head(df)

df<-as_tibble(df)

resultado <- df %>% group_by(Data) %>% summarise(mean(Media),mean(Minima),mean(Maxima))

resultado[,1] <- as.Date(as.character(as.vector(resultado[,1])$Data), format = "%d/%m/%Y")

resultado <- resultado %>% arrange(Data)

write.csv(resultado,"resultado.txt", row.names = F)




