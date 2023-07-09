//---------------------------------------------------------
// File Name   : decoder.sv
// Function    : picoMIPS instruction decoder 
// Author: Qi ZHONg
// ver 2:  // ADD, ADDI, MUL, MULI,LDI, LDS,WAIT0, WAIT1
// Last revised: 21 Mar 2023
//---------------------------------------------------------

`include "alucodes.sv"
`include "opcodes.sv"
//---------------------------------------------------------
module decoder #(parameter O_SIZE = 6, parameter A_SIZE = 2)(//O_SIZE MEANS the width of opcodes, A_SIZE means the width of alucodes
	//input
	input wire [5:0] opcode, //load the opcodes
	input wire SW8,
	
	
	// output
	output logic PCincr, //    PC control

	output logic [1:0] ALUfunc, //    ALU control

	output logic imm, // imm mux control

	output logic immswitches //   imm switch control
  );
   

	
always_comb 
begin
  // set default output signal values 
   PCincr = 1'b1; // PC increments by default
   ALUfunc = `RA; // Because a is always set to a value, so the default operation is RA
   imm=1'b0; 
	immswitches = 1'b0;
	
	
	case (opcode)
			`LIR: begin
				// Load immediate value into destination register
				ALUfunc = `RB;
				imm = 1'b1;
			end
			`LSR: begin
				// Wait for SW8 to be 1
				PCincr = SW8;

				// Load SWITCH value into destination register
				ALUfunc = `RB;
				imm = 1'b1;
				immswitches = 1'b1;
			end
			`ADD: begin
				ALUfunc = `RADD;
			end
			`ADDI: begin
				ALUfunc = `RADD;
				imm = 1'b1;
			end
			`MUL: begin
				ALUfunc = `RMUL;
			end
			`MULI: begin
				ALUfunc = `RMUL;
				imm = 1'b1;
			end
			`WAIT0: begin
				// Wait for SW8 to be 0
				PCincr = ~SW8;
			end
			`WAIT1: begin
				// Wait for SW8 to be 1
				PCincr = SW8;
			end
			default: 
			   $error("unimplemented opcode");
		endcase
  
end // always_comb


endmodule //module decoder --------------------------------