instantaneous_start = -100
instantaneous_end = 0.1
immediate_start = 0.1
immediate_end = 0.5
continuous_s_start = 0.5
continuous_s_end = 2
continuous_c_start = 2
continuous_c_end = 3.5
captive_start = 3.5
captive_end = 7
captive_out_start = 7
captive_out_end = 10

# oh limits

limit_1 = 10
limit_2 = 30
limit_3 = 80
limit_4 = 180

num.cols <- c("nInstantaneous","nImmediate","nContS","nContC","nCaptive", "total")

text_size = 23
text_stat_size = 6.5

# The palette with grey:
cbPalette <- c("#993A00", "#ff9966")

classifyAction <- function(x) {
  action = ''
  if (between(x, instantaneous_start, instantaneous_end)) {
    action = 'Instantaneous'
  } else if (between(x, immediate_start, immediate_end)) {
    action = 'Immediate'
  } else if (between(x, continuous_s_start, continuous_s_end)) {
    action = 'Continuous Simple'
  } else if (between(x, continuous_c_start, continuous_c_end)) {
    action = 'Continuous Complex'
  } else if (between(x, captive_start, captive_end)) {
    action = 'Captive'
  } else {
    action = 'Captive Out'
  }
  return(action)
}

getOverhead <- function(x, c1) {
  overhead = 100 * ( (as.numeric(x[c1]) - as.numeric(x["base_time"])) / as.numeric(x["base_time"]) )
  return(overhead)
}

getOverheadSet <- function(base, samplesSet) {
  cat("base:", base, "\n")

  overheadList <- c()
  i <- 1
  
  for (sample in samplesSet){
    overhead = 100 * ((sample - base) / base )
    overheadList[[i]] <- overhead
    i = i + 1
  }
  return(overheadList)
}

obtainSlowActionsAsPercentage <- function(x){
  slowActions = 0
  
  if (x["base_time.category"] == 'Instantaneous') {
    slowActions = ( (as.numeric(x["nImmediate"]) + as.numeric(x["nContS"]) +as.numeric(x["nContC"]) +as.numeric(x["nCaptive"])+ as.numeric(x["nCaptiveOut"])) / as.numeric(x["total"])) * 100
  } else if (x["base_time.category"] == 'Immediate'){
    slowActions = ( (as.numeric(x["nContS"]) +as.numeric(x["nContC"]) +as.numeric(x["nCaptive"])+ as.numeric(x["nCaptiveOut"])) / as.numeric(x["total"])) * 100
  } else if (x["base_time.category"] == 'Continuous Simple'){
    slowActions = ( (as.numeric(x["nContC"]) +as.numeric(x["nCaptive"])+ as.numeric(x["nCaptiveOut"])) / as.numeric(x["total"])) * 100
  } else if (x["base_time.category"] == 'Continuous Complex'){
    slowActions = ( (as.numeric(x["nCaptive"]) + as.numeric(x["nCaptiveOut"]))  / as.numeric(x["total"]) ) * 100
  } else if (x["base_time.category"] == 'Captive'){
    slowActions = ((as.numeric(x["nCaptiveOut"]))  / as.numeric(x["total"])) * 100
  }
  
  cat("percentage :", slowActions,"%", "\n")
  return(slowActions)
}

obtainSlowActions<- function(x){
  slowActions = 0
  
  if (x["base_time.category"] == 'Instantaneous') {
    slowActions =  (as.numeric(x["nImmediate"]) + as.numeric(x["nContS"]) +as.numeric(x["nContC"]) +as.numeric(x["nCaptive"])+ as.numeric(x["nCaptiveOut"]))
  } else if (x["base_time.category"] == 'Immediate'){
    slowActions =  (as.numeric(x["nContS"]) +as.numeric(x["nContC"]) +as.numeric(x["nCaptive"])+ as.numeric(x["nCaptiveOut"]))
  } else if (x["base_time.category"] == 'Continuous Simple'){
    slowActions =  (as.numeric(x["nContC"]) +as.numeric(x["nCaptive"])+ as.numeric(x["nCaptiveOut"])) 
  } else if (x["base_time.category"] == 'Continuous Complex'){
    slowActions =  (as.numeric(x["nCaptive"])+ as.numeric(x["nCaptiveOut"])) 
  } else if (x["base_time.category"] == 'Captive'){
    slowActions =  (as.numeric(x["nCaptiveOut"])) 
  }
  
  cat("slowActions:", slowActions, "\n")
  return(slowActions)
}

