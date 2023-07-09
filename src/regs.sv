//-----------------------------------------------------
// File Name : regs.sv
// Function : picoMIPS 4 x n registers, %0 == 0
// Author:  Qi Zhong
// Last rev. 12 Mar 23
//-----------------------------------------------------
module regs #(parameter n = 8, R_SIZE = 2)( // n - data bus width

	//input
	input wire clk, // clk and write control
	input wire [n-1:0] Wdata,
	input wire [R_SIZE-1:0] Raddr1, Raddr2,
	
	
	//output
	output logic [n-1:0] Rdata1, Rdata2
);

 	// Declare 4 n-bit registers 
	logic [n-1:0] gpr [3:0];
	
	
	
	// write process, dest reg is Raddr2
	always_ff @ (posedge clk)
	begin
		
            gpr[Raddr1] <= Wdata;

		end

	//Asynchronous read process, output 0 if %0 is selected

	assign Rdata1 = gpr[Raddr1];
	assign Rdata2 = gpr[Raddr2];


endmodule // module regs