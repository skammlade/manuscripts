##    -   ANOVA Tables

library(data.table)
fiber<- read.csv("fiber.csv")

OneWayFit.IDF <- aov(IDF~mktclass, data=fiber)

OneWayFit.SDF <- aov(SDF~mktclass, data=fiber)

OneWayFit.Raff <- aov(Raff~mktclass, data=fiber)

OneWayFit.Stach <- aov(Stach~mktclass, data=fiber)

OneWayFit.Verb <- aov(Verb~mktclass, data=fiber)

OneWayFit.TOligos <- aov(TOligos~mktclass, data=fiber)

OneWayFit.TDF <- aov(TDF~mktclass, data=fiber)

