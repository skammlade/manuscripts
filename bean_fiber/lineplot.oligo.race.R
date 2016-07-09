#create grades dataset
#attach(fiber)
fiber<- read.csv("fiber_facet.csv")

#load required packages
require(ggplot2)
require(cowplot)
require(gridExtra)

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub.oli <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                        fiber$ftype %in% c('Raff', 'Stach', 'Verb'), ]

#summary statistics of fibersub.oli
summ.df <- summarySE(fibersub.oli, measurevar="value", groupvars=c("race","ftype"))

#oligosaccharides by mktclass
p.oli.race <- ggplot(summ.df, aes(x=ftype, y=value, colour=race))

p.oli.race <- p.oli.race  + geom_line(aes(group=race)) + geom_point() 

p.oli.race <- p.oli.race + theme(axis.title.y=element_text(margin=margin(0,17,0,0), 
                                                         family="Helvetica", 
                                                         face="bold",
                                                         size=14),
                               axis.text.y=element_text(family="Helvetica",
                                                        size=14),
                               axis.title.x=element_blank(),
                               legend.text=element_text(size=12), 
                               legend.title=element_text(face="bold", 
                                                         size=12),
                               plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
                               legend.position=c(0.8,0.7))

#makes legend one row of text - must reference the aes
p.oli.race <- p.oli.race + guides(colour=guide_legend(ncol=1, 
                                                    title="race"))

#change x axis lables
p.oli.race <- p.oli.race + scale_x_discrete(labels=c("Raff" = "Raffinose", 
                                                   "Stach" = "Stachyose", 
                                                   "Verb" = "Verbascose"), 
                                          expand=c(0.1,0))

#plot labels
p.oli.race <- p.oli.race + labs(title=NULL, 
                              y="% dry wt.")

p.oli.race <- p.oli.race + scale_y_continuous(limits=c(0,4.5), expand=c(0,0))
