module Traffic_Controller_3_way_tb();
    reg clk, rst;
    wire wg1, wg2, eg1, eg2, ng1, ng2, wy, ey, ny, wr, nr, er;
    Traffic_Controller_3_way t1(clk, rst, wg1, wg2, eg1, eg2, ng1, ng2, wy, ey, ny, wr, nr, er);
    always #10 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        #750 $finish;
    end
    initial begin
        $monitor("time=%0t | rst=%b | wg1=%b wg2=%b | eg1=%b eg2=%b | ng1=%b ng2=%b | wy=%b ey=%b ny=%b | wr=%b nr=%b er=%b",
                 $time, rst, wg1, wg2, eg1, eg2, ng1, ng2, wy, ey, ny, wr, nr, er);
    end
endmodule



