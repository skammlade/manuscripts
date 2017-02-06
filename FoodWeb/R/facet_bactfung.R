#summarySE for standard errors
SummBact<-summarySE(FoodWeb, measurevar="TotalBact", groupvars=c("Location","Clone"))
SummFung<-summarySE(FoodWeb, measurevar="TotalFung", groupvars=c("Location","Clone"))


#using facet_wrap
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



p.Bact <- ggplot(SummBact, aes(colour, x=Location, y=TotalBact, fill=Location))

p.Bact <- p.Bact + facet_wrap(~Clone,nrow=1)

p.Bact <- p.Bact + geom_bar(position=position_dodge(), stat="identity")

p.Bact <- p.Bact + geom_errorbar(aes(ymin=TotalBact-se, ymax=TotalBact+se),width=.2,position=position_dodge(0.9))

p.Bact <- p.Bact + theme(axis.line=element_line(colour="white", size=0.25, linetype="solid"), 
                         panel.border = element_rect(colour = "white", 
                                                     fill=NA, size=0.5, 
                                                     linetype="solid"),
                         panel.margin=unit(0.6, "lines"), 
                         axis.text.x = element_blank(), 
                         axis.title.x=element_blank(), 
                         axis.ticks.x=element_blank(),
                         legend.position="top")

p.Bact <- p.Bact + labs(y="Total Bacteria\n(ug/g soil)", 
                        x=NULL)

p.Bact <- p.Bact + scale_fill_manual(values=cbPalette)                                                                                                



library(ggplot2)
library(pracma)
library(cowplot)

#attach(fiber)
bactfung <- FoodWeb_longform

cbPalette<-c("#a1dab4", "#41b6c4", "#2c7fb8","#253494")


summ.bactfung <- summarySE(bactfung, measurevar = "value", groupvars=c("Location", "Clone", "type"))

summ.bactfung$type <- factor(summ.bactfung$type, 
                          levels=c('TotalBact', 'TotalFung'), 
                          labels = c( 'Total Bacteria', 'Total Fungi'))

#plot
p.Bact <- ggplot(summ.bactfung, 
                            aes(x=Location, 
                                y=value, 
                                fill=Location))

p.Bact <- p.Bact + facet_grid(type~Clone, 
                              scales = "free",
                              space = "free_x",
                              switch="x")

p.Bact <- p.Bact + geom_bar(width=0.9,
                            stat="identity")

p.Bact <- p.Bact + geom_errorbar(aes(ymin=value-se, ymax=value+se),width=.2,position=position_dodge(0.9))


#plot theme
p.Bact <- p.Bact + theme(axis.text.x=element_blank(),
                         axis.title.x=element_blank(),
                                                axis.text.y=element_text(family="Helvetica",
                                                                         size=25), 
                         axis.title.y = element_text(family="Helvetica",
                                                     size=25),
                                                axis.ticks.x=element_blank(),
                                                legend.text=element_text(size=20), 
                                                plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
                                                legend.position="bottom",
                                                strip.text.x=element_text(size=25, face="bold"),
                                                strip.text.y=element_text(size=25, face="bold"),
                                                panel.margin.x=unit(1.5, "lines"),
                                                panel.margin.y=unit(1, "lines"),
                                                legend.title=element_text(size=20, family="Helvetica"),
                         strip.background=element_rect(fill="white"))


#y axis title, plot title
p.Bact <- p.Bact + ylab(expression(paste(mu, "g/g soil")))
                          
                          
                     #     "ug/g soil")  expression(atop(paste('Total bacteria'), '('*mu*'g gsoil'^-1*')'))


p.Bact <- p.Bact + scale_fill_manual(values=cbPalette, 
                                     labels=c("1-Conv  ","2-Conv  ","3-Org  ","4-Org  "))

p.Bact <- p.Bact + guides(fill=guide_legend(keywidth=0.2,
                                            keyheight=0.1,
                                            default.unit="inch"))

# pbar.mktrace.SIDF <-  pbar.mktrace.SIDF + scale_y_continuous(expand=c(0,0.9))
p.Bact <- p.Bact + scale_y_continuous(expand=c(0,0)) 

p.Bact








