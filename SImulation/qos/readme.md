# How to use this file
for using awk, file dont use superuser.

awk rules: $ awk '{awk script}' source_file >> destination_file

we can use awk for parsing the output file, for example:
It is desired to only take time data ($2) and packet size ($6) on data from node 2 ($3==2) to node 4 ($4==4) in the condition that data is received ($1=”r”). The AWK syntax is as follows:

$ awk ‘{if(($3==2)&&($4==4)&&($1==”r”))print $2,$6}’ out1.tr >>outc.txt

To analyze the quality of the network that has been designed, there are several parameters that can be used:
1. Jitter
2. Throughput
3. Delay

Example: awk file to calculate accumulated throughput (open the throughput.awk)
Apply the file to the outc.txt file with the command below and save it in File1.

$ awk -f throughput.awk outc.txt>>File1