classifySlowActionsOH <- function(x, limit_start, limit_end){
  count = 0
  for (i in 1:5){
    if (x["base_time.category"] != x[paste("exec_time_iteration_",i,".category",sep="")])
      if(between(as.numeric(x[paste("exec_time_iteration_",i,".overhead",sep="")]), limit_start, limit_end))
        count = count + 1
  }
  return(count)
}

classifySlowActionsOH1 <- function(x, limit_start, limit_end){
  count = 0
    if (x["base_time.category"] != x[paste("exec_time_iteration_",1,".category",sep="")])
      if(between(as.numeric(x[paste("exec_time_iteration_",1,".overhead",sep="")]), limit_start, limit_end))
        count = count + 1
  return(count)
}

classifyActionsOH <- function(x, limit_start, limit_end){
  count = 0
  for (i in 1:5){
    if(between(as.numeric(x[paste("exec_time_iteration_",i,".overhead",sep="")]), limit_start, limit_end))
      count = count + 1
  }
  return(count)
}

classifyActionsOH1 <- function(x, limit_start, limit_end){
  count = 0
    if(between(as.numeric(x[paste("exec_time_iteration_",1,".overhead",sep="")]), limit_start, limit_end))
      count = count + 1
  return(count)
}

getTotalSlowActions <- function(x, interval){
  
  total = (as.numeric(x[paste("slowactions_",interval,sep="")]) / 
             as.numeric(x[paste("actions_",interval,sep="")]) ) * 100
  return(total)
}

getTotalActions <- function(x, interval){
  
  total = (as.numeric(x[paste("actions_",interval,sep="")]) / 
             as.numeric(x["total"]) ) * 100
  return(total)
}


step1 <- function(appName, resource, load) {
  
  if (resource == "" && load == "")
    loadCsv = paste(appName, "/", "no_saturation.csv", sep = "")
  else
    loadCsv = paste(appName, "/", load, "_" , resource, ".csv", sep = "")
  
  appLoad = read.csv(loadCsv, dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)
  
  appLoad[,"base_time.category"] = apply(appLoad["base_time"],1,classifyAction)
  appLoad[,"exec_time_iteration_1.category"] = apply(appLoad["exec_time_iteration_1"],1,classifyAction)
  appLoad[,"exec_time_iteration_2.category"] = apply(appLoad["exec_time_iteration_2"],1,classifyAction)
  appLoad[,"exec_time_iteration_3.category"] = apply(appLoad["exec_time_iteration_3"],1,classifyAction)
  appLoad[,"exec_time_iteration_4.category"] = apply(appLoad["exec_time_iteration_4"],1,classifyAction)
  appLoad[,"exec_time_iteration_5.category"] = apply(appLoad["exec_time_iteration_5"],1,classifyAction)
  
  appLoad[,"exec_time_iteration_1.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_1")
  appLoad[,"exec_time_iteration_2.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_2")
  appLoad[,"exec_time_iteration_3.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_3")
  appLoad[,"exec_time_iteration_4.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_4")
  appLoad[,"exec_time_iteration_5.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_5")
  
  appLoad[,"actions_0_30"] = apply(appLoad, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_1)
  appLoad[,"actions_30_80"] = apply(appLoad, 1, classifyActionsOH, limit_start = limit_1, limit_end = limit_2)
  appLoad[,"actions_80_180"] = apply(appLoad, 1, classifyActionsOH, limit_start = limit_2, limit_end = limit_3)
  appLoad[,"actions_180_10000"] = apply(appLoad, 1, classifyActionsOH, limit_start = limit_3, limit_end = 10000)
  
  appLoad$nInstantaneous <- rowSums(appLoad[-8] == "Instantaneous")
  appLoad$nImmediate <- rowSums(appLoad[-8] == "Immediate")
  appLoad$nContS <- rowSums(appLoad[-8] == "Continuous Simple")
  appLoad$nContC <- rowSums(appLoad[-8] == "Continuous Complex")
  appLoad$nCaptive <- rowSums(appLoad[-8] == "Captive")
  appLoad$nCaptiveOut <- rowSums(appLoad[-8] == "Captive Out")
  
  appLoad[,"slowactions_0_30"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_1)
  appLoad[,"slowactions_30_80"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = limit_1, limit_end = limit_2)
  appLoad[,"slowactions_80_180"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = limit_2, limit_end = limit_3)
  appLoad[,"slowactions_180_10000"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = limit_3, limit_end = 10000)
  
  appNew <- appLoad[,c("base_time.category","nInstantaneous","nImmediate","nContS","nContC","nCaptive","nCaptiveOut","slowactions_0_30","slowactions_30_80","slowactions_80_180","slowactions_180_10000","actions_0_30","actions_30_80","actions_80_180","actions_180_10000")]
  appFinal <- aggregate(. ~ base_time.category, appNew, sum)
  
  appFinal$total <- rowSums(appFinal[,c(2:7)])
  appFinal$slowActions <- apply(appFinal, 1, obtainSlowActions)
  appFinal$percentageSlowActions <- apply(appFinal, 1, obtainSlowActionsAsPercentage)
  
  appFinal[,"totSA_0_30"] = apply(appFinal, 1, getTotalSlowActions, interval = "0_30")
  appFinal[,"totSA_30_80"] = apply(appFinal, 1, getTotalSlowActions, interval = "30_80")
  appFinal[,"totSA_80_180"] = apply(appFinal, 1, getTotalSlowActions, interval = "80_180")
  appFinal[,"totSA_180_10000"] = apply(appFinal, 1, getTotalSlowActions, interval = "180_10000")
  
  appOverheads <- melt(appLoad[,c("exec_time_iteration_1.overhead","exec_time_iteration_2.overhead","exec_time_iteration_3.overhead","exec_time_iteration_4.overhead","exec_time_iteration_5.overhead")], id.vars=0)
  mean(appOverheads$value)
  
  return (appLoad[,-1])
}

