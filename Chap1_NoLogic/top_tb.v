module top_tb(output led1);
    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        btn1 = 0;
        #200 $stop;
    end
    reg btn1;
    top toptest(.LED1(led1), .BTN1(btn1));
    
    always #5 btn1 = !btn1;
endmodule
