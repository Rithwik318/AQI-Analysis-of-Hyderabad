setwd("C:/Users/WoW/Downloads/MonthlyAQI")

#install.packages("readxl")
library("readxl")
#install.packages('tidyverse')
library(tidyverse)
#install.packages('plotly')
library(plotly)
#install.packages("ggfortify")
library(ggfortify)
#install.packages("NbClust")
library(NbClust)
#install.packages("cluster")
library(cluster)
#install.packages("plotrix")
library(plotrix)
#install.packages("factoextra")
library(factoextra)

aqi2016<-read_excel("AQI2016.xlsx")
aqi2017<-read_excel("aqi2017.xlsx")
aqi2018<-read_excel("aqi2018.xlsx")
aqi2019<-read_excel("aqi2019.xlsx")
aqi2020<-read_excel("aqi2020.xlsx")
aqi2021<-read_excel("aqi2021.xlsx")
aqi2022<-read_excel("aqi2022.xlsx")

#Getting Area Name
area_name<- function(i) {
  a<-as.data.frame(aqi2016[i,1])
  area<-a$Location
  return(area)
}



#Creating a Vector of AQI of the Area
area_vector<- function(i) {
  aqi2016df<-as.data.frame(aqi2016[i,2:13])
  aqi2016vec<-c(aqi2016df$Jan,aqi2016df$Feb,aqi2016df$Mar,aqi2016df$Apr,aqi2016df$May,aqi2016df$Jun,aqi2016df$Jul,aqi2016df$Aug,aqi2016df$Sep,aqi2016df$Oct,aqi2016df$Nov,aqi2016df$Dec)
  aqi2017df<-as.data.frame(aqi2017[i,2:13])
  aqi2017vec<-c(aqi2017df$Jan,aqi2017df$Feb,aqi2017df$Mar,aqi2017df$Apr,aqi2017df$May,aqi2017df$Jun,aqi2017df$Jul,aqi2017df$Aug,aqi2017df$Sep,aqi2017df$Oct,aqi2017df$Nov,aqi2017df$Dec)
  aqi2018df<-as.data.frame(aqi2018[i,2:13])
  aqi2018vec<-c(aqi2018df$Jan,aqi2018df$Feb,aqi2018df$Mar,aqi2018df$Apr,aqi2018df$May,aqi2018df$Jun,aqi2018df$Jul,aqi2018df$Aug,aqi2018df$Sep,aqi2018df$Oct,aqi2018df$Nov,aqi2018df$Dec)
  aqi2019df<-as.data.frame(aqi2019[i,2:13])
  aqi2019vec<-c(aqi2019df$Jan,aqi2019df$Feb,aqi2019df$Mar,aqi2019df$Apr,aqi2019df$May,aqi2019df$Jun,aqi2019df$Jul,aqi2019df$Aug,aqi2019df$Sep,aqi2019df$Oct,aqi2019df$Nov,aqi2019df$Dec)
  aqi2020df<-as.data.frame(aqi2020[i,2:13])
  aqi2020vec<-c(aqi2020df$Jan,aqi2020df$Feb,aqi2020df$Mar,aqi2020df$Apr,aqi2020df$May,aqi2020df$Jun,aqi2020df$Jul,aqi2020df$Aug,aqi2020df$Sep,aqi2020df$Oct,aqi2020df$Nov,aqi2020df$Dec)
  aqi2021df<-as.data.frame(aqi2021[i,2:13])
  aqi2021vec<-c(aqi2021df$Jan,aqi2021df$Feb,aqi2021df$Mar,aqi2021df$Apr,aqi2021df$May,aqi2021df$Jun,aqi2021df$Jul,aqi2021df$Aug,aqi2021df$Sep,aqi2021df$Oct,aqi2021df$Nov,aqi2021df$Dec)
  aqi2022df<-as.data.frame(aqi2022[i,2:13])
  aqi2022vec<-c(aqi2022df$Jan,aqi2022df$Feb,aqi2022df$Mar,aqi2022df$Apr,aqi2022df$May,aqi2022df$Jun,aqi2022df$Jul,aqi2022df$Aug,aqi2022df$Sep,aqi2022df$Oct,aqi2022df$Nov,aqi2022df$Dec)
  suppressWarnings(area_aqi<-as.integer((c(aqi2016vec,aqi2017vec,aqi2018vec,aqi2019vec,aqi2020vec,aqi2021vec,aqi2022vec))))
  return(area_aqi)
}

