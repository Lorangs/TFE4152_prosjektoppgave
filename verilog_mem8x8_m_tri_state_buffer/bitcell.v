/* 
Se vedlegg for kretskjema
Enkel bitcelle i SRAM modul.
WriteEnable og ReadEnable kan aldri være høy (1) samtidig. Ref modul ByteCell. */

module bitcell
    (
        input   inp,
        input   inpn,
        input   we,
        input   re,
        input   ren,
        output  outp
    );

    wire Q0;
    wire Q0n;
    wire Q1;
    wire Q1n;
    wire T0;
    wire T1;

    // supply rails. Logical 1
    supply1 VDD;
    supply0 GND;

    // D-latch
    nand(Q0, inp, we);
    nand(Q0n, inpn, we);
    nand(Q1, Q0, Q1n);
    nand(Q1n, Q0n, Q1);

    // Tri-state buffer
    pmos(T0, VDD, Q1n);
    nmos(T1, GND, Q1n);
    pmos(outp, T0, ren);
    nmos(outp, T1, re);
endmodule

