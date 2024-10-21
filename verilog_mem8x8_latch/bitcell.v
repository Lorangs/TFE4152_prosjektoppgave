/* 
Se vedlegg for kretskjema
Enkel bitcelle i SRAM modul.
WriteEnable og ReadEnable kan aldri være høy (1) samtidig. Ref modul ByteCell. */

module bitcell
    (
        input   inp,
        input   re,
        input   we,
        output  outp
    );

    wire Q0;
    wire Qn0;
    wire Q1;
    wire Qn1;

    nand(Q1, we, inp);
    nand(Qn1, we, ~inp);
    nand(Q0, Q1, Qn0);
    nand(Qn0, Qn1, Q0);
    nmos(outp, Q0, re);
endmodule
