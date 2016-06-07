| mktclass | IDF | 
  ---------|--------
  black | `r mean(fiber.one$mktclass=="black" & fiber.one$ftype=="IDF", na.rm=TRUE)`a
black mottle | `r mean(fiber.one$mktclass=="blackmottle" & fiber.one$ftype=="IDF", na.rm=TRUE)` 
carioca | `r mean(fiber.one$mktclass=="carioca" & fiber.one$ftype=="IDF", na.rm=TRUE)` b
flor de mayo | `r mean(fiber.one$mktclass=="flordemayo" & fiber.one$ftype=="IDF", na.rm=TRUE)`
GN | `r mean(fiber.one$mktclass=="GN" & fiber.one$ftype=="IDF", na.rm=TRUE)`
navy | `r mean(fiber.one$mktclass=="navy" & fiber.one$ftype=="IDF", na.rm=TRUE)`
pink | `r mean(fiber.one$mktclass=="pink" & fiber.one$ftype=="IDF", na.rm=TRUE)`
pinto | `r mean(fiber.one$mktclass=="pinto" & fiber.one$ftype=="IDF", na.rm=TRUE)`
red mottle | `r mean(fiber.one$mktclass=="redmottle" & fiber.one$ftype=="IDF", na.rm=TRUE)`
small red | `r mean(fiber.one$mktclass=="smallred" & fiber.one$ftype=="IDF", na.rm=TRUE)`
small white | `r mean(fiber.one$mktclass=="smallwhite" & fiber.one$ftype=="IDF", na.rm=TRUE)`
tan | `r mean(fiber.one$mktclass=="tan" & fiber.one$ftype=="IDF", na.rm=TRUE)`

library(data.table)
fiber.one<- read.csv("fiber_facet.csv")
f.idf <- data.frame(fiber.one[which(fiber.one$ftype=="IDF" & fiber.one$race=="durango") ,])
mean(fiber.one[fiber.one$ftype=="TDF" & fiber.one$race=="durango"])

round(mean(f.idf),2)

f.sdf <- fiber.one[which(fiber.one$ftype=="SDF") ,]
round(mean(f.sdf$race=="durango", na.rm=TRUE),2)

attach(fiber.one)
aggdata <- aggregate(fiber.one, by=list(ftype, race), FUN=mean, na.rm=TRUE)


attach(mtcars)
aggdata <-aggregate(mtcars, by=list(cyl,vs), 
                    FUN=mean, na.rm=TRUE)
print(aggdata(where[Group.1=="IDF" & Group.2=="durango"], ))

library(data.table)
fiber.one<- read.csv("fiber_facet.csv")

idf.durango <- subset(fiber.one, ftype=="IDF" & race=="durango")
idf.jalisco <- subset(fiber.one, ftype=="IDF" & race=="jalisco")
idf.meso <- subset(fiber.one, ftype=="IDF" & race=="mesoamerican")

sdf.durango <- subset(fiber.one, ftype=="SDF" & race=="durango")
sdf.jalisco <- subset(fiber.one, ftype=="SDF" & race=="jalisco")
sdf.meso <- subset(fiber.one, ftype=="SDF" & race=="mesoamerican")

raff.durango <- subset(fiber.one, ftype=="Raff" & race=="durango")
raff.jalisco <- subset(fiber.one, ftype=="Raff" & race=="jalisco")
raff.meso <- subset(fiber.one, ftype=="Raff" & race=="mesoamerican")

stach.durango <- subset(fiber.one, ftype=="Stach" & race=="durango")
stach.jalisco <- subset(fiber.one, ftype=="Stach" & race=="jalisco")
stach.meso <- subset(fiber.one, ftype=="Stach" & race=="mesoamerican")

verb.durango <- subset(fiber.one, ftype=="Verb" & race=="durango")
verb.jalisco <- subset(fiber.one, ftype=="Verb" & race=="jalisco")
verb.meso <- subset(fiber.one, ftype=="Verb" & race=="mesoamerican")

toligos.durango <- subset(fiber.one, ftype=="TOligos" & race=="durango")
toligos.jalisco <- subset(fiber.one, ftype=="TOligos" & race=="jalisco")
toligos.meso <- subset(fiber.one, ftype=="TOligos" & race=="mesoamerican")

tdf.durango <- subset(fiber.one, ftype=="TDF" & race=="durango")
tdf.jalisco <- subset(fiber.one, ftype=="TDF" & race=="jalisco")
tdf.meso <- subset(fiber.one, ftype=="TDF" & race=="mesoamerican")

mean