module register(D, clk, reset, Q);
	
	// inputs
	input [8:0] D;
	input clk, reset;
	
	// output
	output [8:0] Q;
	reg [8:0] Q;
	
	// assign value or reset Q when clk signal comes
	always @ (posedge clk)
	begin
		if (reset)
			Q = 0; // reset output
		else
			Q = D; // assign value of D to Q
	end
	
endmodule