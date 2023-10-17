module estados ( 
	reset,
	x1,
	x0,
	clk,
	input_state,
	z
	) ;

input  reset;
input  x1;
input  x0;
input  clk;
inout [1:0] input_state;
inout  z;
