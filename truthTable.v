module m1(A,B,C,D,E,F,G,H,I);
    input A,B;
    output C,D,E,F,G,H,I;
    assign C = (A & B);
    assign D = (A | B);
    assign E = (A ^ B);
    assign F = ~(A & B);
    assign G = ~(A | B);
    assign H = ~(A ^ B);
    assign I = ~A;
endmodule

module test;
reg A,B;
wire c,d,e,f,g,h,i;
m1 g1(A,B,c,d,e,f,g,h,i);
initial begin;
$dumpfile("first.vcd");
$dumpvars(0,test);
$display("A \t B \t AND \t OR \t XOR \t NAND \t NOR \t XNOR \t NOT");
$monitor("%b \t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b",A,B,c,d,e,f,g,h,i);
A = 0;B=0;
#10; A = 0 ; B=1;
#10; A = 1 ; B=0;
#10; A = 1 ; B=1;
#10;
$finish;
end
endmodule