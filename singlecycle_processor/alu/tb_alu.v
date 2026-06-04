`timescale 1ns/1ps
module tb_alu;
//first we have to define the inputsa and output . we define the inputs as reg caues we need to store those right
// we need to define the output as wire because they are constantly driven
reg[31:0] a,b;
reg[3:0] alucontrol;
wire[31:0] result;
wire zero;
//now we instantiate the alu. we are basically supplying the signals to see if it performs well or not
alu dut(
.a(a),
.b(b),
.alucommand(alucontrol),
.result(result),
.zero(zero)
);//basically i am creting a copy of alu i defined as dut now this will come to work here 
localparam AND =4'b0000;
localparam OR =4'b0001;
localparam XOR =4'b0010;
localparam ADD =4'b0100;
localparam SUB =4'b0101;
localparam SLT =4'b0110;
localparam SLL =4'b0111;
localparam SRL =4'b1000;
localparam SRA =4'b1001;
initial begin// this is the start of time ig
$dumpfile("tb_alu.vcd");// this is the file where we will see the output of the testbench
$dumpvars(0,tb_alu);// any chnages in the tb_aly will be dumped
 a= 32'd10; b = 32'd5; alucontrol = ADD; #10;//this 10 means 10ns delay after 10ps next line will execute. but if i have anohter initial begin and ther the code will execute in parallel to this one
$display("ADD: %d+%d=%d, ZERO=%b",a,b,result,zero);
    a = 32'd10; b = 32'd5; alucontrol = SUB; #10;
$display("SUB: %d-%d=%d, ZERO=%b",a,b,result,zero);
    a = 32'd10; b = 32'd5; alucontrol = AND; #10;
$display("AND: %d&%d=%d, ZERO=%b",a,b,result,zero);
    a = 32'd10; b = 32'd5; alucontrol = OR; #10;
$display("OR: %d|%d=%d, ZERO=%b",a,b,result,zero);
    a = 32'd10; b = 32'd5; alucontrol = XOR; #10;
$display("XOR: %d^%d=%d, ZERO=%b",a ,b,result,zero);
    a = 32'd10; b = 32'd5; alucontrol = SLT; #10;
$display("SLT: %d<%d=%d, ZERO=%b",a,b,result,zero);
$finish;
end
endmodule