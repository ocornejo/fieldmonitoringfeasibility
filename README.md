This folder contains the samples of the experiment "In-The-Field Monitoring of Functional Calls: Is It Feasible?"

In particular, we provide the time samples collected for the four applications of our experiment (e.g., Adobe Reader DC, Notepad++, Paint.NET and VLC Media Player). All the time samples are measured in seconds.

Each sample file contained in this repository have 7 columns, the column "action" indicates the type of action being executed in the test, the column "non-instrumented" indicates the non instrumented measured time, then the columns from "t1" to "t5" indicate the execution time of the action during the 5 replications of the test case.

We place inside of each application folder the following the set of csv files:

base: 		execution times without context saturation, w and w/o monitoring

60_cpu: 	execution times with CPU context saturation (60%), w/o monitoring

60_cpu_oh:	execution times with CPU context saturation (60%), w monitoring

75_cpu:		execution times with CPU context saturation (75%), w/o monitoring

75_cpu_oh:	execution times with CPU context saturation (75%), w monitoring

90_cpu:		execution times with CPU context saturation (90%), w/o monitoring

90_cpu_oh:	execution times with CPU context saturation (90%), w monitoring 

60_ram: 	execution times with RAM context saturation (60%), w/o monitoring

60_ram_oh:	execution times with RAM context saturation (60%), w monitoring

75_ram:		execution times with RAM context saturation (75%), w/o monitoring

75_ram_oh:	execution times with RAM context saturation (75%), w monitoring

90_ram:		execution times with RAM context saturation (90%), w/o monitoring

90_ram_oh:	execution times with RAM context saturation (90%), w monitoring 

For further information, please contact us to oscar.cornejo@disco.unimib.it