##    -   Pairwise Differences

fiber<- read.csv("fiber.csv")

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fiber <- subset(fiber, 
                   mktclass=='GN' | 
                     mktclass=='pink' | 
                     mktclass=='pinto' | 
                     mktclass=='small red' | 
                     mktclass=='black' | 
                     mktclass=='small white')

OneWayFit <- aov(IDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)

OneWayFit <- aov(SDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)

OneWayFit <- aov(Raff~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)

OneWayFit <- aov(Stach~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)

OneWayFit <- aov(Verb~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)

OneWayFit <- aov(TOligos~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)

OneWayFit <- aov(TDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)

OneWayFit <- aov(TDF~mktclass, data=fiber)
TukeyHSD(OneWayFit)
library(multcomp)
PairComps <- glht(OneWayFit, linfct=mcp(mktclass="Tukey"))
summary(PairComps)
cld(PairComps)
