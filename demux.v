module demux(i,e,s1,s2,a,b,c,d);
input i,e,s1,s2;
output a,b,c,d;
assign a = i & e & ~(s1) & ~(s2);
assign b = i & e & ~(s1) & (s2);
assign c = i & e & (a) & ~(b);
assign d = i & e & a & b;
endmodule

module test;
reg i,e,s1,s2;
wire a,b,c,d;
demux m1(i,e,s1,s2,a,b,c,d);
initial begin
    $dumpfile("seventh.vcd");
    $dumpvars(0,test);
    $display("i \t e \t s1 \t s2 \t a \t b \t c \t d");
    $monitor("%b \t %b \t %b \t %b \t %b \t %b \t %b \t %b",i,e,s1,s2,a,b,c,d);
    i=0;e=0;s1=0;s2=0;
    #10;
    i=0;e=0;s1=0;s2=1;
    #10;
    i=0;e=0;s1=1;s2=0;
    #10;
    i=0;e=0;s1=1;s2=1;
    #10;
    i=0;e=1;s1=0;s2=0;
    #10;
    i=0;e=1;s1=0;s2=1;
    #10;
    i=0;e=1;s1=1;s2=0;
    #10;
    i=0;e=1;s1=1;s2=1;
    #10;
    i=1;e=0;s1=0;s2=0;
    #10;
    i=1;e=0;s1=0;s2=1;
    #10;
    i=1;e=0;s1=1;s2=0;
    #10;
    i=1;e=0;s1=1;s2=1;
    #10;
    i=1;e=0;s1=1;s2=1;
    #10;
    i=1;e=1;s1=0;s2=0;
    #10;
    i=1;e=1;s1=0;s2=1;
    #10;
    i=1;e=1;s1=1;s2=0;
    #10;
    i=1;e=1;s1=1;s2=1;
    #10;
    $finish;
end

endmodule