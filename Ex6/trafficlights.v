//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//
//   Red  Amber Green
//    x     x     x
//
//  Legal states:    100  110  001  010
//  
//  Illegal states:  000  011  101  111
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module trafficlight(
	input clk,
	
	output red,
	output amber,
	output green
	);
	
	reg [2:0] state;

	assign red = state[2];
	assign amber = state[1];
	assign green = state[0];

	always @(posedge clk)
	begin
		case(state)
			// red light
			3'b100: begin
				state <= 3'b110;
				end
			// red and orange
			3'b110: begin
				state <= 3'b001;
				end
			// green
			3'b001: begin
				state <= 3'b010;
				end
			// orange
			3'b010: begin
				state <= 3'b100;
				end
			// illegal states
			default: begin
				state <= 3'b100;
				end
		endcase
	end
	

endmodule
	
