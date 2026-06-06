module controlunit(
    input [6:0] opcode,
    output reg regwrite,
    output reg memtoreg,
    output reg memread,
    output reg alusrc,
    output reg branch,
    output reg jump,
    output reg memwrite,
    output reg [1:0] aluop
);
//defing the control signals based on opcode
localparam R_TYPE = 7'b0110011,
           I_TYPE = 7'b0010011,
           LOAD   = 7'b0000011,
           STORE  = 7'b0100011,
           BRANCH = 7'b1100011,
           JAL    = 7'b1101111;
always @(*)begin
    regwrite = 0;
    memtoreg = 0;
    memread = 0;
    alusrc = 0;
    branch = 0;
    jump = 0;
    aluop = 2'b00;
    memwrite = 0;
    case(opcode)
        R_TYPE: begin
            regwrite=1;
            aluop=2'b10;
            alusrc=0;
        end
        I_TYPE: begin
            regwrite=1;
            aluop=2'b10;
            alusrc=1;
        end
        LOAD: begin
            regwrite=1;
            memtoreg=1;
            memread=1;
            alusrc=1;
            aluop=2'b00;
        end
        STORE:begin
            alusrc=1;
            aluop=2'b00;
            memwrite=1;
        end
        BRANCH:begin
            branch=1;
            aluop=2'b01;
        end
        JAL:begin
            regwrite=1;
            jump=1;
            alusrc=1;
            aluop=2'b00;
        end
        default: begin
        end
    endcase
end 
endmodule