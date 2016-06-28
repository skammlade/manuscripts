#create grades dataset
#attach(fiber)
fiber<- read.csv("fiber.csv")

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub <- subset(fiber, 
                   mktclass=='GN' | 
                     mktclass=='pink' | 
                     mktclass=='pinto' | 
                     mktclass=='small red' | 
                     mktclass=='black' | 
                     mktclass=='small white')

library(ggplot2)

OneWayFit.IDF <- aov(IDF~Entry, data=fibersub)
OneWayFit.SDF <- aov(SDF~Entry, data=fibersub)
OneWayFit.Verb <- aov(Verb~Entry, data=fibersub)
OneWayFit.Raff <- aov(Raff~Entry, data=fibersub)
OneWayFit.Stach <- aov(Stach~Entry, data=fibersub)

#IDF
p1<-ggplot(OneWayFit.IDF, aes(.fitted, .resid))+geom_point()
p1<-p1+geom_hline(yintercept=0, col="red", linetype="dashed")
p1<-p1+xlab("Fitted values")+ylab("Residuals")
p1<-p1+ggtitle("Insoluble DF Residual vs Fitted Plot")+theme_bw()

p2<-ggplot(OneWayFit.IDF, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("Insoluble DF Normal Q-Q")+theme_bw()
p2

#log transform IDF
OneWayFit.logIDF <- aov(log(IDF)~Entry, data=fibersub)

p1log<-ggplot(OneWayFit.logIDF, aes(.fitted, .resid))+geom_point()
p1log<-p1log+geom_hline(yintercept=0, col="red", linetype="dashed")
p1log<-p1log+xlab("Fitted values")+ylab("Residuals")
p1log<-p1log+ggtitle("logInsoluble DF Residual vs Fitted Plot")+theme_bw()

p2log<-ggplot(OneWayFit.logIDF, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("logInsoluble DF Normal Q-Q")+theme_bw()
p2log

#sqrt transform IDF
OneWayFit.sqrtIDF <- aov(sqrt(IDF)~Entry, data=fibersub)

p1sqrt<-ggplot(OneWayFit.sqrtIDF, aes(.fitted, .resid))+geom_point()
p1sqrt<-p1sqrt+geom_hline(yintercept=0, col="red", linetype="dashed")
p1sqrt<-p1sqrt+xlab("Fitted values")+ylab("Residuals")
p1sqrt<-p1sqrt+ggtitle("sqrtInsoluble DF Residual vs Fitted Plot")+theme_bw()

p2sqrt<-ggplot(OneWayFit.sqrtIDF, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("sqrtInsoluble DF Normal Q-Q")+theme_bw()
p2sqrt


#SDF
p3<-ggplot(OneWayFit.SDF, aes(.fitted, .resid))+geom_point()
p3<-p3+geom_hline(yintercept=0, col="red", linetype="dashed")
p3<-p3+xlab("Fitted values")+ylab("Residuals")
p3<-p3+ggtitle("Soluble DF Residual vs Fitted Plot")+theme_bw()

p4<-ggplot(OneWayFit.SDF, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("Soluble DF Normal Q-Q")+theme_bw()
p4

#log transform SDF
OneWayFit.logSDF <- aov(log(SDF)~Entry, data=fibersub)

p3log<-ggplot(OneWayFit.logSDF, aes(.fitted, .resid))+geom_point()
p3log<-p3log+geom_hline(yintercept=0, col="red", linetype="dashed")
p3log<-p3log+xlab("Fitted values")+ylab("Residuals")
p3log<-p3log+ggtitle("logSoluble DF Residual vs Fitted Plot")+theme_bw()

p4log<-ggplot(OneWayFit.logSDF, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("logSoluble DF Normal Q-Q")+theme_bw()
p4log

#sqrt transform SDF
OneWayFit.sqrtSDF <- aov(sqrt(SDF)~Entry, data=fibersub)

p3sqrt<-ggplot(OneWayFit.sqrtSDF, aes(.fitted, .resid))+geom_point()
p3sqrt<-p3sqrt+geom_hline(yintercept=0, col="red", linetype="dashed")
p3sqrt<-p3sqrt+xlab("Fitted values")+ylab("Residuals")
p3sqrt<-p3sqrt+ggtitle("sqrtSoluble DF Residual vs Fitted Plot")+theme_bw()

p4sqrt<-ggplot(OneWayFit.sqrtSDF, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("sqrtSoluble DF Normal Q-Q")+theme_bw()
p4sqrt




#Verb
p5<-ggplot(OneWayFit.Verb, aes(.fitted, .resid))+geom_point()
p5<-p5+geom_hline(yintercept=0, col="red", linetype="dashed")
p5<-p5+xlab("Fitted values")+ylab("Residuals")
p5<-p5+ggtitle("Verbascose Residual vs Fitted Plot")+theme_bw()

p6<-ggplot(OneWayFit.Verb, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("Verbascose Normal Q-Q")+theme_bw()
p6

#log transform Verb
OneWayFit.logVerb <- aov(log(Verb)~Entry, data=fibersub)

p5log<-ggplot(OneWayFit.logVerb, aes(.fitted, .resid))+geom_point()
p5log<-p5log+geom_hline(yintercept=0, col="red", linetype="dashed")
p5log<-p5log+xlab("Fitted values")+ylab("Residuals")
p5log<-p5log+ggtitle("logVerbascose Residual vs Fitted Plot")+theme_bw()


p6log<-ggplot(OneWayFit.logVerb, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("logVerbascose Normal Q-Q")+theme_bw()
p6log

#sqrt transform Verb
OneWayFit.sqrtVerb <- aov(sqrt(Verb)~Entry, data=fibersub)

p5sqrt<-ggplot(OneWayFit.sqrtVerb, aes(.fitted, .resid))+geom_point()
p5sqrt<-p5sqrt+geom_hline(yintercept=0, col="red", linetype="dashed")
p5sqrt<-p5sqrt+xlab("Fitted values")+ylab("Residuals")
p5sqrt<-p5sqrt+ggtitle("sqrtVerbascose Residual vs Fitted Plot")+theme_bw()


p6sqrt<-ggplot(OneWayFit.sqrtVerb, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("sqrtVerbascose Normal Q-Q")+theme_bw()
p6sqrt



#Raff
p7<-ggplot(OneWayFit.Raff, aes(.fitted, .resid))+geom_point()
p7<-p7+geom_hline(yintercept=0, col="red", linetype="dashed")
p7<-p7+xlab("Fitted values")+ylab("Residuals")
p7<-p7+ggtitle("Raffanose Residual vs Fitted Plot")+theme_bw()

p8<-ggplot(OneWayFit.Raff, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("Raffanose Normal Q-Q")+theme_bw()
p8

#log transform Raff
OneWayFit.logRaff <- aov(log(Raff)~Entry, data=fibersub)

p7log<-ggplot(OneWayFit.logRaff, aes(.fitted, .resid))+geom_point()
p7log<-p7log+geom_hline(yintercept=0, col="red", linetype="dashed")
p7log<-p7log+xlab("Fitted values")+ylab("Residuals")
p7log<-p7log+ggtitle("logRaffanose Residual vs Fitted Plot")+theme_bw()


p8log<-ggplot(OneWayFit.logRaff, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("logRaffanose Normal Q-Q")+theme_bw()
p8log

#sqrt transform Raff
OneWayFit.sqrtRaff <- aov(sqrt(Raff)~Entry, data=fibersub)

p7sqrt<-ggplot(OneWayFit.sqrtRaff, aes(.fitted, .resid))+geom_point()
p7sqrt<-p7sqrt+geom_hline(yintercept=0, col="red", linetype="dashed")
p7sqrt<-p7sqrt+xlab("Fitted values")+ylab("Residuals")
p7sqrt<-p7sqrt+ggtitle("sqrtRaffanose Residual vs Fitted Plot")+theme_bw()


p8sqrt<-ggplot(OneWayFit.sqrtRaff, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("sqrtRaffanose Normal Q-Q")+theme_bw()
p8sqrt


#Stach
p9<-ggplot(OneWayFit.Stach, aes(.fitted, .resid))+geom_point()
p9<-p9+geom_hline(yintercept=0, col="red", linetype="dashed")
p9<-p9+xlab("Fitted values")+ylab("Residuals")
p9<-p9+ggtitle("Stachyose Residual vs Fitted Plot")+theme_bw()

p10<-ggplot(OneWayFit.Stach, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("Stachyose Normal Q-Q")+theme_bw()
p10

#log transform Stach
OneWayFit.logStach <- aov(log(Stach)~Entry, data=fibersub)

p9log<-ggplot(OneWayFit.logStach, aes(.fitted, .resid))+geom_point()
p9log<-p9log+geom_hline(yintercept=0, col="red", linetype="dashed")
p9log<-p9log+xlab("Fitted values")+ylab("Residuals")
p9log<-p9log+ggtitle("logStachanose Residual vs Fitted Plot")+theme_bw()


p10log<-ggplot(OneWayFit.logStach, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("logStachanose Normal Q-Q")+theme_bw()
p10log

#sqrt transform Stach
OneWayFit.sqrtStach <- aov(sqrt(Stach)~Entry, data=fibersub)

p9sqrt<-ggplot(OneWayFit.sqrtStach, aes(.fitted, .resid))+geom_point()
p9sqrt<-p9sqrt+geom_hline(yintercept=0, col="red", linetype="dashed")
p9sqrt<-p9sqrt+xlab("Fitted values")+ylab("Residuals")
p9sqrt<-p9sqrt+ggtitle("sqrtStachanose Residual vs Fitted Plot")+theme_bw()

p10sqrt<-ggplot(OneWayFit.sqrtStach, aes(sample=.stdresid))+geom_qq()+geom_abline()+xlab("Theoretical Quantiles")+ylab("Standardized Residuals")+ggtitle("sqrtStachanose Normal Q-Q")+theme_bw()
p10sqrt


library(cowplot)
plot_grid(p1,p2,p1log,p2log,p1sqrt,p2sqrt, ncol=2, labels = c("A", "B", "C", "D", "E", "F"))
plot_grid(p3,p4,p3log,p4log,p3sqrt,p4sqrt, ncol=2, labels = c("A", "B", "C", "D", "E", "F"))
plot_grid(p5,p6,p5log,p6log,p5sqrt,p6sqrt, ncol=2, labels = c("A", "B", "C", "D", "E", "F"))
plot_grid(p7,p8,p7log,p8log,p7sqrt,p8sqrt, ncol=2, labels = c("A", "B", "C", "D", "E", "F"))
plot_grid(p9,p10,p9log,p10log,p9sqrt,p10sqrt, ncol=2, labels = c("A", "B", "C", "D", "E", "F"))
