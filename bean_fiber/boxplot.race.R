#create grades dataset
#attach(fiber)
fiber<- read.csv("fiber.csv")

#load required packages
require(ggplot2)
require(cowplot)


#insoluble dietary fiber
p.IDF.race <- ggplot(fiber, 
                    aes(x=race, y=IDF, fill=race))

p.IDF.race <- p.IDF.race + geom_boxplot()

p.IDF.race <- p.IDF.race + theme(legend.position="none",
                               plot.title = element_text(size=20),
                               axis.title.x = element_blank(),
                               axis.text.x = element_text(angle=60, hjust=1, 
                                                          vjust=1, 
                                                          size=15, 
                                                          face="bold"),
                               axis.title.y = element_blank())

#add point at mean
p.IDF.race <- p.IDF.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p.IDF.race <- p.IDF.race + labs(title="Insoluble DF")



#SOLUBLE dietary fiber
p.SDF.race <- ggplot(fiber, 
                    aes(x=race, y=SDF, fill=race))

p.SDF.race <- p.SDF.race + geom_boxplot()

p.SDF.race <- p.SDF.race + theme(legend.position="none",
                               plot.title = element_text(size=20),
                               axis.title.x = element_blank(),
                               axis.text.x = element_text(angle=60, hjust=1, 
                                                          vjust=1, 
                                                          size=15, 
                                                          face="bold"),
                               axis.title.y = element_blank())

#add point at mean
p.SDF.race <- p.SDF.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p.SDF.race <- p.SDF.race + labs(title="Soluble DF")




#RAFF
p.Raff.race <- ggplot(fiber, 
                     aes(x=race, y=Raff, fill=race))

p.Raff.race <- p.Raff.race + geom_boxplot()

p.Raff.race <- p.Raff.race + theme(legend.position="none",
                                 plot.title = element_text(size=20),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_text(angle=60, hjust=1, 
                                                            vjust=1, 
                                                            size=15, 
                                                            face="bold"),
                                 axis.title.y = element_blank())

#add point at mean
p.Raff.race <- p.Raff.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p.Raff.race <- p.Raff.race + labs(title="Raff")





#STACH
p.Stach.race <- ggplot(fiber, 
                      aes(x=race, y=Stach, fill=race))

p.Stach.race <- p.Stach.race + geom_boxplot()

p.Stach.race <- p.Stach.race + theme(legend.position="none",
                                   plot.title = element_text(size=20),
                                   axis.title.x = element_blank(),
                                   axis.text.x = element_text(angle=60, hjust=1, 
                                                              vjust=1, 
                                                              size=15, 
                                                              face="bold"),
                                   axis.title.y = element_blank())

#add point at mean
p.Stach.race <- p.Stach.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p.Stach.race <- p.Stach.race + labs(title="Stach")



#VERB
p.Verb.race <- ggplot(fiber, 
                     aes(x=race, y=Verb, fill=race))

p.Verb.race <- p.Verb.race + geom_boxplot()

p.Verb.race <- p.Verb.race + theme(legend.position="none",
                                 plot.title = element_text(size=20),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_text(angle=60, hjust=1, 
                                                            vjust=1, 
                                                            size=15, 
                                                            face="bold"),
                                 axis.title.y = element_blank())

#add point at mean
p.Verb.race <- p.Verb.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p.Verb.race <- p.Verb.race + labs(title="Verb")



#total oligos
p.TOligos.race <- ggplot(fiber, 
                        aes(x=race, y=TOligos, fill=race))

p.TOligos.race <- p.TOligos.race + geom_boxplot()

p.TOligos.race <- p.TOligos.race + theme(legend.position="none",
                                       plot.title = element_text(size=20),
                                       axis.title.x = element_blank(),
                                       axis.text.x = element_text(angle=60, hjust=1, 
                                                                  vjust=1, 
                                                                  size=15, 
                                                                  face="bold"),
                                       axis.title.y = element_blank())

#add point at mean
p.TOligos.race <- p.TOligos.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p.TOligos.race <- p.TOligos.race + labs(title="Total Oligos")




#total dietary fiber
p.TDF.race <- ggplot(fiber, 
                    aes(x=race, y=TDF, fill=race))

p.TDF.race <- p.TDF.race + geom_boxplot()

p.TDF.race <- p.TDF.race + theme(legend.position="none",
                               plot.title = element_text(size=20),
                               axis.title.x = element_blank(),
                               axis.text.x = element_text(angle=60, hjust=1, 
                                                          vjust=1, 
                                                          size=15, 
                                                          face="bold"),
                               axis.title.y = element_blank())

#add point at mean
p.TDF.race <- p.TDF.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p.TDF.race <- p.TDF.race + labs(title="Total Dietary Fiber")

#multiple plots
plot_grid(p.Verb.race, p.Raff.race, p.Stach.race, p.TOligos.race, labels = c("A", "B", "C", "D"), ncol = 2)
