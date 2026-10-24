`timescale 1ns / 1ps
module signExtend(
    input wire [15:0] immediate,
    output wire [31:0] extended
    );
    
    assign extended = immediate[15] ? {16'b1111111111111111, immediate} : {16'b0000000000000000,immediate};
    
endmodule