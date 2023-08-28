module top_level_sys
(
	(* chip_pin = "M8" *) input logic clk,
	(* chip_pin = "J21" *) input logic reset_n,
	(* chip_pin = "H21, H22" *) input logic [1:0] pb,
	(* chip_pin = "C5, B4, A5, C4, B7, A6, C8, C7" *) output logic [7:0] q
);

base_sys u0
(
	.clk_clk          (clk),			//       clk.clk
	.reset_reset_n    (reset_n),		//     reset.reset_n
	.pio_leds_export  (q),				//  pio_leds.export
	.pio_input_export (pb)				// pio_input.export
);

endmodule
	