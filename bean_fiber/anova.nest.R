##    -   ANOVA Tables

library(data.table)
fiber<- read.csv("fiber.csv")

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub <- subset(fiber, 
                   mktclass=='GN' | 
                     mktclass=='pink' | 
                     mktclass=='pinto' | 
                     mktclass=='small red' | 
                     mktclass=='black' | 
                     mktclass=='small white')

OneWayFit.IDF <- aov(IDF~race/mktclass + Rep, data=fibersub)

OneWayFit.SDF <- aov(SDF~race/mktclass + Rep, data=fibersub)

OneWayFit.Raff <- aov(Raff~race/mktclass + Rep, data=fibersub)

OneWayFit.Stach <- aov(Stach~race/mktclass + Rep, data=fibersub)

OneWayFit.Verb <- aov(Verb~race/mktclass + Rep, data=fibersub)

OneWayFit.TOligos <- aov(TOligos~race/mktclass + Rep, data=fibersub)

OneWayFit.TDF <- aov(TDF~race/mktclass + Rep, data=fibersub)