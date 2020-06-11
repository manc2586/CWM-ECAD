//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);

//Todo: Parameters
	parameter CLK_PERIOD = 10;
	
//Todo: Registers and wires
	reg [2:0] state;
	reg err = 0;
	reg clk;
	wire red;
	wire amber;
	wire green;

//Todo: Clock generation
	initial
	begin
		clk = 0;
		forever
			#(CLK_PERIOD/2) clk = ~clk;
	end

//Todo: User logic
    initial 
    begin
    // Test for valid states transition
        #(3*CLK_PERIOD/2) 
    	if (state != 3'b100) 
    		begin
        	$display("***FAIL 1***");    
        	err=1;
    	   end 
        #CLK_PERIOD
    	if (state != 3'b110)
    		begin
        	$display("***FAIL 2***");    
        	err=1;
    	   end 
        #CLK_PERIOD
    	if (state != 3'b001)
    		begin
        	$display("***FAIL 3***");    
        	err=1;
            end 
        #CLK_PERIOD
    	if (state != 3'b010)
            begin
        	$display("***FAIL 4***");    
        	err=1;
    	    end 
        #CLK_PERIOD
    	if (state != 3'b100)
    		begin
        	$display("***FAIL 5***");    
        	err=1;
    	    end 

end     

//Todo: Finish test, check for success
	initial 
	begin
        #500 
        if (err == 0)
        	$display("***TEST PASSED!***");
        $finish;
    end

//Todo: Instantiate counter module
	trafficlight top ( 
		.clk (clk),
		.red (red),
		.amber (amber),
		.green (green)
		);

endmodule
