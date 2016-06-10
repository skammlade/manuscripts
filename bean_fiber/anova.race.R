##    -   ANOVA Tables

library(data.table)
fiber<- read.csv("fiber.csv")

OneWayFit.IDF <- aov(IDF~race, data=fiber)

OneWayFit.SDF <- aov(SDF~race, data=fiber)

OneWayFit.Raff <- aov(Raff~race, data=fiber)

OneWayFit.Stach <- aov(Stach~race, data=fiber)

OneWayFit.Verb <- aov(Verb~race, data=fiber)

OneWayFit.TOligos <- aov(TOligos~race, data=fiber)

OneWayFit.TDF <- aov(TDF~race, data=fiber)

