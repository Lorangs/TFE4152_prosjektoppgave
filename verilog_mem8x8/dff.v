
module dff
    (
        input data,
        input we,
        output Q,
        output Qn
    );

    wire Q1;
    wire Qn1;

    nand(Q1, we, data);
    nand(Qn1, we, ~data);
    nand(Q, Q1, Qn);
    nand(Qn, Qn1, Q);
endmodule

module tb_dff;
    reg data;
    reg we;
    wire Q;
    wire Qn;

    dff dff_inst1(
        .data(data),
        .we(we),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, tb_dff);

        data = 0;
        we = 0;

        #10 data <= 1;
        #10 data <= 0;
        #10 we <= 1;
        #10 we <= 0;
        #10 data <= 1; we <= 1;
        #10 we <= 0;
        #10 data <= 0;
        #10 we <= 1;
        #10 we <= 0;
        #10;
    end
endmodule