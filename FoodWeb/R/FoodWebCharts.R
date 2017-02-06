#summarySE for standard errors
SummBact<-summarySE(FoodWeb, measurevar="TotalBact", groupvars=c("Location","Clone"))
SummFung<-summarySE(FoodWeb, measurevar="TotalFung", groupvars=c("Location","Clone"))



#plots using multiplot with error bars but no letters above bars
PlotFung<-ggplot(SummFung, aes(x=Clone, y=TotalFung, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=TotalFung-se, ymax=TotalFung+se),width=.2,position=position_dodge(0.9))
PlotBact<-ggplot(SummBact, aes(x=Clone, y=TotalBact, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=TotalBact-se, ymax=TotalBact+se),width=.2,position=position_dodge(0.9))
multiplot(PlotBact, PlotFung, cols=1)

#plots using cowplot
#letters for differences between least squared means
library(cowplot)
lettersBact<-c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20")
plot.Bact<-ggplot(SummBact, aes(x=Clone, y=TotalBact, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=TotalBact-se, ymax=TotalBact+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_text(angle=70, vjust=0.5))+geom_text(aes(label=lettersBact, y=TotalBact+se),position=position_dodge(width=0.9), vjust=-0.25)
lettersFung<-c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20")
plot.Fung<-ggplot(SummFung, aes(x=Clone, y=TotalFung, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=TotalFung-se, ymax=TotalFung+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_text(angle=70, vjust=0.5))+geom_text(aes(label=lettersFung, y=TotalFung+se),position=position_dodge(width=0.9), vjust=-0.25)
plot_grid(plot.Bact,plot.Fung, labels = c("A", "B"), ncol = 1, align="h")

#plots using cowplot
#removing x axis lables and legends
lettersBact<-c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20")
plot.Bact<-ggplot(SummBact, aes(x=Clone, y=TotalBact, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=TotalBact-se, ymax=TotalBact+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(),legend.position="none")+geom_text(aes(label=lettersBact, y=TotalBact+se),position=position_dodge(width=0.9), vjust=-0.25)
lettersFung<-c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20")
plot.Fung<-ggplot(SummFung, aes(x=Clone, y=TotalFung, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=TotalFung-se, ymax=TotalFung+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(),legend.position="none")+geom_text(aes(label=lettersFung, y=TotalFung+se),position=position_dodge(width=0.9), vjust=-0.25)
plot_grid(plot.Bact,plot.Fung, labels = c("A", "B"), ncol = 1, align="h")



#plots using cowplot with labels removed
#removing x axis lables and 

ggplot(SummBact, aes(x=Location, y=TotalBact, fill=Location))+facet_wrap(~Clone, nrow=1)+geom_bar(aes(fill=Location), stat="identity")
ggplot(SummBact, aes(x=Clone, y=TotalBact))+facet_wrap(~Clone,nrow=1)+geom_bar(position=position_dodge(), stat="identity", aes(fill=Location))+geom_errorbar(aes(ymin=TotalBact-se, ymax=TotalBact+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(),legend.position="none")+labs(y="Total Bacteria\n (ug/g soil)", x=NULL)

#using facet_wrap
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

cbPalette<-c("#a1dab4", "#41b6c4", "#2c7fb8","#253494")

plot.Bact <- ggplot(SummBact, aes(colour, x=Location, y=TotalBact, fill=Location))+
  facet_wrap(~Clone,nrow=1)+geom_bar(position=position_dodge(), stat="identity")+geom_errorbar(aes(ymin=TotalBact-se, ymax=TotalBact+se),width=.2,position=position_dodge(0.9))+theme(axis.line=element_line(colour="white", size=0.25, linetype="solid"), panel.border = element_rect(colour = "white", fill=NA, size=0.5, linetype="solid"),panel.margin=unit(0.6, "lines"), axis.text.x = element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(),legend.position="top")+labs(y="Total Bacteria\n(ug/g soil)", x=NULL)+scale_fill_manual(values=cbPalette)                                                                                                        



plot.Fung<-ggplot(SummFung, aes(x=Location, y=TotalFung, fill=Location))+facet_wrap(~Clone,nrow=1)+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=TotalFung-se, ymax=TotalFung+se),width=.2,position=position_dodge(0.9))+theme(axis.line=element_line(colour="white", size=0.25, linetype="solid"), panel.border = element_rect(colour = "white", fill=NA, size=0.5, linetype="solid"),panel.margin=unit(0.6, "lines"), axis.text.x = element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(),legend.position="bottom",legend.title=element_text(family="Helvetica", size=12, face="bold"))+labs(y="Total Fungi\n(ug/g soil)", x=NULL, legend="Location:")+scale_fill_manual(values=cbPalette)

plot_grid(plot.Bact,plot.Fung, labels = c("A", "B"), ncol = 1, align="v")









#single horizontal figure with legend on bottom fake graph
cbPalette<-c("#a1dab4", "#41b6c4", "#2c7fb8","#253494")

plot.Bact <- ggplot(SummBact, aes(colour, x=Clone, y=TotalBact, fill=Location))
plot.Bact <- plot.Bact + geom_bar(color="white", 
                                  width=0.9, 
                                  position=position_dodge(width=0.9),
                                  stat="identity")
plot.Bact <- plot.Bact + geom_errorbar(aes(ymin=TotalBact-se, 
                                           ymax=TotalBact+se),
                                       width=.2,
                                       position=position_dodge(0.9))
plot.Bact <- plot.Bact + theme(axis.line=element_line(colour="white", 
                                                      size=0.25, 
                                                      linetype="solid"), 
                               legend.title=element_text(family="Helvetica", 
                                                         size=12, face="bold"),
                               panel.border = element_rect(colour = "white", 
                                                           fill=NA, 
                                                           size=0.5, 
                                                           linetype="solid"),
                               panel.margin=unit(0.6, "lines"), 
                               axis.text.x = element_blank(), 
                               axis.title.x=element_blank(), 
                               axis.ticks.x = element_blank(),
                               axis.text.y = element_text(size=20,
                                                          family = "Helvetica"),
                               axis.title.y = element_text(size=25,
                                                           family = "Helvetica",
                                                           face="bold"), 
                               legend.position="none")
plot.Bact <- plot.Bact + ylab(expression(atop(paste('Total bacteria'), '('*mu*'g gsoil'^-1*')')))
plot.Bact <- plot.Bact + scale_fill_manual(values=cbPalette)
plot.Bact <- plot.Bact + scale_y_continuous(expand=c(0,0))

plot.Fung <- ggplot(SummFung, 
                    aes(x=Clone, 
                        y=TotalFung, 
                        fill=Location))
plot.Fung <- plot.Fung + geom_bar(color="white",
                                  width=0.9, 
                                  position=position_dodge(width=0.9),
                                  stat="identity")
plot.Fung <- plot.Fung + geom_errorbar(aes(ymin=TotalFung-se, 
                                           ymax=TotalFung+se),
                                       width=.2,
                                       position=position_dodge(0.9))
plot.Fung <- plot.Fung + theme(axis.line=element_line(colour="white", 
                                                      size=0.25, 
                                                      linetype="solid"),
                               panel.border = element_rect(colour = "white", 
                                                           fill=NA, size=0.5, 
                                                           linetype="solid"),
                               panel.margin=unit(0.6, "lines"), 
                               axis.text.x = element_text(size=25, 
                                                          face="bold"), 
                               axis.title.x=element_blank(), 
                               axis.ticks.x = element_blank(),
                               axis.text.y = element_text(size=20,
                                                          family = "Helvetica"),
                               axis.title.y = element_text(size=25,
                                                           family = "Helvetica",
                                                           face="bold"),
                               legend.position="none")
plot.Fung <- plot.Fung + ylab(expression(atop(paste('Total fungi'), '('*mu*'g gsoil'^-1*')')))
plot.Fung <- plot.Fung + scale_fill_manual(values=cbPalette)
plot.Fung <- plot.Fung + scale_y_continuous(expand=c(0,0))

library(cowplot)
plot_grid(plot.Bact,plot.Fung, labels = c("A", "B"), ncol = 1, align = "v")