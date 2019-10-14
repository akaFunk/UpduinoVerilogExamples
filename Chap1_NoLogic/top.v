module top
    (
        output LED1,
        input BTN1
    );
    
    // Invert button and assign the value to the LED
    assign LED1 = ~BTN1;
endmodule
