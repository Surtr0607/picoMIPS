//-----------------------------------------------------
// File Name : prog.sv
// Function : Program memory 5-bit opcodes
// Author: Qi Zhong 
// Last rev. 16 Mar 2023
//-----------------------------------------------------
module prog #(parameter P_SIZE = 5, I_SIZE = 16)( // P_SIZE - memory width, I_SIZE - instruction width

	//input
	input logic [P_SIZE-1:0] address,
	//output
	output logic [I_SIZE-1:0] I  // I - instruction code
); 

// program memory declaration, note: 1<<n is same as 2^n
logic [I_SIZE-1:0] progMem[ (1<<P_SIZE)-1:0];

// get memory contents from file
initial
  $readmemh("prog.hex", progMem);
  
// program memory read 

assign I = progMem[address];

endmodule // end of module prog
