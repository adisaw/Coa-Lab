Fsm.v file is written to slow the clock on FGPA. 
To run on iSim 
	1.commentout the first always block of counter 
	2.Replace slow_clk by clock in the second always block. 