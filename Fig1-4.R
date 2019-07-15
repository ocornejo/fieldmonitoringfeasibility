options(scipen = 999)
library(dplyr)
library(reshape)
library(ggplot2)
library(ggtextures)
library(tibble)
library(scales)
library(evaluate)

replay(evaluate(file("HelperFunctions.R")))

## Individual

# base time
adobe = read.csv("adobe/no_saturation.csv", dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)

# classifying actions according to SRT
adobe[,"base_time.category"] = apply(adobe["base_time"],1,classifyAction)
adobe[,"exec_time_iteration_1.category"] = apply(adobe["exec_time_iteration_1"],1,classifyAction)
adobe[,"exec_time_iteration_2.category"] = apply(adobe["exec_time_iteration_2"],1,classifyAction)
adobe[,"exec_time_iteration_3.category"] = apply(adobe["exec_time_iteration_3"],1,classifyAction)
adobe[,"exec_time_iteration_4.category"] = apply(adobe["exec_time_iteration_4"],1,classifyAction)
adobe[,"exec_time_iteration_5.category"] = apply(adobe["exec_time_iteration_5"],1,classifyAction)

# estimating overhead
adobe[,"exec_time_iteration_1.overhead"] = apply(adobe, 1, getOverhead, c1 = "exec_time_iteration_1")
adobe[,"exec_time_iteration_2.overhead"] = apply(adobe, 1, getOverhead, c1 = "exec_time_iteration_2")
adobe[,"exec_time_iteration_3.overhead"] = apply(adobe, 1, getOverhead, c1 = "exec_time_iteration_3")
adobe[,"exec_time_iteration_4.overhead"] = apply(adobe, 1, getOverhead, c1 = "exec_time_iteration_4")
adobe[,"exec_time_iteration_5.overhead"] = apply(adobe, 1, getOverhead, c1 = "exec_time_iteration_5")

# classifying actions according to overhead
adobe[,"actions_0_30"] = apply(adobe, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_2)
adobe[,"actions_0_10"] = apply(adobe, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_1)
adobe[,"actions_10_30"] = apply(adobe, 1, classifyActionsOH, limit_start = limit_1, limit_end = limit_2)
adobe[,"actions_30_80"] = apply(adobe, 1, classifyActionsOH, limit_start = limit_2, limit_end = limit_3)
adobe[,"actions_80_180"] = apply(adobe, 1, classifyActionsOH, limit_start = limit_3, limit_end = limit_4)
adobe[,"actions_180_5000"] = apply(adobe, 1, classifyActionsOH, limit_start = limit_4, limit_end = 10000)

adobe$nInstantaneous <- rowSums(adobe[-8] == "Instantaneous")
adobe$nImmediate <- rowSums(adobe[-8] == "Immediate")
adobe$nContS <- rowSums(adobe[-8] == "Continuous Simple")
adobe$nContC <- rowSums(adobe[-8] == "Continuous Complex")
adobe$nCaptive <- rowSums(adobe[-8] == "Captive")
adobe$nCaptiveOut <- rowSums(adobe[-8] == "Captive Out")

# estimating slow actions
adobe[,"slowactions_0_30"] = apply(adobe, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_2)
adobe[,"slowactions_0_10"] = apply(adobe, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_1)
adobe[,"slowactions_10_30"] = apply(adobe, 1, classifySlowActionsOH, limit_start = limit_1, limit_end = limit_2)
adobe[,"slowactions_30_80"] = apply(adobe, 1, classifySlowActionsOH, limit_start = limit_2, limit_end = limit_3)
adobe[,"slowactions_80_180"] = apply(adobe, 1, classifySlowActionsOH, limit_start = limit_3, limit_end = limit_4)
adobe[,"slowactions_180_5000"] = apply(adobe, 1, classifySlowActionsOH, limit_start = limit_4, limit_end = 10000)

adobeNew <- adobe[,c("base_time.category","nInstantaneous","nImmediate","nContS","nContC","nCaptive","nCaptiveOut","slowactions_0_30","slowactions_30_80","slowactions_80_180","slowactions_180_5000","actions_0_30","actions_0_10","actions_10_30","actions_30_80","actions_80_180","actions_180_5000")]
adobeFinal <- aggregate(. ~ base_time.category, adobeNew, sum)