step2 <- function(appName, resource, load) {
  
  if (resource == "" && load == "")
    loadCsv = paste(appName, "/", "no_saturation.csv", sep = "")
  else
    loadCsv = paste(appName, "/", load, "_" , resource, ".csv", sep = "")
  
  appLoad = read.csv(loadCsv, dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)
  
  appLoad[,"base_time.category"] = apply(appLoad["base_time"],1,classifyAction)
  appLoad[,"exec_time_iteration_1.category"] = apply(appLoad["exec_time_iteration_1"],1,classifyAction)
  appLoad[,"exec_time_iteration_2.category"] = apply(appLoad["exec_time_iteration_2"],1,classifyAction)
  appLoad[,"exec_time_iteration_3.category"] = apply(appLoad["exec_time_iteration_3"],1,classifyAction)
  appLoad[,"exec_time_iteration_4.category"] = apply(appLoad["exec_time_iteration_4"],1,classifyAction)
  appLoad[,"exec_time_iteration_5.category"] = apply(appLoad["exec_time_iteration_5"],1,classifyAction)
  
  appLoad[,"exec_time_iteration_1.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_1")
  appLoad[,"exec_time_iteration_2.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_2")
  appLoad[,"exec_time_iteration_3.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_3")
  appLoad[,"exec_time_iteration_4.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_4")
  appLoad[,"exec_time_iteration_5.overhead"] = apply(appLoad, 1, getOverhead, c1 = "exec_time_iteration_5")
  
  appLoad[,"actions_0_30"] = apply(appLoad, 1, classifyActionsOH, limit_start = -10000, limit_end = limit_1)
  appLoad[,"actions_30_80"] = apply(appLoad, 1, classifyActionsOH, limit_start = limit_1, limit_end = limit_2)
  appLoad[,"actions_80_180"] = apply(appLoad, 1, classifyActionsOH, limit_start = limit_2, limit_end = limit_3)
  appLoad[,"actions_180_10000"] = apply(appLoad, 1, classifyActionsOH, limit_start = limit_3, limit_end = 10000)
  
  appLoad$nInstantaneous <- rowSums(appLoad[-8] == "Instantaneous")
  appLoad$nImmediate <- rowSums(appLoad[-8] == "Immediate")
  appLoad$nContS <- rowSums(appLoad[-8] == "Continuous Simple")
  appLoad$nContC <- rowSums(appLoad[-8] == "Continuous Complex")
  appLoad$nCaptive <- rowSums(appLoad[-8] == "Captive")
  appLoad$nCaptiveOut <- rowSums(appLoad[-8] == "Captive Out")
  
  appLoad[,"slowactions_0_30"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = -10000, limit_end = limit_1)
  appLoad[,"slowactions_30_80"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = limit_1, limit_end = limit_2)
  appLoad[,"slowactions_80_180"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = limit_2, limit_end = limit_3)
  appLoad[,"slowactions_180_10000"] = apply(appLoad, 1, classifySlowActionsOH, limit_start = limit_3, limit_end = 10000)
  
  appNew <- appLoad[,c("base_time.category","nInstantaneous","nImmediate","nContS","nContC","nCaptive","nCaptiveOut","slowactions_0_30","slowactions_30_80","slowactions_80_180","slowactions_180_10000","actions_0_30","actions_30_80","actions_80_180","actions_180_10000")]
  appFinal <- aggregate(. ~ base_time.category, appNew, sum)
  
  appFinal$total <- rowSums(appFinal[,c(2:7)])
  appFinal$slowActions <- apply(appFinal, 1, obtainSlowActions)
  appFinal$percentageSlowActions <- apply(appFinal, 1, obtainSlowActionsAsPercentage)
  
  appFinal[,"totSA_0_30"] = apply(appFinal, 1, getTotalSlowActions, interval = "0_30")
  appFinal[,"totSA_30_80"] = apply(appFinal, 1, getTotalSlowActions, interval = "30_80")
  appFinal[,"totSA_80_180"] = apply(appFinal, 1, getTotalSlowActions, interval = "80_180")
  appFinal[,"totSA_180_10000"] = apply(appFinal, 1, getTotalSlowActions, interval = "180_10000")
  
  return (appNew)
}


