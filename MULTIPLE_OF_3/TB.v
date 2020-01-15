`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:25 08/21/2019
// Design Name:   fsm
// Module Name:   E:/group19Verilog/mult_of_three/TB.v
// Project Name:  mult_of_three
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB;

	// Inputs 
	reg clock;
	reg reset;
	reg inbit;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.clock(clock), 
		.reset(reset), 
		.inbit(inbit), 
		.out(out)
	);
	reg [3:0]i; 
	reg [15:0]sequence;
	
	initial begin
		// Initialize Inputs
			clock=0; 
        reset = 0;
		  #5
		  reset=1;
        sequence = 16'b0101011101110010;
   #2 reset = 0;

   for( i = 15; i >= 0; i = i - 1)
   begin
      inbit = sequence[i];
      #5 clock = 1;
      #5 clock = 0;
      
   end
		
	
        
		// Add stimulus here

	end
      
endmodule

