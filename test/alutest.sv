//-----------------------------------------------------
// File Name   : alutest.sv
// Function    : ALU testbench for picoMIPS
// Author:  Qi Zhong
// Last rev. 12 Mar 23
//-----------------------------------------------------

`include "../src/alucodes.sv"

module alutest;
parameter n=8;
logic [n-1:0] a,b;
logic [1:0] ALUfunc;
logic [n-1:0] result;
alu #(.n(n)) alu1 (.a(a), .b(b), .ALUfunc(ALUfunc), .result(result)); //create alu object
//code starts here

initial
	begin a = 8'h7a; b = 8'h08;
	#10 ALUfunc = `RADD; // result = a+b
	#10 ALUfunc = `RMUL; // result = a*b
	#50 ALUfunc = `RADD; // result = a+b
	#10 ALUfunc = `RA; // result = a 
	#10 ALUfunc = `RB; // result = b
	end
	
endmodule
