module mux2to1( i, s, o); //defining in the structural level
input [1:0] i;
input s;
output o;
wire t0,t1,ns;
not n1(ns,s);
and ao(t0,i[0],ns);
and a1(t1,i[1],s);
or O1(o,t0,t1);
endmodule
module mux4to1(input [3:0]i,input [1:0]s,output o);
wire [1:0]t;
mux2to1 mux0(.i(i[1:0]),.s(s[0]),.o(t[0]));
mux2to1 mux1(.i(i[3:2]),.s(s[0]),.o(t[1]));
mux2to1 mux2(.i(t[1:0]),.s(s[1]),.o(o));
endmodule

module mux16to1(input [15:0]in,input [3:0]sel,output out);//describing in the behavioral level
wire [3:0]t;
mux4to1 mux0(.i(in[3:0]),.s(sel[1:0]),.o(t[0]));
mux4to1 mux1(.i(in[7:4]),.s(sel[1:0]),.o(t[1]));
mux4to1 mux2(.i(in[11:8]),.s(sel[1:0]),.o(t[2]));
mux4to1 mux3(.i(in[15:12]),.s(sel[1:0]),.o(t[3]));
mux4to1 mux4(.i(t[3:0]),.s(sel[3:2]),.o(out));
endmodule