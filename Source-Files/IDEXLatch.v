`timescale 1ns / 1ps

module IDEXLatch (

input wire clk,
input wire [1:0] WB_in,
input wire [2:0] M_in,
input wire [3:0] EX,
input wire NPC_in,
input wire [31:0] ReadData1_in,
input wire [31:0] ReadData2_in,
input wire [31:0] SignExtend_in,
input wire [4:0] Instr_2016_in,
input wire [4:0] Instr_1511_in,
output reg [1:0] WB_out,
output reg [2:0] M_out,
output reg [1:0] ALUOp,
output reg ALUSrc,
output reg RegDst,
output reg [31:0] NPC,
output reg [31:0] ReadData1,
output reg [31:0] ReadData2,
output reg [31:0] SignExtend,
output reg [4:0] Instr_2016,
output reg [4:0] Instr_1511

);

always @(posedge clk) begin

WB_out <= WB_in;
M_out <= M_in;
ALUOp <= EX[2:1];
ALUSrc <= EX[0];
RegDst <= EX[3];
NPC <= NPC_in;
ReadData1 <= ReadData1_in;
ReadData2 <= ReadData2_in;
SignExtend <= SignExtend_in;
Instr_2016 <= Instr_2016_in;
Instr_1511 <= Instr_1511_in;


end

endmodule