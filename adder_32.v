module adder_32 (
  input [31:0] a,
  input [31:0] b,
  input        cin,    //carry input
  output [31:0] sum,
  output        count  //carry output
);

  assign {count, sum} = a + b + cin;

endmodule      