adobeFinal$total <- rowSums(adobeFinal[,c(2:7)])
adobeFinal$slowActions <- apply(adobeFinal, 1, obtainSlowActions)
adobeFinal$percentageSlowActions <- apply(adobeFinal, 1, obtainSlowActionsAsPercentage)

adobeFinal[,"totSA_0_30"] = apply(adobeFinal, 1, getTotalSlowActions, interval = "0_30")
adobeFinal[,"totSA_30_80"] = apply(adobeFinal, 1, getTotalSlowActions, interval = "30_80")
adobeFinal[,"totSA_80_180"] = apply(adobeFinal, 1, getTotalSlowActions, interval = "80_180")
adobeFinal[,"totSA_180_5000"] = apply(adobeFinal, 1, getTotalSlowActions, interval = "180_5000")

adobeFinal$application <-  rep("Adobe Reader DC", length(adobeFinal$base_time.category))

adobeOverheads <- adobe[,c("base_time.category","base_time", "exec_time_iteration_1", "exec_time_iteration_2", "exec_time_iteration_3", "exec_time_iteration_4", "exec_time_iteration_5")]
adobeOverheads$meanTime <- rowMeans(adobeOverheads[,-c(1,2)])
adobeOverheads$meanOverhead <- 100 * ((adobeOverheads$meanTime - adobeOverheads$base_time)/adobeOverheads$base_time)

overheadsForBoxplots <- subset(adobeOverheads, select = c("base_time.category", "meanOverhead"))
overheadsForBoxplots$application <-  rep("Adobe Reader DC", length(overheadsForBoxplots$base_time.category))

adobeOverheadsAgg <- aggregate(. ~ base_time.category, adobeOverheads, mean)

########################

# base time
notepad = read.csv("notepad/no_saturation.csv", dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)

# classifying actions according to SRT
notepad[,"base_time.category"] = apply(notepad["base_time"],1,classifyAction)
notepad[,"exec_time_iteration_1.category"] = apply(notepad["exec_time_iteration_1"],1,classifyAction)
notepad[,"exec_time_iteration_2.category"] = apply(notepad["exec_time_iteration_2"],1,classifyAction)
notepad[,"exec_time_iteration_3.category"] = apply(notepad["exec_time_iteration_3"],1,classifyAction)
notepad[,"exec_time_iteration_4.category"] = apply(notepad["exec_time_iteration_4"],1,classifyAction)
notepad[,"exec_time_iteration_5.category"] = apply(notepad["exec_time_iteration_5"],1,classifyAction)

# estimating overhead
notepad[,"exec_time_iteration_1.overhead"] = apply(notepad, 1, getOverhead, c1 = "exec_time_iteration_1")
notepad[,"exec_time_iteration_2.overhead"] = apply(notepad, 1, getOverhead, c1 = "exec_time_iteration_2")
notepad[,"exec_time_iteration_3.overhead"] = apply(notepad, 1, getOverhead, c1 = "exec_time_iteration_3")
notepad[,"exec_time_iteration_4.overhead"] = apply(notepad, 1, getOverhead, c1 = "exec_time_iteration_4")
notepad[,"exec_time_iteration_5.overhead"] = apply(notepad, 1, getOverhead, c1 = "exec_time_iteration_5")

# classifying actions according to overhead
notepad[,"actions_0_30"] = apply(notepad, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_2)
notepad[,"actions_0_10"] = apply(notepad, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_1)
notepad[,"actions_10_30"] = apply(notepad, 1, classifyActionsOH, limit_start = limit_1, limit_end = limit_2)
notepad[,"actions_30_80"] = apply(notepad, 1, classifyActionsOH, limit_start = limit_2, limit_end = limit_3)
notepad[,"actions_80_180"] = apply(notepad, 1, classifyActionsOH, limit_start = limit_3, limit_end = limit_4)
notepad[,"actions_180_5000"] = apply(notepad, 1, classifyActionsOH, limit_start = limit_4, limit_end = 10000)

notepad$nInstantaneous <- rowSums(notepad[-8] == "Instantaneous")
notepad$nImmediate <- rowSums(notepad[-8] == "Immediate")
notepad$nContS <- rowSums(notepad[-8] == "Continuous Simple")
notepad$nContC <- rowSums(notepad[-8] == "Continuous Complex")
notepad$nCaptive <- rowSums(notepad[-8] == "Captive")
notepad$nCaptiveOut <- rowSums(notepad[-8] == "Captive Out")

