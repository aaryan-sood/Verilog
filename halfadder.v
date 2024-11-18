module halfadder(A,B,sum,carry);
    input A,B;
    output sum,carry;
    assign carry = A & B;
    assign sum = A ^ B;
endmodule

module test;
    reg A,B;
    wire sum,carry;
    halfadder h1(A,B,sum,carry);
    initial begin

        $dumpfile("second.vcd");
        $dumpvars(0,test);

        $display("A \t B \t SUM \t CARRY");
        $monitor("%b \t %b \t %b \t %b",A,B,sum,carry);
        A=0;B=0;
        #10;A=0;B=1;
        #10;A=1;B=0;
        #10;A=1;B=1;
        #10;
        $finish;
    end

endmodule