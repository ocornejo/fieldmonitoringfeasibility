options(scipen = 999)
library(dplyr)
library(reshape)
library(ggplot2)
library(cowplot)
library(grid)
library(car)
library(evaluate)

replay(evaluate(file("HelperFunctions.R")))

adobeBase = step1("adobe", "", "")
notepadBase = step1("notepad", "", "")
paintBase = step1("paint", "", "")
vlcBase = step1("vlc", "", "")

instBase = extractOverheadData(adobeBase,notepadBase,paintBase,vlcBase,"Instantaneous")
immBase  = extractOverheadData(adobeBase,notepadBase,paintBase,vlcBase,"Immediate")
csBase = extractOverheadData(adobeBase,notepadBase,paintBase,vlcBase,"Continuous Simple")
ccBase = extractOverheadData(adobeBase,notepadBase,paintBase,vlcBase,"Continuous Complex")
captBase = extractOverheadData(adobeBase,notepadBase,paintBase,vlcBase,"Captive")

############################
############################

adobeCpu60 = step1("adobe", "cpu", "60")
notepadCpu60 = step1("notepad", "cpu", "60")
paintCpu60 = step1("paint", "cpu", "60")
vlcCpu60 = step1("vlc", "cpu", "60")

instCpu60 = extractOverheadData(adobeCpu60,notepadCpu60,paintCpu60,vlcCpu60,"Instantaneous")
immCpu60  = extractOverheadData(adobeCpu60,notepadCpu60,paintCpu60,vlcCpu60,"Immediate")
csCpu60 = extractOverheadData(adobeCpu60,notepadCpu60,paintCpu60,vlcCpu60,"Continuous Simple")
ccCpu60 = extractOverheadData(adobeCpu60,notepadCpu60,paintCpu60,vlcCpu60,"Continuous Complex")
captCpu60 = extractOverheadData(adobeCpu60,notepadCpu60,paintCpu60,vlcCpu60,"Captive")

############################
############################
adobeCpu75 = step1("adobe", "cpu", "75")
notepadCpu75 = step1("notepad", "cpu", "75")
paintCpu75 = step1("paint", "cpu", "75")
vlcCpu75 = step1("vlc", "cpu", "75")

instCpu75 = extractOverheadData(adobeCpu75,notepadCpu75,paintCpu75,vlcCpu75,"Instantaneous")
immCpu75  = extractOverheadData(adobeCpu75,notepadCpu75,paintCpu75,vlcCpu75,"Immediate")
csCpu75 = extractOverheadData(adobeCpu75,notepadCpu75,paintCpu75,vlcCpu75,"Continuous Simple")
ccCpu75 = extractOverheadData(adobeCpu75,notepadCpu75,paintCpu75,vlcCpu75,"Continuous Complex")
captCpu75 = extractOverheadData(adobeCpu75,notepadCpu75,paintCpu75,vlcCpu75,"Captive")

############################
############################

adobeCpu90 = step1("adobe", "cpu", "90")
notepadCpu90 = step1("notepad", "cpu", "90")
paintCpu90 = step1("paint", "cpu", "90")
vlcCpu90 = step1("vlc", "cpu", "90")

instCpu90 = extractOverheadData(adobeCpu90,notepadCpu90,paintCpu90,vlcCpu90,"Instantaneous")
immCpu90  = extractOverheadData(adobeCpu90,notepadCpu90,paintCpu90,vlcCpu90,"Immediate")
csCpu90 = extractOverheadData(adobeCpu90,notepadCpu90,paintCpu90,vlcCpu90,"Continuous Simple")
ccCpu90 = extractOverheadData(adobeCpu90,notepadCpu90,paintCpu90,vlcCpu90,"Continuous Complex")
captCpu90 = extractOverheadData(adobeCpu90,notepadCpu90,paintCpu90,vlcCpu90,"Captive")

############################
############################

adobeRam60 = step1("adobe", "ram", "60")
notepadRam60 = step1("notepad", "ram", "60")
paintRam60 = step1("paint", "ram", "60")
vlcRam60 = step1("vlc", "ram", "60")

instRam60 = extractOverheadData(adobeRam60,notepadRam60,paintRam60,vlcRam60,"Instantaneous")
immRam60  = extractOverheadData(adobeRam60,notepadRam60,paintRam60,vlcRam60,"Immediate")
csRam60 = extractOverheadData(adobeRam60,notepadRam60,paintRam60,vlcRam60,"Continuous Simple")
ccRam60 = extractOverheadData(adobeRam60,notepadRam60,paintRam60,vlcRam60,"Continuous Complex")
captRam60 = extractOverheadData(adobeRam60,notepadRam60,paintRam60,vlcRam60,"Captive")

