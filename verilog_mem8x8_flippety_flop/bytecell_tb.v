`include "bytecell.v"                    // include the module 


// Test Benche for the ByteCell module
module bytecell_tb;
    reg     [7:0]   inp;
    reg             op;
    reg             sel;
    wire    [7:0]   outp;

    bytecell bytecell_insts 
    (
        .inp    (inp),
        .op     (op),
        .sel    (sel),
        .outp   (outp)
    );

    initial begin
        $dumpfile("bytecell_waveform.vcd");
        $dumpvars(1, bytecell_tb);

        inp = 8'b00000000;
        op = 0;
        sel = 0;

        #5 sel  <= 1;
        #5 op   <= 0;               inp <= 8'b10101010;
        #5 op   <= 1;
        #5 inp  <= 8'b11001100;
        #5 op   <= 0;               inp <= 8'b11110000;
        #5 sel  <= 0;
        #5;
    end
endmodule