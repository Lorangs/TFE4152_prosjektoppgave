module counter(
    // variable declaration
    input               clk,
    input               reset,
    input               increment,
    input               decrement,
    output reg [3:0]    count
);
    reg                 enable;
    reg     [3:0]       mux_out;

    always @(*)
        enable = increment | decrement;

    always @(*)
    begin
        case(increment)
            1'b0:   mux_out = count - 1;
            1'b1:   mux_out = count + 1;
        endcase
    end

    always @(posedge clk)
    begin 
        if (reset)
            count <= #1 0;
        else if(enable)
            count <= #1 mux_out;
    end
endmodule



module tb_counter;
    // varibale declaration
    reg             clk;
    reg             reset;
    reg             increment;
    reg             decrement;
    wire    [3:0]   count;

    // instance of counter module
    counter counter_inst1(
        .clk        (clk),
        .reset      (reset),
        .increment  (increment),
        .decrement  (decrement),
        .count      (count)
    );
//--------------------------------------------------------------------
// Clock Genereation
    initial begin  
        clk = 0;
        forever begin
                #5 clk = ~clk;
        end
    end
//-----------------------------------------------------------------------
// main simulation
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(2, tb_counter);

        increment = 0;
        decrement = 0;
        reset = 0;

        @(posedge clk)
            reset <= #1 1;
        @(posedge clk)
            reset <= #1 0;
        @(posedge clk);
            #1 increment = 1;
        repeat(2) @(posedge clk);
            #1  increment = 0;
                decrement = 1; 
        @(posedge clk);
            #1  decrement = 0;

        $display("count = %d", count);
        repeat(10)@(posedge clk);
        $stop;
    end
endmodule


