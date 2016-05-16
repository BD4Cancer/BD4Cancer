

# install.packages("RISmed")

library(RISmed)
cancerType <- 'breast cancer'
query <- paste ("",cancerType,"[MeSh]")
res <- EUtilsSummary(query)
QueryCount(res)

auths<-Author(EUtilsGet(res))
typeof(auths)
auths[3]

ForeName    <- sapply(auths, function(x)paste(x$ForeName))
auths1      <- as.data.frame(sort(table(unlist(ForeName)), dec=TRUE))
head(auths1)

LastName    <- sapply(auths, function(x)paste(x$LastName))
auths2      <- as.data.frame(sort(table(unlist(Last)), dec=TRUE))
names(auths2)<-c("name")
head(auths2)
auths2 <- cbind(author=row.names(auths2),auths2)
dim(auths2)

qplot(factor(name), data=auths2, geom="bar", fill=factor(name)) +
geom_bar() +
ggtitle(paste("Breast Cancer: Number of Publication Per Author, n=", QueryCount(res))) +
labs(fill="Publication (n)") +
labs(x="Number of Publications",y="Number of Authors") 
