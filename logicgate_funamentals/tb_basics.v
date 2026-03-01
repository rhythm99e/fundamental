`timescale 1ns/1ps
module tb_allgates;
reg a,b;//these works as memory and will be used to give input
wire not_a,and_ab,or_ab,xor_ab,nand_ab ;//these are of tye net and will be constantly updated.
//instantiating the gates
and_gate g1(.a(a),.b(b),.o(and_ab));
or_gate g2(.a(a),.b(b),.o(or_ab));
xor_gate g3(.a(a),.b(b),.o(xor_ab));
nand_gate g4(.a(a),.b(b),.o(nand_ab));
not_gate g5(.a(a),.o(not_a));

initial begin // this will make the following exicute in sequence
$dumpfile("tb_allgates.vcd");//this will create a file with the waveform
$dumpvars(0,tb_allgates);//this tells the level of abstraction which is to be shown in the wave if multiple modules were here then multiple will shown 
a=0;b=0; #10;//10 is delay
a=0;b=1; #10;
a=1;b=0; #10;
a=1;b=1; #10;
$finish;
end
endmodule