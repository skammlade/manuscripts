##    -   ANOVA Tables

##### IDF
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(IDF~mktclass, data=fiber)
summary(OneWayFit)
```
##### SDF
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(SDF~mktclass, data=fiber)
summary(OneWayFit)
```
##### Raffinose
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Raff~mktclass, data=fiber)
summary(OneWayFit)
```
##### Stachyose
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Stach~mktclass, data=fiber)
summary(OneWayFit)
```
##### Verbascose
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Verb~mktclass, data=fiber)
summary(OneWayFit)
```
##### Total Oligosaccharides (TOligos)
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(TOligos~mktclass, data=fiber)
summary(OneWayFit)
```
##### Total Dietary Fiber (TDF)
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(TDF~mktclass, data=fiber)
summary(OneWayFit)
```