module bytecell
    (
        input [7:0] inp,
        input rw,
        input sel,
        output [7:0] outp
    );

    bitcell bitcells [7:0] 
    (
        .inp(inp),
        .rw(rw),
        .sel(sel),
        .outp(outp)
    );
endmodule

module tb_bytecell;
    reg [7:0] inp;
    reg rw;
    reg sel;
    wire [7:0] outp;

    bytecell uut 
    (
        .inp(inp),
        .rw(rw),
        .sel(sel),
        .outp(outp)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, tb_bytecell);

        inp = 8'b00000000;
        rw = 0;
        sel = 0;

        #10 sel <= 1;
        #10 rw <= 0; inp <= 8'b10101010;
        #10 rw <= 1;
        #10 inp <= 8'b11001100;
        #10 rw <= 0; inp <= 8'b11110000;
        #10;
    end
endmodule