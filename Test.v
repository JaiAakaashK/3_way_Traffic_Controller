module Test(
input clk,rst,
output reg west_green_straight,west_green_right,east_green_straight,east_green_left,south_green_right,south_green_left,
output reg west_yellow,east_yellow,south_yellow,
output reg west_red,south_red,east_red
);
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
reg[2:0] state,next_state;
reg [3:0]count_green;
reg [3:0]count_yellow;


always @(posedge clk or posedge rst) begin
if (rst)
state <= s0;
else
state <= next_state;
end

always @(posedge clk or posedge rst) begin
if (rst) begin
count_green <= 0;
count_yellow <= 0;
end else begin
case(state)

s0:begin
if(state!=next_state)begin
count_green<=0;
end
else begin
count_green<=count_green+1;
end
end

s1:begin
if(state!=next_state)begin
count_yellow<=0;
end
else begin
count_yellow<=count_yellow+1;
end				
end				
				
s2:begin
if(state!=next_state)begin
count_green<=0;
end
else begin
count_green<=count_green+1;
end
end
				
s3:begin
if(state!=next_state)begin
count_yellow<=0;
end
else begin
count_yellow<=count_yellow+1;
end
end
			
s4:begin
if(state!=next_state)begin
count_green<=0;
end
else begin
count_green<=count_green+1;
end
end
				
s5:begin
if(state!=next_state)begin
count_yellow<=0;
end
else begin
count_yellow<=count_yellow+1;
end
end
				
default: begin
count_green <= 0;
count_yellow <= 0;
end
endcase
end
end


always @(*)begin
next_state=state;
case(state)

s0:begin
if(count_green>=8)
next_state<=s1;
else
next_state<=s0;
end

s1:begin
if(count_yellow>=2)
next_state<=s2;
else
next_state<=s1;
end


s2:begin
if(count_green>=8)
next_state<=s3;
else
next_state<=s2;
end

s3:begin
if(count_yellow>=2)
next_state<=s4;
else
next_state<=s3;
end


s4:begin
if(count_green>=8)
next_state<=s5;
else
next_state<=s4;
end


s5:begin
if(count_yellow>=2)
next_state<=s0;
else
next_state<=s5;
end

default:begin
next_state<=s0;

end
endcase
end


always @(*)begin
west_green_straight = 1'b0; west_green_right = 1'b0; west_red  = 1'b1; west_yellow  = 1'b0;
east_green_straight = 1'b0; east_green_left = 1'b0; east_red  = 1'b1; east_yellow  = 1'b0;
south_green_right = 1'b0; south_green_left = 1'b0; south_red  = 1'b1; south_yellow  = 1'b0;

case(state)
s0:begin
west_green_straight=1;
west_green_right=1;
west_red=0;
south_green_left=1;
end

s1:begin
west_yellow=1;
end

s2:begin
south_green_right=1;
south_green_left=1;
south_red=0;
east_green_left=1;
end

s3:begin
south_yellow=1;
end

s4:begin
east_green_straight=1;
east_green_left=1;
east_red=0;
end

s5:begin
east_yellow=1;
end
endcase
end
endmodule







