`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:12 08/21/2019 
// Design Name: 
// Module Name:    barrel_shifter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module barrel_shifter(
    input [7:0]in,
    input [2:0]shamt,
    input dir,
    output [7:0]out
    );
	wire [7:0]inp1r={4'b0000,in[7:4]};
	wire [7:0]inp1l={in[3:0],4'b0000};
	wire [7:0]out1r,inp2r,out2r,out3r,inp3r;
	wire [7:0]out1l,inp2l,out2l,out3l,inp3l;

	
	
	    Mux1r m1(in,inp1r,shamt[2],out1r);
		 assign inp2r={2'b00,out1r[7:2]}; 
		 Mux1r m2(out1r,inp2r,shamt[1],out2r);
		 assign inp3r={1'b0,out2r[7:1]};
		 Mux1r m3(out2r,inp3r,shamt[0],out3r);
		 
	
	
	
		 Mux1r m4(in,inp1l,shamt[2],out1l);
		 assign inp2l={out1r[5:0],2'b00}; 
		 Mux1r m5(out1l,inp2l,shamt[1],out2l);
		 assign inp3l={out2l[6:0],1'b0};
		 Mux1r m6(out2l,inp3l,shamt[0],out3l);
	
		 assign out=(dir==1)?out3l:out3r;

		 
		

endmodule
