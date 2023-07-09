//-----------------------------------------------------
// File Name : pc.sv
// Function : picoMIPS Program Counter
// functions: increment
// Author: Qi Zhong
// Last rev. 16 Mar 2023
//-----------------------------------------------------
module pc #(parameter P_SIZE = 6)( // up to 32 instructions

	//input
	input logic PCincr,
	input wire clk,
	
	//output
	output logic [P_SIZE-1 : 0] PCout
);

//------------- code starts here---------


always_ff @ ( posedge clk) 
  begin
		if (PCincr)	// Increment
			PCout <= PCout + 1;
		else		// Do nothing
			PCout <= PCout;
	end
	 
endmodule // module pc