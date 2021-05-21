`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 04:45:32 PM
// Design Name: 
// Module Name: pmram
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


module pmram(address,data,cs,we,oe);
    
    input [7:0] address;
    inout [3:0] data;
    input cs;
    input we;
    input oe;
        
    reg [3:0] data_out;
    reg [7:0] mem [0:1023]; //10-bit address bus, 8-bit data bus.
        
    assign data = (cs && oe && !we) ? data_out : 8'bzzzzzzzz;

    always @ (cs or we or data or address)
    begin 
        if ( cs && we ) 
            mem[address] = data;
    end
    always @ (cs or we or data or address or data)
    begin
        if (cs && !we && oe)
            data_out = mem[address];
    end
endmodule