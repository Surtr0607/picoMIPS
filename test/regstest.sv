//-----------------------------------------------------
// File Name : regstest.sv
// Function : testbench for pMIPS 4 x n registers, %0 == 0
// Author: Qi Zhong
// Last rev. 16 Mar 2023
//-----------------------------------------------------
module regstest;

parameter n = 8;
parameter R_SIZE = 2;

logic clk;
logic [n-1:0] Wdata;
logic [1:0] Raddr1, Raddr2;
logic [n-1:0] Rdata1, Rdata2;

regs  #(.n(n), .R_SIZE(R_SIZE)) r(.*);

initial
begin
  clk =  0;
  
end

always #5 clk = ~clk;

initial
begin
    Raddr1 = 2; Raddr2 = 3;
    Wdata = 8;

  #20 Raddr1 = 1; Wdata = 8'd07;
  #20 Raddr1 = 2; Wdata = 8'd06;
  #20 Raddr1 = 3; Wdata = 8'd05;
  #20 Raddr2 = 3; Wdata = 8'd04;
  #20 Raddr2 = 2; Wdata = 8'd03;
  #20 Raddr2 = 1; Wdata = 8'd02; 
  #20;
end

	

endmodule // module regstest