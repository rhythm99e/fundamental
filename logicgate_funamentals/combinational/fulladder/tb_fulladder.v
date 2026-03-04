`timescale 10ms/1ms
module tb_fulladder;
reg a,b,c;
wire sum,carry;
fulladder f1(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
initial begin
    $dumpfile("tb_fulladder.vcd");
    $dumpvars(0,tb_fulladder);
    $monitor($time,"a=%b,b=%b,c=%c,sum=%b,carry=%b",a,b,c,sum,carry);
    #5 a=0;b=0;c=0;
    #5 a=1;b=0;c=0;
    #5 a=1;b=1;c=0;
    #5;
    $finish;
end 
endmodule

