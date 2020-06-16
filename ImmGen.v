`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: William Shaddix
// 
// Create Date: 05/31/2020 07:05:05 PM
// Design Name: 
// Module Name: ImmGen
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
// Finding the immediate is dependant on the type of instruction
//////////////////////////////////////////////////////////////////////////////////


module ImmGen(
    input wire [31:0] instruction,
    output reg [31:0] sextImm
    );
    /*
    6 types of instructions
    U-Type:
    J-Type:
    B-Type:
    I-Type: [31:11] = inst[31], 10:0 = inst[30:20]
    S-Type:
    R-Type:
    
    */
    
    parameter LUI =     7'b0110111,//U-Type 
              AUIPC =   7'b0010111,//U-Type
              JAL =     7'b1101111,//J-Type
              JALR =    7'b1100111,//I-Type
              Branch =  7'b1100011,//B-Type for BEQ, BLT, BNE, BGE, BLTU, AND BGEU
              Load =    7'b0000011,//I-Type for LB, LH, LW, LBU, and LHU
              Store =   7'b0100011,//S-Type
              Imm =     7'b0010011;//I-Type for ADDI, SLTI, SLTIU, XORI, ORI, ANDI
              
    always@(*) begin
    
    casex({instruction[6:0]})
    
        LUI : sextImm <= {{13{instruction[31]}}, instruction[30:12]};//U-Type Unsure if this is actual implementation
        
        AUIPC: sextImm <= {{13{instruction[31]}}, instruction[30:12]};//U-Type Unsure if this is actual implementation;
        
        JAL:  sextImm <= {{13{instruction[31]}}, instruction[19:12],  instruction[20],  instruction[30:21]};//J-Type unsure if this is right
        
        JALR: sextImm <= {{21{instruction[31]}}, instruction[30:20]};//I-Type
        
        Branch :  sextImm <= {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};//B-Type;;
        
        Load : sextImm <= {{21{instruction[31]}}, instruction[30:20]};//I-Type;
        
        Store: sextImm <= {{21{instruction[31]}}, instruction[30:25], instruction[11:7]};//S-Type;
        
        Imm: sextImm <= {{21{instruction[31]}}, instruction[30:20]};//I-Type;
        
        default: ;//set it to 0?
    
    endcase
    
    end
    
    
endmodule