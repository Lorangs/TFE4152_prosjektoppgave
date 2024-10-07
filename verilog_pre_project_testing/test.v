module adder (
   input [3:0] a,
   input [3:0] b,
   output [4:0] sum
);
   assign sum = a + b;
endmodule

module adder_tb;
   // Inputs
   reg [3:0] a;
   reg [3:0] b;
   
   // Outputs
   wire [4:0] sum;
   
   // Instantiate the Unit Under Test (UUT)
   adder uut (
      .a(a), 
      .b(b), 
      .sum(sum)
   );
   
   initial begin
      $dumpfile("./test.vcd");
      $dumpvars;
      // Initialize Inputs
      a = 4'b0000; b = 4'b0000;
      #10;
      a = 4'b0010; b = 4'b0011;
      #10;
      a = 4'b0101; b = 4'b0110;
      #10;
      a = 4'b1111; b = 4'b0001;
      #10;
      a = 4'b1001; b = 4'b0110;
      #10;
      
      // Finish simulation
      $finish;
   end;
endmodule;