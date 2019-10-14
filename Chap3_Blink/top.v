module top
    (
        output reg LED1
    );
    
    // Initialize internal high speed clock source
    wire clk;
    SB_HFOSC u_hfosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );
    // 0b00 = 48 MHz, 0b01 = 24 MHz, 0b10 = 12 MHz, 0b11 = 6 MHz
    defparam u_hfosc.CLKHF_DIV = "0b11";
    
    // Register (memory/flip-flop) for a counter
    reg [31:0] counter;
    
    always @ (posedge clk)
    begin
        // If the counter reached 1200000 (200 ms), reset it, else
        // increment counter on every positive edge of clk
        if (counter > 1200000)
            counter <= 0;
        else
            counter <= counter + 1;
        
        // If the counter is larger than 600000 (100 ms), turn on led,
        // else turn it off
        if (counter > 600000)
            LED1 <= 1;
        else
            LED1 <= 0;
    end
endmodule
