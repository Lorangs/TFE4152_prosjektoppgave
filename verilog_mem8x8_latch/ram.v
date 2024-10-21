/* 
8x8 bit SRAM modul
se vedlegg for kretskjema.
 */

// include the bytecell modules used for this project
`include "bytecell.v"               
`include "demux1to8bit.v"

module ram
    (
        input   [7:0]   inp,
        input   [2:0]   addr,
        input           op,
        input           sel,
        output  [7:0]   outp
    );

    wire    [7:0]   outp_demux;

    demux1to8bit demux1to8bit_inst1
    (
        .inp    (sel),
        .addr   (addr),
        .outp   (outp_demux)
    );

    genvar i; generate
        for (i = 0; i < 8; i = i + 1) begin : bytecell_insts1
            bytecell bytecell_inst (
                .inp    (inp),
                .op     (op),
                .sel    (outp_demux[i]),
                .outp   (outp)
            );
        end
    endgenerate

endmodule