# estimating slow actions
notepad[,"slowactions_0_30"] = apply(notepad, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_2)
notepad[,"slowactions_0_10"] = apply(notepad, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_1)
notepad[,"slowactions_10_30"] = apply(notepad, 1, classifySlowActionsOH, limit_start = limit_1, limit_end = limit_2)
notepad[,"slowactions_30_80"] = apply(notepad, 1, classifySlowActionsOH, limit_start = limit_2, limit_end = limit_3)
notepad[,"slowactions_80_180"] = apply(notepad, 1, classifySlowActionsOH, limit_start = limit_3, limit_end = limit_4)
notepad[,"slowactions_180_5000"] = apply(notepad, 1, classifySlowActionsOH, limit_start = limit_4, limit_end = 10000)

notepadNew <- notepad[,c("base_time.category","nInstantaneous","nImmediate","nContS","nContC","nCaptive","nCaptiveOut","slowactions_0_30","slowactions_30_80","slowactions_80_180","slowactions_180_5000","actions_0_30","actions_0_10","actions_10_30","actions_30_80","actions_80_180","actions_180_5000")]
notepadFinal <- aggregate(. ~ base_time.category, notepadNew, sum)

notepadFinal$total <- rowSums(notepadFinal[,c(2:7)])
notepadFinal$slowActions <- apply(notepadFinal, 1, obtainSlowActions)
notepadFinal$percentageSlowActions <- apply(notepadFinal, 1, obtainSlowActionsAsPercentage)

notepadFinal[,"totSA_0_30"] = apply(notepadFinal, 1, getTotalSlowActions, interval = "0_30")
notepadFinal[,"totSA_30_80"] = apply(notepadFinal, 1, getTotalSlowActions, interval = "30_80")
notepadFinal[,"totSA_80_180"] = apply(notepadFinal, 1, getTotalSlowActions, interval = "80_180")
notepadFinal[,"totSA_180_5000"] = apply(notepadFinal, 1, getTotalSlowActions, interval = "180_5000")

notepadFinal$application <-  rep("Notepad++", length(notepadFinal$base_time.category))

notepadOverheads <- notepad[,c("base_time.category","base_time", "exec_time_iteration_1", "exec_time_iteration_2", "exec_time_iteration_3", "exec_time_iteration_4", "exec_time_iteration_5")]
notepadOverheads$meanTime <- rowMeans(notepadOverheads[,-c(1,2)])
notepadOverheads$meanOverhead <- 100 * ((notepadOverheads$meanTime - notepadOverheads$base_time)/notepadOverheads$base_time)

tempNotepadOverheads <- subset(notepadOverheads, select = c("base_time.category", "meanOverhead"))
tempNotepadOverheads$application <-  rep("Notepad++", length(tempNotepadOverheads$base_time.category))
overheadsForBoxplots <- rbind(overheadsForBoxplots,tempNotepadOverheads)

notepadOverheadsAgg <- aggregate(. ~ base_time.category, notepadOverheads, mean)

########################

# base time
paint = read.csv("paint/no_saturation.csv", dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)

# classifying actions according to SRT
paint[,"base_time.category"] = apply(paint["base_time"],1,classifyAction)
paint[,"exec_time_iteration_1.category"] = apply(paint["exec_time_iteration_1"],1,classifyAction)
paint[,"exec_time_iteration_2.category"] = apply(paint["exec_time_iteration_2"],1,classifyAction)
paint[,"exec_time_iteration_3.category"] = apply(paint["exec_time_iteration_3"],1,classifyAction)
paint[,"exec_time_iteration_4.category"] = apply(paint["exec_time_iteration_4"],1,classifyAction)
paint[,"exec_time_iteration_5.category"] = apply(paint["exec_time_iteration_5"],1,classifyAction)

# estimating overhead
paint[,"exec_time_iteration_1.overhead"] = apply(paint, 1, getOverhead, c1 = "exec_time_iteration_1")
paint[,"exec_time_iteration_2.overhead"] = apply(paint, 1, getOverhead, c1 = "exec_time_iteration_2")
paint[,"exec_time_iteration_3.overhead"] = apply(paint, 1, getOverhead, c1 = "exec_time_iteration_3")
paint[,"exec_time_iteration_4.overhead"] = apply(paint, 1, getOverhead, c1 = "exec_time_iteration_4")
paint[,"exec_time_iteration_5.overhead"] = apply(paint, 1, getOverhead, c1 = "exec_time_iteration_5")

