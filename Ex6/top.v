//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module dotl(
	// inputs and outputs of the macro setup
	input rst,
	input clk,
	input button,
	input sel,
	output [2:0] result
	);
	
	// internal wires
	wire [2:0] throw;
	wire [2:0] state;

	// instantiate dice
	dice christina(
		.rst (rst), 
		.clk (clk),
		.button (button),
		.throw (throw[2:0])
		);

	// instantiate traffice lights
	trafficlight tl(
		.clk (clk),
		.red (state[2]),
		.amber (state[1]),
		.green (state[0])
		);

	// instantiate multiplexer
    mux multiplexer(
    	.a (throw [2:0]),
    	.b (state [2:0]),
    	.sel (sel),
     	.out (result [2:0])
     	);
  
endmodule
