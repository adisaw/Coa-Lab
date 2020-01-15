`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:04 08/28/2019 
// Design Name: 
// Module Name:    unsigned_seq_mul_RS 
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
module unsigned_seq_mul_RS(
    input clk,
    input rst,
    input load,
    input [5:0]a,
    input [5:0]b,
    output reg [11:0]product,
	 output reg slow_clk
    );
reg [5:0]la,lb;
reg [2:0]counter=0;
reg [11:0] temp;	
reg [32:0]mcounter=0;
reg [12:0]product1;
 
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
		product1=0;
		counter=0;
	end
	else if(load==1)
	begin
		product=0;
		product1=0;
		counter=0;
		la=a[5:0];
		lb=b[5:0];
	end
	else if(counter<=5)
	begin	
		temp[5:0]=6'b000000;
		temp[11]=la[counter]&lb[5];
		temp[10]=la[counter]&lb[4];
		temp[9]=la[counter]&lb[3];
		temp[8]=la[counter]&lb[2];
		temp[7]=la[counter]&lb[1];
		temp[6]=la[counter]&lb[0];
		product1=product+temp;
		product=product1>>1;
		
		counter=counter+1;
	end
end



endmodule
