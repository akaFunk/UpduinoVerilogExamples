module top
    (
        output reg LED1,
        input BTN1,
        input BTN2
    );
    
    // Always block is triggered when one of the signals in the sensitivity list changes
    always @ (BTN1, BTN2)
    begin
        // Invert button and assign the value to the LED
        if(~BTN1 & ~BTN2)
            LED1 = 1;
        else
            LED1 = 0;
    end    
endmodule
