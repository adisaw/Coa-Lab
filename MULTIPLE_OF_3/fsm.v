`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:53 08/26/2019 
// Design Name: 
// Module Name:    fsm 
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
module fsm(
    input clock,
    input reset,
    input inbit,
    output reg out
    );

	reg [1:0]state;
	reg slow_clk=0;
	initial begin
		state=2'b00;
		out=0;
	end

	reg [32:0]counter=0;
    always @(posedge clock)
    begin
        counter = (counter>=20000000)?0:counter+1;
        slow_clk = (counter < 10000000)?1'b0:1'b1;
    end
	always @(posedge slow_clk or posedge reset)
	begin
		if(reset==1) begin
			state =2'b00 ;
			out=0;
			end
		else
			begin
				if(state==2'b00) 
					begin
						if (inbit==1)begin
							state=2'b01;
							out=0;
							end
						else
							out=1;
							
					end
				else if(state==2'b01)
					begin
						if (inbit==1)begin
							state=2'b00;
							out=1;
							end
						else begin
							state=2'b10;
							out=0;
							end
						
					end
				else if(state==2'b10)
					begin
						if(inbit==0)begin
							state=2'b01;
							out=0;
							end
						else
							out=0;
					end
			end
			
	end
endmodule
