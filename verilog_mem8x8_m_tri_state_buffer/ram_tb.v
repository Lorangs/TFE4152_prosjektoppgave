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
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b11001100;     addr <= 3'b010;         // write CC to address 2
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b010;                                 // read from address 2
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b11110000;     addr <= 3'b011;         // write F0 to address 3
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b011;                                 // read from address 3
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b00001111;     addr <= 3'b100;         // write 0F to address 4
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b100;                                 // read from address 4
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b00110011;     addr <= 3'b101;         // write 33 to address 5
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b101;                                 // read from address 5
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b01010101;     addr <= 3'b110;         // write 55 to address 6
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b110;                                 // read from address 6
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b10011001;     addr <= 3'b111;         // write 99 to address 7
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b111;                                 // read from address 7
        #10 sel <= 1'b0;

        #10;

/*         #10 sel <= 1'b1;    op <= 1'b1;     inp <= 8'b10101010;     addr <= 3'b001;         // write AA to address 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b001;                                 // read from address 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1;    op <= 1'b0;     addr <= 3'b010;                                 // read from address 2
        #10 op  <= 1'b1;    inp <= 8'b10101011;                                             // write AB to address 2
        #10 op  <= 1'b0;
        #10 addr <= 3'b001;

        #10; */
    end
endmodule