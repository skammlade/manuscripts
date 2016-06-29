library(data.table)
fiber.one<- read.csv("fiber_facet.csv")

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fiber.one <- subset(fiber, 
                mktclass=='GN' | 
                  mktclass=='pink' | 
                  mktclass=='pinto' | 
                  mktclass=='small red' | 
                  mktclass=='black' | 
                  mktclass=='small white')

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