module shifter(a, shift, q);

	// inputs
	input [8:0] a;
	input [1:0] shift;
	
	// output
	output [8:0] q;
	reg [8:0] q;
	
	// give appropriate shifter output(q) when either a or shift input changes
	always @(a, shift)
	begin
		case (shift)
			2'b00: q = a;
			2'b01: q = a << 1;
			2'b10: q = a << 2;
			2'b11: q = a << 3;
		endcase
	end
	
endmodule