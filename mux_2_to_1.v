module mux_2_to_1 (i0, i1, sel, q);
	
	// inputs
	input [8:0] i0, i1; // main inputs to mux
	input sel; // selection input
	
	// output
	output [8:0] q;
	reg [8:0] q;
	
	// give mux output when either i0, i1 or selection input changes
	always @(i0, i1, sel)
	begin
        case (sel)
            1'b0: q = i0;
			1'b1: q = i1;
        endcase
	end
	
endmodule