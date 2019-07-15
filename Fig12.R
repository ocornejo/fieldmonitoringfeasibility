library(ggplot2)

# loading 
new_measures = read.csv("hss_measures.csv", dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)

aggregatedByAction <- aggregate(new_measures$srt, by=list(action=new_measures$action, srt_type=new_measures$srt_type, oh_range=new_measures$oh_range), FUN=sum)

totalParticipants <- length(unique(new_measures$participant))
colnames(aggregatedByAction)[4] <- "count"

slow_srt = read.csv("hss_slow_srt.csv", dec = ".", sep = ";", header = T, stringsAsFactors=FALSE)

aggregatedByAction <- merge(aggregatedByAction, slow_srt, by="action")

estimateSimilarity <- function(x, total) {
  similarity = 0
  
  if (x["isSlow"] == 0) {
    similarity = 1 - (as.numeric(x["count"]) / total)
  } else if (x["isSlow"] == 1) {
    similarity = as.numeric(x["count"]) / total
  }
  
  return(similarity * 100)
}

aggregatedByAction[,"similarity"] = apply(aggregatedByAction, 1, estimateSimilarity, total = totalParticipants)

# Similarity by srt type and oh range

aggregatedBySRTOH <- aggregate(aggregatedByAction$similarity, by=list(srt_type=aggregatedByAction$srt_type, oh_range=aggregatedByAction$oh_range, isSlow=aggregatedByAction$isSlow), FUN=mean)

aggregatedBySRTOH$isSlow[aggregatedBySRTOH$isSlow == 0] <- "Expected"
aggregatedBySRTOH$isSlow[aggregatedBySRTOH$isSlow == 1] <- "Slow"

aggregatedBySRTOH$oh_rangef = factor(aggregatedBySRTOH$oh_range, levels=c("0-30%", "30-80%", "80-180%","180+%"))

png(file = "new_slow_oh.png", width = 1400,height = 700)
ggplot(aggregatedBySRTOH, aes(x=factor(srt_type, levels=c("Instantaneous", "Immediate", "Continuous Simple", "Continuous Complex", "Captive")), y = x, group = isSlow)) +
  geom_text(aes(label=isSlow), size = 5.5,  position=position_dodge(width=0.9), vjust=-0.40) +
  geom_bar(aes(fill = srt_type),colour="black", size = 0.3, position = position_dodge2(width = 0.9, preserve = "single"), stat= "identity") +
  facet_grid(.~oh_rangef, scales = "free")  +
  ylab("Consistency [%]") +
  ylim(0, 100) + theme_bw(base_size=24) + xlab("SRT Category") +
  theme(legend.position="none", axis.text.x = element_text(angle = 60, hjust = 1)) +
  scale_fill_brewer(palette = "Oranges", limits= c("Instantaneous", "Immediate", "Continuous Simple", "Continuous Complex", "Captive"))
dev.off()
