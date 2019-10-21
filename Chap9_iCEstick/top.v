module top
    (
        input clk,
        output reg LED1,
        output reg LED2,
        output reg LED3,
        output reg LED4,
        input BTN1,
        input BTN2,
        input BTN3,
        input BTN4
    );
    
    // Define possible states and current/next state
    parameter STATE_LED1 = 2'b00, STATE_LED2 = 2'b01,
              STATE_LED3 = 2'b10, STATE_LED4 = 2'b11;
    reg [1:0] state = STATE_LED1, next_state;
    
    always @ (posedge clk)
    begin
        // Take over next state
        state <= next_state;
    end
    
    // Combinatorial logic
    // Compute output and next state
    always @ (BTN1, BTN2, BTN3, BTN4, state)
    begin
        // Default values
        LED1 = 0;
        LED2 = 0;
        LED3 = 0;
        LED4 = 0;
        next_state = state;
        
        // Go through all states and decide what to do depending on other inputs
        case(state)
            STATE_LED1:
            begin
                LED1 = 1;
                if(~BTN1)
                    next_state <= STATE_LED2;
            end
            STATE_LED2:
            begin
                LED2 = 1;
                if(~BTN2)
                    next_state <= STATE_LED3;
            end
            STATE_LED3:
            begin
                LED3 = 1;
                if(~BTN3)
                    next_state <= STATE_LED4;
            end
            STATE_LED4:
            begin
                LED4 = 1;
                if(~BTN4)
                    next_state <= STATE_LED1;
            end
        endcase
    end
endmodule
