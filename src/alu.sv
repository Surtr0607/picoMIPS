//-----------------------------------------------------
// File Name   : alu.sv
// Function    : ALU module for picoMIPS
// Author:  Qi Zhong
// Last rev. 12 Mar 23
//-----------------------------------------------------

`include "alucodes.sv"
module alu #(parameter n =8, parameter A_SIZE = 2) ( //A_SIZE means the width of alu function
	//input
   input wire signed [n-1:0] a, b, // ALU operands
   input wire [1:0] ALUfunc, // ALU function code
	
	//output
   output logic signed [n-1:0] result // ALU result
);       

// create the ALU, use signal multiplyResult in arithmetic operations
    logic signed [15:0] multiplyResult;
    assign multiplyResult = a * b;

    always_comb begin
        case (ALUfunc)
            `RA:      result = a;
            `RB:      result = b;
            `RADD:    result = a + b;
            `RMUL:    result = multiplyResult[14:7];
            default:    result = a;
        endcase
    end
endmodule

