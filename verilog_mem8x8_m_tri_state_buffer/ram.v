`include "bytecell.v"               
`include "demux1to8bit.v"

module ram
    (
        input   [7:0]   inp,
        input   [2:0]   adr,
        input           op,
        input           sel,
        output  [7:0]   outp
    );

    wire    [7:0]   outp_demux;
    wire    [7:0]   inpn;

    // invert the input
    genvar j; generate
        for(j = 0; j < 8; j = j + 1) begin : inpn_insts1
            assign inpn[j] = ~inp[j];
        end
    endgenerate

    demux1to8bit demux1to8bit_inst1
    (
        .inp    (sel),
        .adr    (adr),
        .outp   (outp_demux)
    );

    // instantiate 8 bytecell modules
    genvar i; generate
        for (i = 0; i < 8; i = i + 1) begin : bytecell_insts1
            bytecell bytecell_inst (
                .inp    (inp),
                .inpn   (inpn),
                .op     (op),
                .sel    (outp_demux[i]),
                .outp   (outp)
            );
        end
    endgenerate
endmodule