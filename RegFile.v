`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: William Shaddix
// 
// Create Date: 05/31/2020 07:05:05 PM
// Design Name: 
// Module Name: RegFile
// Project Name: RISC-V Processor
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


module RegFile(
        input wire [5:0]readreg1,
        input wire [5:0]readreg2,
        input wire [5:0]writereg,//register we are writing to
        input wire wen,//write enable
        input wire [31:0]writedata,//data we are writing
        
        output reg [31:0]readdata1,
        output reg [31:0]readdata2
    );
    
    reg [31:0]registers[31:0];
    initial registers[0] = 'b0;
    
    always@(*) begin
    
    casex({wen})
        1'b1 : registers[writereg] <= writedata;//if write enabled, write
        1'b0 : ;//no write
        default : ;//default case no write
    endcase
    
    end
    
    always@(*) begin
    
    readdata1 = registers[readreg1];
    readdata2 = registers[readreg2];

    end
    
    
    
    
    
endmodule
