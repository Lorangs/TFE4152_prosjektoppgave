/* 
8 to 1 demux module
Se vedlegg for kretskjema 
*/
module demux1to8bit
    (
        input           inp,
        input   [2:0]   adr,
        output  [7:0]   outp
    );

    wire    [2:0]   not_adr;

    not(not_adr[0], adr[0]);
    not(not_adr[1], adr[1]);
    not(not_adr[2], adr[2]);

    and(outp[0],    inp,    not_adr[2],    not_adr[1],    not_adr[0]);
    and(outp[1],    inp,    not_adr[2],    not_adr[1],    adr[0]);
    and(outp[2],    inp,    not_adr[2],    adr[1],        not_adr[0]);
    and(outp[3],    inp,    not_adr[2],    adr[1],        adr[0]);
    and(outp[4],    inp,    adr[2],        not_adr[1],    not_adr[0]);
    and(outp[5],    inp,    adr[2],        not_adr[1],    adr[0]);
    and(outp[6],    inp,    adr[2],        adr[1],        not_adr[0]);
    and(outp[7],    inp,    adr[2],        adr[1],        adr[0]);

endmodule


