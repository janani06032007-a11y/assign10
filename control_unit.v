module control_unit(
 input [6:0]Opcode,
 output reg RegWrite,
 output reg ALUSrc,
 output reg MemRead,
 output reg MemWrite,
 output reg MemtoReg,
 output reg Branch,
 output reg ALUOp);

always @(*) begin
  case(Opcode)
   
  //R-type
  7'b0110011: begin
    RegWrite = 1;
    ALUSrc = 0;
    MemRead = 0;
    MemWrite = 0;
    MemtoReg = 0;
    Branch = 0;
    ALUOp = 2'b10;
   end

//I-type
  7'b0010011: begin
    RegWrite = 1;
    ALUSrc = 1;
    MemRead = 0;
    MemWrite = 0;
    MemtoReg = 0;
    Branch = 0;
    ALUOp = 2'b11;
   end

//LW
  7'b0000011: begin
    RegWrite = 1;
    ALUSrc = 1;
    MemRead = 1;
    MemWrite = 0;
    MemtoReg = 1;
    Branch = 0;
    ALUOp = 2'b00;
   end

//SW
  7'b0100011: begin
    RegWrite = 0;
    ALUSrc = 1;
    MemRead = 0;
    MemWrite = 1;
    MemtoReg = 0;
    Branch = 0;
    ALUOp = 2'b00;
   end
 
//BEQ
  7'b1100011: begin
    RegWrite = 0;
    ALUSrc = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 1;
    ALUOp = 2'b01;
   end


 default: begin
    RegWrite = 0;
    ALUSrc = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 1;
    ALUOp = 2'b00;
   end
  endcase
end
endmodule
