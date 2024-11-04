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

    not(inpn[0], inp[0]);
    not(inpn[1], inp[1]);
    not(inpn[2], inp[2]);
    not(inpn[3], inp[3]);
    not(inpn[4], inp[4]);
    not(inpn[5], inp[5]);
    not(inpn[6], inp[6]);
    not(inpn[7], inp[7]);

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