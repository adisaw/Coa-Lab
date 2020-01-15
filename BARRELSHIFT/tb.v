`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:44:58 08/21/2019
// Design Name:   barrel_shifter
// Module Name:   E:/group19Verilog/BarrelShifter/tb.v
// Project Name:  BarrelShifter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel_shifter
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
	reg [7:0] in;
	reg [2:0] shamt;
	reg dir;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	barrel_shifter uut (
		.in(in), 
		.shamt(shamt), 
		.dir(dir), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		shamt = 0;
		dir = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		dir=1;
		in=8'b01110100;
		shamt=2'b011;
		#100
		in=8'b01011100;
		dir=0;
		shamt=2'b101;
	end
      
endmodule

