`include "bytecell.v"                    // include the module 


// Test Benche for the ByteCell module
module bytecell_tb;
    reg     [7:0]   inp;
    reg     [7:0]   inpn;
    reg             op;
    reg             sel;
    wire    [7:0]   outp;

    bytecell bytecell_insts1 
    (
        .inp    (inp),
        .inpn   (inpn),
        .op     (op), 
        .sel    (sel),
        .outp   (outp)
    );

    initial begin
        $dumpfile("bytecell_waveform.vcd");
        $dumpvars(1, bytecell_tb);

        inp = 8'b00000000;
        inpn = 8'b11111111;
        op = 0;
        sel = 0;

        #5 sel  <= 1;
        #5 op   <= 0;               inp <= 8'b10101010; inpn <= 8'b01010101;
        #5 op   <= 1;
        #5 inp  <= 8'b11001100;     inpn <= 8'b00110011;
        #5 op   <= 0;               inp <= 8'b11110000; inpn <= 8'b00001111;
        #5 sel  <= 0;
        #5 op   <= 1; sel <= 1;
        #5 op   <= 0;               inp <= 8'b01010101; inpn <= 8'b10101010;
        #5 op   <= 1; sel <= 0;
        #5 op   <= 0;               inp <= 8'b00000000; inpn <= 8'b11111111;
        #5 sel  <= 1;
        #5;
    end
endmodule