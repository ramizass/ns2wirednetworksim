Tcl Steps
1. Open a new tcl file with the gedit command. For example, the file name is simulation.tcl
#gedit simulation.tcl

2. On the top line of the file, define the simulator name. In this exercise the name is ns
#Create a Simulator
set ns [new Simulator]

3. Create variable trace objects, namely traceku which will be used as an output .tr file with the name out1.tr, and NAMku which will be used as an output .nam file with the name out1.nam. The names of the object variables and output files are up to you.
#Create trace object
set traceku [open out1.tr w]
$ns trace-all $traceku

#Create a NAM trace file
set NAMku [open out1.nam w]
$ns namtrace-all $NAMku

4. Define the "finish" procedure for ending the simulation
#Define a finish procedure
proc finish {} {
  global ns traceku NAMku
  $ns flush-trace
  close $traceku
  close $NAMku
  puts "running nam..."
  exec nam out1.nam &
  exit 0
}

5. Generate the nodes
#Create nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

6. Connect each node with a duplex link or simplex link with the bandwidth and delay specified in the scenario.
#Connect each node with duplex link
$ns duplex-link $n0 $n2 1Mb 5ms DropTail
$ns duplex-link $n1 $n2 1Mb 5ms DropTail
$ns duplex-link $n2 $n4 5Mb 10ms DropTail
$ns duplex-link $n2 $n3 5Mb 10ms DropTail
$ns simplex-link $n3 $n4 0.5Mb 15ms DropTail
$ns queue-limit $n2 $n3 4

7. Use the UDP protocol for node paths n0 to n3, where n0 is the origin of the UDP flow and n3 is the end (null) of the UDP
#Create a UDP flow from n0 to n3
set udp [new Agent/UDP]
$ns attach-agent $n0 $udp
set null [new Agent/Null]
$ns attach-agent $n3 $null
$ns connect $udp $null
$udp set fid_ 1

8. Place the CBR application on top of the UDP path. The packet size is 500 bytes and the interval between packets is 0.005 ms.
#Attach CBR source to the UDP flow
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set packetSize_ 500
$cbr set interval_ 0.005

9. Use the TCP protocol for node paths n1 to n4, where n1 is the origin of the TCP flow and n4 is the end of TCP (as TCPSink).
#Create a TCP flow from n1 to n4
set tcp [new Agent/TCP]
$ns attach-agent $n1 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink
$ns connect $tcp $sink
$tcp set fid_ 2

10. Place the FTP packet over the TCP path.
#Attach FTP source to the TCP flow
set ftp [new Application/FTP]
$ftp attach-agent $tcp

11. Create an event scheduler, where at t=0.5 the ftp packet is activated and stopped at t=4.5. Meanwhile at t=2 the CBR packet is activated and stopped at t=5.
#Schedule Events
$ns at 0.5 "$ftp start"
$ns at 2.0 "$cbr start"
$ns at 4.5 "$ftp stop"
$ns at 5.0 "$cbr stop"

12. Output to the CLI editor the size of the packets and the interval between packets
#Put the information to the CLI editor
puts [$cbr set packetSize_]
puts [$cbr set interval_]

13. End the simulation process
$ns at 6.0 "finish"
$ns run

14. After all the syntax is written, save it. In the directory where simulation.tcl is located, compile the file by typing:
$ ns fileku.tcl
