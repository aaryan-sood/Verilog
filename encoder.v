module encoder(a,b,c,d,x,y);
    input a,b,c,d;
    output x,y;
    assign x = c | d;
    assign y = b | d;
endmodule

module test;
reg a,b,c,d;
wire x,y;
encoder m1(a,b,c,d,x,y);
initial begin
    $dumpfile("ninth.vcd");
    $dumpvars(0,test);
    $display("a \t b \t c \t d \t x \t y");
    $monitor("%b \t %b \t %b \t %b \t %b \t %b",a,b,c,d,x,y);
    a = 1;b=0;c=0;d=0;
    #10;
    a = 0;b=1;c=0;d=0;
    #10;
    a = 0;b=0;c=1;d=0;
    #10;
    a = 0;b=0;c=0;d=1;
    #10;
    $finish;
end
endmodule