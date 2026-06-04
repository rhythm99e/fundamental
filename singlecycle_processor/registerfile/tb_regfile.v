`timescale 1ns / 1ps
module tb_regfile;
reg clk;
reg regwrite;
reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;
reg [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2;
regfile name(
    .clk(clk),
    .regwrite(regwrite),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
initial
clk=0;
always #5 clk =~clk; //clk needs to be outside of the initial because initial is one time and sequential we need clock to be parallel
initial begin
    $dumpfile("regfile.vcd");
    $dumpvars(0,tb_regfile);
    regwrite=0;
     rs1=0;
    rs2=0;
    rd=0;
    write_data=0;
    #10;
    regwrite=1;
    rd=5'b00001;
    write_data=32'd100;
    #10;
    // we wrote in the x1 and now we read
    regwrite=0;
    rs1=5'b00001;
    $display("read_data1=%d",read_data1);
    #10;
    //write to x2 remember we have two output ports
    regwrite=1;
    rd=5'b00010;
    write_data=32'd200;
    #10;
    //read from x2 and x1 we can do this cause we have two output ports
    regwrite=0;
    rs1=5'b00001;
    rs2=5'b00010;
    #1;
    $display("read_data1=%d, read_data2=%d",read_data1, read_data2 );
    $finish;
end 
endmodule


