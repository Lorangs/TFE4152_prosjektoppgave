`include "bitcell.v"        // include the module

module bitcell_tb;
    reg     inp;
    reg     inpn;
    reg     re;
    reg     ren;
    reg     we;
    wire    outp;

    bitcell bitcell_inst1
    (
        .inp    (inp),
        .inpn   (inpn),
        .we     (we),
        .re     (re),
        .ren    (ren),
        .outp   (outp)
    );

    initial begin
        $dumpfile("bitcell_waveform.vcd");
        $dumpvars(1, bitcell_tb);

        inp     = 0;
        inpn    = 1;
        re      = 0;
        ren     = 1;
        we      = 0;

        #5 re  <= 1; ren <= 0;
        #5 re  <= 0; ren <= 1;
        #5 inp <= 1; inpn <= 0; we <= 1; 
        #5 we  <= 0; 
        #5 inp <= 0; inpn <= 1;
        #5 re  <= 1; ren <= 0;
        #5 re  <= 0; ren <= 1; we <= 1; 
        #5 we  <= 0; 
        #5 re  <= 1; ren <= 0;
        #5 re  <= 0; ren <= 1;
        #5;
    end
endmodule