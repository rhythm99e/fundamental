module alu(input [31:0] a,
   input [31:0] b,
   input [3:0] alucommand,
   output reg [31:0] result,
   output  zero);

localparam AND =4'b0000;
localparam OR =4'b0001;
localparam XOR =4'b0010;
localparam ADD =4'b0100;
localparam SUB =4'b0101;
localparam SLT =4'b0110;
localparam SLL =4'b0111;
localparam SRL =4'b1000;
localparam SRA =4'b1001;

assign zero = (result == 32'b0000);
always @(*) begin
    case (alucommand)
        AND : result =a&b;
        OR : result =a|b;
        XOR : result =a^b;
        ADD : result =a+b;
        SUB : result =a-b;
        SLT : result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;//signed
        SLL : result =a<<b[4:0];
        SRL : result =a>>b[4:0];
        SRA : result =$signed(a)>>>b[4:0];
        default : result =32'b0000;
    endcase
end 
endmodule