aqi<-cbind(aqi2016$Avg,aqi2017$Avg)
aqi<-cbind(aqi,aqi2018$Avg)
aqi<-cbind(aqi,aqi2019$Avg)
aqi<-cbind(aqi,aqi2020$Avg)
aqi<-cbind(aqi,aqi2021$Avg)
aqi<-cbind(aqi,aqi2022$Avg)
aqi


noRows<-25
for(i in 1:noRows){
  if(sum(is.na(aqi[i,]))){
    aqi[i,][is.na(aqi[i,])] <- mean(aqi[i,], na.rm = TRUE)
  }
}
aqi<-rowMeans(aqi)
aqi
place <-c(aqi2016[,1])
df2<-data.frame(
  Location<-place,
  aqi_overall_avg <-aqi
)

df2

aqi_range<-c(ifelse(aqi_overall_avg>400,"Severe(>400)",
                    ifelse(aqi_overall_avg>300,"Very poor(301-400)",
                           ifelse(aqi_overall_avg>200,"Poor(201-300)",
                                  ifelse(aqi_overall_avg>100,"Moderate(101-200)",
                                         ifelse(aqi_overall_avg>50,"Satisfactory(51-100)","Good(0-50)"))))))

ggplot(df2,aes(x=Location,y=aqi_overall_avg,fill=aqi_range))+
  labs(title = "Overall Mean AQI for Different Places in Hyderabad",face="bold")+
  geom_bar(stat = "identity")+
  scale_fill_manual(values=c('#F9FF50','#25D84A'))+
  theme_bw()+
  coord_flip()


date<-seq(as.Date("2016-01-01"),as.Date("2022-12-01"),by="month")

df<-data.frame(date,area_vector(1),area_vector(2),area_vector(3),area_vector(4),area_vector(5),area_vector(6),area_vector(7),area_vector(8),area_vector(9),area_vector(10),area_vector(11),area_vector(12),area_vector(13),area_vector(14),area_vector(15),area_vector(16),area_vector(17),area_vector(18),area_vector(19),area_vector(20),area_vector(21),area_vector(22),area_vector(23),area_vector(24),area_vector(25))
areanames<-c("Balanagar","Uppal","JubileeHills","Paradise","Charminar","Jeedimetla","Abids","KBRNPark","LangarHouse","Madhapur","MGBS","Chikkadapally","Kukatpally","Nacharam","Rajendranagar","Sainikpuri","BPPA","Shameerpet","HCU","Panjagutta","Sanathnagar","ZooPark","Pashamylaram","Bollaram","ICRISAT")
colnames(df)<-c("Date",areanames)
summary(df)

df$MGBS[which(is.na(df$MGBS))]<-as.integer(mean(df$MGBS,na.rm=TRUE))
df$Nacharam[which(is.na(df$Nacharam))]<-as.integer(mean(df$Nacharam,na.rm=TRUE))
df$Sainikpuri[which(is.na(df$Sainikpuri))]<-as.integer(mean(df$Sainikpuri,na.rm=TRUE))
df$Shameerpet[which(is.na(df$Shameerpet))]<-as.integer(mean(df$Shameerpet,na.rm=TRUE))
df$Panjagutta[which(is.na(df$Panjagutta))]<-as.integer(mean(df$Panjagutta,na.rm=TRUE))
df$ZooPark[which(is.na(df$ZooPark))]<-as.integer(mean(df$ZooPark,na.rm=TRUE))
df$Bollaram[which(is.na(df$Bollaram))]<-as.integer(mean(df$Bollaram,na.rm=TRUE))
df$ICRISAT[which(is.na(df$ICRISAT))]<-as.integer(mean(df$ICRISAT,na.rm=TRUE))
is.na(df)