############################
############################

adobeRam75 = step1("adobe", "ram", "75")
notepadRam75 = step1("notepad", "ram", "75")
paintRam75 = step1("paint", "ram", "75")
vlcRam75 = step1("vlc", "ram", "75")

instRam75 = extractOverheadData(adobeRam75,notepadRam75,paintRam75,vlcRam75,"Instantaneous")
immRam75  = extractOverheadData(adobeRam75,notepadRam75,paintRam75,vlcRam75,"Immediate")
csRam75 = extractOverheadData(adobeRam75,notepadRam75,paintRam75,vlcRam75,"Continuous Simple")
ccRam75 = extractOverheadData(adobeRam75,notepadRam75,paintRam75,vlcRam75,"Continuous Complex")
captRam75 = extractOverheadData(adobeRam75,notepadRam75,paintRam75,vlcRam75,"Captive")

############################
############################


adobeRam90 = step1("adobe", "ram", "90")
notepadRam90 = step1("notepad", "ram", "90")
paintRam90 = step1("paint", "ram", "90")
vlcRam90 = step1("vlc", "ram", "90")

instRam90 = extractOverheadData(adobeRam90,notepadRam90,paintRam90,vlcRam90,"Instantaneous")
immRam90  = extractOverheadData(adobeRam90,notepadRam90,paintRam90,vlcRam90,"Immediate")
csRam90 = extractOverheadData(adobeRam90,notepadRam90,paintRam90,vlcRam90,"Continuous Simple")
ccRam90 = extractOverheadData(adobeRam90,notepadRam90,paintRam90,vlcRam90,"Continuous Complex")
captRam90 = extractOverheadData(adobeRam90,notepadRam90,paintRam90,vlcRam90,"Captive")

##########################################

adobeCpu60OH = step1("adobe", "cpu_oh", "60")
notepadCpu60OH = step1("notepad", "cpu_oh", "60")
paintCpu60OH = step1("paint", "cpu_oh", "60")
vlcCpu60OH = step1("vlc", "cpu_oh", "60")

instCpu60OH = extractOverheadData(adobeCpu60OH,notepadCpu60OH,paintCpu60OH,vlcCpu60OH,"Instantaneous")
immCpu60OH  = extractOverheadData(adobeCpu60OH,notepadCpu60OH,paintCpu60OH,vlcCpu60OH,"Immediate")
csCpu60OH = extractOverheadData(adobeCpu60OH,notepadCpu60OH,paintCpu60OH,vlcCpu60OH,"Continuous Simple")
ccCpu60OH = extractOverheadData(adobeCpu60OH,notepadCpu60OH,paintCpu60OH,vlcCpu60OH,"Continuous Complex")
captCpu60OH = extractOverheadData(adobeCpu60OH,notepadCpu60OH,paintCpu60OH,vlcCpu60OH,"Captive")

############################
############################

adobeCpu75OH = step1("adobe", "cpu_oh", "75")
notepadCpu75OH = step1("notepad", "cpu_oh", "75")
paintCpu75OH = step1("paint", "cpu_oh", "75")
vlcCpu75OH = step1("vlc", "cpu_oh", "75")

instCpu75OH = extractOverheadData(adobeCpu75OH,notepadCpu75OH,paintCpu75OH,vlcCpu75OH,"Instantaneous")
immCpu75OH  = extractOverheadData(adobeCpu75OH,notepadCpu75OH,paintCpu75OH,vlcCpu75OH,"Immediate")
csCpu75OH = extractOverheadData(adobeCpu75OH,notepadCpu75OH,paintCpu75OH,vlcCpu75OH,"Continuous Simple")
ccCpu75OH = extractOverheadData(adobeCpu75OH,notepadCpu75OH,paintCpu75OH,vlcCpu75OH,"Continuous Complex")
captCpu75OH = extractOverheadData(adobeCpu75OH,notepadCpu75OH,paintCpu75OH,vlcCpu75OH,"Captive")


############################
############################

adobeCpu90OH = step1("adobe", "cpu_oh", "90")
notepadCpu90OH = step1("notepad", "cpu_oh", "90")
paintCpu90OH = step1("paint", "cpu_oh", "90")
vlcCpu90OH = step1("vlc", "cpu_oh", "90")