# classifying actions according to overhead
paint[,"actions_0_30"] = apply(paint, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_2)
paint[,"actions_0_10"] = apply(paint, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_1)
paint[,"actions_10_30"] = apply(paint, 1, classifyActionsOH, limit_start = limit_1, limit_end = limit_2)
paint[,"actions_30_80"] = apply(paint, 1, classifyActionsOH, limit_start = limit_2, limit_end = limit_3)
paint[,"actions_80_180"] = apply(paint, 1, classifyActionsOH, limit_start = limit_3, limit_end = limit_4)
paint[,"actions_180_5000"] = apply(paint, 1, classifyActionsOH, limit_start = limit_4, limit_end = 10000)

paint$nInstantaneous <- rowSums(paint[-8] == "Instantaneous")
paint$nImmediate <- rowSums(paint[-8] == "Immediate")
paint$nContS <- rowSums(paint[-8] == "Continuous Simple")
paint$nContC <- rowSums(paint[-8] == "Continuous Complex")
paint$nCaptive <- rowSums(paint[-8] == "Captive")
paint$nCaptiveOut <- rowSums(paint[-8] == "Captive Out")

# estimating slow actions
paint[,"slowactions_0_30"] = apply(paint, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_2)
paint[,"slowactions_0_10"] = apply(paint, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_1)
paint[,"slowactions_10_30"] = apply(paint, 1, classifySlowActionsOH, limit_start = limit_1, limit_end = limit_2)
paint[,"slowactions_30_80"] = apply(paint, 1, classifySlowActionsOH, limit_start = limit_2, limit_end = limit_3)
paint[,"slowactions_80_180"] = apply(paint, 1, classifySlowActionsOH, limit_start = limit_3, limit_end = limit_4)
paint[,"slowactions_180_5000"] = apply(paint, 1, classifySlowActionsOH, limit_start = limit_4, limit_end = 10000)

paintNew <- paint[,c("base_time.category","nInstantaneous","nImmediate","nContS","nContC","nCaptive","nCaptiveOut","slowactions_0_30","slowactions_30_80","slowactions_80_180","slowactions_180_5000","actions_0_30","actions_0_10","actions_10_30","actions_30_80","actions_80_180","actions_180_5000")]
paintFinal <- aggregate(. ~ base_time.category, paintNew, sum)

paintFinal$total <- rowSums(paintFinal[,c(2:7)])
paintFinal$slowActions <- apply(paintFinal, 1, obtainSlowActions)
paintFinal$percentageSlowActions <- apply(paintFinal, 1, obtainSlowActionsAsPercentage)

paintFinal[,"totSA_0_30"] = apply(paintFinal, 1, getTotalSlowActions, interval = "0_30")
paintFinal[,"totSA_30_80"] = apply(paintFinal, 1, getTotalSlowActions, interval = "30_80")
paintFinal[,"totSA_80_180"] = apply(paintFinal, 1, getTotalSlowActions, interval = "80_180")
paintFinal[,"totSA_180_5000"] = apply(paintFinal, 1, getTotalSlowActions, interval = "180_5000")

paintFinal$application <-  rep("Paint.NET", length(paintFinal$base_time.category))

paintOverheads <- paint[,c("base_time.category","base_time", "exec_time_iteration_1", "exec_time_iteration_2", "exec_time_iteration_3", "exec_time_iteration_4", "exec_time_iteration_5")]
paintOverheads$meanTime <- rowMeans(paintOverheads[,-c(1,2)])
paintOverheads$meanOverhead <- 100 * ((paintOverheads$meanTime - paintOverheads$base_time)/paintOverheads$base_time)

tempPaintOverheads <- subset(paintOverheads, select = c("base_time.category", "meanOverhead"))
tempPaintOverheads$application <-  rep("Paint.NET", length(tempPaintOverheads$base_time.category))
overheadsForBoxplots <- rbind(overheadsForBoxplots,tempPaintOverheads)

paintOverheadsAgg <- aggregate(. ~ base_time.category, paintOverheads, mean)

########################

# base time
vlc = read.csv("vlc/no_saturation.csv", dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)

