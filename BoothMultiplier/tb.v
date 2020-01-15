`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:49:09 09/02/2019
// Design Name:   BoothMult
// Module Name:   E:/group19Verilog/Assgn_7_Grp_19/BoothMultiplier/tb.v
// Project Name:  BoothMultiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BoothMult
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
	wire slow_clk;
	wire [11:0] product;


	// Instantiate the Unit Under Test (UUT)
	BoothMult uut (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.slow_clk(slow_clk), 
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
        
		// Add stimulus here
		clk=1;
		load=1;
		a=6'b000001;
		b=6'b000011;
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
		
		
		
	end
      
endmodule

