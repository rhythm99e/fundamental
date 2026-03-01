## BASIC LOGIC GATE IMPLEMENTATION IN VERILOG

Implementation of fundamental digital logic using Verilog hdl 

## overview
This project implements basic gates in Verilog i.e(AND,OR,NOT,XOR,NAND) using behavioral modeling(where we are concerned with the behavior of circuit only). All the gates were verified using testbench and waveform analysis.
 
## features
* contains 5 basic gates 
* contains waveform of those gates when supplied with various logic levels

## FILE STRUCTURE
 * basicgates.v #contains the modeling of gate
 * tb_allgates.v #contains the testbench used to verify
 * tb_allgates.vcd #contains the waveform of output

## compilation and simulation 
* to compilr iverilog -0 simulate gates.v tb_allgates.v
* to run vvp simulate
* to see waveform  gtkwave tb_allgtes.vcd

## KEY LEARNING 
1. dataflow modeling
we used the assign . this will only work when the data type on the left hand is of net type
when use assign the output is constantly updated on the basis of change in the input
2. Verilog operaors
bitwise operators were use such as &,^,| . they work with individual bits and product the logic result.
in this project they were use to model the gates
3. testbench design
testbench is used to provide the circuit with the number of inputs to test agains. 
we used type reg for a and b so that they will hold the value(make them work as memory for this project)
there are no_ports in the testbench as this is not connected with any input and output. it creates its own signal

## challenges and solutions
Verilog provides these basic gates by default but for the sake of learning we made our own.

## AUTHOR
Ridam katwal 
student,Elecronics and communication Engineering
pulchowk campus, Tribhuvan University
Nepal

continue the journey
