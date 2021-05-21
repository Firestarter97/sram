`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2020 04:11:11 PM
// Design Name: 
// Module Name: top_sram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_sram(cs,we,oe,data,clk,address,reset);

    output cs;
    output we;
    output oe;
    output [7:0] address;
    
    inout [3:0] data = 4'b0000;
    input clk, reset;
    
    pmram pmram1(.address(address),.data(data),.cs(cs),.we(we),.oe(oe));
    pmmem_fsm pmmem_fsm1(.clk(clk),.reset(reset),.address(address),.data(data),.cs(cs),.we(we),.oe(oe));
     
endmodule
