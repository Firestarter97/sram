`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 04:52:26 PM
// Design Name: 
// Module Name: pmmem_fsm
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


module pmmem_fsm(clk,reset,address,data,cs,we,oe);

    input clk, reset;
    output [7:0] address;
    inout [3:0] data;
    output reg cs = 1'b0;
    output reg we = 1'b0;
    output reg oe = 1'b0;
    
    reg [7:0] address = 8'b00000000;
    reg [3:0] data_reg = 4'b0000;
    reg [2:0] state;
    
    parameter idle = 3'b000, s1= 3'b001, s2=3'b010,s3=3'b011,s4=3'b100;  //decide the numeber of states you need to have
    assign data = data_reg;
    
    always@(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            state <= idle;
            address <= 0;
        end
        else
        case (state)
            idle: 
            begin
                state <= s1;
                address <= 0;
            end
            s1:
            begin
                state <= s2;
                address <= 0;
            end
            s2: 
            begin
                address <= address + 1;
                if(address > 32)
                    state <= s3;
                else
                    state <= s2;
            end
            s3:
            begin
                address <= 0;
                state <= s4;
            end
            s4:
            begin
                address <= address + 1;
                state <= s4;
            end
// describe other states
            default:
            begin
                state <= s1;
                address <= 0;
            end
    endcase
    end
    
    always@(state)
    begin
        case (state)
        idle: 
        begin
            cs = 0; we = 0; oe = 0; data_reg = 4'bZZZZ;
            //data_reg = 8'bZZZZZZZZ;
        end
        s1: begin //writing
            cs = 1; we = 1; oe = 0; data_reg = 4'b1010;
            //data_reg = 8'b11000011;
        end
        s2: 
        begin //writing
            cs = 1; we = 1; oe = 0; data_reg = 4'b1010;
            //data_reg = 8'b11000011;
        end
        s3: 
        begin //reading
            cs = 1; we = 0; oe = 1;
        end
        s4:
        begin //reading
          cs = 1; we = 0; oe = 1; data_reg = 4'bZZZZ;
        end
 // determine other states
        default:
        begin
            cs = 0; we = 0; oe = 0; data_reg = 4'bZZZZ;
        end
    endcase
    end
endmodule