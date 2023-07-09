`include "opcodes.sv"
module controlPath
    #(
        parameter n = 8,        
        parameter A_SIZE = 2,  
        parameter O_SIZE = 6,   
        parameter P_SIZE = 4,   
        parameter R_SIZE = 2,   
        parameter I_SIZE = 16
    )
    (
        // Outputs
        // controlpath
        output wire [1:0] ALUfunc,
        output wire imm,
        output wire immswitches,
        // datapath
        output wire [(R_SIZE-1):0] Raddr1,
        output wire [(n-1):0] Raddr2,

        // Inputs
        input wire [9:0] SW,
        input wire clk
    );

    
    wire [(I_SIZE-1):0] I;
    wire [5:0] opcode;
    assign {opcode, Raddr1, Raddr2} = I;

    wire PCincr;
    wire [(P_SIZE-1):0] PCout;


    // pc
    pc
        #(
            .P_SIZE(P_SIZE)
        ) pc
        (
            // Outputs
            .PCout(PCout),

            // Inputs
            .PCincr(PCincr),
            .clk(clk)
        );


    // prog
    prog
        #(
            .I_SIZE(I_SIZE),
            .P_SIZE(P_SIZE)
        ) pm
        (
            // Outputs
            .I(I),

            // Inputs
            .address(PCout)
        );


    // decoder
    decoder
        #(
            .A_SIZE(A_SIZE),
            .O_SIZE(O_SIZE)
        ) de
        (
            // Outputs
            .ALUfunc(ALUfunc),
            .imm(imm),
            .immswitches(immswitches),
            .PCincr(PCincr),
            
            // Inputs
            .opcode(opcode),
            .SW8(SW[8])
        );

endmodule