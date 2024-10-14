module ram
    (
        input [7:0] inp,
        input [2:0] addr,
        input op,
        input sel,
        output [7:0] outp
    );

    wire [7:0] outp_demux;

    demux1to8bit demux1to8bit_inst1
    (
        .inp(sel),
        .addr(addr),
        .outp(outp_demux)
    );

    genvar i; generate
        for (i = 0; i < 8; i = i + 1) begin : bytecell_insts1
            bytecell bytecell_inst (
                .inp(inp),
                .rw(op),
                .sel(outp_demux[i]),
                .outp(outp)
            );
        end
    endgenerate

endmodule

module tb_ram;
    reg [7:0] inp;
    reg [2:0] addr;
    reg op;
    reg sel;
    wire [7:0] outp;

    ram ram_inst (
        .inp(inp),
        .addr(addr),
        .op(op),
        .sel(sel),
        .outp(outp)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, tb_ram);

        inp = 8'b00000000;
        addr = 3'b000;
        op = 1'b0;
        sel = 1'b0;

        #10 sel <= 1'b1; op <= 1'b1; inp <= 8'b10101010; addr <= 3'b001; // write AA to address 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1; op <= 1'b0; addr <= 3'b001; // read from address 1
        #10 sel <= 1'b0;
        #10 sel <= 1'b1; op <= 1'b0; addr <= 3'b010; // read from address 2
        #10 op <= 1'b1; inp <= 8'b10101011; // write AB to address 2
        #10 op <= 1'b0;
        #10;

    end
endmodule