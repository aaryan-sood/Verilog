module fulladder(A,B,C,sum,carry);
    input A,B,C;
    output sum,carry;
    assign sum = A ^ B ^ C;
    assign carry = A&B | B&C | A&C;
endmodule

module test;
    reg A,B,C;
    wire sum,carry;
    fulladder f1(A,B,C,sum,carry);
    initial begin
        $dumpfile("third.vcd");
        $dumpvars(0,test);
        
        $display("A \t B \t C \t SUM \t CARRY");
        $monitor("%b \t %b \t %b \t %b \t %b",A,B,C,sum,carry);
        A=0;B=0;C=0;
        #10;
        A=0;B=0;C=1;
        #10;
        A=0;B=1;C=0;
        #10;
        A=0;B=1;C=1;
        #10;
        A=1;B=0;C=0;
        #10;
        A=1;B=0;C=1;
        #10;
        A=1;B=1;C=0;
        #10;
        A=1;B=1;C=1;
        #10;
        $finish;
    end
endmodule