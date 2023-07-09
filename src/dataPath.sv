`include "alucodes.sv"
module dataPath
    #(
        parameter n = 8,        // Data bus width
        parameter A_SIZE = 2,   // ALU function width
        parameter R_SIZE = 2    // GPR address width
    )
    (
        // outputs
        output wire [(n-1):0] displayResult,

        // inputs
        input wire [9:0] SW,
        input wire [1:0] ALUfunc,
        input wire imm,
        input wire immswitches,
        input wire [(R_SIZE-1):0] Raddr1,
        input wire [(n-1):0] Raddr2,
        input wire clk
    );


    // register para
    wire [(n-1):0] Rdata1, Rdata2;

    // alu para
    wire [(n-1):0] aluA, aluB, result;
    assign aluA = Rdata1;
    assign aluB = imm ? (immswitches ? SW[(n-1):0] : Raddr2) : Rdata2;

    //calculate result
    assign displayResult = result;


    // regs
    regs
        #(
            .n(n),
            .R_SIZE(R_SIZE)
        ) re
        (
            // outputs
            .Rdata1(Rdata1),
            .Rdata2(Rdata2),

            // inputs
            .Wdata(result),
            .Raddr1(Raddr1),
            .Raddr2(Raddr2[(R_SIZE-1):0]),

            .clk(clk)
        );


    // ALU
    alu
        #(
            .n(n)
        ) al
        (
            // outputs
            .result(result),

            // inputs
            .a(aluA),
            .b(aluB),
            .ALUfunc(ALUfunc)
        );

endmodule