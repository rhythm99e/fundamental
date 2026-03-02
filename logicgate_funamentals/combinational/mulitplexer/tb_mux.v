`timescale 10ms/1ms
module tb_mux;
reg [15:0]in;
reg [3:0]sel;
wire out;
mux16to1 m1(.in(in),.sel(sel),.out(out));
initial begin
    $dumpfile("tb_mux.vcd");
    $dumpvars(0,tb_mux);
    $monitor($time,"in=%h,sel=%h,out=%b",in,sel,out);//easy to look at the status of select line
    #5 in=16'h2401;sel=4'h 0;
    #5 sel=4'h6;
    #5 sel=4'h8;
    $finish;
end
endmodule
