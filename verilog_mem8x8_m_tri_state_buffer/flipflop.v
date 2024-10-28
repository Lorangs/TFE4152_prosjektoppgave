module flipflop
    (
        input   inp,
        input   clk,
        output  outp
    );

    wire P0;
    wire P1;
    wire inpn;
    wire outpn;
    wire clkN;
    wire clkPE;

    not(clkN, clk);
    and(clkPE, clk, clkN);

    not(inpn, inp);
    nand(P0, inp, clkPE);
    nand(P1, inpn, clkPE);
    nand(outp, P0, outpn);
    nand(outpn, P1, outp);
endmodule