module regfile(
    input clk,
    input regwrite,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,
    output [31:0]read_data1,
    output [31:0]read_data2
); 
reg [31:0] register[31:0];
//we have to initialize the reg to zero just at the beginning of the simulation
integer i;
initial begin
for(i=0; i<32; i++)
 begin
    register[i] = 32'b0;
end
end
assign read_data1 = (rs1 == 0) ? 32'b0 : register[rs1];
assign read_data2 = (rs2 == 0) ? 32'b0 : register[rs2];
// to write we need the synchronous. why cause we need a way to communicate when one task is complet. we assuem the worst case 
always @(posedge clk)begin
    if(regwrite&&(rd!=0)) begin
        register[rd] <= write_data;
    end
end
endmodule