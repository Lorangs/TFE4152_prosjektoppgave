
// parameter declaration
parameter IDLE      = 2'b00;
parameter WAIT_A    = 2'b01;
parameter WAIT_B    = 2'b10;
parameter WAIT_C    = 2'b11;

reg [1:0]   state;
reg [1:0]   state_nxt;


// On reset initialize state back to IDLE after #1 tick
always @(posedge clk) begin 
    if (reset)
        state <= #1 IDLE;
    else
        state <= #1 next_state;
end

always @(*) begin  
    // initial values of state
    start_a     = 0;
    start_b     = 0;
    start_c     = 0;
    done        = 0;
    state_nxt   = state;

    case(IDLE)
        IDLE:
            if(start) begin
                start_a = 1;
                state_nxt = WAIT_A; end

        WAIT_A:
            if (done_a) begin
                start_b = 1;
                state_nxt = WAIT_B; end
        WAIT_B:
            if (done_b) begin
                start_c = 1;
                state_nxt = WAIT_C; end
        WAIT_C:
            if (done_c) begin
                done = 1;
                state_nxt = IDLE;   end
    endcase
end