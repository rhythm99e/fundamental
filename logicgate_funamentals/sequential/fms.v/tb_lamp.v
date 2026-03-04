`timescale 10ms/1ms
module tb_lamp;
reg clock;//use of reg because we need to store the value.(memory like concept)
wire [2:0] light;//we are simply connectig the output of the lamp
always #5 clock=~clock;//we are changing the value in 50ms
lamp l1(clock,light);
initial begin
    clock=1'b0;//initialize but chance of conflict with always block
  #100 $finish;//after 100ms we will stop the simulation
end
initial begin
    $dumpfile("tb_lamp.vcd");
    $dumpvars(0,tb_lamp);
    $monitor($time,"light=%b",light);
end
endmodule
