`include "ram.v"
`include "FSM.v"

module mem_system
    (
        input clk,
        input [7:0] i,
        input [2:0] adr,
        input op, select,
        output [7:0] o
    );

    wire valid_connect;
    wire rw_connect;

    fsm fsm1 (
        .op(op),
        .sel(select),
        .clk(clk),
        .valid(valid_connect),
        .rw(rw_connect)
    );

    ram ram1 (
        .inp(i),
        .adr(adr),
        .op(rw_connect),
        .sel(valid_connect),
        .outp(o)
    );
endmodule