//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module dice(
	input rst,
	input clk,
	input button,
	
	output reg [2:0] throw
	);
	
	always @(posedge clk)
	begin
		// reset
		if(rst == 1)
			throw <= 2'b000;
		// rectify illegal values
		else if(throw == 2'b000 || throw == 2'b111)
			throw <= 2'b001;
		// button pressed
		else if(button)
		begin
			if(throw == 2'b110)
				throw <= 2'b001;
			else
				throw <= throw + 1;
		end
		// button not pressed
		else
			throw <= throw;	
	end
	
endmodule