#For Clustering, we need unlabelled data
mydata=select(df,c(2:26))

#Getting the transpose of the data for forming clusters
mydatat<-as.data.frame(t(mydata))
colnames(mydatat)<-c(date)

#Finding Optimum m=number of Clusters
#Method 1
#WSS Plot Function
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
  wss
}
wssplot(mydatat)

#Method 2
set.seed(1234)
nc <- NbClust(mydata, min.nc=2, max.nc=15, method="kmeans")


KM = kmeans(mydatat,3)
#KM1= kmeans(mydata,3)
fviz_cluster(KM,data=mydatat)
autoplot(KM,mydatat,frame=TRUE)
KM$centers
KM$cluster

#Plots of Cluster 1

c1plot  <-  ggplot(data=df,mapping=aes(x=Date))+
  geom_line(mapping=aes(y=KBRNPark,color="KBRNPark"),linewidth=0.5)+
  geom_line(mapping=aes(y=Madhapur,color="Madhapur"),linewidth=0.5)+
  geom_line(mapping=aes(y=MGBS,color="MGBS"),linewidth=0.5)+
  geom_line(mapping=aes(y=Chikkadapally,color="Chikkadapally"),linewidth=0.5)+
  geom_line(mapping=aes(y=Rajendranagar,color="Rajendranagar"),linewidth=0.5)+
  geom_line(mapping=aes(y=Sainikpuri,color="Sainikpuri"),linewidth=0.5)+
  geom_line(mapping=aes(y=BPPA,color="BPPA"),linewidth=0.5)+
  geom_line(mapping=aes(y=Shameerpet,color="Shameerpet"),linewidth=0.5)+
  theme_bw()+
  labs(title=paste("Cluster 1 Plots"))+
  xlab("Date")+
  ylab('AQI')
ggplotly(c1plot)

#Plots of Cluster 2

c2plot  <-  ggplot(data=df,mapping=aes(x=Date))+
  geom_line(mapping=aes(y=Balanagar,color="Balanagar"),linewidth=0.5)+
  geom_line(mapping=aes(y=Uppal,color="Uppal"),linewidth=0.5)+
  geom_line(mapping=aes(y=JubileeHills,color="JubileeHills"),linewidth=0.5)+
  geom_line(mapping=aes(y=Paradise,color="Paradise"),linewidth=0.5)+
  geom_line(mapping=aes(y=Charminar,color="Charminar"),linewidth=0.5)+
  geom_line(mapping=aes(y=Jeedimetla,color="Jeedimetla"),linewidth=0.5)+
  geom_line(mapping=aes(y=Abids,color="Abids"),linewidth=0.5)+
  geom_line(mapping=aes(y=LangarHouse,color="LangarHouse"),linewidth=0.5)+
  geom_line(mapping=aes(y=Kukatpally,color="Kukatpally"),linewidth=0.5)+
  geom_line(mapping=aes(y=Nacharam,color="Nacharam"),linewidth=0.5)+
  geom_line(mapping=aes(y=HCU,color="HCU"),linewidth=0.5)+
  geom_line(mapping=aes(y=Panjagutta,color="Panjagutta"),linewidth=0.5)+
  theme_bw()+
  labs(title=paste("Cluster 2 Plots"))+
  xlab("Date")+
  ylab('AQI')
ggplotly(c2plot)

#Plots of Cluster 3

