##    -   Pairwise Differences


fiber<- read.csv("fiber.csv")
OneWayFit <- aov(IDF~race, data=fiber)
TukeyHSD(OneWayFit)

fiber<- read.csv("fiber.csv")
OneWayFit <- aov(SDF~race, data=fiber)
TukeyHSD(OneWayFit)

fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Raff~race, data=fiber)
TukeyHSD(OneWayFit)

fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Stach~race, data=fiber)
TukeyHSD(OneWayFit)

fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Verb~race, data=fiber)
TukeyHSD(OneWayFit)

fiber<- read.csv("fiber.csv")
OneWayFit <- aov(TOligos~race, data=fiber)
TukeyHSD(OneWayFit)

fiber<- read.csv("fiber.csv")
OneWayFit <- aov(TDF~race, data=fiber)
TukeyHSD(OneWayFit)