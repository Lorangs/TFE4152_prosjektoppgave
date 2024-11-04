`include "mem_system.v"

module mem_system_tb;

    reg clk;
    reg [7:0] i;
    reg [2:0] adr;
    reg op, select;
    wire [7:0] o;

    // Instantiate the Unit Under Test (UUT)
    mem_system mem_system1 (
        .clk(clk), 
        .i(i), 
        .adr(adr),
        .op(op), .select(select), 
        .o(o)
    );

    always begin
        #5 clk = 1;
        #5 clk = 0;
    end

    initial begin
        $dumpfile("mem_system_waveform.vcd");
        $dumpvars(1, mem_system_tb);

        clk = 0;
        i = 0;
        adr = 0;
        op = 0; select = 0;

        #25;
        //Write "LS SWK !" to memory
        op = 1; select = 1;
        adr = 3'b000; i = 8'b01001100; // ASCII 'L'
        #20 adr = 3'b001; i = 8'b01010011; // ASCII 'S'
        #20 adr = 3'b010; i = 8'b00100000; // ASCII space
        #20 adr = 3'b011; i = 8'b01010011; // ASCII 'S'
        #20 adr = 3'b100; i = 8'b01010111; // ASCII 'W'
        #20 adr = 3'b101; i = 8'b01001011; // ASCII 'K'
        #20 adr = 3'b110; i = 8'b00100000; // ASCII space
        #20 adr = 3'b111; i = 8'b00100001; // ASCII '!'
        #20;
        
        op = 0; select = 0; adr=3'b000; i = 8'b00000000;
        #30;

        //Read from memory
        #10 op = 0; select = 1; adr = 3'b000;
        #10 adr = 3'b001;
        #10 adr = 3'b010;
        #10 adr = 3'b011;
        #10 adr = 3'b100;
        #10 adr = 3'b101;
        #10 adr = 3'b110;
        #10 adr = 3'b111;

        #10 op = 0; select = 0; adr=3'b000;

        #100 $finish;
    end
    
endmodule