module top
    (
        output LED1,
        input [0:1] BTN
    );
    
    // Invert button and assign the value to the LED
    assign LED1 = ~BTN[0] & ~BTN[1];
endmodule
