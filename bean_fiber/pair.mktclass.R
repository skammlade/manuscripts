##    -   Pairwise Differences

fiber<- read.csv("fiber.csv")

OneWayFit <- aov(IDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(SDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(Raff~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(Stach~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(Verb~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(TOligos~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(TDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(TDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)
