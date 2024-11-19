module halfSubractor(A,B,diff,borrow);
    input A,B;
    output diff,borrow;

    assign diff = A ^ B;
    assign borrow = ~A & B;
endmodule

module test;
    reg A,B;
    wire diff,borrow;
    halfSubractor h1(A,B,diff,borrow);
    initial begin
        $dumpfile("forth.vcd");
        $dumpvars(0,test);

        $display("A \t B \t DIFF \t BORROW");
        $monitor("%b \t %b \t %b \t %b",A,B,diff,borrow);

        A=0;B=0;
        #10;
        A=0;B=1;
        #10;
        A=1;B=0;
        #10;
        A=1;B=1;
        #10;
        $finish;
    end

endmodule