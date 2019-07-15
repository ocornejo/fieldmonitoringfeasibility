options(scipen = 999)
library(dplyr)
library(reshape)
library(ggplot2)
library(cowplot)
library(grid)

replay(evaluate(file("HelperFunctions.R")))

adobeBase = step2("adobe", "", "")
notepadBase = step2("notepad", "", "")
paintBase = step2("paint", "", "")
vlcBase = step2("vlc", "", "")

cpuNoLoad <- step3(adobeBase,notepadBase,paintBase,vlcBase)
cpuNoLoad$load <- rep("no_load", length(cpuNoLoad$base_time.category))

ramNoLoad <- cpuNoLoad

cpuNoLoadNoOH <- cpuNoLoad
cpuNoLoadNoOH$percentageSlowActions <- rep(0, length(cpuNoLoadNoOH$percentageSlowActions))

ramNoLoadNoOH <- cpuNoLoadNoOH

############################

adobeCpu60 = step2("adobe", "cpu", "60")
notepadCpu60 = step2("notepad", "cpu", "60")
paintCpu60 = step2("paint", "cpu", "60")
vlcCpu60 = step2("vlc", "cpu", "60")

cpu60Load <- step3(adobeCpu60,notepadCpu60,paintCpu60,vlcCpu60)
cpu60Load$load <- rep("60", length(cpu60Load$base_time.category))

############################
adobeCpu75 = step2("adobe", "cpu", "75")
notepadCpu75 = step2("notepad", "cpu", "75")
paintCpu75 = step2("paint", "cpu", "75")
vlcCpu75 = step2("vlc", "cpu", "75")

cpu75Load <- step3(adobeCpu75,notepadCpu75,paintCpu75,vlcCpu75)
cpu75Load$load <- rep("75", length(cpu75Load$base_time.category))

############################
adobeCpu90 = step2("adobe", "cpu", "90")
notepadCpu90 = step2("notepad", "cpu", "90")
paintCpu90 = step2("paint", "cpu", "90")
vlcCpu90 = step2("vlc", "cpu", "90")

cpu90Load <- step3(adobeCpu90,notepadCpu90,paintCpu90,vlcCpu90)
cpu90Load$load <- rep("90", length(cpu90Load$base_time.category))


##########################################

adobeCpu60OH = step2("adobe", "cpu_oh", "60")
notepadCpu60OH = step2("notepad", "cpu_oh", "60")
paintCpu60OH = step2("paint", "cpu_oh", "60")
vlcCpu60OH = step2("vlc", "cpu_oh", "60")

cpu60OHLoad <- step3(adobeCpu60OH,notepadCpu60OH,paintCpu60OH,vlcCpu60OH)
cpu60OHLoad$load <- rep("60", length(cpu60OHLoad$base_time.category))
############################
adobeCpu75OH = step2("adobe", "cpu_oh", "75")
notepadCpu75OH = step2("notepad", "cpu_oh", "75")
paintCpu75OH = step2("paint", "cpu_oh", "75")
vlcCpu75OH = step2("vlc", "cpu_oh", "75")

cpu75OHLoad <- step3(adobeCpu75OH,notepadCpu75OH,paintCpu75OH,vlcCpu75OH)
cpu75OHLoad$load <- rep("75", length(cpu75OHLoad$base_time.category))
############################
adobeCpu90OH = step2("adobe", "cpu_oh", "90")
notepadCpu90OH = step2("notepad", "cpu_oh", "90")
paintCpu90OH = step2("paint", "cpu_oh", "90")
vlcCpu90OH = step2("vlc", "cpu_oh", "90")

cpu90OHLoad <- step3(adobeCpu90OH,notepadCpu90OH,paintCpu90OH,vlcCpu90OH)
cpu90OHLoad$load <- rep("90", length(cpu90OHLoad$base_time.category))

############################

adobeRam60 = step2("adobe", "ram", "60")
notepadRam60 = step2("notepad", "ram", "60")
paintRam60 = step2("paint", "ram", "60")
vlcRam60 = step2("vlc", "ram", "60")

ram60Load <- step3(adobeRam60,notepadRam60,paintRam60,vlcRam60)
ram60Load$load <- rep("60", length(ram60Load$base_time.category))

############################
adobeRam75 = step2("adobe", "ram", "75")
notepadRam75 = step2("notepad", "ram", "75")
paintRam75 = step2("paint", "ram", "75")
vlcRam75 = step2("vlc", "ram", "75")

ram75Load <- step3(adobeRam75,notepadRam75,paintRam75,vlcRam75)
ram75Load$load <- rep("75", length(ram75Load$base_time.category))

############################
adobeRam90 = step2("adobe", "ram", "90")
notepadRam90 = step2("notepad", "ram", "90")
paintRam90 = step2("paint", "ram", "90")
vlcRam90 = step2("vlc", "ram", "90")

ram90Load <- step3(adobeRam90,notepadRam90,paintRam90,vlcRam90)
ram90Load$load <- rep("90", length(ram90Load$base_time.category))

#########################################

adobeRam60OH = step2("adobe", "ram_oh", "60")
notepadRam60OH = step2("notepad", "ram_oh", "60")
paintRam60OH = step2("paint", "ram_oh", "60")
vlcRam60OH = step2("vlc", "ram_oh", "60")

ram60OHLoad <- step3(adobeRam60OH,notepadRam60OH,paintRam60OH,vlcRam60OH)
ram60OHLoad$load <- rep("60", length(ram60OHLoad$base_time.category))

############################

