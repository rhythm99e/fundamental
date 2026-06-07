module sign_extend (
    input  [31:0] instruction,
    input  [1:0]  imm_sel,
    output reg [31:0] imm_ext
);

    always @(*) begin
        case (imm_sel)

            2'b00: // I-type
                // immediate is instruction[31:20]
                // sign bit is instruction[31]
                // extend sign bit to fill upper 20 bits
                imm_ext = {{20{instruction[31]}}, instruction[31:20]};

            2'b01: // S-type
                // immediate split: [11:5] in inst[31:25], [4:0] in inst[11:7]
                // reassemble then sign extend
                imm_ext = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};

            2'b10: // B-type
                // most scrambled
                // imm[12]   = inst[31]
                // imm[11]   = inst[7]
                // imm[10:5] = inst[30:25]
                // imm[4:1]  = inst[11:8]
                // imm[0]    = always 0 (branches are 2-byte aligned)
                imm_ext = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};

            2'b11: // J-type
                // imm[20]    = inst[31]
                // imm[19:12] = inst[19:12]
                // imm[11]    = inst[20]
                // imm[10:1]  = inst[30:21]
                // imm[0]     = always 0 (jumps are 2-byte aligned)
                imm_ext = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};

            default:
                imm_ext = 32'b0;

        endcase
    end

endmodule