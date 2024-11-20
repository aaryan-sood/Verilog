module Sdff(d,rstn,clk,q);
input d,rstn,clk;
output reg q;
always@(posedge clk)
	if (!rstn )
		q<=0;
	else
		q<=d;
endmodule

module tv_dff;
 reg d,rstn,clk;
 Sdff obj(d,rstn,clk,q);

always #10 clk = ~clk;

initial begin
 $display(" T\treset \t clk \t D \t|  q");
$monitor(" %0t \t %d \t  %d  \t %d | %d",$time,rstn,clk,d,q);
 end
 integer i;
	initial begin	
		clk =0; d =0; rstn  =0;
		
		#5 rstn =1;
		
		repeat(6) begin
		      d =$urandom_range(0,1);
		     #5;
		end
		rstn = 0; 
		//#5 rstn = 1;
		repeat(6) begin
		      d =$urandom_range(0,1);
		     #5;
		end
		$finish;
	end		
endmodule  