c3plot  <-  ggplot(data=df,mapping=aes(x=Date))+
  geom_line(mapping=aes(y=Sanathnagar,color="Sanathnagar"),linewidth=0.5)+
  geom_line(mapping=aes(y=ZooPark,color="ZooPark"),linewidth=0.5)+
  geom_line(mapping=aes(y=Pashamylaram,color="Pashamylaram"),linewidth=0.5)+
  geom_line(mapping=aes(y=Bollaram,color="Bollaram"),linewidth=0.5)+
  geom_line(mapping=aes(y=ICRISAT,color="ICRISAT"),linewidth=0.5)+
  theme_bw()+
  labs(title=paste("Cluster 3 Plots"))+
  xlab("Date")+
  ylab('AQI')
ggplotly(c3plot)


#Pie Chart of Cluster 1
x1<-c(mean(df$KBRNPark),mean(df$Madhapur),mean(df$MGBS),mean(df$Chikkadapally),mean(df$Rajendranagar),mean(df$Sainikpuri),mean(df$BPPA),mean(df$Shameerpet))
pct=round(x1/sum(x1)*100)
names1<-c("KBRNPark", "Madhapur", "MGBS", "Chikkadapally","Rajendranagar","Sainikpuri","BPPA","Shameerpet")
label1<-paste(names1,"-",pct,"%",sep="")
col1<-c("#FFBBA9", "#FFFB74", "#9AFF4D", "#A05FFF","#FF5067","#6139FF","#71FFE3","#0EFF0E")
pie3D(x1, labels = label1, main = "Cluster 1 AQI Average Distribution",col=col1,explode=0.1)
legend("bottom", label1, fill = col1)

#Pie Chart of Cluster 2
x2<-c(mean(df$Balanagar),mean(df$Uppal),mean(df$JubileeHills),mean(df$Paradise),mean(df$Charminar),mean(df$Jeedimetla),mean(df$Kukatpally),mean(df$Panjagutta))
pct2=round(x2/sum(x2)*100)
names2<-c("Balanagar", "Uppal", "JubileeHills", "Paradise","Charminar","Jeedimetla","Kukatpally","Panjagutta")
label2<-paste(names2,"-",pct2,"%",sep="")
col2<-c("#FF8BE4", "#FF567D", "#68FF8B", "##F7FF2A","#FF7437","#BBFF04","#A0FFA0","#5DC9FF")
pie3D(x2, labels = label2, main = "Cluster 2 AQI Average Distribution",col=col1,explode=0.1)
legend("bottom", label2, fill = col2)

#Pie Chart of Cluster 3
x3<-c(mean(df$Sanathnagar),mean(df$ZooPark),mean(df$Pashamylaram),mean(df$Bollaram),mean(df$ICRISAT))
pct3=round(x3/sum(x3)*100)
names3<-c("Sanathnagar", "ZooPark", "Pashamylaram", "Bollaram","ICRISAT")
label3<-paste(names3,"-",pct3,"%",sep="")
col3<-c("#BEF7FF", "#FFA000", "#8BFF34", "#A05FFF","#FF5067")
pie3D(x3, labels = label3, main = "Cluster 3 AQI Average Distribution",col=col3,explode=0.1 )
legend("bottom", label3, fill = col3)


rowMeans(KM$centers)
mean(df$Chikkadapally)
mean(df$Charminar)
mean(df$Bollaram)

cl1_model<-lm(df$Chikkadapally~date)
predict(cl1_model,newdata=data.frame(date=seq(as.Date("2023-01-01"),as.Date("2023-12-01"),by="month")),interval="confidence")
ggplot(df,aes(x=Date,y=Chikkadapally))+geom_point()+geom_smooth(method="lm")
cl2_model<-lm(df$Charminar~date)
predict(cl2_model,newdata=data.frame(date=seq(as.Date("2023-01-01"),as.Date("2023-12-01"),by="month")),interval="confidence")
ggplot(df,aes(x=Date,y=Charminar))+geom_point()+geom_smooth(method="lm")
cl3_model<-lm(df$Bollaram~date)
predict(cl3_model,newdata=data.frame(date=seq(as.Date("2023-01-01"),as.Date("2023-12-01"),by="month")),interval="confidence")
ggplot(df,aes(x=Date,y=Bollaram))+geom_point()+geom_smooth(method="lm")


