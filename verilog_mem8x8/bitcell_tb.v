`include "bitcell.v"        // include the module

module bitcell_tb;
    reg     inp;
    reg     re;
    reg     we;
    reg     wen;
    reg     ren;
    wire    outp;

    bitcell bitcell_inst1
    (
        .inp    (inp),
        .we     (we),
        .re     (re),
        .outp   (outp),
        .wen    (wen),
        .ren    (ren)
    );

    initial begin
        $dumpfile("bitcell_waveform.vcd");
        $dumpvars(1, bitcell_tb);

        inp = 0;
        re  = 0;
        ren = 0;
        we  = 0;
        wen = 1;

        #5 re  <= 1; ren <= 0;
        #5 re  <= 0; ren <= 1;
        #5 inp <= 1; we <= 1; wen <= 0;
        #5 we  <= 0; wen <= 1;
        #5 inp <= 0;
        #5 re  <= 1; ren <= 0;
        #5 re  <= 0; we <= 1; ren <= 1; wen <= 0;
        #5 we  <= 0; wen <= 1;
        #5 re  <= 1; ren <= 0;
        #5 re  <= 0; ren <= 1;
        #5;
    end
endmodule