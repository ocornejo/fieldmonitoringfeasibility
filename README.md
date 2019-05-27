# Repository data - JSS Paper

This repository contains the samples of the experiment "In-The-Field Monitoring of Functional Calls: Is It Feasible?"

We provide the time samples collected for the four applications of our experiment (e.g., Adobe Reader DC, Notepad++, Paint.NET and VLC Media Player). All the time samples are measured in seconds.

Each sample file contained in this repository have 7 columns:

* the column *action* indicates the type of action being executed in the test
* the column *base_time* indicates the measured time for the application without any monitoring nor resource saturation. 
* the columns from *exec_time_iteration_1* to *exec_time_iteration_5* indicate the execution time of the action during the 5 replications of the test case for the particular treatment.

Note that each file corresponds to a certain treatment (e.g., monitoring or resource saturation).
Each application folder contains the following the set of csv files:

* base: 		execution times without context saturation, with and without monitoring
* 60_cpu: 		execution times with CPU context saturation (60%), without monitoring
* 60_cpu_oh:	execution times with CPU context saturation (60%), with monitoring
* 75_cpu:		execution times with CPU context saturation (75%), without monitoring
* 75_cpu_oh:	execution times with CPU context saturation (75%), with monitoring
* 90_cpu:		execution times with CPU context saturation (90%), without monitoring
* 90_cpu_oh:	execution times with CPU context saturation (90%), with monitoring 
* 60_ram: 		execution times with RAM context saturation (60%), without monitoring
* 60_ram_oh:	execution times with RAM context saturation (60%), with monitoring
* 75_ram:		execution times with RAM context saturation (75%), without monitoring
* 75_ram_oh:	execution times with RAM context saturation (75%), with monitoring
* 90_ram:		execution times with RAM context saturation (90%), without monitoring
* 90_ram_oh:	execution times with RAM context saturation (90%), with monitoring 

For further information, please contact us to oscar.cornejo@unimib.it
