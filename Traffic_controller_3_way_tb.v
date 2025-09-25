module Traffic_controller_3_way_tb();
    reg clk, rst;
    wire west_green_straight, west_green_right, east_green_straight, east_green_left, south_green_right, south_green_left, west_yellow, east_yellow, south_yellow, west_red, south_red, east_red;

   
	  Traffic_controller_3_way dut (
        .clk(clk),
        .rst(rst),
        .west_green_straight(west_green_straight),
        .west_green_right(west_green_right),
        .east_green_straight(east_green_straight),
        .east_green_left(east_green_left),
        .south_green_right(south_green_right),
        .south_green_left(south_green_left),
        .west_yellow(west_yellow),
        .east_yellow(east_yellow),
        .south_yellow(south_yellow),
        .west_red(west_red),
        .south_red(south_red),
        .east_red(east_red)
    );
	 
    always #10 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        #20;
        rst = 0;
        #750 $finish;
    end
	 
    initial begin
        $monitor("time=%0t | rst=%b | west_green_straight=%b west_green_right=%b | east_green_straight=%b east_green_left=%b | south_green_right=%b south_green_left=%b | west_yellow=%b east_yellow=%b south_yellow=%b | west_red=%b south_red=%b east_red=%b",
                 $time, rst, west_green_straight, west_green_right, east_green_straight, east_green_left, south_green_right, south_green_left, west_yellow, east_yellow, south_yellow, west_red, south_red, east_red);
    end
endmodule