instCpu90OH = extractOverheadData(adobeCpu90OH,notepadCpu90OH,paintCpu90OH,vlcCpu90OH,"Instantaneous")
immCpu90OH  = extractOverheadData(adobeCpu90OH,notepadCpu90OH,paintCpu90OH,vlcCpu90OH,"Immediate")
csCpu90OH = extractOverheadData(adobeCpu90OH,notepadCpu90OH,paintCpu90OH,vlcCpu90OH,"Continuous Simple")
ccCpu90OH = extractOverheadData(adobeCpu90OH,notepadCpu90OH,paintCpu90OH,vlcCpu90OH,"Continuous Complex")
captCpu90OH = extractOverheadData(adobeCpu90OH,notepadCpu90OH,paintCpu90OH,vlcCpu90OH,"Captive")


############################
adobeRam60OH = step1("adobe", "ram_oh", "60")
notepadRam60OH = step1("notepad", "ram_oh", "60")
paintRam60OH = step1("paint", "ram_oh", "60")
vlcRam60OH = step1("vlc", "ram_oh", "60")

instRam60OH = extractOverheadData(adobeRam60OH,notepadRam60OH,paintRam60OH,vlcRam60OH,"Instantaneous")
immRam60OH  = extractOverheadData(adobeRam60OH,notepadRam60OH,paintRam60OH,vlcRam60OH,"Immediate")
csRam60OH = extractOverheadData(adobeRam60OH,notepadRam60OH,paintRam60OH,vlcRam60OH,"Continuous Simple")
ccRam60OH = extractOverheadData(adobeRam60OH,notepadRam60OH,paintRam60OH,vlcRam60OH,"Continuous Complex")
captRam60OH = extractOverheadData(adobeRam60OH,notepadRam60OH,paintRam60OH,vlcRam60OH,"Captive")

############################
############################

adobeRam75OH = step1("adobe", "ram_oh", "75")
notepadRam75OH = step1("notepad", "ram_oh", "75")
paintRam75OH = step1("paint", "ram_oh", "75")
vlcRam75OH = step1("vlc", "ram_oh", "75")

instRam75OH = extractOverheadData(adobeRam75OH,notepadRam75OH,paintRam75OH,vlcRam75OH,"Instantaneous")
immRam75OH  = extractOverheadData(adobeRam75OH,notepadRam75OH,paintRam75OH,vlcRam75OH,"Immediate")
csRam75OH = extractOverheadData(adobeRam75OH,notepadRam75OH,paintRam75OH,vlcRam75OH,"Continuous Simple")
ccRam75OH = extractOverheadData(adobeRam75OH,notepadRam75OH,paintRam75OH,vlcRam75OH,"Continuous Complex")
captRam75OH = extractOverheadData(adobeRam75OH,notepadRam75OH,paintRam75OH,vlcRam75OH,"Captive")

############################
############################
adobeRam90OH = step1("adobe", "ram_oh", "90")
notepadRam90OH = step1("notepad", "ram_oh", "90")
paintRam90OH = step1("paint", "ram_oh", "90")
vlcRam90OH = step1("vlc", "ram_oh", "90")

instRam90OH = extractOverheadData(adobeRam90OH,notepadRam90OH,paintRam90OH,vlcRam90OH,"Instantaneous")
immRam90OH  = extractOverheadData(adobeRam90OH,notepadRam90OH,paintRam90OH,vlcRam90OH,"Immediate")
csRam90OH = extractOverheadData(adobeRam90OH,notepadRam90OH,paintRam90OH,vlcRam90OH,"Continuous Simple")
ccRam90OH = extractOverheadData(adobeRam90OH,notepadRam90OH,paintRam90OH,vlcRam90OH,"Continuous Complex")
captRam90OH = extractOverheadData(adobeRam90OH,notepadRam90OH,paintRam90OH,vlcRam90OH,"Captive")

####
instCpu0OHSet = getOverheadSet(mean(instBase$base_time), rowMeans(instBase[,2:6]))
instCpu60OHSet = getOverheadSet(mean(rowMeans(instCpu60[,2:6])), rowMeans(instCpu60OH[,2:6]))
instCpu75OHSet = getOverheadSet(mean(rowMeans(instCpu75[,2:6])), rowMeans(instCpu75OH[,2:6]))
instCpu90OHSet = getOverheadSet(mean(rowMeans(instCpu90[,2:6])), rowMeans(instCpu90OH[,2:6]))

instCpuAll<-data.frame(instCpu0OHSet,instCpu60OHSet,instCpu75OHSet,instCpu90OHSet,  stringsAsFactors=FALSE)
instCpuMelt <- melt(instCpuAll)
instCpuMelt$log <- log(instCpuMelt$value)

