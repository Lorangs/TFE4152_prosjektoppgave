module state_machine
    (
        input clk,
        input start,
        input done_a,
        input done_b,
        input done_c,
        output reg start_a,
        output reg start_b,
        output reg start_c,
        output reg done
    );

    parameter IDLE      = 2'b00; // parameters are like compile-time constants
    parameter WAIT_A    = 2'b01;
    parameter WAIT_B    = 2'b10;
    parameter WAIT_C    = 2'b11;

    reg [1:0] state;
    reg [1:0] state_nxt;

    always@(*)
    begin
        start_a = 0;
        start_b = 0;
        start_c = 0;
        done = 0;
        state_nxt = state;

        case(state)
        IDLE:
            if(start)
            begin
                start_a = 1;
                state_nxt = WAIT_A;
            end
        WAIT_A:
            if(done_a)
            begin
                start_b = 1;
                state_nxt = WAIT_B;
            end
        WAIT_B:
            if(done_b)
            begin
                start_c = 1;
                state_nxt = WAIT_C;
            end
        WAIT_C:
            if(done_c)
            begin
                done = 1;
                state_nxt = IDLE;
            end
        endcase
    end
endmodule
