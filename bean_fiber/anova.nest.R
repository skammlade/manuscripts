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

OneWayFit.IDF <- summary(aov(IDF~Rep + (race/mktclass), data=fibersub))

OneWayFit.SDF <- summary(aov(SDF~Rep + (race/mktclass), data=fibersub))

OneWayFit.Raff <- summary(aov(Raff~Rep + (race/mktclass), data=fibersub))

OneWayFit.Stach <- summary(aov(Stach~Rep + (race/mktclass), data=fibersub))

OneWayFit.Verb <- summary(aov(Verb~Rep + (race/mktclass), data=fibersub))

OneWayFit.TOligos <- summary(aov(TOligos~Rep + (race/mktclass), data=fibersub))

OneWayFit.TDF <- summary(aov(TDF~Rep + (race/mktclass), data=fibersub))