qqPlot(instCpuMelt$value)
shapiro.test(instCpuMelt$value) 
# data is not normal...

kruskal.test(value ~ variable, data = instCpuMelt) 

####

####
immCpu0OHSet = getOverheadSet(mean(immBase$base_time), rowMeans(immBase[,2:6]))
immCpu60OHSet = getOverheadSet(mean(rowMeans(immCpu60[,2:6])), rowMeans(immCpu60OH[,2:6]))
immCpu75OHSet = getOverheadSet(mean(rowMeans(immCpu75[,2:6])), rowMeans(immCpu75OH[,2:6]))
immCpu90OHSet = getOverheadSet(mean(rowMeans(immCpu90[,2:6])), rowMeans(immCpu90OH[,2:6]))

immCpuAll<-data.frame(immCpu0OHSet,immCpu60OHSet,immCpu75OHSet,immCpu90OHSet,  stringsAsFactors=FALSE)
immCpuMelt <- melt(immCpuAll)

kruskal.test(value ~ variable, data = immCpuMelt) 
####

####
csCpu0OHSet = getOverheadSet(mean(csBase$base_time), rowMeans(csBase[,2:6]))
csCpu60OHSet = getOverheadSet(mean(rowMeans(csCpu60[,2:6])), rowMeans(csCpu60OH[,2:6]))
csCpu75OHSet = getOverheadSet(mean(rowMeans(csCpu75[,2:6])), rowMeans(csCpu75OH[,2:6]))
csCpu90OHSet = getOverheadSet(mean(rowMeans(csCpu90[,2:6])), rowMeans(csCpu90OH[,2:6]))

csCpuAll<-data.frame(csCpu0OHSet,csCpu60OHSet,csCpu75OHSet,csCpu90OHSet,  stringsAsFactors=FALSE)
csCpuMelt <- melt(csCpuAll)

kruskal.test(value ~ variable, data = csCpuMelt) 
####

####
ccCpu0OHSet = getOverheadSet(mean(ccBase$base_time), rowMeans(ccBase[,2:6]))
ccCpu60OHSet = getOverheadSet(mean(rowMeans(ccCpu60[,2:6])), rowMeans(ccCpu60OH[,2:6]))
ccCpu75OHSet = getOverheadSet(mean(rowMeans(ccCpu75[,2:6])), rowMeans(ccCpu75OH[,2:6]))
ccCpu90OHSet = getOverheadSet(mean(rowMeans(ccCpu90[,2:6])), rowMeans(ccCpu90OH[,2:6]))

ccCpuAll<-data.frame(ccCpu0OHSet,ccCpu60OHSet,ccCpu75OHSet,ccCpu90OHSet,  stringsAsFactors=FALSE)
ccCpuMelt <- melt(ccCpuAll)

kruskal.test(value ~ variable, data = ccCpuMelt) 
####

####
captCpu0OHSet = getOverheadSet(mean(captBase$base_time), rowMeans(captBase[,2:6]))
captCpu60OHSet = getOverheadSet(mean(rowMeans(captCpu60[,2:6])), rowMeans(captCpu60OH[,2:6]))
captCpu75OHSet = getOverheadSet(mean(rowMeans(captCpu75[,2:6])), rowMeans(captCpu75OH[,2:6]))
captCpu90OHSet = getOverheadSet(mean(rowMeans(captCpu90[,2:6])), rowMeans(captCpu90OH[,2:6]))

captCpuAll<-data.frame(captCpu0OHSet,captCpu60OHSet,captCpu75OHSet,captCpu90OHSet,  stringsAsFactors=FALSE)
captCpuMelt <- melt(captCpuAll)

kruskal.test(value ~ variable, data = captCpuMelt) 


###########################

