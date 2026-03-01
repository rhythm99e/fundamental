//modeling all the basic gates
module not_gate(input a,output o);
assign o=~a;
endmodule
module and_gate(input a,b, output o);
assign o=a&b;
endmodule
module or_gate(input a,b, output o);
assign o=a|b;
endmodule
module xor_gate(input a,b , output o);
assign o=a^b;
endmodule
module nand_gate(input a,b, output o);
assign o=~(a&b);
endmodule