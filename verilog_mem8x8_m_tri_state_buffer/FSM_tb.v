`include "FSM.v"

module FSM_tb;
    reg clkPE;
    reg op;
    reg sel;
    wire valid;
    wire rw;

    fsm fsm1 (
        .op(op),
        .sel(sel),
        .clkPE(clkPE),
        .valid(valid),
        .rw(rw)
    );

    always begin
        #9 clkPE = 1;
        #1 clkPE = 0;
    end

    initial begin
        $dumpfile("FSM_waveform.vcd");
        $dumpvars(1, FSM_tb);

        op  = 0;
        sel = 0;

        #10 sel <= 1;
        #10 op  <= 1;
        #10 op  <= 0;
        #10 sel <= 0;
        #10 sel <= 1;
        #10 op  <= 0;
        
        #100 $finish;
    end
endmodule