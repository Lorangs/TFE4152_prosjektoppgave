/* 
Se vedlegg for kretskjema
Enkel bitcelle i SRAM modul.
WriteEnable og ReadEnable kan aldri være høy (1) samtidig. Ref modul ByteCell. */

module bitcell
    (
        input   inp,
        input   re,
        input   ren,
        input   we,
        input   wen,
        output  outp
    );

    wire Q0;
    wire Q1;
    wire Q2;

    pmos(Q0, inp, wen);
    nmos(Q0, inp, we);

    not(Q1, Q0);
    not(Q2, Q1);

    pmos(Q0, Q2, we);
    nmos(Q0, Q2, wen);

    pmos(outp, Q2, ren);
    nmos(outp, Q2, re);
endmodule
