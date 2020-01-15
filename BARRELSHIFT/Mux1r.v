`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:16 08/21/2019 
// Design Name: 
// Module Name:    Mux1r 
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
module Mux1r(
    input [7:0]inp,
    input [7:0]inp1,
    input sel,
    output [7:0]out
    );
assign out=(sel==1)?inp1:inp;

endmodule
