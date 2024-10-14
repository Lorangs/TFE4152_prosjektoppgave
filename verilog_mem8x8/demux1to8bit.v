module demux1to8bit
    (
        input inp,
        input [2:0] addr,
        output [7:0] outp
    );

    wire not_addr[2:0];
    not(not_addr[0], addr[0]);
    not(not_addr[1], addr[1]);
    not(not_addr[2], addr[2]);

    and(outp[0], inp, not_addr[0], not_addr[1], not_addr[2]);
    and(outp[1], inp, not_addr[0], not_addr[1], addr[2]);
    and(outp[2], inp, not_addr[0], addr[1], not_addr[2]);
    and(outp[3], inp, not_addr[0], addr[1], addr[2]);
    and(outp[4], inp, addr[0], not_addr[1], not_addr[2]);
    and(outp[5], inp, addr[0], not_addr[1], addr[2]);
    and(outp[6], inp, addr[0], addr[1], not_addr[2]);
    and(outp[7], inp, addr[0], addr[1], addr[2]);
endmodule