module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
//creating intermediate variables
wire p,z;
assign p=a^b;
assign z=a&b;
assign sum=p^c;
assign carry=z|p&c;
endmodule