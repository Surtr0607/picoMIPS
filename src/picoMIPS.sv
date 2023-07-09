`include "alucodes.sv"
`include "opcodes.sv"
module picoMIPS(
	output wire [7:0] LED,
	// Board inputs
	input wire [9:0] SW,

	// Clock
	input wire clk
);

	
	parameter n = 8;
	parameter A_SIZE = 2;
	parameter O_SIZE = 6;
	parameter P_SIZE = 4;
	parameter R_SIZE = 2;


	// Control lines
	wire [1:0] ALUfunc;
	wire imm;
	wire immswitches;

	// Operands
	wire [(R_SIZE-1):0] Raddr1;
	wire [(n-1):0] Raddr2;


	// Control path instance
	controlPath
		#(
			.n(n),
			.A_SIZE(A_SIZE),
			.O_SIZE(O_SIZE),
			.P_SIZE(P_SIZE),
			.R_SIZE(R_SIZE)
		) cp
		(
			.SW(SW),

			// Outputs
			// Control
			.ALUfunc(ALUfunc),
			.imm(imm),
			.immswitches(immswitches),
			//Data
			.Raddr1(Raddr1),
			.Raddr2(Raddr2),

			// Clock
			.clk(clk)
		);


	// Data path instance
	dataPath
		#(
			.n(n),
			.A_SIZE(A_SIZE),
			.R_SIZE(R_SIZE)
		) dp
		(
			// Demo
			.displayResult(LED[7:0]),
			.SW(SW),

			// Inputs
			// Control
			.ALUfunc(ALUfunc),
			.imm(imm),
			.immswitches(immswitches),
			// Data
			.Raddr1(Raddr1),
			.Raddr2(Raddr2),

			// Clock
			.clk(clk)
		);

endmodule