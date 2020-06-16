`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2020 01:51:53 AM
// Design Name: 
// Module Name: RegFile_tb
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


module RegFile_tb(
        
    );
    
     reg [5:0]readreg1;
     reg [5:0]readreg2;
     reg [5:0]writereg;
     reg wen;
     reg [31:0]writedata;
    
     wire [31:0]readdata1;
     wire [31:0]readdata2;
     
     reg [31:0]value1;
     reg [31:0]value2;
     RegFile regfile (
         .readreg1(readreg1), 
         .readreg2(readreg2), 
         .writereg(writereg), 
         .wen(wen), 
         .writedata(writedata), 
         .readdata1(readdata1), 
         .readdata2(readdata2)
     );
     
 
     initial begin 
     
      wen = 'b1;
      readreg1 =  'b0;
      readreg2 = 'b0;
      writereg = 'b1;
      writedata = 'b10;
     
     #2
     wen = 0;
     readreg1 = 'b1;
     #2
     wen = 1;
     #2
     value1 = readdata1;// should be 'd2
      writereg = 'b10;
      writedata = 'h80000000;
      #2
      readreg2 = 'd2;
      #2
      value2 = readdata2;
      writereg = 'b10000;
      writedata = 'hffffffff;
      #2 
      readreg1 = 'b10000;
      #2
      value1 = readreg1;
      #2
      wen = 0;
      #2
      writereg = 'b1;
      writedata = 'h11111111;
      #2;
      
     
     
     
     end
    
endmodule
