module flipflop
    (
        input   inp,
        input   clkPE,
        output  outp
    );

    wire P0;
    wire P1;
    wire inpn;
    wire outpn;

    not(inpn, inp);
    nand(P0, inp, clkPE);
    nand(P1, inpn, clkPE);
    nand(outp, P0, outpn);
    nand(outpn, P1, outp);
endmodule