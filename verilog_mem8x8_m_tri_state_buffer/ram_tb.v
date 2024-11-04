`include "ram.v"                // include the module

// Test Bench for RAM modul
module ram_tb;
    reg     [7:0]   inp;
    reg     [2:0]   adr;
    reg             op;
    reg             sel;
    wire    [7:0]   outp;

    ram ram_inst1 (
        .inp    (inp),
        .adr   (adr),
        .op     (op),
        .sel    (sel),
        .outp   (outp)
    );

    initial begin
        $dumpfile("ram_waveform.vcd");
        $dumpvars(1, ram_tb);

        inp  = 8'b00000000;
        adr = 3'b000;
        op   = 1'b0;
        sel  = 1'b0;

                #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b10101010;     adr <= 3'b001;         // write AA to adress 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b001;                                 // read from adress 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b11001100;     adr <= 3'b010;         // write CC to adress 2
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b010;                                 // read from adress 2
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b11110000;     adr <= 3'b011;         // write F0 to adress 3
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b011;                                 // read from adress 3
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b00001111;     adr <= 3'b100;         // write 0F to adress 4
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b100;                                 // read from adress 4
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b00110011;     adr <= 3'b101;         // write 33 to adress 5
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b101;                                 // read from adress 5
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b01010101;     adr <= 3'b110;         // write 55 to adress 6
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b110;                                 // read from adress 6
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b10011001;     adr <= 3'b111;         // write 99 to adress 7
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b111;                                 // read from adress 7
        #10 sel <= 1'b0;

        #10;

/*         #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b10101010;     adr <= 3'b001;         // write AA to adress 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b001;                                 // read from adress 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     adr <= 3'b010;                                 // read from adress 2
        #10 op  <= 1'b1;    inp <= 8'b10101011;                                             // write AB to adress 2
        #10 op  <= 1'b0;
        #10 adr <= 3'b001;

        #10; */
    end
endmodule