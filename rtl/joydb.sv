module joydb
(
	input  logic  [6:0] USER_IN,
	input  logic  [1:0] snac_player,

	output logic [15:0] joystick1,
	output logic [15:0] joystick2,
	output logic        joystick1_en,
	output logic        joystick2_en
);

wire fire2 = ~USER_IN[4];  // CPC DB9 pin 6: Fire 2 / X / Button 1
wire fire1 = ~USER_IN[2];  // CPC DB9 pin 7: Fire 1 / Z / Button 2
wire up    = ~USER_IN[1];  // CPC DB9 pin 1
wire down  = ~USER_IN[0];  // CPC DB9 pin 2
wire left  = ~USER_IN[5];  // CPC DB9 pin 3
wire right = ~USER_IN[3];  // CPC DB9 pin 4

wire [15:0] joystick;
assign joystick[15:11] = 5'd0;
assign joystick[10]    = 1'b0;  // CPC DB9 pin 5: Fire 3 is not available with both commons wired.
assign joystick[9:7]   = 3'd0;
assign joystick[6]     = fire2;
assign joystick[5]     = 1'b0;
assign joystick[4]     = fire1;
assign joystick[3]     = up;
assign joystick[2]     = down;
assign joystick[1]     = left;
assign joystick[0]     = right;

assign joystick1    = joystick1_en ? joystick : 16'd0;
assign joystick2    = joystick2_en ? joystick : 16'd0;
assign joystick1_en = (snac_player == 2'd1);
assign joystick2_en = (snac_player == 2'd2);

endmodule
