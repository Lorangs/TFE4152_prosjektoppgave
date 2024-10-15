// mux
always @(*)
begin 
    case(addr)
        2'b00:  out = a;
        2'b01:  out = b;
        2'b10:  out = c;
        2'b11:  out = d;
    endcase
end


// demux
always @(*)
begin
    case (addr)
        2'b00:  {a,b,c,d} = {in, 3'b0}
        2'b01:  {a,b,c,d} = {1'b0, in, 2'b0}
        2'b10:  {a,b,c,d} = {2'b0, in, 1'b0}
        2'b11:  {a,b,c,d} = {3'b0, in}
    endcase 
end


// register
always @(posedge clk)
begin
    if(reset)       reg_out <= 0;
    else if(en)     reg_out <= reg_in;
end


// declaration. 2 likestilte deklarasjoner
reg [16:0]  c;
always @(*)
    c = a + b;

wire [16:0] c;

