#correlations between soil health and soil food web
install.packages("psych")
attach(corr_health_foodweb)
corrDf <- corr_health_foodweb
data.frame(corrDf)

#correlation values
cor(corrDf, 
    use="complete.obs", 
    method="pearson")

#correlation values with probability
corr.test(corrDf, 
          y=NULL, 
          use="pairwise", 
          method="pearson")

#cor.test to double check corr.test output
cor.test(corrDf$TotalBact, corrDf$Solvita)