module top
    (
        output reg LED1,
        output reg LED2,
        output reg LED3,
        output reg LED4
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
    
    // Define possible states and current/next state
    parameter STATE_LED1 = 2'b00, STATE_LED2 = 2'b01,
              STATE_LED3 = 2'b10, STATE_LED4 = 2'b11;
    reg [1:0] state = STATE_LED1, next_state;
    
    // Counter for the chaser light
    reg [19:0] counter = 0;
    
    always @ (posedge clk)
    begin
        // Take over next state
        state <= next_state;
        
        // Increment counter
        counter <= counter + 1;
    end
    
    // Combinatorial logic
    // Compute output and next state
    always @ (counter, state)
    begin
        // Default values
        LED1 <= 0;
        LED2 <= 0;
        LED3 <= 0;
        LED4 <= 0;
        next_state <= state;
        
        // Go through all states and decide what to do depending on other inputs
        case(state)
            STATE_LED1:
            begin
                LED1 <= 1;
                if(counter == 0)
                    next_state <= STATE_LED2;
            end
            STATE_LED2:
            begin
                LED2 <= 1;
                if(counter == 0)
                    next_state <= STATE_LED3;
            end
            STATE_LED3:
            begin
                LED3 <= 1;
                if(counter == 0)
                    next_state <= STATE_LED4;
            end
            STATE_LED4:
            begin
                LED4 <= 1;
                if(counter == 0)
                    next_state <= STATE_LED1;
            end
        endcase
    end
endmodule