adobeRam75OH = step2("adobe", "ram_oh", "75")
notepadRam75OH = step2("notepad", "ram_oh", "75")
paintRam75OH = step2("paint", "ram_oh", "75")
vlcRam75OH = step2("vlc", "ram_oh", "75")

ram75OHLoad <- step3(adobeRam75OH,notepadRam75OH,paintRam75OH,vlcRam75OH)
ram75OHLoad$load <- rep("75", length(ram75OHLoad$base_time.category))

############################

adobeRam90OH = step2("adobe", "ram_oh", "90")
notepadRam90OH = step2("notepad", "ram_oh", "90")
paintRam90OH = step2("paint", "ram_oh", "90")
vlcRam90OH = step2("vlc", "ram_oh", "90")

ram90OHLoad <- step3(adobeRam90OH,notepadRam90OH,paintRam90OH,vlcRam90OH)
ram90OHLoad$load <- rep("90", length(ram90OHLoad$base_time.category))

##########################
inst_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
inst_cpu[nrow(inst_cpu) + 1,] = list("0","base_time", 0, 0)
inst_cpu[nrow(inst_cpu) + 1,] = list("0","monitored", cpuNoLoad[cpuNoLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     cpuNoLoad[cpuNoLoad$base_time.category == "Instantaneous", ]$slowActions)
inst_cpu[nrow(inst_cpu) + 1,] = list("60","base_time", cpu60Load[cpu60Load$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     cpu60Load[cpu60Load$base_time.category == "Instantaneous", ]$slowActions)
inst_cpu[nrow(inst_cpu) + 1,] = list("60","monitored", cpu60OHLoad[cpu60OHLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     cpu60OHLoad[cpu60OHLoad$base_time.category == "Instantaneous", ]$slowActions)
inst_cpu[nrow(inst_cpu) + 1,] = list("75","base_time", cpu75Load[cpu75Load$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     cpu75Load[cpu75Load$base_time.category == "Instantaneous", ]$slowActions)
inst_cpu[nrow(inst_cpu) + 1,] = list("75","monitored", cpu75OHLoad[cpu75OHLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     cpu75OHLoad[cpu75OHLoad$base_time.category == "Instantaneous", ]$slowActions)
inst_cpu[nrow(inst_cpu) + 1,] = list("90","base_time", cpu90Load[cpu90Load$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     cpu90Load[cpu90Load$base_time.category == "Instantaneous", ]$slowActions)
inst_cpu[nrow(inst_cpu) + 1,] = list("90","monitored", cpu90OHLoad[cpu90OHLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     cpu90OHLoad[cpu90OHLoad$base_time.category == "Instantaneous", ]$slowActions)

imm_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
imm_cpu[nrow(imm_cpu) + 1,] = list("0","base_time", 0, 0)
imm_cpu[nrow(imm_cpu) + 1,] = list("0","monitored", cpuNoLoad[cpuNoLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   cpuNoLoad[cpuNoLoad$base_time.category == "Immediate", ]$slowActions)
imm_cpu[nrow(imm_cpu) + 1,] = list("60","base_time", cpu60Load[cpu60Load$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   cpu60Load[cpu60Load$base_time.category == "Immediate", ]$slowActions)
imm_cpu[nrow(imm_cpu) + 1,] = list("60","monitored", cpu60OHLoad[cpu60OHLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   cpu60OHLoad[cpu60OHLoad$base_time.category == "Immediate", ]$slowActions)
imm_cpu[nrow(imm_cpu) + 1,] = list("75","base_time", cpu75Load[cpu75Load$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   cpu75Load[cpu75Load$base_time.category == "Immediate", ]$slowActions)
imm_cpu[nrow(imm_cpu) + 1,] = list("75","monitored", cpu75OHLoad[cpu75OHLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   cpu75OHLoad[cpu75OHLoad$base_time.category == "Immediate", ]$slowActions)
imm_cpu[nrow(imm_cpu) + 1,] = list("90","base_time", cpu90Load[cpu90Load$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   cpu90Load[cpu90Load$base_time.category == "Immediate", ]$slowActions)
imm_cpu[nrow(imm_cpu) + 1,] = list("90","monitored", cpu90OHLoad[cpu90OHLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   cpu90OHLoad[cpu90OHLoad$base_time.category == "Immediate", ]$slowActions)

cs_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
cs_cpu[nrow(cs_cpu) + 1,] = list("0","base_time", 0, 0)
cs_cpu[nrow(cs_cpu) + 1,] = list("0","monitored", cpuNoLoad[cpuNoLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 cpuNoLoad[cpuNoLoad$base_time.category == "Continuous Simple", ]$slowActions)
cs_cpu[nrow(cs_cpu) + 1,] = list("60","base_time", cpu60Load[cpu60Load$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 cpu60Load[cpu60Load$base_time.category == "Continuous Simple", ]$slowActions)
cs_cpu[nrow(cs_cpu) + 1,] = list("60","monitored", cpu60OHLoad[cpu60OHLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 cpu60OHLoad[cpu60OHLoad$base_time.category == "Continuous Simple", ]$slowActions)
cs_cpu[nrow(cs_cpu) + 1,] = list("75","base_time", cpu75Load[cpu75Load$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 cpu75Load[cpu75Load$base_time.category == "Continuous Simple", ]$slowActions)
cs_cpu[nrow(cs_cpu) + 1,] = list("75","monitored", cpu75OHLoad[cpu75OHLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 cpu75OHLoad[cpu75OHLoad$base_time.category == "Continuous Simple", ]$slowActions)
cs_cpu[nrow(cs_cpu) + 1,] = list("90","base_time", cpu90Load[cpu90Load$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 cpu90Load[cpu90Load$base_time.category == "Continuous Simple", ]$slowActions)
cs_cpu[nrow(cs_cpu) + 1,] = list("90","monitored", cpu90OHLoad[cpu90OHLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 cpu90OHLoad[cpu90OHLoad$base_time.category == "Continuous Simple", ]$slowActions)

cc_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
cc_cpu[nrow(cc_cpu) + 1,] = list("0","base_time", 0, 0)
cc_cpu[nrow(cc_cpu) + 1,] = list("0","monitored", cpuNoLoad[cpuNoLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 cpuNoLoad[cpuNoLoad$base_time.category == "Continuous Complex", ]$slowActions)
cc_cpu[nrow(cc_cpu) + 1,] = list("60","base_time", cpu60Load[cpu60Load$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 cpu60Load[cpu60Load$base_time.category == "Continuous Complex", ]$slowActions)
cc_cpu[nrow(cc_cpu) + 1,] = list("60","monitored", cpu60OHLoad[cpu60OHLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 cpu60OHLoad[cpu60OHLoad$base_time.category == "Continuous Complex", ]$slowActions)
cc_cpu[nrow(cc_cpu) + 1,] = list("75","base_time", cpu75Load[cpu75Load$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 cpu75Load[cpu75Load$base_time.category == "Continuous Complex", ]$slowActions)
cc_cpu[nrow(cc_cpu) + 1,] = list("75","monitored", cpu75OHLoad[cpu75OHLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 cpu75OHLoad[cpu75OHLoad$base_time.category == "Continuous Complex", ]$slowActions)
cc_cpu[nrow(cc_cpu) + 1,] = list("90","base_time", cpu90Load[cpu90Load$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 cpu90Load[cpu90Load$base_time.category == "Continuous Complex", ]$slowActions)
cc_cpu[nrow(cc_cpu) + 1,] = list("90","monitored", cpu90OHLoad[cpu90OHLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 cpu90OHLoad[cpu90OHLoad$base_time.category == "Continuous Complex", ]$slowActions)

capt_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
capt_cpu[nrow(capt_cpu) + 1,] = list("0","base_time", 0, 0)
capt_cpu[nrow(capt_cpu) + 1,] = list("0","monitored", cpuNoLoad[cpuNoLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     cpuNoLoad[cpuNoLoad$base_time.category == "Captive", ]$slowActions)
capt_cpu[nrow(capt_cpu) + 1,] = list("60","base_time", cpu60Load[cpu60Load$base_time.category == "Captive", ]$percentageSlowActions, 
                                     cpu60Load[cpu60Load$base_time.category == "Captive", ]$slowActions)
capt_cpu[nrow(capt_cpu) + 1,] = list("60","monitored", cpu60OHLoad[cpu60OHLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     cpu60OHLoad[cpu60OHLoad$base_time.category == "Captive", ]$slowActions)
capt_cpu[nrow(capt_cpu) + 1,] = list("75","base_time", cpu75Load[cpu75Load$base_time.category == "Captive", ]$percentageSlowActions, 
                                     cpu75Load[cpu75Load$base_time.category == "Captive", ]$slowActions)
capt_cpu[nrow(capt_cpu) + 1,] = list("75","monitored", cpu75OHLoad[cpu75OHLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     cpu75OHLoad[cpu75OHLoad$base_time.category == "Captive", ]$slowActions)
capt_cpu[nrow(capt_cpu) + 1,] = list("90","base_time", cpu90Load[cpu90Load$base_time.category == "Captive", ]$percentageSlowActions, 
                                     cpu90Load[cpu90Load$base_time.category == "Captive", ]$slowActions)
capt_cpu[nrow(capt_cpu) + 1,] = list("90","monitored", cpu90OHLoad[cpu90OHLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     cpu90OHLoad[cpu90OHLoad$base_time.category == "Captive", ]$slowActions)
inst_cpu$percentageSlowActions = as.numeric(as.character(inst_cpu$percentageSlowActions))
inst_cpu$slowActions = as.numeric(as.character(inst_cpu$slowActions))
imm_cpu$percentageSlowActions = as.numeric(as.character(imm_cpu$percentageSlowActions))
imm_cpu$slowActions = as.numeric(as.character(imm_cpu$slowActions))
cs_cpu$percentageSlowActions = as.numeric(as.character(cs_cpu$percentageSlowActions))
cs_cpu$slowActions = as.numeric(as.character(cs_cpu$slowActions))
cc_cpu$percentageSlowActions = as.numeric(as.character(cc_cpu$percentageSlowActions))
cc_cpu$slowActions = as.numeric(as.character(cc_cpu$slowActions))
capt_cpu$percentageSlowActions = as.numeric(as.character(capt_cpu$percentageSlowActions))
capt_cpu$slowActions = as.numeric(as.character(capt_cpu$slowActions))

p0 <- ggplot(data=inst_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  geom_point(size = 3) +
  ggtitle("Instantaneous") +
  ylab("Slow operations [%]") + xlab("CPU Load [%]") +
  theme_bw(base_size=22.5) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

legend <- get_legend(p0 + theme(legend.position = "top",legend.text=element_text(size=27)))
p0<- p0 + theme(legend.position="none")  

p1 <- ggplot(data=imm_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Immediate") +
  geom_point(size = 3) +
  xlab("CPU Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p2 <- ggplot(data=cs_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Continuous Simple") +
  geom_point(size = 3) + xlab("CPU Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p3 <- ggplot(data=cc_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Continuous Complex") +
  geom_point(size = 3) + xlab("CPU Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p4 <- ggplot(data=capt_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Captive") +
  geom_point(size = 3) + xlab("CPU Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))


p<-plot_grid(p0,p1,p2,p3,p4, ncol=5)
png(file = "contextSRTCPUslow.png",width = 1500,height = 600)
plot(plot_grid(p, legend, ncol = 1, rel_heights = c(1,0.1)))
dev.off()


#################

inst_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
inst_ram[nrow(inst_ram) + 1,] = list("0","base_time", 0, 0)
inst_ram[nrow(inst_ram) + 1,] = list("0","monitored", ramNoLoad[ramNoLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     ramNoLoad[ramNoLoad$base_time.category == "Instantaneous", ]$slowActions)
inst_ram[nrow(inst_ram) + 1,] = list("60","base_time", ram60Load[ram60Load$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     ram60Load[ram60Load$base_time.category == "Instantaneous", ]$slowActions)
inst_ram[nrow(inst_ram) + 1,] = list("60","monitored", ram60OHLoad[ram60OHLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     ram60OHLoad[ram60OHLoad$base_time.category == "Instantaneous", ]$slowActions)
inst_ram[nrow(inst_ram) + 1,] = list("75","base_time", ram75Load[ram75Load$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     ram75Load[ram75Load$base_time.category == "Instantaneous", ]$slowActions)
inst_ram[nrow(inst_ram) + 1,] = list("75","monitored", ram75OHLoad[ram75OHLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     ram75OHLoad[ram75OHLoad$base_time.category == "Instantaneous", ]$slowActions)
inst_ram[nrow(inst_ram) + 1,] = list("90","base_time", ram90Load[ram90Load$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     ram90Load[ram90Load$base_time.category == "Instantaneous", ]$slowActions)
inst_ram[nrow(inst_ram) + 1,] = list("90","monitored", ram90OHLoad[ram90OHLoad$base_time.category == "Instantaneous", ]$percentageSlowActions, 
                                     ram90OHLoad[ram90OHLoad$base_time.category == "Instantaneous", ]$slowActions)

imm_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
imm_ram[nrow(imm_ram) + 1,] = list("0","base_time", 0, 0)
imm_ram[nrow(imm_ram) + 1,] = list("0","monitored", ramNoLoad[ramNoLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   ramNoLoad[ramNoLoad$base_time.category == "Immediate", ]$slowActions)
imm_ram[nrow(imm_ram) + 1,] = list("60","base_time", ram60Load[ram60Load$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   ram60Load[ram60Load$base_time.category == "Immediate", ]$slowActions)
imm_ram[nrow(imm_ram) + 1,] = list("60","monitored", ram60OHLoad[ram60OHLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   ram60OHLoad[ram60OHLoad$base_time.category == "Immediate", ]$slowActions)
imm_ram[nrow(imm_ram) + 1,] = list("75","base_time", ram75Load[ram75Load$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   ram75Load[ram75Load$base_time.category == "Immediate", ]$slowActions)
imm_ram[nrow(imm_ram) + 1,] = list("75","monitored", ram75OHLoad[ram75OHLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   ram75OHLoad[ram75OHLoad$base_time.category == "Immediate", ]$slowActions)
imm_ram[nrow(imm_ram) + 1,] = list("90","base_time", ram90Load[ram90Load$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   ram90Load[ram90Load$base_time.category == "Immediate", ]$slowActions)
imm_ram[nrow(imm_ram) + 1,] = list("90","monitored", ram90OHLoad[ram90OHLoad$base_time.category == "Immediate", ]$percentageSlowActions, 
                                   ram90OHLoad[ram90OHLoad$base_time.category == "Immediate", ]$slowActions)

cs_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
cs_ram[nrow(cs_ram) + 1,] = list("0","base_time", 0, 0)
cs_ram[nrow(cs_ram) + 1,] = list("0","monitored", ramNoLoad[ramNoLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 ramNoLoad[ramNoLoad$base_time.category == "Continuous Simple", ]$slowActions)
cs_ram[nrow(cs_ram) + 1,] = list("60","base_time", ram60Load[ram60Load$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 ram60Load[ram60Load$base_time.category == "Continuous Simple", ]$slowActions)
cs_ram[nrow(cs_ram) + 1,] = list("60","monitored", ram60OHLoad[ram60OHLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 ram60OHLoad[ram60OHLoad$base_time.category == "Continuous Simple", ]$slowActions)
cs_ram[nrow(cs_ram) + 1,] = list("75","base_time", ram75Load[ram75Load$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 ram75Load[ram75Load$base_time.category == "Continuous Simple", ]$slowActions)
cs_ram[nrow(cs_ram) + 1,] = list("75","monitored", ram75OHLoad[ram75OHLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 ram75OHLoad[ram75OHLoad$base_time.category == "Continuous Simple", ]$slowActions)
cs_ram[nrow(cs_ram) + 1,] = list("90","base_time", ram90Load[ram90Load$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 ram90Load[ram90Load$base_time.category == "Continuous Simple", ]$slowActions)
cs_ram[nrow(cs_ram) + 1,] = list("90","monitored", ram90OHLoad[ram90OHLoad$base_time.category == "Continuous Simple", ]$percentageSlowActions, 
                                 ram90OHLoad[ram90OHLoad$base_time.category == "Continuous Simple", ]$slowActions)

cc_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
cc_ram[nrow(cc_ram) + 1,] = list("0","base_time", 0, 0)
cc_ram[nrow(cc_ram) + 1,] = list("0","monitored", ramNoLoad[ramNoLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 ramNoLoad[ramNoLoad$base_time.category == "Continuous Complex", ]$slowActions)
cc_ram[nrow(cc_ram) + 1,] = list("60","base_time", ram60Load[ram60Load$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 ram60Load[ram60Load$base_time.category == "Continuous Complex", ]$slowActions)
cc_ram[nrow(cc_ram) + 1,] = list("60","monitored", ram60OHLoad[ram60OHLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 ram60OHLoad[ram60OHLoad$base_time.category == "Continuous Complex", ]$slowActions)
cc_ram[nrow(cc_ram) + 1,] = list("75","base_time", ram75Load[ram75Load$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 ram75Load[ram75Load$base_time.category == "Continuous Complex", ]$slowActions)
cc_ram[nrow(cc_ram) + 1,] = list("75","monitored", ram75OHLoad[ram75OHLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 ram75OHLoad[ram75OHLoad$base_time.category == "Continuous Complex", ]$slowActions)
cc_ram[nrow(cc_ram) + 1,] = list("90","base_time", ram90Load[ram90Load$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 ram90Load[ram90Load$base_time.category == "Continuous Complex", ]$slowActions)
cc_ram[nrow(cc_ram) + 1,] = list("90","monitored", ram90OHLoad[ram90OHLoad$base_time.category == "Continuous Complex", ]$percentageSlowActions, 
                                 ram90OHLoad[ram90OHLoad$base_time.category == "Continuous Complex", ]$slowActions)

capt_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
capt_ram[nrow(capt_ram) + 1,] = list("0","base_time", 0, 0)
capt_ram[nrow(capt_ram) + 1,] = list("0","monitored", ramNoLoad[ramNoLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     ramNoLoad[ramNoLoad$base_time.category == "Captive", ]$slowActions)
capt_ram[nrow(capt_ram) + 1,] = list("60","base_time", ram60Load[ram60Load$base_time.category == "Captive", ]$percentageSlowActions, 
                                     ram60Load[ram60Load$base_time.category == "Captive", ]$slowActions)
capt_ram[nrow(capt_ram) + 1,] = list("60","monitored", ram60OHLoad[ram60OHLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     ram60OHLoad[ram60OHLoad$base_time.category == "Captive", ]$slowActions)
capt_ram[nrow(capt_ram) + 1,] = list("75","base_time", ram75Load[ram75Load$base_time.category == "Captive", ]$percentageSlowActions, 
                                     ram75Load[ram75Load$base_time.category == "Captive", ]$slowActions)
capt_ram[nrow(capt_ram) + 1,] = list("75","monitored", ram75OHLoad[ram75OHLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     ram75OHLoad[ram75OHLoad$base_time.category == "Captive", ]$slowActions)
capt_ram[nrow(capt_ram) + 1,] = list("90","base_time", ram90Load[ram90Load$base_time.category == "Captive", ]$percentageSlowActions, 
                                     ram90Load[ram90Load$base_time.category == "Captive", ]$slowActions)
capt_ram[nrow(capt_ram) + 1,] = list("90","monitored", ram90OHLoad[ram90OHLoad$base_time.category == "Captive", ]$percentageSlowActions, 
                                     ram90OHLoad[ram90OHLoad$base_time.category == "Captive", ]$slowActions)
inst_ram$percentageSlowActions = as.numeric(as.character(inst_ram$percentageSlowActions))
inst_ram$slowActions = as.numeric(as.character(inst_ram$slowActions))
imm_ram$percentageSlowActions = as.numeric(as.character(imm_ram$percentageSlowActions))
imm_ram$slowActions = as.numeric(as.character(imm_ram$slowActions))
cs_ram$percentageSlowActions = as.numeric(as.character(cs_ram$percentageSlowActions))
cs_ram$slowActions = as.numeric(as.character(cs_ram$slowActions))
cc_ram$percentageSlowActions = as.numeric(as.character(cc_ram$percentageSlowActions))
cc_ram$slowActions = as.numeric(as.character(cc_ram$slowActions))
capt_ram$percentageSlowActions = as.numeric(as.character(capt_ram$percentageSlowActions))
capt_ram$slowActions = as.numeric(as.character(capt_ram$slowActions))



p0 <- ggplot(data=inst_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  geom_point(size = 3) +
  ggtitle("Instantaneous") +
  ylab("Slow operations [%]") + xlab("RAM Load [%]") +
  theme_bw(base_size=22.5) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

legend <- get_legend(p0 + theme(legend.position = "top",legend.text=element_text(size=27)))
p0<- p0 + theme(legend.position="none")  

p1 <- ggplot(data=imm_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Immediate") +
  geom_point(size = 3) +
  xlab("RAM Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p2 <- ggplot(data=cs_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Continuous Simple") +
  geom_point(size = 3) + xlab("RAM Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p3 <- ggplot(data=cc_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Continuous Complex") +
  geom_point(size = 3) + xlab("RAM Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p4 <- ggplot(data=capt_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Captive") +
  geom_point(size = 3) + xlab("RAM Load [%]") +
  theme_bw(base_size=22.5) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))


p<-plot_grid(p0,p1,p2,p3,p4, ncol=5)
png(file = "contextSRTRAMslow.png",width = 1500,height = 600)
plot(plot_grid(p, legend, ncol = 1, rel_heights = c(1,0.1)))
dev.off()


#################


adobe_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
adobe_cpu[nrow(adobe_cpu) + 1,] = list("0","base_time", 0, 0)
adobe_cpu[nrow(adobe_cpu) + 1,] = list("0","monitored", sum(colSums(adobeBase[,8:11]))/sum(colSums(adobeBase[,12:15])) * 100, sum(colSums(adobeBase[,8:11])))
adobe_cpu[nrow(adobe_cpu) + 1,] = list("60","base_time", sum(colSums(adobeCpu60[,8:11]))/sum(colSums(adobeCpu60[,12:15])) * 100, sum(colSums(adobeCpu60[,8:11])))
adobe_cpu[nrow(adobe_cpu) + 1,] = list("60","monitored", sum(colSums(adobeCpu60OH[,8:11]))/sum(colSums(adobeCpu60OH[,12:15])) * 100, sum(colSums(adobeCpu60OH[,8:11])))
adobe_cpu[nrow(adobe_cpu) + 1,] = list("75","base_time", sum(colSums(adobeCpu75[,8:11]))/sum(colSums(adobeCpu75[,12:15])) * 100, sum(colSums(adobeCpu75[,8:11])))
adobe_cpu[nrow(adobe_cpu) + 1,] = list("75","monitored", sum(colSums(adobeCpu75OH[,8:11]))/sum(colSums(adobeCpu75OH[,12:15])) * 100, sum(colSums(adobeCpu75OH[,8:11])))
adobe_cpu[nrow(adobe_cpu) + 1,] = list("90","base_time", sum(colSums(adobeCpu90[,8:11]))/sum(colSums(adobeCpu90[,12:15])) * 100, sum(colSums(adobeCpu90[,8:11])))
adobe_cpu[nrow(adobe_cpu) + 1,] = list("90","monitored", sum(colSums(adobeCpu90OH[,8:11]))/sum(colSums(adobeCpu90OH[,12:15])) * 100, sum(colSums(adobeCpu90OH[,8:11])))

notepad_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
notepad_cpu[nrow(notepad_cpu) + 1,] = list("0","base_time", 0, 0)
notepad_cpu[nrow(notepad_cpu) + 1,] = list("0","monitored", sum(colSums(notepadBase[,8:11]))/sum(colSums(notepadBase[,12:15])) * 100, sum(colSums(notepadBase[,8:11])))
notepad_cpu[nrow(notepad_cpu) + 1,] = list("60","base_time", sum(colSums(notepadCpu60[,8:11]))/sum(colSums(notepadCpu60[,12:15])) * 100, sum(colSums(notepadCpu60[,8:11])))
notepad_cpu[nrow(notepad_cpu) + 1,] = list("60","monitored", sum(colSums(notepadCpu60OH[,8:11]))/sum(colSums(notepadCpu60OH[,12:15])) * 100, sum(colSums(notepadCpu60OH[,8:11])))
notepad_cpu[nrow(notepad_cpu) + 1,] = list("75","base_time", sum(colSums(notepadCpu75[,8:11]))/sum(colSums(notepadCpu75[,12:15])) * 100, sum(colSums(notepadCpu75[,8:11])))
notepad_cpu[nrow(notepad_cpu) + 1,] = list("75","monitored", sum(colSums(notepadCpu75OH[,8:11]))/sum(colSums(notepadCpu75OH[,12:15])) * 100, sum(colSums(notepadCpu75OH[,8:11])))
notepad_cpu[nrow(notepad_cpu) + 1,] = list("90","base_time", sum(colSums(notepadCpu90[,8:11]))/sum(colSums(notepadCpu90[,12:15])) * 100, sum(colSums(notepadCpu90[,8:11])))
notepad_cpu[nrow(notepad_cpu) + 1,] = list("90","monitored", sum(colSums(notepadCpu90OH[,8:11]))/sum(colSums(notepadCpu90OH[,12:15])) * 100, sum(colSums(notepadCpu90OH[,8:11])))

paint_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
paint_cpu[nrow(paint_cpu) + 1,] = list("0","base_time", 0, 0)
paint_cpu[nrow(paint_cpu) + 1,] = list("0","monitored", sum(colSums(paintBase[,8:11]))/sum(colSums(paintBase[,12:15])) * 100, sum(colSums(paintBase[,8:11])))
paint_cpu[nrow(paint_cpu) + 1,] = list("60","base_time", sum(colSums(paintCpu60[,8:11]))/sum(colSums(paintCpu60[,12:15])) * 100, sum(colSums(paintCpu60[,8:11])))
paint_cpu[nrow(paint_cpu) + 1,] = list("60","monitored", sum(colSums(paintCpu60OH[,8:11]))/sum(colSums(paintCpu60OH[,12:15])) * 100, sum(colSums(paintCpu60OH[,8:11])))
paint_cpu[nrow(paint_cpu) + 1,] = list("75","base_time", sum(colSums(paintCpu75[,8:11]))/sum(colSums(paintCpu75[,12:15])) * 100, sum(colSums(paintCpu75[,8:11])))
paint_cpu[nrow(paint_cpu) + 1,] = list("75","monitored", sum(colSums(paintCpu75OH[,8:11]))/sum(colSums(paintCpu75OH[,12:15])) * 100, sum(colSums(paintCpu75OH[,8:11])))
paint_cpu[nrow(paint_cpu) + 1,] = list("90","base_time", sum(colSums(paintCpu90[,8:11]))/sum(colSums(paintCpu90[,12:15])) * 100, sum(colSums(paintCpu90[,8:11])))
paint_cpu[nrow(paint_cpu) + 1,] = list("90","monitored", sum(colSums(paintCpu90OH[,8:11]))/sum(colSums(paintCpu90OH[,12:15])) * 100, sum(colSums(paintCpu90OH[,8:11])))

vlc_cpu  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
vlc_cpu[nrow(vlc_cpu) + 1,] = list("0","base_time", 0, 0)
vlc_cpu[nrow(vlc_cpu) + 1,] = list("0","monitored", sum(colSums(vlcBase[,8:11]))/sum(colSums(vlcBase[,12:15])) * 100, sum(colSums(vlcBase[,8:11])))
vlc_cpu[nrow(vlc_cpu) + 1,] = list("60","base_time", sum(colSums(vlcCpu60[,8:11]))/sum(colSums(vlcCpu60[,12:15])) * 100, sum(colSums(vlcCpu60[,8:11])))
vlc_cpu[nrow(vlc_cpu) + 1,] = list("60","monitored", sum(colSums(vlcCpu60OH[,8:11]))/sum(colSums(vlcCpu60OH[,12:15])) * 100, sum(colSums(vlcCpu60OH[,8:11])))
vlc_cpu[nrow(vlc_cpu) + 1,] = list("75","base_time", sum(colSums(vlcCpu75[,8:11]))/sum(colSums(vlcCpu75[,12:15])) * 100, sum(colSums(vlcCpu75[,8:11])))
vlc_cpu[nrow(vlc_cpu) + 1,] = list("75","monitored", sum(colSums(vlcCpu75OH[,8:11]))/sum(colSums(vlcCpu75OH[,12:15])) * 100, sum(colSums(vlcCpu75OH[,8:11])))
vlc_cpu[nrow(vlc_cpu) + 1,] = list("90","base_time", sum(colSums(vlcCpu90[,8:11]))/sum(colSums(vlcCpu90[,12:15])) * 100, sum(colSums(vlcCpu90[,8:11])))
vlc_cpu[nrow(vlc_cpu) + 1,] = list("90","monitored", sum(colSums(vlcCpu90OH[,8:11]))/sum(colSums(vlcCpu90OH[,12:15])) * 100, sum(colSums(vlcCpu90OH[,8:11])))


p0 <- ggplot(data=adobe_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  geom_point(size = 3) +
  ggtitle("Adobe Reader DC") +
  ylab("Slow operations [%]") + xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

legend <- get_legend(p0 + theme(legend.position = "top",legend.text=element_text(size=27)))
p0<- p0 + theme(legend.position="none")  

p1 <- ggplot(data=notepad_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Notepad++") +
  geom_point(size = 3) +
  xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p2 <- ggplot(data=paint_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Paint.NET") +
  geom_point(size = 3) + xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p3 <- ggplot(data=vlc_cpu, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("VLC Media Player") +
  geom_point(size = 3) + xlab("CPU Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p<-plot_grid(p0,p1,p2,p3, ncol=4)
png(file = "contextAppsCPUslow.png",width = 1500,height = 600)
plot(plot_grid(p, legend, ncol = 1, rel_heights = c(1,0.1)))
dev.off()

######################

adobe_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
adobe_ram[nrow(adobe_ram) + 1,] = list("0","base_time", 0, 0)
adobe_ram[nrow(adobe_ram) + 1,] = list("0","monitored", sum(colSums(adobeBase[,8:11]))/sum(colSums(adobeBase[,12:15])) * 100, sum(colSums(adobeBase[,8:11])))
adobe_ram[nrow(adobe_ram) + 1,] = list("60","base_time", sum(colSums(adobeRam60[,8:11]))/sum(colSums(adobeRam60[,12:15])) * 100, sum(colSums(adobeRam60[,8:11])))
adobe_ram[nrow(adobe_ram) + 1,] = list("60","monitored", sum(colSums(adobeRam60OH[,8:11]))/sum(colSums(adobeRam60OH[,12:15])) * 100, sum(colSums(adobeRam60OH[,8:11])))
adobe_ram[nrow(adobe_ram) + 1,] = list("75","base_time", sum(colSums(adobeRam75[,8:11]))/sum(colSums(adobeRam75[,12:15])) * 100, sum(colSums(adobeRam75[,8:11])))
adobe_ram[nrow(adobe_ram) + 1,] = list("75","monitored", sum(colSums(adobeRam75OH[,8:11]))/sum(colSums(adobeRam75OH[,12:15])) * 100, sum(colSums(adobeRam75OH[,8:11])))
adobe_ram[nrow(adobe_ram) + 1,] = list("90","base_time", sum(colSums(adobeRam90[,8:11]))/sum(colSums(adobeRam90[,12:15])) * 100, sum(colSums(adobeRam90[,8:11])))
adobe_ram[nrow(adobe_ram) + 1,] = list("90","monitored", sum(colSums(adobeRam90OH[,8:11]))/sum(colSums(adobeRam90OH[,12:15])) * 100, sum(colSums(adobeRam90OH[,8:11])))

notepad_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
notepad_ram[nrow(notepad_ram) + 1,] = list("0","base_time", 0, 0)
notepad_ram[nrow(notepad_ram) + 1,] = list("0","monitored", sum(colSums(notepadBase[,8:11]))/sum(colSums(notepadBase[,12:15])) * 100, sum(colSums(notepadBase[,8:11])))
notepad_ram[nrow(notepad_ram) + 1,] = list("60","base_time", sum(colSums(notepadRam60[,8:11]))/sum(colSums(notepadRam60[,12:15])) * 100, sum(colSums(notepadRam60[,8:11])))
notepad_ram[nrow(notepad_ram) + 1,] = list("60","monitored", sum(colSums(notepadRam60OH[,8:11]))/sum(colSums(notepadRam60OH[,12:15])) * 100, sum(colSums(notepadRam60OH[,8:11])))
notepad_ram[nrow(notepad_ram) + 1,] = list("75","base_time", sum(colSums(notepadRam75[,8:11]))/sum(colSums(notepadRam75[,12:15])) * 100, sum(colSums(notepadRam75[,8:11])))
notepad_ram[nrow(notepad_ram) + 1,] = list("75","monitored", sum(colSums(notepadRam75OH[,8:11]))/sum(colSums(notepadRam75OH[,12:15])) * 100, sum(colSums(notepadRam75OH[,8:11])))
notepad_ram[nrow(notepad_ram) + 1,] = list("90","base_time", sum(colSums(notepadRam90[,8:11]))/sum(colSums(notepadRam90[,12:15])) * 100, sum(colSums(notepadRam90[,8:11])))
notepad_ram[nrow(notepad_ram) + 1,] = list("90","monitored", sum(colSums(notepadRam90OH[,8:11]))/sum(colSums(notepadRam90OH[,12:15])) * 100, sum(colSums(notepadRam90OH[,8:11])))

paint_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
paint_ram[nrow(paint_ram) + 1,] = list("0","base_time", 0, 0)
paint_ram[nrow(paint_ram) + 1,] = list("0","monitored", sum(colSums(paintBase[,8:11]))/sum(colSums(paintBase[,12:15])) * 100, sum(colSums(paintBase[,8:11])))
paint_ram[nrow(paint_ram) + 1,] = list("60","base_time", sum(colSums(paintRam60[,8:11]))/sum(colSums(paintRam60[,12:15])) * 100, sum(colSums(paintRam60[,8:11])))
paint_ram[nrow(paint_ram) + 1,] = list("60","monitored", sum(colSums(paintRam60OH[,8:11]))/sum(colSums(paintRam60OH[,12:15])) * 100, sum(colSums(paintRam60OH[,8:11])))
paint_ram[nrow(paint_ram) + 1,] = list("75","base_time", sum(colSums(paintRam75[,8:11]))/sum(colSums(paintRam75[,12:15])) * 100, sum(colSums(paintRam75[,8:11])))
paint_ram[nrow(paint_ram) + 1,] = list("75","monitored", sum(colSums(paintRam75OH[,8:11]))/sum(colSums(paintRam75OH[,12:15])) * 100, sum(colSums(paintRam75OH[,8:11])))
paint_ram[nrow(paint_ram) + 1,] = list("90","base_time", sum(colSums(paintRam90[,8:11]))/sum(colSums(paintRam90[,12:15])) * 100, sum(colSums(paintRam90[,8:11])))
paint_ram[nrow(paint_ram) + 1,] = list("90","monitored", sum(colSums(paintRam90OH[,8:11]))/sum(colSums(paintRam90OH[,12:15])) * 100, sum(colSums(paintRam90OH[,8:11])))

vlc_ram  <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("load", "type", "percentageSlowActions", "slowActions"))
vlc_ram[nrow(vlc_ram) + 1,] = list("0","base_time", 0, 0)
vlc_ram[nrow(vlc_ram) + 1,] = list("0","monitored", sum(colSums(vlcBase[,8:11]))/sum(colSums(vlcBase[,12:15])) * 100, sum(colSums(vlcBase[,8:11])))
vlc_ram[nrow(vlc_ram) + 1,] = list("60","base_time", sum(colSums(vlcRam60[,8:11]))/sum(colSums(vlcRam60[,12:15])) * 100, sum(colSums(vlcRam60[,8:11])))
vlc_ram[nrow(vlc_ram) + 1,] = list("60","monitored", sum(colSums(vlcRam60OH[,8:11]))/sum(colSums(vlcRam60OH[,12:15])) * 100, sum(colSums(vlcRam60OH[,8:11])))
vlc_ram[nrow(vlc_ram) + 1,] = list("75","base_time", sum(colSums(vlcRam75[,8:11]))/sum(colSums(vlcRam75[,12:15])) * 100, sum(colSums(vlcRam75[,8:11])))
vlc_ram[nrow(vlc_ram) + 1,] = list("75","monitored", sum(colSums(vlcRam75OH[,8:11]))/sum(colSums(vlcRam75OH[,12:15])) * 100, sum(colSums(vlcRam75OH[,8:11])))
vlc_ram[nrow(vlc_ram) + 1,] = list("90","base_time", sum(colSums(vlcRam90[,8:11]))/sum(colSums(vlcRam90[,12:15])) * 100, sum(colSums(vlcRam90[,8:11])))
vlc_ram[nrow(vlc_ram) + 1,] = list("90","monitored", sum(colSums(vlcRam90OH[,8:11]))/sum(colSums(vlcRam90OH[,12:15])) * 100, sum(colSums(vlcRam90OH[,8:11])))


p0 <- ggplot(data=adobe_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  geom_point(size = 3) +
  ggtitle("Adobe Reader DC") +
  ylab("Slow operations [%]") + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

legend <- get_legend(p0 + theme(legend.position = "top",legend.text=element_text(size=27)))
p0<- p0 + theme(legend.position="none")  

p1 <- ggplot(data=notepad_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Notepad++") +
  geom_point(size = 3) +
  xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p2 <- ggplot(data=paint_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("Paint.NET") +
  geom_point(size = 3) + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p3 <- ggplot(data=vlc_ram, aes(x=load, y=percentageSlowActions, group=type, colour=type)) + 
  geom_line(size = 2) +
  ggtitle("VLC Media Player") +
  geom_point(size = 3) + xlab("RAM Load [%]") +
  theme_bw(base_size=text_size) +
  theme(legend.position="none",axis.title.y=element_blank()) +
  scale_colour_manual(values=cbPalette,breaks=c("base_time", "monitored"),
                      labels=c("Non-monitored", "monitored"),name = "Instrumentation") +
  scale_y_continuous(breaks=seq(0,100,10),limits = c(0, 100))

p<-plot_grid(p0,p1,p2,p3, ncol=4)
png(file = "contextAppsRAMslow.png",width = 1500,height = 600)
plot(plot_grid(p, legend, ncol = 1, rel_heights = c(1,0.1)))
dev.off()
