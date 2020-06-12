//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here
	input [2:0] a,
	input [2:0] b,
	input sel,
	output [2:0] out
    );

    //Todo: define your logic here                 
	assign #5 out = (sel==1) ? b : a ;
      
endmodule