# classifying actions according to SRT
vlc[,"base_time.category"] = apply(vlc["base_time"],1,classifyAction)
vlc[,"exec_time_iteration_1.category"] = apply(vlc["exec_time_iteration_1"],1,classifyAction)
vlc[,"exec_time_iteration_2.category"] = apply(vlc["exec_time_iteration_2"],1,classifyAction)
vlc[,"exec_time_iteration_3.category"] = apply(vlc["exec_time_iteration_3"],1,classifyAction)
vlc[,"exec_time_iteration_4.category"] = apply(vlc["exec_time_iteration_4"],1,classifyAction)
vlc[,"exec_time_iteration_5.category"] = apply(vlc["exec_time_iteration_5"],1,classifyAction)

# estimating overhead
vlc[,"exec_time_iteration_1.overhead"] = apply(vlc, 1, getOverhead, c1 = "exec_time_iteration_1")
vlc[,"exec_time_iteration_2.overhead"] = apply(vlc, 1, getOverhead, c1 = "exec_time_iteration_2")
vlc[,"exec_time_iteration_3.overhead"] = apply(vlc, 1, getOverhead, c1 = "exec_time_iteration_3")
vlc[,"exec_time_iteration_4.overhead"] = apply(vlc, 1, getOverhead, c1 = "exec_time_iteration_4")
vlc[,"exec_time_iteration_5.overhead"] = apply(vlc, 1, getOverhead, c1 = "exec_time_iteration_5")

# classifying actions according to overhead
vlc[,"actions_0_30"] = apply(vlc, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_2)
vlc[,"actions_0_10"] = apply(vlc, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_1)
vlc[,"actions_10_30"] = apply(vlc, 1, classifyActionsOH, limit_start = limit_1, limit_end = limit_2)
vlc[,"actions_30_80"] = apply(vlc, 1, classifyActionsOH, limit_start = limit_2, limit_end = limit_3)
vlc[,"actions_80_180"] = apply(vlc, 1, classifyActionsOH, limit_start = limit_3, limit_end = limit_4)
vlc[,"actions_180_5000"] = apply(vlc, 1, classifyActionsOH, limit_start = limit_4, limit_end = 10000)

vlc$nInstantaneous <- rowSums(vlc[-8] == "Instantaneous")
vlc$nImmediate <- rowSums(vlc[-8] == "Immediate")
vlc$nContS <- rowSums(vlc[-8] == "Continuous Simple")
vlc$nContC <- rowSums(vlc[-8] == "Continuous Complex")
vlc$nCaptive <- rowSums(vlc[-8] == "Captive")
vlc$nCaptiveOut <- rowSums(vlc[-8] == "Captive Out")

# estimating slow actions
vlc[,"slowactions_0_30"] = apply(vlc, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_2)
vlc[,"slowactions_0_10"] = apply(vlc, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_1)
vlc[,"slowactions_10_30"] = apply(vlc, 1, classifySlowActionsOH, limit_start = limit_1, limit_end = limit_2)
vlc[,"slowactions_30_80"] = apply(vlc, 1, classifySlowActionsOH, limit_start = limit_2, limit_end = limit_3)
vlc[,"slowactions_80_180"] = apply(vlc, 1, classifySlowActionsOH, limit_start = limit_3, limit_end = limit_4)
vlc[,"slowactions_180_5000"] = apply(vlc, 1, classifySlowActionsOH, limit_start = limit_4, limit_end = 10000)

vlcNew <- vlc[,c("base_time.category","nInstantaneous","nImmediate","nContS","nContC","nCaptive","nCaptiveOut","slowactions_0_30","slowactions_30_80","slowactions_80_180","slowactions_180_5000","actions_0_30","actions_0_10","actions_10_30","actions_30_80","actions_80_180","actions_180_5000")]
vlcFinal <- aggregate(. ~ base_time.category, vlcNew, sum)

vlcFinal$total <- rowSums(vlcFinal[,c(2:7)])
vlcFinal$slowActions <- apply(vlcFinal, 1, obtainSlowActions)
vlcFinal$percentageSlowActions <- apply(vlcFinal, 1, obtainSlowActionsAsPercentage)

vlcFinal[,"totSA_0_30"] = apply(vlcFinal, 1, getTotalSlowActions, interval = "0_30")
vlcFinal[,"totSA_30_80"] = apply(vlcFinal, 1, getTotalSlowActions, interval = "30_80")
vlcFinal[,"totSA_80_180"] = apply(vlcFinal, 1, getTotalSlowActions, interval = "80_180")
vlcFinal[,"totSA_180_5000"] = apply(vlcFinal, 1, getTotalSlowActions, interval = "180_5000")

vlcFinal$application <-  rep("VLC Media Player", length(vlcFinal$base_time.category))

