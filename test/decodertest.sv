//---------------------------------------------------------
// File Name   : decodertest.sv
// Function    : testbench for picoMIPS instruction decoder 
// Author: QI ZHONG
// Last revised: 16 Mar 2023
//---------------------------------------------------------

`include "../src/alucodes.sv"
`include "../src/opcodes.sv"
//---------------------------------------------------------
module decodertest;
    // Outputs
    logic [1:0] ALUfunc;
    wire imm, immswitches, PCincr;

    // Inputs
    logic [5:0] opcode;
    logic SW8;
	 
	 //parameters
	 parameter A_SIZE = 2;
	 parameter O_SIZE = 6;


    decoder
        #(
            .A_SIZE(A_SIZE),
            .O_SIZE(O_SIZE)
        ) de
        (
            .ALUfunc(ALUfunc),
            .imm(imm),
            .immswitches(immswitches),
            .PCincr(PCincr),

            .opcode(opcode),
            .SW8(SW8)
        );


    initial begin
        SW8 = 0;

        #5 opcode = `LIR;
        #5 SW8 = 1;

        // Test multiplication instructions
        #5 opcode = `MUL;
        #5 opcode = `MULI;
        #5;

    end

endmodule //module decodertest 