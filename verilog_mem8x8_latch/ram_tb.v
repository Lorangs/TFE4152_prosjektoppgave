`include "ram.v"                // include the module

// Test Bench for RAM modul
module ram_tb;
    reg     [7:0]   inp;
    reg     [2:0]   addr;
    reg             op;
    reg             sel;
    wire    [7:0]   outp;

    ram ram_inst1 (
        .inp    (inp),
        .addr   (addr),
        .op     (op),
        .sel    (sel),
        .outp   (outp)
    );

    initial begin
        $dumpfile("ram_waveform.vcd");
        $dumpvars(1, ram_tb);

        inp  = 8'b00000000;
        addr = 3'b000;
        op   = 1'b0;
        sel  = 1'b0;

        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b10101010;     addr <= 3'b001;         // write AA to address 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b001;                                 // read from address 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b010;                                 // read from address 2
        #10 op  <= 1'b1;    inp <= 8'b10101011;                                             // write AB to address 2
        #10 op  <= 1'b0;
        #10;
    end
endmodule