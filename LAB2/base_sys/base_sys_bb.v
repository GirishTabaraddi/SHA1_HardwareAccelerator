
module base_sys (
	clk_clk,
	reset_reset_n,
	pio_leds_export,
	pio_input_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	pio_leds_export;
	input		pio_input_export;
endmodule