vlcOverheads <- vlc[,c("base_time.category","base_time", "exec_time_iteration_1", "exec_time_iteration_2", "exec_time_iteration_3", "exec_time_iteration_4", "exec_time_iteration_5")]
vlcOverheads$meanTime <- rowMeans(vlcOverheads[,-c(1,2)])
vlcOverheads$meanOverhead <- 100 * ((vlcOverheads$meanTime - vlcOverheads$base_time)/vlcOverheads$base_time)

tempVlcOverheads <- subset(vlcOverheads, select = c("base_time.category", "meanOverhead"))
tempVlcOverheads$application <-  rep("VLC Media Player", length(tempVlcOverheads$base_time.category))
overheadsForBoxplots <- rbind(overheadsForBoxplots,tempVlcOverheads)

vlcOverheadsAgg <- aggregate(. ~ base_time.category, vlcOverheads, mean)

##### Aggregated

# FIGURE 1
png(file = "overheadBoxplot.png",width = 1200,height = 700)
ggplot(overheadsForBoxplots, aes(x=application, y = meanOverhead, fill = application)) +
  geom_boxplot() +
  facet_grid(.~factor(base_time.category, levels= c("Instantaneous","Immediate","Continuous Simple", "Continuous Complex", "Captive")), scales = "free") +
  ylab("Overhead [%]") + xlab("Application") + theme_bw(base_size=24) +
  scale_y_continuous(breaks=seq(0,1150,100),limits = c(-50, 1150)) +
  theme(legend.position="none", axis.text.x = element_text(angle = 60, hjust = 1)) 
dev.off()

total <- rbind(adobeNew,notepadNew,paintNew,vlcNew)

totalFinal <- aggregate(. ~ base_time.category, total, sum)

totalFinal$total <- rowSums(totalFinal[,c(2:7)])

totalFinal$slowActions <- apply(totalFinal, 1, obtainSlowActions)
totalFinal$percentageSlowActions <- apply(totalFinal, 1, obtainSlowActionsAsPercentage)

totalFinal[,"totSA_0_30"] = apply(totalFinal, 1, getTotalSlowActions, interval = "0_30")
totalFinal[,"totSA_0_10"] = apply(totalFinal, 1, getTotalSlowActions, interval = "0_10")
totalFinal[,"totSA_10_30"] = apply(totalFinal, 1, getTotalSlowActions, interval = "10_30")
totalFinal[,"totSA_30_80"] = apply(totalFinal, 1, getTotalSlowActions, interval = "30_80")
totalFinal[,"totSA_80_180"] = apply(totalFinal, 1, getTotalSlowActions, interval = "80_180")
totalFinal[,"totSA_180_5000"] = apply(totalFinal, 1, getTotalSlowActions, interval = "180_5000")

totalFinal[,"totA_0_30"] = apply(totalFinal, 1, getTotalActions, interval = "0_30")
totalFinal[,"totA_0_10"] = apply(totalFinal, 1, getTotalActions, interval = "0_10")
totalFinal[,"totA_10_30"] = apply(totalFinal, 1, getTotalActions, interval = "10_30")
totalFinal[,"totA_30_80"] = apply(totalFinal, 1, getTotalActions, interval = "30_80")
totalFinal[,"totA_80_180"] = apply(totalFinal, 1, getTotalActions, interval = "80_180")
totalFinal[,"totA_180_5000"] = apply(totalFinal, 1, getTotalActions, interval = "180_5000")

#change nas per zeros
totalFinal[is.na(totalFinal)] <- 0

totalFinal$application <-  rep("Overall", length(totalFinal$base_time.category))

columne <- c("base_time.category","percentageSlowActions","application")
totalSRT <- rbind (subset(adobeFinal,select = columne), subset(notepadFinal,select = columne), subset(paintFinal,select = columne), subset(vlcFinal,select = columne), subset(totalFinal,select = columne))

totalSRT$percentageSlowActions <- as.numeric(as.character(totalSRT$percentageSlowActions))

