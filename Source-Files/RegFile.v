`timescale 1ns / 1ps

module RegFile (

input wire clk,
input wire [4:0] ReadReg1,
input wire [4:0] ReadReg2,
input wire [4:0] writeReg,
input wire [31:0] writeData,
input wire RegWrite,
output wire [31:0] Read1,
output wire [31:0] Read2

);

reg [31:0] Reg [31:0];

always @(posedge clk) begin
    if (RegWrite) begin
        Reg[writeReg] <= writeData;
    end 
end
   assign Read1 = Reg[ReadReg1];
   assign Read2 = Reg[ReadReg2];

endmodule