`include "bitcell.v"        // include the module

module bitcell_tb;
    reg     inp;
    reg     re;
    reg     we;
    wire    outp;

    bitcell bitcell_inst1
    (
        .inp    (inp),
        .we     (we),
        .re     (re),
        .outp   (outp)
    );

    initial begin
        $dumpfile("bitcell_waveform.vcd");
        $dumpvars(1, bitcell_tb);

        inp = 0;
        re  = 0;
        we  = 0;

        #5 re  <= 1;
        #5 re  <= 0;
        #5 inp <= 1; we <= 1;
        #5 we  <= 0;
        #5 inp <= 0;
        #5 re  <= 1;
        #5 re  <= 0; we <= 1;
        #5 we  <= 0;
        #5 re  <= 1;
        #5 re  <= 0;
        #5;
    end
endmodule