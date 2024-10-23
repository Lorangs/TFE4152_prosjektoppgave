/* 
Se vedlegg for kretskjema.
En bytecelle bestående av 8 stk bitceller med enkel logikk for kontroll av 
utgangsignalene WriteEnable og ReadEnable fra inngangsignalene sel(ect) og op(eration). .
Tar inn 8 bit inp(ut) signal og fordeler informasjonen til de tilhørende 8 bitcellene.
gir tilsvarende outp(ut) fra de 8 innbyrdes bitcellene.
Modul Bitcelle er konstruert i filen bitcelle.v
 */

`include "bitcell.v"                // include bitcell module to the script

module bytecell
    (
        input   [7:0]   inp,        // input
        input   [7:0]   inpn,       // input not
        input           op,         // operation, write = 1, read = 0
        input           sel,        // select. 1 if read/write operation is valid for one bytecell, else 0.
        output  [7:0]   outp        // output
    );

    wire re;                     // read enable
    wire ren;                    // read enable not
    wire we;                     // write enable
    wire opn;

    // F Block. Se vedlegg for kretskjema
    not(opn, op);                   // opn = ~op
    and(we, sel, op);               // we = sel & op
    nand(ren, sel, opn);            // ren = sel & ~op
    not(re, ren);                   // re = ~ren

    // 8 stk bitceller
    genvar i;   generate
        for(i = 0; i < 8; i = i + 1) begin : bitcell_insts_i
            bitcell bitcells
            (
                .inp    (inp[i]),
                .inpn   (inpn[i]),
                .we     (we),
                .re     (re),
                .ren    (ren),
                .outp   (outp[i])
            );
        end
    endgenerate
endmodule