library("hydroTSM")
library("tidyverse")
data(SanMartinoPPts)
rainfall <- as.vector(window(SanMartinoPPts,start=as.Date("1985-01-01"),end=as.Date("1985-01-02")+99))
ggplot(tibble(rainfall),aes(x=rainfall))+xlab("Daily rainfall (mm)")+geom_density(adjust=10,size=1)+xlim(c(0,50))
mean(rainfall,na.rm=TRUE)
median(rainfall,na.rm=TRUE)
library("palmerpenguins")
plot <- ggplot(filter(penguins,species=="Adelie"),aes(x=flipper_length_mm))+xlab("Flipper length (mm)")+geom_density(adjust=1,size=1)
plot+
geom_vline(aes(xintercept=mean(flipper_length_mm,na.rm=TRUE),linetype="mean",color="mean"),size=1)+
scale_linetype_manual(name="stats",values=c(mean="dashed",median="dotted",t_mean="dotdash"))+
scale_color_manual(name="stats",values=c(mean="red",median="blue",t_mean="purple"))
quantile(rainfall,na.rm=TRUE,probs=seq(0,1,0.1))
