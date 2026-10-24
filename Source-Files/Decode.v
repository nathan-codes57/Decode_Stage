`timescale 1ns / 1ps

module Decode (

input wire clk, rst,
input wire [31:0] Instruction,
input wire [4:0] WriteReg,
input wire [31:0] WriteData,
input wire RegWrite,
input wire [31:0] NPC_in,
output wire [1:0] WB_out,
output wire [2:0] M_out,
output wire [1:0] ALUOp,
output wire ALUSrc,
output wire RegDst,
output wire [31:0] NPC_out,
output wire [31:0] ReadData1_out,
output wire [31:0] ReadData2_out,
output wire [31:0] SignExt,
output wire [4:0] Instr_2016_out,
output wire [4:0] Instr_1511_out

);

wire [5:0] OpCode;
wire [4:0] ReadReg1;
wire [4:0] ReadReg2;
wire [15:0] SignExt_in;
wire [4:0] Instr_2016_in;
wire [4:0] Instr_1511_in;
wire [1:0] WB;
wire [2:0] M;
wire [3:0] EX;
wire [31:0] NPC;
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [31:0] SignExt_out;

assign OpCode = Instruction [31:26];
assign ReadReg1 = Instruction [25:21];
assign ReadReg2 = Instruction [20:16];
assign SignExt_in = Instruction[15:0];
assign Instr_2016_in = Instruction [20:16];
assign Instr_1511_in = Instruction [15:11];

signExtend se0 (

.immediate(SignExt_in),
.extended(SignExt_out)

);

IDEXLatch IDEX(

.clk(clk),
.WB_in(WB),
.M_in(M),
.EX(EX),
.NPC_in(NPC_in),
.ReadData1_in(ReadData1),
.ReadData2_in(ReadData2),
.SignExtend_in(SignExt_out),
.Instr_2016_in(Instr_2016_in),
.Instr_1511_in(Instr_1511_in),
.WB_out(WB_out),
.M_out(M_out),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.NPC(NPC_out),
.ReadData1(ReadData1_out),
.ReadData2(ReadData2_out),
.SignExtend(SignExt),
.Instr_2016(Instr_2016_out),
.Instr_1511(Instr_1511_out)

);

control c0 (

.clk(clk),
.rst(rst),
.opcode(OpCode),
.wb(WB),
.mem(M),
.ex(EX)

);

RegFile rf0 (

.clk(clk),
.ReadReg1(ReadReg1),
.ReadReg2(ReadReg2),
.writeReg(WriteReg),
.writeData(WriteData),
.RegWrite(RegWrite),
.Read1(ReadData1),
.Read2(ReadData2)

);

endmodule