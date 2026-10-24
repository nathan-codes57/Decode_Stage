`timescale 1ns / 1ps


module Decode_tb();

reg RegWrite;
reg clk;
reg [31:0] Instruction;
reg [4:0] WriteReg;
reg [31:0] WriteData;
wire [1:0] WB;
wire [2:0] M;
wire [1:0] ALUOp;
wire ALUSrc;
wire RegDst;
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [31:0] SignExt;
wire [4:0] Instr_2016;
wire [4:0] Instr_1511;

Decode DUT (

.clk(clk),
.Instruction(Instruction),
.WriteReg(WriteReg),
.WriteData(WriteData),
.RegWrite(RegWrite),
.WB_out(WB),
.M_out(M),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.ReadData1_out(ReadData1),
.ReadData2_out(ReadData2),
.SignExt(SignExt),
.Instr_2016_out(Instr_2016),
.Instr_1511_out(Instr_1511)

);


 initial clk <= 0;

always #1 clk <= ~clk;

initial begin

//Write to Reg 1, 2, 3
#6
RegWrite <= 1;
WriteReg <= 4'd0;
WriteData <= 32'h00000001;
#6
WriteReg <= 4'd1;
WriteData <= 32'h00000002;
#6
WriteReg <= 4'd2;
WriteData <= 32'h00000003;

//ADD Instruction (R Type) add $0, $1, $2
#10
RegWrite <= 0;
Instruction <= 32'b00000000001000100000000000100000;
//ReadData1 should be 2 (reg1)
//ReadData2 should be 3 (reg2)
//WB should be 10
//M should be 000
//ALUOp should be 10
//ALUSrc should be 0
//RegDst should be 1
//Instr_2016 should be 00011
//Instr_1511 should be 00000

//SW Instruction (SW Type) SW $0, 4($1)
#10
Instruction <= 32'b10101100001000000000000000000100;
//ReadData1 should be 2 (reg1)
//ReadData2 should be 1 (reg0)
//WB should be 0x
//M should be 001
//ALUOp should be 00
//ALUSrc should be 1
//RegDst should be X
//Instr_2016 should be 00000
//Instr_1511 should be 00000
//SignExt should be 00000000000000000000000000000100

#20
$finish;
end
 
endmodule
