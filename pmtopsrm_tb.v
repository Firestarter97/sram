`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 05:59:42 PM
// Design Name: 
// Module Name: pmtopsrm_tb
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

module pmtopsrm_tb;

    reg clk, reset;
    wire[3:0] data;
    wire cs, we, oe;
    wire [7:0] address;
    
    top_sram pmtop_sram(.cs(cs),.we(we),.oe(oe),.data(data),.clk(clk),.address(address),.reset(reset));
    
    always #1 clk = ~clk;
  
    initial
    begin
    
    clk = 0; reset = 0;
    #5;
    reset = 1;
    #5;
    reset = 0;
    #300;
    reset = 1;
    #5;
    reset = 0;
    #300;
    reset = 1;
    #5;
    reset = 0;
  end
endmodule