inst_cpu <- setNames(data.frame(matrix(unlist(instBase$base_time), nrow=length(instBase$base_time), byrow=T)), c("exec_time"))
inst_cpu$load <-  rep("0", length(inst_cpu$exec_time))
inst_cpu$type <-  rep("base", length(inst_cpu$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(instBase[,2:6])), nrow=length(rowMeans(instBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_cpu <- rbind(inst_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instCpu60[,2:6])), nrow=length(rowMeans(instCpu60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
inst_cpu <- rbind(inst_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instCpu60OH[,2:6])), nrow=length(rowMeans(instCpu60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_cpu <- rbind(inst_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instCpu75[,2:6])), nrow=length(rowMeans(instCpu75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
inst_cpu <- rbind(inst_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instCpu75OH[,2:6])), nrow=length(rowMeans(instCpu75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_cpu <- rbind(inst_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instCpu90[,2:6])), nrow=length(rowMeans(instCpu90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
inst_cpu <- rbind(inst_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instCpu90OH[,2:6])), nrow=length(rowMeans(instCpu90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_cpu <- rbind(inst_cpu, temp)

imm_cpu <- setNames(data.frame(matrix(unlist(immBase$base_time), nrow=length(immBase$base_time), byrow=T)), c("exec_time"))
imm_cpu$load <-  rep("0", length(imm_cpu$exec_time))
imm_cpu$type <-  rep("base", length(imm_cpu$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(immBase[,2:6])), nrow=length(rowMeans(immBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_cpu <- rbind(imm_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immCpu60[,2:6])), nrow=length(rowMeans(immCpu60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
imm_cpu <- rbind(imm_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immCpu60OH[,2:6])), nrow=length(rowMeans(immCpu60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_cpu <- rbind(imm_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immCpu75[,2:6])), nrow=length(rowMeans(immCpu75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
imm_cpu <- rbind(imm_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immCpu75OH[,2:6])), nrow=length(rowMeans(immCpu75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_cpu <- rbind(imm_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immCpu90[,2:6])), nrow=length(rowMeans(immCpu90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
imm_cpu <- rbind(imm_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immCpu90OH[,2:6])), nrow=length(rowMeans(immCpu90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_cpu <- rbind(imm_cpu, temp)

cs_cpu <- setNames(data.frame(matrix(unlist(csBase$base_time), nrow=length(csBase$base_time), byrow=T)), c("exec_time"))
cs_cpu$load <-  rep("0", length(cs_cpu$exec_time))
cs_cpu$type <-  rep("base", length(cs_cpu$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(csBase[,2:6])), nrow=length(rowMeans(csBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_cpu <- rbind(cs_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csCpu60[,2:6])), nrow=length(rowMeans(csCpu60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cs_cpu <- rbind(cs_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csCpu60OH[,2:6])), nrow=length(rowMeans(csCpu60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_cpu <- rbind(cs_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csCpu75[,2:6])), nrow=length(rowMeans(csCpu75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cs_cpu <- rbind(cs_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csCpu75OH[,2:6])), nrow=length(rowMeans(csCpu75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_cpu <- rbind(cs_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csCpu90[,2:6])), nrow=length(rowMeans(csCpu90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cs_cpu <- rbind(cs_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csCpu90OH[,2:6])), nrow=length(rowMeans(csCpu90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_cpu <- rbind(cs_cpu, temp)

cc_cpu <- setNames(data.frame(matrix(unlist(ccBase$base_time), nrow=length(ccBase$base_time), byrow=T)), c("exec_time"))
cc_cpu$load <-  rep("0", length(cc_cpu$exec_time))
cc_cpu$type <-  rep("base", length(cc_cpu$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccBase[,2:6])), nrow=length(rowMeans(ccBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_cpu <- rbind(cc_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccCpu60[,2:6])), nrow=length(rowMeans(ccCpu60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cc_cpu <- rbind(cc_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccCpu60OH[,2:6])), nrow=length(rowMeans(ccCpu60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_cpu <- rbind(cc_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccCpu75[,2:6])), nrow=length(rowMeans(ccCpu75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cc_cpu <- rbind(cc_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccCpu75OH[,2:6])), nrow=length(rowMeans(ccCpu75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_cpu <- rbind(cc_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccCpu90[,2:6])), nrow=length(rowMeans(ccCpu90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cc_cpu <- rbind(cc_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccCpu90OH[,2:6])), nrow=length(rowMeans(ccCpu90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_cpu <- rbind(cc_cpu, temp)

capt_cpu <- setNames(data.frame(matrix(unlist(captBase$base_time), nrow=length(captBase$base_time), byrow=T)), c("exec_time"))
capt_cpu$load <-  rep("0", length(capt_cpu$exec_time))
capt_cpu$type <-  rep("base", length(capt_cpu$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(captBase[,2:6])), nrow=length(rowMeans(captBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_cpu <- rbind(capt_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captCpu60[,2:6])), nrow=length(rowMeans(captCpu60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
capt_cpu <- rbind(capt_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captCpu60OH[,2:6])), nrow=length(rowMeans(captCpu60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_cpu <- rbind(capt_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captCpu75[,2:6])), nrow=length(rowMeans(captCpu75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
capt_cpu <- rbind(capt_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captCpu75OH[,2:6])), nrow=length(rowMeans(captCpu75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_cpu <- rbind(capt_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captCpu90[,2:6])), nrow=length(rowMeans(captCpu90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
capt_cpu <- rbind(capt_cpu, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captCpu90OH[,2:6])), nrow=length(rowMeans(captCpu90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_cpu <- rbind(capt_cpu, temp)

p0 <- ggplot(data=inst_cpu, aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Instantaneous") +
  ylab("Execution time [s]") + xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  scale_fill_manual(values=cbPalette, breaks=c("base", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,1.1,0.2),limits = c(0, 1.03))

legend <- get_legend(p0 + theme(legend.position = "top",legend.text=element_text(size=27)))
p0<- p0 + theme(legend.position="none")   

p1 <- ggplot(data=imm_cpu, aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Immediate") +
  xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette,breaks=c("base", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,1.1,0.2),limits = c(0, 1.03))

p2 <- ggplot(data=cs_cpu, aes(x=load, y=exec_time, fill=type)) + 
  ggtitle("Continuous Simple") +
  geom_boxplot(size = 0.5) +
  xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette,breaks=c("base", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,30,5),limits = c(0, 30))

p3 <- ggplot(data=cc_cpu, aes(x=load, y=exec_time, fill=type)) + 
  ggtitle("Continuous Complex") +
  geom_boxplot(size = 0.5) +
  xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,30,5),limits = c(0, 30))

p4 <- ggplot(data=capt_cpu, aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Captive") +
  xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,30,5),limits = c(0, 30))

p <- plot_grid(p0,p1,p2,p3,p4, ncol=5)
png(file = "contextSRTCPU.png",width = 1500,height = 600)
plot(plot_grid(p, legend, ncol = 1, rel_heights = c(1,0.1)))
dev.off()


##########################################

instRam0OHSet = getOverheadSet(mean(instBase$base_time), rowMeans(instBase[,2:6]))
instRam60OHSet = getOverheadSet(mean(rowMeans(instRam60[,2:6])), rowMeans(instRam60OH[,2:6]))
instRam75OHSet = getOverheadSet(mean(rowMeans(instRam75[,2:6])), rowMeans(instRam75OH[,2:6]))
instRam90OHSet = getOverheadSet(mean(rowMeans(instRam90[,2:6])), rowMeans(instRam90OH[,2:6]))

instRamAll<-data.frame(instRam0OHSet,instRam60OHSet,instRam75OHSet,instRam90OHSet,  stringsAsFactors=FALSE)
instRamMelt <- melt(instRamAll)

kruskal.test(value ~ variable, data = instRamMelt) 
qqPlot(instRamMelt$value)
shapiro.test(instRamMelt$value) 

####

####
immRam0OHSet = getOverheadSet(mean(immBase$base_time), rowMeans(immBase[,2:6]))
immRam60OHSet = getOverheadSet(mean(rowMeans(immRam60[,2:6])), rowMeans(immRam60OH[,2:6]))
immRam75OHSet = getOverheadSet(mean(rowMeans(immRam75[,2:6])), rowMeans(immRam75OH[,2:6]))
immRam90OHSet = getOverheadSet(mean(rowMeans(immRam90[,2:6])), rowMeans(immRam90OH[,2:6]))

immRamAll<-data.frame(immRam0OHSet,immRam60OHSet,immRam75OHSet,immRam90OHSet,  stringsAsFactors=FALSE)
immRamMelt <- melt(immRamAll)

kruskal.test(value ~ variable, data = immRamMelt) 
qqPlot(immRamMelt$value)
shapiro.test(immRamMelt$value) 

####

####
csRam0OHSet = getOverheadSet(mean(csBase$base_time), rowMeans(csBase[,2:6]))
csRam60OHSet = getOverheadSet(mean(rowMeans(csRam60[,2:6])), rowMeans(csRam60OH[,2:6]))
csRam75OHSet = getOverheadSet(mean(rowMeans(csRam75[,2:6])), rowMeans(csRam75OH[,2:6]))
csRam90OHSet = getOverheadSet(mean(rowMeans(csRam90[,2:6])), rowMeans(csRam90OH[,2:6]))

csRamAll<-data.frame(csRam0OHSet,csRam60OHSet,csRam75OHSet,csRam90OHSet,  stringsAsFactors=FALSE)
csRamMelt <- melt(csRamAll)

kruskal.test(value ~ variable, data = csRamMelt) 
qqPlot(csRamMelt$value)
shapiro.test(csRamMelt$value) 

####

####
ccRam0OHSet = getOverheadSet(mean(ccBase$base_time), rowMeans(ccBase[,2:6]))
ccRam60OHSet = getOverheadSet(mean(rowMeans(ccRam60[,2:6])), rowMeans(ccRam60OH[,2:6]))
ccRam75OHSet = getOverheadSet(mean(rowMeans(ccRam75[,2:6])), rowMeans(ccRam75OH[,2:6]))
ccRam90OHSet = getOverheadSet(mean(rowMeans(ccRam90[,2:6])), rowMeans(ccRam90OH[,2:6]))

ccRamAll<-data.frame(ccRam0OHSet,ccRam60OHSet,ccRam75OHSet,ccRam90OHSet,  stringsAsFactors=FALSE)
ccRamMelt <- melt(ccRamAll)

kruskal.test(value ~ variable, data = ccRamMelt) 
qqPlot(ccRamMelt$value)
shapiro.test(ccRamMelt$value) 

####

####
captRam0OHSet = getOverheadSet(mean(captBase$base_time), rowMeans(captBase[,2:6]))
captRam60OHSet = getOverheadSet(mean(rowMeans(captRam60[,2:6])), rowMeans(captRam60OH[,2:6]))
captRam75OHSet = getOverheadSet(mean(rowMeans(captRam75[,2:6])), rowMeans(captRam75OH[,2:6]))
captRam90OHSet = getOverheadSet(mean(rowMeans(captRam90[,2:6])), rowMeans(captRam90OH[,2:6]))

captRamAll<-data.frame(captRam0OHSet,captRam60OHSet,captRam75OHSet,captRam90OHSet,  stringsAsFactors=FALSE)
captRamMelt <- melt(captRamAll)

kruskal.test(value ~ variable, data = captRamMelt) 
qqPlot(captRamMelt$value)
shapiro.test(captRamMelt$value) 

#### 
inst_ram <- setNames(data.frame(matrix(unlist(instBase$base_time), nrow=length(instBase$base_time), byrow=T)), c("exec_time"))
inst_ram$load <-  rep("0", length(inst_ram$exec_time))
inst_ram$type <-  rep("base", length(inst_ram$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(instBase[,2:6])), nrow=length(rowMeans(instBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_ram <- rbind(inst_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instRam60[,2:6])), nrow=length(rowMeans(instRam60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
inst_ram <- rbind(inst_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instRam60OH[,2:6])), nrow=length(rowMeans(instRam60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_ram <- rbind(inst_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instRam75[,2:6])), nrow=length(rowMeans(instRam75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
inst_ram <- rbind(inst_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instRam75OH[,2:6])), nrow=length(rowMeans(instRam75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_ram <- rbind(inst_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instRam90[,2:6])), nrow=length(rowMeans(instRam90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
inst_ram <- rbind(inst_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(instRam90OH[,2:6])), nrow=length(rowMeans(instRam90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
inst_ram <- rbind(inst_ram, temp)


imm_ram <- setNames(data.frame(matrix(unlist(immBase$base_time), nrow=length(immBase$base_time), byrow=T)), c("exec_time"))
imm_ram$load <-  rep("0", length(imm_ram$exec_time))
imm_ram$type <-  rep("base", length(imm_ram$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(immBase[,2:6])), nrow=length(rowMeans(immBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_ram <- rbind(imm_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immRam60[,2:6])), nrow=length(rowMeans(immRam60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
imm_ram <- rbind(imm_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immRam60OH[,2:6])), nrow=length(rowMeans(immRam60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_ram <- rbind(imm_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immRam75[,2:6])), nrow=length(rowMeans(immRam75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
imm_ram <- rbind(imm_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immRam75OH[,2:6])), nrow=length(rowMeans(immRam75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_ram <- rbind(imm_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immRam90[,2:6])), nrow=length(rowMeans(immRam90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
imm_ram <- rbind(imm_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(immRam90OH[,2:6])), nrow=length(rowMeans(immRam90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
imm_ram <- rbind(imm_ram, temp)

cs_ram <- setNames(data.frame(matrix(unlist(csBase$base_time), nrow=length(csBase$base_time), byrow=T)), c("exec_time"))
cs_ram$load <-  rep("0", length(cs_ram$exec_time))
cs_ram$type <-  rep("base", length(cs_ram$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(csBase[,2:6])), nrow=length(rowMeans(csBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_ram <- rbind(cs_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csRam60[,2:6])), nrow=length(rowMeans(csRam60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cs_ram <- rbind(cs_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csRam60OH[,2:6])), nrow=length(rowMeans(csRam60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_ram <- rbind(cs_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csRam75[,2:6])), nrow=length(rowMeans(csRam75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cs_ram <- rbind(cs_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csRam75OH[,2:6])), nrow=length(rowMeans(csRam75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_ram <- rbind(cs_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csRam90[,2:6])), nrow=length(rowMeans(csRam90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cs_ram <- rbind(cs_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(csRam90OH[,2:6])), nrow=length(rowMeans(csRam90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cs_ram <- rbind(cs_ram, temp)


cc_ram <- setNames(data.frame(matrix(unlist(ccBase$base_time), nrow=length(ccBase$base_time), byrow=T)), c("exec_time"))
cc_ram$load <-  rep("0", length(cc_ram$exec_time))
cc_ram$type <-  rep("base", length(cc_ram$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccBase[,2:6])), nrow=length(rowMeans(ccBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_ram <- rbind(cc_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccRam60[,2:6])), nrow=length(rowMeans(ccRam60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cc_ram <- rbind(cc_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccRam60OH[,2:6])), nrow=length(rowMeans(ccRam60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_ram <- rbind(cc_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccRam75[,2:6])), nrow=length(rowMeans(ccRam75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cc_ram <- rbind(cc_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccRam75OH[,2:6])), nrow=length(rowMeans(ccRam75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_ram <- rbind(cc_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccRam90[,2:6])), nrow=length(rowMeans(ccRam90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
cc_ram <- rbind(cc_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(ccRam90OH[,2:6])), nrow=length(rowMeans(ccRam90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
cc_ram <- rbind(cc_ram, temp)


capt_ram <- setNames(data.frame(matrix(unlist(captBase$base_time), nrow=length(captBase$base_time), byrow=T)), c("exec_time"))
capt_ram$load <-  rep("0", length(capt_ram$exec_time))
capt_ram$type <-  rep("base", length(capt_ram$exec_time))
temp <- setNames(data.frame(matrix(unlist(rowMeans(captBase[,2:6])), nrow=length(rowMeans(captBase[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("0", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_ram <- rbind(capt_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captRam60[,2:6])), nrow=length(rowMeans(captRam60[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
capt_ram <- rbind(capt_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captRam60OH[,2:6])), nrow=length(rowMeans(captRam60OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("60", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_ram <- rbind(capt_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captRam75[,2:6])), nrow=length(rowMeans(captRam75[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
capt_ram <- rbind(capt_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captRam75OH[,2:6])), nrow=length(rowMeans(captRam75OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("75", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_ram <- rbind(capt_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captRam90[,2:6])), nrow=length(rowMeans(captRam90[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("base", length(temp$exec_time))
capt_ram <- rbind(capt_ram, temp)
temp <- setNames(data.frame(matrix(unlist(rowMeans(captRam90OH[,2:6])), nrow=length(rowMeans(captRam90OH[,2:6])), byrow=T)), c("exec_time"))
temp$load <-  rep("90", length(temp$exec_time))
temp$type <-  rep("monitored", length(temp$exec_time))
capt_ram <- rbind(capt_ram, temp)


#########################

p0 <- ggplot(data=inst_ram, aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Instantaneous") +
  ylab("Execution time [s]") + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  scale_fill_manual(values=cbPalette, breaks=c("base", "monitored"),
                    labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,1,0.2),limits = c(0, 1))


legend <- get_legend(p0 + theme(legend.position = "top",legend.text=element_text(size=27)))
p0<- p0 + theme(legend.position="none")  


p1 <- ggplot(data=imm_ram, aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Immediate") +
  ylab("Execution time [s]") + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette, breaks=c("base", "monitored"),
                    labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,2,0.4),limits = c(0, 2))


p2 <- ggplot(data=cs_ram, aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Continuous Simple") +
  ylab("Execution time [s]") + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette, breaks=c("base", "monitored"),
                    labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,20,4),limits = c(0, 20))

p3 <- ggplot(data=cc_ram, aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Continuous Complex") +
  ylab("Execution time [s]") + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette, breaks=c("base", "monitored"),
                    labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,10,2),limits = c(0, 10))

p4 <- ggplot(data=capt_ram,  aes(x=load, y=exec_time, fill=type)) + 
  geom_boxplot(size = 0.5) +
  ggtitle("Captive") +
  ylab("Execution time [s]") + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_fill_manual(values=cbPalette, breaks=c("base", "monitored"),
                    labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,10,2),limits = c(0, 10))

p <- plot_grid(p0,p1,p2,p3,p4, ncol=5)
png(file = "contextSRTRAM.png",width = 1500,height = 600)
plot(plot_grid(p, legend, ncol = 1, rel_heights = c(1,0.1)))
dev.off()

