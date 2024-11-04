`include "demux1to8bit.v"                  // include the module

// Test bench for 1 to 8 dembux
module demux1to8bit_tb;
    reg             inp;
    reg     [2:0]   adr;
    wire    [7:0]   outp;

    demux1to8bit demux1to8bit_inst1 (
        .inp    (inp),
        .adr   (adr),
        .outp   (outp)
    );

    initial begin 
        $dumpfile("demux1to8bit_wavefile.vcd");
        $dumpvars(1, demux1to8bit_tb);
        
        inp     = 1'b0;
        adr    = 3'b000;

        #5;
        #5  inp  <= 1'b1;    
        #5  adr <= 3'b001;
        #5  adr <= 3'b010;
        #5  adr <= 3'b011;
        #5  adr <= 3'b100;
        #5  adr <= 3'b101;
        #5  adr <= 3'b110;
        #5  adr <= 3'b111;
        #5  inp  <= 1'b0;
        #5;
    end
endmodule