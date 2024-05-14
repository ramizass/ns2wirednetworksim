This is a simple simulation to simulate a wired network using NS-2. NS-2 is built from 2 programming languages: libraries with the C++ programming language used for event schedulers, protocols and network components, and Tcl/OTcl which is a programming language for writing simulation scripts. The relationship between simulation input, execution process and simulation output with the two programming languages mentioned above is shown in the body of NS-2

![image](https://github.com/ramizass/ns2wirednetworksim/assets/88464165/aa01af61-05c8-4793-ba9d-e47f350a55e6)

**NS-2 components**
1. NS as a simulator
2. NAM, as a network animator, is tasked with visualizing the output of NS-2. The NAM editor is a GUI interface which is called as a file with the extension .nam in the Tcl scripts.
3. Pre-processing, responsible for generating traffic and network topology
4. Post-processing, in the form of analysis of simulation results displayed in the .tr file where some of the simulation results can be filtered using the awk command and can be converted into graphic form with the XGraph tool. A detailed explanation for filtering simulation data is at the end of the practical instructions.

**Steps in Building a Simulation with NS-2**
1. Create a simulator object and event scheduler using TCL programming
2. Create a network topology
3. Define traffic patterns
4. Define the trace file
5. Manage the course of simulation scenarios, traffic flow, traces and other events.
6. Process the trace file data into data that is ready to be plotted and to facilitate analysis

**Simulation Scenario**
![image](https://github.com/ramizass/ns2wirednetworksim/assets/88464165/ba572aaa-6b82-4e38-b3d3-dbf3a9a16187)
1. A wired network consists of 4 nodes (n0, n1, n2 and n3).
2. The path between n0 and n2 is duplex with a bandwidth of 100 Mbps, a delay of 5 ms and a DropTail type queue.
3. The same applies to the path from n1 to n2.
4. Between n2 and n4, a duplex line is built with a bandwidth of 54 Mbps, a delay of 10 ms and a DropTail queue, as well as from n2 and n3.
5. Meanwhile between n3 and n4 there is a simplex line with a bandwidth of 10 Mbps and a delay of 15 ms.
6. The CBR application package will be streamed from node n0 to n3 via UDP protocol with node n3 being the Null agent.
7. Meanwhile, FTP packets are streamed from node n1 to n4 via the TCP protocol, with node n4 being TCPSink.
8. The simulation runs for 6 seconds. At 0.5 seconds the ftp packet starts sending and ends at 4.5 seconds.
9. In the 2nd second the CBR packet is sent and ends in the 5th second.


