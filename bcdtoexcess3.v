module bcdtoexcess3(A,B,C,D,w,x,y,z);
    input A,B,C,D;
    output w,x,y,z;
    
    assign w = A | (B & C) | (B & D);
    assign x = (~(B) & C) | (~(B) & D) | (B & ~(C) & ~(D));
    assign y = (~(C) & ~(D)) | (C & D);
    assign z = ~(D);
endmodule

module test;
reg A,B,C,D;
wire w,x,y,z;
bcdtoexcess3 b1(A,B,C,D,w,x,y,z);
initial begin
    $dumpfile("fifth.vcd");
    $dumpvars(0,test);

    $display("A \t B \t C \t D \t W \t X \t Y \t Z");
    $monitor("%b \t %b \t %b \t %b \t %b \t %b \t %b \t %b",A,B,C,D,w,x,y,z);
    A = 0;B = 0;C = 0; D = 0;
    #10;
    A = 0;B = 0;C = 0; D = 1;
    #10;
    A = 0;B = 0;C = 1; D = 0;
    #10;
    A = 0;B = 0;C = 1; D = 1;
    #10;
    A = 0;B = 1;C = 0; D = 0;
    #10;
    A = 0;B = 1;C = 0; D = 1;
    #10;
    A = 0;B = 1;C = 0; D = 0;
    #10;
    A = 0;B = 1;C = 1; D = 1;
    #10;
    A = 1;B = 0;C = 0; D = 0;
    #10;
    A = 1;B = 0;C = 0; D = 1;
    #10;
    A = 1;B = 0;C = 1; D = 0;
    #10;
    A = 1;B = 0;C = 1; D = 1;
    #10;
    A = 1;B = 1;C = 0; D = 0;
    #10;
    A = 1;B = 1;C = 0; D = 1;
    #10;
    A = 1;B = 1;C = 1; D = 0;
    #10;
    A = 1;B = 1;C = 1; D = 1;
    #10;
    $finish;
end

endmodule