# FIGURE 3
png(file = "total.png",width = 1300,height = 600)
ggplot(totalSRT, aes(x=factor(application, levels= c("Adobe Reader DC","Notepad++","Paint.NET", "VLC Media Player", "Overall")), y = percentageSlowActions))+
  geom_bar(aes(fill = application),colour="black", size = 0.3, position = position_dodge2(width = 0.9, preserve = "single"), stat= "identity") +
  geom_text(aes(label=sprintf("%0.2f", round(percentageSlowActions,2))), size = 6,position = position_dodge2(width = 0.9, preserve = "single"), vjust=-0.25) +
  facet_grid(.~reorder(base_time.category,desc(base_time.category)), scales = "free") +
  ylim(0, 100) + theme_bw(base_size=24) +  
  theme(legend.position="none", axis.text.x = element_text(angle = 60, hjust = 1)) +
  scale_fill_brewer(palette="Oranges", limits= c("Adobe Reader DC","Notepad++","Paint.NET", "VLC Media Player", "Overall")) + 
  ylab("Slow Operations [%]") + xlab("Application")
dev.off()

#add incremental totals
totalFinal <- rbind(totalFinal, c("Overall",apply(totalFinal[-1],2,sum)))

for (i in 0:5){
  totalFinal[6, 27 + i] = mean(as.numeric(totalFinal[1:5, 27 + i]))
}

totalFinalMelt_1 <- melt (totalFinal[,c("base_time.category","totA_0_10","totA_10_30","totA_30_80","totA_80_180","totA_180_5000")],id.vars = 1)
totalFinalMelt_1$value <- as.numeric(as.character(totalFinalMelt_1$value))

# FIGURE 2
png(file = "oh_cat.png",width = 1200,height = 600)
ggplot(totalFinalMelt_1, aes(x=factor(variable, levels= c("totA_0_10","totA_10_30", "totA_30_80", "totA_80_180","totA_180_5000")), y = value)) +
  geom_text(aes(label=sprintf("%0.2f", round(value,2))), size = 5, position=position_dodge(width=0.9), vjust=-0.40) +
  geom_bar(aes(fill = variable),colour="black", size = 0.3, position = position_dodge2(width = 0.9, preserve = "single"), stat= "identity") +
  facet_grid(.~factor(base_time.category, levels= c("Instantaneous","Immediate","Continuous Simple", "Continuous Complex", "Captive", "Overall")), scales = "free") +
  ylim(0, 100) + theme_bw(base_size=23) +  
  theme(legend.position="none", axis.text.x = element_text(angle = 60, hjust = 1)) +
  ylab("Operations per overhead range [%]") + xlab("Overhead range") +
  scale_x_discrete(breaks=c("totA_0_10", "totA_10_30", "totA_30_80","totA_80_180","totA_180_5000"),
                   labels=c("0-10%", "10-30%", "30-80%", "80-180%","180+%")) +
  scale_fill_brewer(palette="Oranges")
dev.off()
####
for (i in 0:3){
  totalFinal[6, 19 + i] = (as.numeric(totalFinal[6, 8 + i]) / as.numeric(totalFinal[6, 12 + i])) * 100
}

totalFinalMelt_2 <- melt (totalFinal[,c("base_time.category","totSA_0_30","totSA_30_80","totSA_80_180","totSA_180_5000")],id.vars = 1)
totalFinalMelt_2$value <- as.numeric(as.character(totalFinalMelt_2$value))

totalFinalMelt_2 <- totalFinalMelt_2[-c(4,5,13,14,19), ]

# FIGURE 4
png(file = "slow_oh.png",width = 1400,height = 700)
levels(totalFinalMelt_2$variable) <- c("0-30%", "30-80%", "80-180%","180+%")
ggplot(totalFinalMelt_2, aes(x=factor(base_time.category, levels= c("Instantaneous", "Immediate", "Continuous Simple", "Continuous Complex", "Captive", "Overall")), y = value)) +
  geom_text(aes(label=sprintf("%0.2f", round(value,2))), size = 5, position=position_dodge(width=0.9), vjust=-0.40) +
  geom_bar(aes(fill = base_time.category),colour="black", size = 0.3, position = position_dodge2(width = 0.9, preserve = "single"), stat= "identity") +
  facet_grid(.~variable, scales = "free") +
  ylab("Slow Operations [%]")  + ggtitle("Percentage of Slow Operations based on Overhead Range") +
  ylim(0, 100) + theme_bw(base_size=24) +  
  theme(legend.position="none", axis.text.x = element_text(angle = 60, hjust = 1)) +
  xlab("SRT Category") +
  scale_fill_brewer(palette = "Oranges", limits= c("Instantaneous", "Immediate", "Continuous Simple", "Continuous Complex", "Captive", "Overall"))  
dev.off()


