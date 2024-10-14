module bitcell
    (
        input inp,
        input rw,
        input sel,
        output outp
    );

    wire pre_outp;
    wire we;
    wire re;

    dff dff_inst1
    (
        .data(inp),
        .we(we),
        .Q(pre_outp),
        .Qn()
    );

    nmos(outp, pre_outp, re);
    and(we, rw, sel);
    and(re, ~rw, sel);
endmodule

module tb_bitcell;
    reg inp;
    reg rw;
    reg sel;
    wire outp;

    bitcell bitcell_inst1
    (
        .inp(inp),
        .sel(sel),
        .rw(rw),
        .outp(outp)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, tb_bitcell);

        inp = 0;
        rw = 0;
        sel = 0;

        #10 rw <= 1;
        #10 rw <= 0;
        #10 inp <= 1; rw <= 1;
        #10 sel <= 1;
        #10 rw <= 0;
        #10 sel <= 0;
        #10 rw <= 1;
        #10 rw <= 0;
        #10;
    end
endmodule