step3 <- function(adobe, notepad, paint, vlc) {
  base <- rbind(adobe,notepad)
  base <- rbind(base,paint)
  base <- rbind(base,vlc)
  
  totalFinal <- aggregate(. ~ base_time.category, base, sum)
  
  totalFinal$total <- rowSums(totalFinal[,c(2:7)])
  
  totalFinal$slowActions <- apply(totalFinal, 1, obtainSlowActions)
  totalFinal$percentageSlowActions <- apply(totalFinal, 1, obtainSlowActionsAsPercentage)
  totalFinal <- rbind(totalFinal, c("Overall",apply(totalFinal[-1],2,mean)))
  
  return(subset(totalFinal, select = c(base_time.category, percentageSlowActions, slowActions)))
}

step4 <- function(adobe, notepad, paint, vlc){
  final <- rbind(adobe, notepad, paint, vlc)
  
  finalSA <- subset(final, select = c(base_time.category, nInstantaneous, nImmediate, nContS, nContC, nCaptive, nCaptiveOut))
  finalOH <- subset(final, select = c(base_time.category, exec_time_iteration_1.overhead, exec_time_iteration_2.overhead, exec_time_iteration_3.overhead, exec_time_iteration_4.overhead, exec_time_iteration_5.overhead))
  
  finalSA <- aggregate(. ~ base_time.category, finalSA, sum)
  finalSA$total <- rowSums(finalSA[,c(2:7)])
  finalSA$slowActions <- apply(finalSA, 1, obtainSlowActions)
  finalSA$percentageSlowActions <- apply(finalSA, 1, obtainSlowActionsAsPercentage)
  
  finalOHMelted <- melt (finalOH,id.vars = 1)
  
  finalMeansBySRT <- cbind(aggregate(. ~ base_time.category, finalOHMelted, mean), finalSA)
  
  return(subset(finalMeansBySRT, select = c(base_time.category,value, percentageSlowActions)))
}

extractOverheadData <- function(adobe, notepad, paint, vlc, action) {
  all <- rbind(adobe, notepad, paint, vlc)
  return(subset(all , base_time.category == action))
}

n_fun <- function(x) {
  
  percentage <- 100* ((x[2] - x[1]) / x[1])
  
  return(data.frame(y = mean(x) , label = paste0( round( percentage, 1) ,"%")))
}

