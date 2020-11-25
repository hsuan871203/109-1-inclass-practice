#p1: 讀取csv,txt或是excel格式
#p2: 讀取R本身內建的資料

#第一階段: 從網路讀取資料(csv)
#常用函數: read.table()
#參數: file:檔案完整路徑
#      header:第一橫列是否為變數名稱
#      sep:設定分隔資料的分隔符號


#https://www.jaredlander.com/data/

url<- "https://www.jaredlander.com/data/DiamondColors.csv"

read.table(file=url,header = T,sep=",")
file1<-  read.table(file=url,header = T,sep=",")
class(file1)
str(file1)

file2<- read.table(file = "https://www.jaredlander.com/data/Tomato%20First.csv",
                   header=T,sep = ",")
file2

#查看前五筆資料
file2[1:5,]
head(file2,5)   #查看資料的前面資料

#查看最後幾筆的資料
tail(file2,3)

#查看資料格式
class(file2)
dim(file2)
str(file2)

View(file2)

#將Tomato跟Source轉為character
file2[,c(2,4)]<- as.character(file2[,c(2,4)])
str(file2)
#另一方法
file2_temp<- read.table(file = "https://www.jaredlander.com/data/Tomato%20First.csv",
                        header=T,sep = ",",stringsAsFactors = F)
str(file2_temp)

#讀取txt檔案:從網路
file3<- read.table(file = "https://www.jaredlander.com/data/emotion.txt",
                   header=T,sep = "")
View(file3)

#第二階段: 讀取自己電腦內的資料
file4<- read.table(file="D:/BIG DATA/housingNew.csv",header = T,sep = ",")
View(file4)

#quiz: 請讀取file4中的前10筆資料及最後10資料，並計算income的平均值
(sum(head(file4$Income,10))+sum(tail(file4$Income,10)))/20


#讀取excel檔案，需下載package: readxl
install.packages("readxl")
library(readxl)
getwd()#確認工作資料夾位置
setwd("D:/BIG DATA")

excel_sheets("D:/BIG DATA/ExcelExample.xlsx")
excel_sheets("./ExcelExample.xlsx")

#讀取工作表
filetomato<- read_excel("./ExcelExample.xlsx",sheet=1)


##讀取R本身內建的資料集
library(datasets)
airquality
file5<- data.frame(airquality)

file5<-data.frame(datasets::airquality)

##practice-------------------------------------##
#讀取R本身內建資料庫: mtcars
#查看mtcars的狀況
?mtcars

#quiz1:將mtcars存成一個資料框命名為file6
file6<- data.frame(datasets::mtcars)
View(file6)

#quiz2:在眾多車款中鐘，有一款車名為Valiant，請取出Valiant的所有資料
file6[6,]

#quiz3:取出馬力(gross horsepower)大於110的所有觀察點
file6$hp[file6$hp>110]

#quiz4:將file6前面16筆資料存成file7
file7<- head(file6,16)
View(file7)

#quiz5:再將file7以及file6最後4比合成file8
file8<- rbind(file7,tail(file6,4))
View(file8)

##-------------------輸出資料-------------------------##
#將自建的matrix或是dataframe 輸出成csv.txt
#將R內建的data輸出

#將前面練習的Female，輸出成csv
write.table(Female
            ,"./famaledata.csv"
            ,sep = ","
            ,row.names = F
            ,col.names = T)



