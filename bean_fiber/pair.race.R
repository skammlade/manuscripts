##    -   Pairwise Differences
library(multcomp)

fiber<- read.csv("fiber.csv")

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub <- subset(fiber, 
                   mktclass=='GN' | 
                     mktclass=='pink' | 
                     mktclass=='pinto' | 
                     mktclass=='small red' | 
                     mktclass=='black' | 
                     mktclass=='small white')


OneWayFit <- aov(IDF~race, data=fibersub)
TukeyHSD(OneWayFit)
PairComps <- glht(OneWayFit, linfct=mcp(race="Tukey"))
summary(PairComps)
cld(PairComps)


OneWayFit <- aov(SDF~race, data=fibersub)
TukeyHSD(OneWayFit)
PairComps <- glht(OneWayFit, linfct=mcp(race="Tukey"))
summary(PairComps)
cld(PairComps)


OneWayFit <- aov(Raff~race, data=fibersub)
TukeyHSD(OneWayFit)
PairComps <- glht(OneWayFit, linfct=mcp(race="Tukey"))
summary(PairComps)
cld(PairComps)


OneWayFit <- aov(Stach~race, data=fibersub)
TukeyHSD(OneWayFit)
PairComps <- glht(OneWayFit, linfct=mcp(race="Tukey"))
summary(PairComps)
cld(PairComps)


OneWayFit <- aov(Verb~race, data=fibersub)
TukeyHSD(OneWayFit)
PairComps <- glht(OneWayFit, linfct=mcp(race="Tukey"))
summary(PairComps)
cld(PairComps)


OneWayFit <- aov(TOligos~race, data=fibersub)
TukeyHSD(OneWayFit)
PairComps <- glht(OneWayFit, linfct=mcp(race="Tukey"))
summary(PairComps)
cld(PairComps)


OneWayFit <- aov(TDF~race, data=fibersub)
TukeyHSD(OneWayFit)
PairComps <- glht(OneWayFit, linfct=mcp(race="Tukey"))
summary(PairComps)
cld(PairComps)