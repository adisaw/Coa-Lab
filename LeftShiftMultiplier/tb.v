`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:14:15 08/28/2019
// Design Name:   unsigned_seq_mul_LS
// Module Name:   E:/group19Verilog/LeftShiftMultiplication/tb.v
// Project Name:  LeftShiftMultiplication
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: unsigned_seq_mul_LS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg [5:0] a;
	reg [5:0] b;

	// Outputs
	wire [11:0] product;

	// Instantiate the Unit Under Test (UUT)
	unsigned_seq_mul_LS uut (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.a(a), 
		.b(b), 
		.product(product)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		load = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk=1;
		load=1;
		a=6'b111111;
		b=6'b111111;
		#5;
		load=0;
		clk=0;
		#10
		clk=1;
		#10;
		clk=0;
		#10
		clk=1;
		#10;
		clk=0;
		#10
		clk=1;
		#10;
		clk=0;
		#10
		clk=1;
		#10;
		clk=0;
		#10
		clk=1;
		#10;
		clk=0;
		#10
		clk=1;
		#10;
				

		load=0;
        
		// Add stimulus here

	end
      
endmodule

