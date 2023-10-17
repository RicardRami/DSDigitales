module detector ( 
	y,
	state,
	x,
	reset,
	clk
	) ;

inout  y;
inout [2:0] state;
input  x;
input  reset;
input  clk;
