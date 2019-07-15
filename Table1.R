##This is for the tables on section 2
library(evaluate)
replay(evaluate(file("Fig6&9_Kruskal.R")))

# no monitoring
cpu60MeansBySRT <- step4(adobeCpu60, notepadCpu60, paintCpu60, vlcCpu60)
# monitoring
cpu60OHMeansBySRT <- step4(adobeCpu60OH, notepadCpu60OH, paintCpu60OH, vlcCpu60OH)

cpu60 <- cbind(cpu60MeansBySRT, cpu60OHMeansBySRT)
cpu60$deltaOH <- cpu60OHMeansBySRT[,"value"] - cpu60MeansBySRT[,"value"]
cpu60$deltaSA <- cpu60OHMeansBySRT[,"percentageSlowActions"] - cpu60MeansBySRT[,"percentageSlowActions"]

# no monitoring
cpu75MeansBySRT <- step4(adobeCpu75, notepadCpu75, paintCpu75, vlcCpu75)
# monitoring
cpu75OHMeansBySRT <- step4(adobeCpu75OH, notepadCpu75OH, paintCpu75OH, vlcCpu75OH)

cpu75 <- cbind(cpu75MeansBySRT, cpu75OHMeansBySRT)
cpu75$deltaOH <- cpu75OHMeansBySRT[,"value"] - cpu75MeansBySRT[,"value"]
cpu75$deltaSA <- cpu75OHMeansBySRT[,"percentageSlowActions"] - cpu75MeansBySRT[,"percentageSlowActions"]

# no monitoring
cpu90MeansBySRT <- step4(adobeCpu90, notepadCpu90, paintCpu90, vlcCpu90)
# monitoring
cpu90OHMeansBySRT <- step4(adobeCpu90OH, notepadCpu90OH, paintCpu90OH, vlcCpu90OH)

cpu90 <- cbind(cpu90MeansBySRT, cpu90OHMeansBySRT)
cpu90$deltaOH <- cpu90OHMeansBySRT[,"value"] - cpu90MeansBySRT[,"value"]
cpu90$deltaSA <- cpu90OHMeansBySRT[,"percentageSlowActions"] - cpu90MeansBySRT[,"percentageSlowActions"]


# no monitoring
ram60MeansBySRT <- step4(adobeRam60, notepadRam60, paintRam60, vlcRam60)
ram60MeansBySRT$value <- ram60MeansBySRT$value * 100
# monitoring
ram60OHMeansBySRT <- step4(adobeRam60OH, notepadRam60OH, paintRam60OH, vlcRam60OH)
ram60OHMeansBySRT$value <- ram60OHMeansBySRT$value * 100

ram60 <- cbind(ram60MeansBySRT, ram60OHMeansBySRT)
ram60$deltaOH <- ram60OHMeansBySRT[,"value"] - ram60MeansBySRT[,"value"]
ram60$deltaSA <- ram60OHMeansBySRT[,"percentageSlowActions"] - ram60MeansBySRT[,"percentageSlowActions"]

# no monitoring
ram75MeansBySRT <- step4(adobeRam75, notepadRam75, paintRam75, vlcRam75)
ram75MeansBySRT$value <- ram75MeansBySRT$value * 100
# monitoring
ram75OHMeansBySRT <- step4(adobeRam75OH, notepadRam75OH, paintRam75OH, vlcRam75OH)
ram75OHMeansBySRT$value <- ram75OHMeansBySRT$value * 100

ram75 <- cbind(ram75MeansBySRT, ram75OHMeansBySRT)
ram75$deltaOH <- ram75OHMeansBySRT[,"value"] - ram75MeansBySRT[,"value"]
ram75$deltaSA <- ram75OHMeansBySRT[,"percentageSlowActions"] - ram75MeansBySRT[,"percentageSlowActions"]

# no monitoring
ram90MeansBySRT <- step4(adobeRam90, notepadRam90, paintRam90, vlcRam90)
ram90MeansBySRT$value <- ram90MeansBySRT$value * 100
# monitoring
ram90OHMeansBySRT <- step4(adobeRam90OH, notepadRam90OH, paintRam90OH, vlcRam90OH)
ram90OHMeansBySRT$value <- ram90OHMeansBySRT$value * 100

ram90 <- cbind(ram90MeansBySRT, ram90OHMeansBySRT)
ram90$deltaOH <- ram90OHMeansBySRT[,"value"] - ram90MeansBySRT[,"value"]
ram90$deltaSA <- ram90OHMeansBySRT[,"percentageSlowActions"] - ram90MeansBySRT[,"percentageSlowActions"]
