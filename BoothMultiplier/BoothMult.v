`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:09 09/02/2019 
// Design Name: 
// Module Name:    BoothMult 
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
module BoothMult(
    input clk,
    input rst,
    input load,
    output reg slow_clk,
    input [5:0]a,
    input [5:0]b,
	 output reg [11:0]product
    );

	reg [5:0]la,lb;
	reg [2:0]counter=0;
	reg [11:0] temp;	
	reg [32:0]mcounter=0;
	reg [6:0]Q=0;
	reg [5:0]A=0;

	always @(posedge clk)
    begin
        mcounter = (mcounter>=8000000)?0:mcounter+1;
        slow_clk = (mcounter < 4000000)?1'b0:1'b1;
    end
always @(posedge slow_clk)
begin
	if(rst==1)
	begin
		product=0;
		counter=0;
	end
	else if(load==1)
	begin
		product=0;
		counter=0;
		la=a[5:0]; 
		lb=b[5:0];
		A=0;
		Q={la[5:0],1'b0};
	end
	else if(counter<=5)
	begin	
		if( Q[1]==0 && Q[0]==1)
		begin
			A=A+lb;
		end
		else if( Q[1]==1 && Q[0]==0)
		begin 
			A=A-lb;
		end
		Q={A[0],Q[6:1]};
		A={A[5],A[5:1]};
		product={A,Q[6:1]};
		counter=counter+1;
	end
end
endmodule
