`include "flipflop.v"

module flipflop_tb;
    reg inp;
    reg clkPE;
    wire outp;

    flipflop ff1 (
        .inp(inp),
        .clkPE(clkPE),
        .outp(outp)
    );

    always begin
        #9 clkPE = 1;
        #1 clkPE = 0;
    end

    initial begin
        $dumpfile("flipflop_waveform.vcd");
        $dumpvars(1, flipflop_tb);

        inp = 0;
        clkPE = 0;
                
        #5 inp <= 1; 
        #10 inp <= 0; 
        #10 inp <= 1; 
        #10 inp <= 0;
        #100 $finish;
    end
endmodule