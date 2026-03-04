module lamp(clock,light);
input clock;
output reg [2:0] light;
parameter RED=3'b000,YELLOW=3'b001,GREEN=3'b010;
parameter c0=2'b00,c1=2'b01,c2=2'b10;
 reg [1:0]state;
always @(posedge clock)
case(state)
c0:begin
    light<=RED; 
    state<=c1;
end
c1:begin
    light<=YELLOW;
    state<=c2;
end
c2:begin
    light<=GREEN;
    state<=c0;
end
default:begin
    light<=RED;
    state<=c1;
end
endcase
endmodule
