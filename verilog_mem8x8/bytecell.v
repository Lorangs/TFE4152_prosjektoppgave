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
        input           op,         // operation, write = 1, read = 0
        input           sel,        // select. 1 if read/write operation is valid for one bytecell, else 0.
        output  [7:0]   outp        // output
    );
    wire    re;                     // read enable
    wire    we;                     // write enable
    

    and(we, sel, op);               // we = sel & op
    and(re, sel, ~op);              // re = sel & ~op


    bitcell bitcells [7:0]          // 8xbitcell
    (
        .inp(inp),
        .re(re),
        .we(we),
        .outp(outp)
    );
endmodule