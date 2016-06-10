fiber<- read.csv("fiber.csv")

require(ggplot2)
require(cowplot)

#one way ANOVA
OneWayFit.IDF <- aov(IDF~Entry, data=fiber)
summary(OneWayFit.IDF)

#diagnostics
# residuals vs predicted values
p.resid.idf <- plot(fitted(OneWayFit.IDF), residuals(OneWayFit.IDF), main="Resids vs Pred"); abline(h=0)
# check normality of residuals
p.hist.IDF <- ggplot(data=fiber, aes(fiber$IDF)) + geom_histogram(colour = "black", fill="white", binwidth=((max(fiber$IDF)-min(fiber$IDF))/15))
p.qqnorm.idf <- qqnorm(residuals(OneWayFit.IDF))
p.qqline.idf <- qqline(residuals(OneWayFit.IDF))
test.shap.idf <- shapiro.test(residuals(OneWayFit.IDF))
test.ks.idf <- ks.test(residuals(OneWayFit.IDF), "pnorm", mean(residuals(OneWayFit.IDF)), sd(residuals(OneWayFit.IDF)))

#logtransform IDF
OneWayFit.logIDF <- aov(log(IDF)~Entry, data=fiber)
p.resid.logidf <- plot(fitted(OneWayFit.logIDF), residuals(OneWayFit.logIDF), main="Resids vs Pred log transform"); abline(h=0)
p.qqnorm.idf <- qqnorm(residuals(OneWayFit.logIDF))
p.qqline.idf <- qqline(residuals(OneWayFit.logIDF))
test.shap.idf <- shapiro.test(residuals(OneWayFit.logIDF))
test.ks.idf <- ks.test(residuals(OneWayFit.logIDF), "pnorm", mean(residuals(OneWayFit.logIDF)), sd(residuals(OneWayFit.logIDF)))

#one way ANOVA
OneWayFit.SDF <- aov(SDF~Entry, data=fiber)
summary(OneWayFit.SDF)

#diagnostics
# residuals vs predicted values
p.resid.SDF <- plot(fitted(OneWayFit.SDF), residuals(OneWayFit.SDF), main="Resids vs Pred"); abline(h=0)
# check normality of residuals
p.hist.SDF <- ggplot(data=fiber, aes(fiber$SDF)) + geom_histogram(colour = "black", fill="white", binwidth=((max(fiber$SDF)-min(fiber$SDF))/15))
p.qqnorm.SDF <- qqnorm(residuals(OneWayFit.SDF))
p.qqline.SDF <- qqline(residuals(OneWayFit.SDF))
test.shap.SDF <- shapiro.test(residuals(OneWayFit.SDF))
test.ks.SDF <- ks.test(residuals(OneWayFit.SDF), "pnorm", mean(residuals(OneWayFit.SDF)), sd(residuals(OneWayFit.SDF)))

#one way ANOVA
OneWayFit.Raff <- aov(Raff~Entry, data=fiber)
summary(OneWayFit.Raff)

#diagnostics
# residuals vs predicted values
p.resid.Raff <- plot(fitted(OneWayFit.Raff), residuals(OneWayFit.Raff), main="Resids vs Pred"); abline(h=0)
# check normality of residuals
p.hist.Raff <- ggplot(data=fiber, aes(fiber$Raff)) + geom_histogram(colour = "black", fill="white", binwidth=((max(fiber$Raff)-min(fiber$Raff))/15))
p.qqnorm.Raff <- qqnorm(residuals(OneWayFit.Raff))
p.qqline.Raff <- qqline(residuals(OneWayFit.Raff))
test.shap.Raff <- shapiro.test(residuals(OneWayFit.Raff))
test.ks.Raff <- ks.test(residuals(OneWayFit.Raff), "pnorm", mean(residuals(OneWayFit.Raff)), sd(residuals(OneWayFit.Raff)))

#logtransform Raff
OneWayFit.logRaff <- aov(log(Raff)~Entry, data=fiber)
p.resid.logRaff <- plot(fitted(OneWayFit.logRaff), residuals(OneWayFit.logRaff), main="Resids vs Pred log transform"); abline(h=0)
p.qqnorm.Raff <- qqnorm(residuals(OneWayFit.logRaff))
p.qqline.Raff <- qqline(residuals(OneWayFit.logRaff))
test.shap.Raff <- shapiro.test(residuals(OneWayFit.logRaff))
test.ks.Raff <- ks.test(residuals(OneWayFit.logRaff), "pnorm", mean(residuals(OneWayFit.logRaff)), sd(residuals(OneWayFit.logRaff)))


#one way ANOVA
OneWayFit.Verb <- aov(Verb~Entry, data=fiber)
summary(OneWayFit.Verb)

#diagnostics
# residuals vs predicted values
p.resid.Verb <- plot(fitted(OneWayFit.Verb), residuals(OneWayFit.Verb), main="Resids vs Pred"); abline(h=0)
# check normality of residuals
p.hist.Verb <- ggplot(data=fiber, aes(fiber$Verb)) + geom_histogram(colour = "black", fill="white", binwidth=((max(fiber$Verb)-min(fiber$Verb))/15))
p.qqnorm.Verb <- qqnorm(residuals(OneWayFit.Verb))
p.qqline.Verb <- qqline(residuals(OneWayFit.Verb))
test.shap.Verb <- shapiro.test(residuals(OneWayFit.Verb))
test.ks.Verb <- ks.test(residuals(OneWayFit.Verb), "pnorm", mean(residuals(OneWayFit.Verb)), sd(residuals(OneWayFit.Verb)))

#one way ANOVA
OneWayFit.Stach <- aov(Stach~Entry, data=fiber)
summary(OneWayFit.Stach)

#diagnostics
# residuals vs predicted values
p.resid.Stach <- plot(fitted(OneWayFit.Stach), residuals(OneWayFit.Stach), main="Resids vs Pred"); abline(h=0)
# check normality of residuals
p.hist.Stach <- ggplot(data=fiber, aes(fiber$Stach)) + geom_histogram(colour = "black", fill="white", binwidth=((max(fiber$Stach)-min(fiber$Stach))/15))
p.qqnorm.Stach <- qqnorm(residuals(OneWayFit.Stach))
p.qqline.Stach <- qqline(residuals(OneWayFit.Stach))
test.shap.Stach <- shapiro.test(residuals(OneWayFit.Stach))
test.ks.Stach <- ks.test(residuals(OneWayFit.Stach), "pnorm", mean(residuals(OneWayFit.Stach)), sd(residuals(OneWayFit.Stach)))
