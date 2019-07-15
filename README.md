# Repository data - JSS Paper

This repository contains the samples of the experiment "In-The-Field Monitoring of Functional Calls: Is It Feasible?"

We provide the time samples collected for the four applications of our experiment (e.g., Adobe Reader DC, Notepad++, Paint.NET and VLC Media Player). All the time samples are measured in seconds.

Each sample file have 7 columns:

* the column *action* indicates the type of action being executed in the test
* the column *base_time* indicates the **mean** measured time for the application without any monitoring nor resource saturation. 
* the columns from *exec_time_iteration_1* to *exec_time_iteration_5* indicate the execution time of the action during the 5 replications of the test case for the particular treatment.

Note that each file corresponds to a certain treatment (e.g., monitoring or resource saturation).
Each application folder contains the following the set of csv files:

* base:				execution times without context saturation nor monitoring
* no_saturation: 	execution times without context saturation, with and without monitoring
* 60_cpu: 			execution times with CPU context saturation (60%), without monitoring
* 60_cpu_oh:		execution times with CPU context saturation (60%), with monitoring
* 75_cpu:			execution times with CPU context saturation (75%), without monitoring
* 75_cpu_oh:		execution times with CPU context saturation (75%), with monitoring
* 90_cpu:			execution times with CPU context saturation (90%), without monitoring
* 90_cpu_oh:		execution times with CPU context saturation (90%), with monitoring 
* 60_ram: 			execution times with RAM context saturation (60%), without monitoring
* 60_ram_oh:		execution times with RAM context saturation (60%), with monitoring
* 75_ram:			execution times with RAM context saturation (75%), without monitoring
* 75_ram_oh:		execution times with RAM context saturation (75%), with monitoring
* 90_ram:			execution times with RAM context saturation (90%), without monitoring
* 90_ram_oh:		execution times with RAM context saturation (90%), with monitoring 

## Human subject studies measures

For human subject studies we report for each application the times we measured during the video recording process.
The files called *no_saturation_video.csv* contain 3 columns:

* the column *action* indicates the type of action
* the column *base_time* indicates the **mean** measured time for the application without any monitoring. 
* the column *exec_time_iteration_1* indicates the execution time of the action during the test case under monitoring.

We also include the *hss_slow_srt.csv* file that indicates if each action of the video is slow or not. 
Finally, we incorporate the file *hss_measures.csv* that shows the answers of the participants of the human subject studies. Particularly, this file contains 5 columns:

* the identifier of the participant
* the identifier of the action 
* the SRT category of the action
* the overhead range of the actions
* the answer of the participant (0-expected, 1-slow)

## Failing executions

For the experimentation with failing executions we report the timing measures for Adobe Reader DC and Notepad++ applications.
The files called *no_saturation_faulty.csv* contain 7 columns:

* the column *action* indicates the type of action being executed in the test
* the column *base_time* indicates the **mean** measured time for the application without any monitoring nor fault injection. 
* the columns from *exec_time_iteration_1* to *exec_time_iteration_5* indicate the execution time of the action during the 5 replications of the test case with monitoring and the fault injection.

## R scripts 

For graphs and tables replication, we also included the R scripts. In this repository are available:

* Fig1-4.R: Figures 1, 2, 3 and 4 (overhead distribution and slow actions).
* Fig5.R: Figure 5 (failing executions)
* Fig6&9_Kruskal.R: Figures 6 and 9 (boxplots) with their statistical analysis
* Fig7&8&10&11.R: Figures 7, 8, 10 and 11.
* Fig12.R: Figure 12 (hss experiment)
* Table1.R: Table from RQ1

For further information, please contact us to oscar.cornejo@unimib.it
