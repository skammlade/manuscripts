f <- read.csv("fiber_facet.csv")

#load required packages
require(ggplot2)
require(cowplot)

#create dataframe using only Raff, Stach, Verb and Total Oligos values
f.oligo <- f[f$ftype=="Raff", ]


p <- ggplot(f.oligo, aes(x=ftype, y=value, fill=mktclass))

#barplot
p <- p + geom_boxplot()

#facet by year
p <- p + facet_wrap(~ftype, nrow=1, scales="free_x", switch="x")

#plot theme
p <- p + theme(plot.title=element_text(family="Helvetica", 
                                       face="bold", 
                                       size=36, 
                                       color="firebrick4", 
                                       vjust=20), 
               axis.text.x=element_blank(),
               axis.title.y=element_text(margin=margin(0,17,0,0), 
                                         family="Helvetica", 
                                         face="bold",
                                         size=14),
               axis.text.y=element_text(family="Helvetica",
                                        size=14), 
               axis.ticks.x=element_blank(),
               legend.text=element_text(size=14, 
                                        face="bold"), 
               plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
               legend.position="bottom",
               #panel.grid.major=element_line(color="gray90"),
               #panel.grid.minor=element_line(color="gray90"),
               #panel.grid.major.x=element_blank(),
               #panel.grid.minor.x=element_blank(),
               #change year labels
               strip.text.x=element_text(size=14, face="bold"),
               #increase distance between panels
               panel.margin.x=unit(1, "lines"))
p

