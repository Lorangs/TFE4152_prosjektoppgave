module fifo(
    input   [15:0]      data_in,
    input               push,
    input               pop,
    output  [15:0]      data_out,
    output              fifo_full,
    output              fifo_empty
);

    wire                push;
    wire                pop;
    wire    [3:0]       count;
    
    counter counter_inst_1 (
        .increment      (push),
        .decrement      (pop),
        .count          (count)
    );

endmodule
