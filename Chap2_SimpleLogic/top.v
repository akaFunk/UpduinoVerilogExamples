module top
    (
        output LED1,
        input BTN1,
        input BTN2
    );
    
    // Invert button and assign the value to the LED
    assign LED1 = ~BTN1 & ~BTN2;
endmodule
