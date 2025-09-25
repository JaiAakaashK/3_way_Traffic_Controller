module test_tb();
    reg clk, rst;
    wire wg1, wg2, eg1, eg2, ng1, ng2, wy, ey, ny, wr, nr, er;

    // Instantiate the DUT
    Test t1(clk, rst, wg1, wg2, eg1, eg2, ng1, ng2, wy, ey, ny, wr, nr, er);

    // Clock generation: 50 MHz (20 ns period)
    always #10 clk = ~clk;

    // Initial block for reset and simulation control
    initial begin
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        #750 $finish;
    end

    // Monitor signals during simulation
    initial begin
        $monitor("time=%0t | rst=%b | wg1=%b wg2=%b | eg1=%b eg2=%b | ng1=%b ng2=%b | wy=%b ey=%b ny=%b | wr=%b nr=%b er=%b",
                 $time, rst, wg1, wg2, eg1, eg2, ng1, ng2, wy, ey, ny, wr, nr, er);
    end
endmodule
