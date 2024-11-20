module gates_ff(
    input in1,
    input in2,
    output out1,
    output out2,
    output reg q,
    input clk,
	 input rst
    );

assign out1=in1^in2;
assign out2=out1&in2;

always @(posedge clk) begin
if (rst) 
	q=0;
else if (clk==1)
	q=in1;
end

endmodule

TEST BENCH FOR RAM:
module tb_gates_ff;

	// Inputs
	reg in1;
	reg in2;
	reg clk;
	reg rst;

	// Outputs
	wire out1;
	wire out2;
	wire q;

	// Instantiate the Unit Under Test (UUT)
	gates_ff uut (
		.in1(in1), 
		.in2(in2), 
		.out1(out1), 
		.out2(out2), 
		.q(q), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 1;
		clk = 0;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#10;	rst=0; in1=1; 
		#100; in2=1; in1=1;
        
	end
always #20 clk=~clk;     
endmodule
