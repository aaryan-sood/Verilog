module decoder(x,a,b,c,d,e,f);
input x,a,b;
output c,d,e,f;
assign c = (x & a & b);
assign d = (x & a & ~(b));
assign e = (x & ~(a) & b);
assign f = (x & ~(a) & ~(b));
endmodule

module test;
reg x,a,b;
wire c,d,e,f;
decoder m1(x,a,b,c,d,e,f);
initial begin
    $dumpfile("eight.vcd");
    $dumpvars(0,test);
    $display("x \t a \t b \t c \t d \t e \t f");
    $monitor("%b \t %b \t %b \t %b \t %b \t %b \t %b",x,a,b,c,d,e,f);
    x=0;a=0;b=0;
    #10;
    x=1;a=0;b=0;
    #10;
    x=1;a=0;b=1;
    #10;
    x=1;a=1;b=0;
    #10;
    x=1;a=1;b=1;
    #10;
    $finish;
end
endmodule