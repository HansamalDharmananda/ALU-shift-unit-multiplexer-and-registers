module alu(a, b, alu_op, q);

	// inputs
	input [8:0] a, b;
	input [2:0] alu_op;
	
	// output
	output [8:0] q;
	reg [8:0] q;
	
	// give appropriate alu output(q) when either a, b or alu_op input changes
	always @(a, b, alu_op)
	begin
		case (alu_op)
			3'b000: q = a;
			3'b001: q = a + b;
			3'b010: q = a - b;
			3'b011: q = b - a;
			3'b100: q = a & b; 
			3'b101: q = a | b; 
			3'b110: q = a ^ b; 
			3'b111: q = a ^~ b; 
		endcase
	end
	
endmodule