// Source, our Indian friend: https://www.youtube.com/watch?v=nblGw37Fv8A&t=2240s

module counter(
input clk,
input reset,
input increment,
input decrement,
output reg [3:0] count // [3:0] means 4 bits (from 3 to 0). Always set outputs to reg
);

reg enable; // always use reg for things set in "always@..." blocks as well
reg [3:0] mux_out; // reg does not mean flip-flop register, it just means "store"

always@(*) // always means "always do this"
    enable = increment | decrement; // enable is set to bitwise OR of increment and decrement

always@(*) // * means "any change"
begin
    case (increment) // case is like a switch statement, basically a mux
    1'b0: mux_out = count - 1; // if increment is 0, then mux_out is count - 1
    1'b1: mux_out = count + 1;
    endcase
end

always@(posedge clk) // posedge means "positive edge of clock", this block always runs on posedge
begin
    if (reset) // if reset is set to high, 1
        count <= #1 0; // count is set to 0, but after 1 time unit.
    else if (enable)
        count <= #1 mux_out; // Use <= to not make the program wait for the delay before writing
end

endmodule



`timescale 1ns/1ps
module tb_counter; //tb stands for testbench. testbenches have no inputs or outputs, they just test

// Variables ------------------------------------------
reg clk;
reg reset;
reg increment;
reg decrement;
wire [3:0] count; // outputs from modules, used as inputs to somewhere else, are always set to wires

counter counter_inst1( // make an instance of the counter module
    .clk (clk), // .clk means "connect this to the clk input of the counter module", in this case to reg clk
    .reset (reset), // generally best practice to name the inputs and outputs the same as the module
    .increment (increment),
    .decrement (decrement),
    .count (count)
);

// Clock generation -----------------------------------
initial // initial means "do this once at the start of the simulation at the same time as other initial blocks"
begin
    clk = 0;
    forever begin
        #5 clk = ~clk; //clk toggles every 5 time units, meaning 10 tu per cycle. Notice "=" not "<=" to wait for delay
    end
end // it would be possible to put this together with the block below, but this is more readable

// Simulation -----------------------------------------
initial
begin
    $dumpfile("waveform.vcd"); // where to log the waveform from the test
    $dumpvars(1, tb_counter); // level of logging. 2 means counter is included

    increment = 0;
    decrement = 0;
    reset = 0;

    @(posedge clk) //at the first rising edge of the clock
        reset <= #1 1;
    @(posedge clk) //at the second rising edge
        reset <= #1 0;
    
    //different syntax under, does the same thing
    @(posedge clk); //third rising edge
        #1 increment = 1;
    repeat(2) @(posedge clk); //fifth (skipped fourth) rising edge
        #1 increment = 0;
        decrement = 1;
    @(posedge clk); //sixth rising edge
        #1 decrement = 0;
    
    $display("count = %d", count); // prints this to the terminal at this point in the simulation
    repeat(10)@(posedge clk); //extra time for stabilization
    $finish; // end the simulation
end

endmodule



// Using Icarus Verilog and GTKWave -----------------------------------

// Compiling with: $iverilog PATH
// Compile all verilog files together: $iverilog *.v
// Set output file: $iverilog -o OUTPUT_FILE PATH

// Running with: $vvp a.out

// Viewing with: $gtkwave WAVEFORM_FILE

