`include "FSM.v"

module FSM_tb;
    reg clk;
    reg op;
    reg sel;
    wire valid;
    wire rw;

    fsm fsm1 (
        .op(op),
        .sel(sel),
        .clk(clk),
        .valid(valid),
        .rw(rw)
    );

    always begin
        #5 clk = 1;
        #5 clk = 0;
    end

    initial begin
        $dumpfile("FSM_waveform.vcd");
        $dumpvars(1, FSM_tb);

        clk = 0;
        op  = 0;
        sel = 0;

        #10 op <= 0; sel <= 1; // read, valid = 1, rw = 0
        #20;
        #10 op <= 1; sel <= 1; // write, valid = 1, rw = 1
        #20; // occilate between write and stable
        #10 op <= 0; sel <= 0;
        
        #100 $finish;
    end
endmodule