`timescale 1ns / 1ps
module signExtTB(

    );
    reg[15:0] imm;
    wire[31:0] ext;
    
    signExtend DUT(.extended(ext), .immediate(imm));
    initial begin
        imm = 16'b1000000000000011;
        #1;
        imm = 16'b1100000000110100;
        #1;
        imm = 16'b0000000000001111;
        #1;
        imm = 16'b0011000000110100;
        $finish;
    end
endmodule
