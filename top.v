// test bed for the top module
module testbed;
	
	// input/output for the top module
	reg [8:0] A, B, ctrl_bus;
	reg clk;
	wire [8:0] Q;
	
	// instantiate top module
	top top_module(A, B, ctrl_bus, clk, Q);
	
	// give values for inputs to check the output in simulation
	initial
	begin
	
		// reset clock input 
		clk = 1'b0;
		
		// reset registers and put values to A and B
		ctrl_bus = 8'b11000000;
		A = 8'd8;
		B = 8'd5;		
		
		#10
		ctrl_bus = 8'b00000000;	// Q will get A
		
		#10
		ctrl_bus = 8'b00000001;	// Q will get A + B
		
	end
	
	// generate the clock signal with period 10	
	always
		#5 clk = ~clk;
	
endmodule


module top (A, B, ctrl_bus, clk, Q);
	
	// inputs
	input [8:0] A, B;
	input [8:0] ctrl_bus;
	input clk;
	
	// output
	output [8:0] Q;
	
	// internal wires
	wire [8:0] R, M, X, S;
	
	// instantiate modules needed for the design with proper connections
	register R_reg(S, clk, ctrl_bus[6], R);
	register Q_reg(S, clk, ctrl_bus[7], Q);
	mux_2_to_1 mux(B, R, ctrl_bus[3], M);
	alu alu_unit(A, M, ctrl_bus[2:0], X);
	shifter shift_unit(X, ctrl_bus[5:4], S);
	
endmodule