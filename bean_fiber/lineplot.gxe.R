#create grades dataset
#attach(fiber)
fiber<- read.csv("gxefiber_facet.csv")

#load required packages
require(ggplot2)
require(cowplot)
require(gridExtra)

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
gxe.fibersub.TDF <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                        fiber$ftype %in% c('TDF'), ]

#summary statistics of gxe.fibersub
summ.df <- summarySE(gxe.fibersub.TDF, measurevar="value", groupvars=c("Entry","Origin"))

#oligosaccharides by mktclass
p.gxe.TDF <- ggplot(summ.df, aes(x=Origin, y=value, colour=Entry))

p.gxe.TDF <- p.gxe.TDF  + geom_line(aes(group=Entry)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.gxe.TDF <- p.gxe.TDF + theme(axis.title.y=element_blank(),
                               axis.text.y=element_text(family="Helvetica",
                                                        size=12),
                               axis.title.x=element_blank(),
                               legend.text=element_text(size=12), 
                               legend.title=element_text(face="bold", 
                                                         size=12),
                               plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"), legend.position="none")




#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
gxe.fibersub.IDF <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                            fiber$ftype %in% c('IDF'), ]

#summary statistics of gxe.fibersub
summ.df <- summarySE(gxe.fibersub.IDF, measurevar="value", groupvars=c("Entry","Origin"))

#oligosaccharides by mktclass
p.gxe.IDF <- ggplot(summ.df, aes(x=Origin, y=value, colour=Entry))

p.gxe.IDF <- p.gxe.IDF  + geom_line(aes(group=Entry)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.gxe.IDF <- p.gxe.IDF + theme(axis.title.y=element_blank(),
                               axis.text.y=element_text(family="Helvetica",
                                                        size=12),
                               axis.title.x=element_blank(),
                               legend.text=element_text(size=12), 
                               legend.title=element_text(face="bold", 
                                                         size=12),
                               plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"), legend.position="none")





#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
gxe.fibersub.SDF <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                            fiber$ftype %in% c('SDF'), ]

#summary statistics of gxe.fibersub
summ.df <- summarySE(gxe.fibersub.SDF, measurevar="value", groupvars=c("Entry","Origin"))

#oligosaccharides by mktclass
p.gxe.SDF <- ggplot(summ.df, aes(x=Origin, y=value, colour=Entry))

p.gxe.SDF <- p.gxe.SDF  + geom_line(aes(group=Entry)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.gxe.SDF <- p.gxe.SDF + theme(axis.title.y=element_blank(),
                                       axis.text.y=element_text(family="Helvetica",
                                                                size=12),
                                       axis.title.x=element_blank(),
                                       legend.text=element_text(size=12), 
                                       legend.title=element_text(face="bold", 
                                                                 size=12),
                                       plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"), legend.position="none")




#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
gxe.fibersub.Raff <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                            fiber$ftype %in% c('Raff'), ]

#summary statistics of gxe.fibersub
summ.df <- summarySE(gxe.fibersub.Raff, measurevar="value", groupvars=c("Entry","Origin"))

#oligosaccharides by mktclass
p.gxe.Raff <- ggplot(summ.df, aes(x=Origin, y=value, colour=Entry))

p.gxe.Raff <- p.gxe.Raff  + geom_line(aes(group=Entry)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.gxe.Raff <- p.gxe.Raff + theme(axis.title.y=element_blank(),
                                 axis.text.y=element_text(family="Helvetica",
                                                          size=12),
                                 axis.title.x=element_blank(),
                                 legend.text=element_text(size=12), 
                                 legend.title=element_text(face="bold", 
                                                           size=12),
                                 plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"), legend.position="none")







#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
gxe.fibersub.Stach <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                            fiber$ftype %in% c('Stach'), ]

#summary statistics of gxe.fibersub
summ.df <- summarySE(gxe.fibersub.Stach, measurevar="value", groupvars=c("Entry","Origin"))

#oligosaccharides by mktclass
p.gxe.Stach <- ggplot(summ.df, aes(x=Origin, y=value, colour=Entry))

p.gxe.Stach <- p.gxe.Stach  + geom_line(aes(group=Entry)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.gxe.Stach <- p.gxe.Stach + theme(axis.title.y=element_blank(),
                                   axis.text.y=element_text(family="Helvetica",
                                                            size=12),
                                   axis.title.x=element_blank(),
                                   legend.text=element_text(size=12), 
                                   legend.title=element_text(face="bold", 
                                                             size=12),
                                   plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"), legend.position="none")






#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
gxe.fibersub.Verb <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                            fiber$ftype %in% c('Verb'), ]

#summary statistics of gxe.fibersub
summ.df <- summarySE(gxe.fibersub.Verb, measurevar="value", groupvars=c("Entry","Origin"))

#oligosaccharides by mktclass
p.gxe.Verb <- ggplot(summ.df, aes(x=Origin, y=value, colour=Entry))

p.gxe.Verb <- p.gxe.Verb  + geom_line(aes(group=Entry)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.gxe.Verb <- p.gxe.Verb + theme(axis.title.y=element_blank(),
                                 axis.text.y=element_text(family="Helvetica",
                                                          size=12),
                                 axis.title.x=element_blank(),
                                 legend.text=element_text(size=12), 
                                 legend.title=element_text(face="bold", 
                                                           size=12),
                                 plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"), legend.position="none")








#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
gxe.fibersub.TOligos <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                            fiber$ftype %in% c('TOligos'), ]

#summary statistics of gxe.fibersub
summ.df <- summarySE(gxe.fibersub.TOligos, measurevar="value", groupvars=c("Entry","Origin"))

#oligosaccharides by mktclass
p.gxe.TOligos <- ggplot(summ.df, aes(x=Origin, y=value, colour=Entry))

p.gxe.TOligos <- p.gxe.TOligos  + geom_line(aes(group=Entry)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.gxe.TOligos <- p.gxe.TOligos + theme(axis.title.y=element_blank(),
                                       axis.text.y=element_text(family="Helvetica",
                                                                size=12),
                                       axis.title.x=element_blank(),
                                       legend.text=element_text(size=12), 
                                       legend.title=element_text(face="bold", 
                                                                 size=12),
                                       plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"), legend.position="none")

