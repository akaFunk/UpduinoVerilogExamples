// Define a module that inverts its input. This could also sit in a
// seperate file.
module inverter
    (
        inout in,
        output out
    );
    assign out = ~in;
endmodule


module top
    (
        output LED1,
        input BTN1
    );
    
    // Assign LED to inverted button using the inverter module
    inverter ledInverter(.in(BTN1), .out(LED1));
endmodule
