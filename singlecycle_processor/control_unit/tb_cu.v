`timescale 1ns/1ps
module tb_cu;
reg [6:0] opcode;
wire regwrite;
wire memwrite;
wire memread;
wire memtoreg;
wire branch;
wire jump;
wire [1:0] aluop;
wire alusrc;
controlunit cu(
    .opcode(opcode),
    .regwrite(regwrite),
    .memwrite(memwrite),
    .memread(memread),
    .memtoreg(memtoreg),
    .branch(branch),
    .jump(jump),
    .aluop(aluop)
);
initial begin 
    $dumpfile("tb_cu.vcd");
    $dumpvars(0,tb_cu);
      $monitor("opcode=%b | RW=%b AS=%b MW=%b MR=%b M2R=%b Br=%b Jmp=%b ALUOp=%b",
            opcode, regwrite, alusrc, memwrite, memread, memtoreg, branch, jump, aluop);// it keeps on running right. it is not like display
            //r type
            opcode=7'b0110011; #10;
            //i type
            opcode=7'b0010011; #10;
            //load
            opcode=7'b0000011; #10;
            //store
            opcode=7'b0100011; #10;
            //branch
            opcode=7'b1100011; #10;
            //jal
            opcode=7'b1101111; #10;
            $finish;
end 
endmodule