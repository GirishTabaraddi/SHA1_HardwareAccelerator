package state_machine_definitions;

	enum logic [1:0] {__RESET = 2'b00, __IDLE = 2'b01, __PROC = 2'b10, __DONE = 2'b11} state;

endpackage 

`define circularleftshift(x, n) ((x << n) | (x >> (32-n)))

module sha1_state_machine
(
	input logic clk,
	
	input logic reset_n,
	
	input logic start,
	
	input logic [511:0] data,
	
	output logic [159:0] q,
	
	output logic done,
	
	input logic [31:0] Hash[4:0],
	
	input logic [31:0] K[3:0]

);

	import state_machine_definitions::*;
	
	localparam LOOP_ITERATIONS = 80;
	localparam ITERATIONS      = LOOP_ITERATIONS - 1;
	localparam BITWIDTH        = $clog2(ITERATIONS);

	logic [31:0] word_array[79:0];
	
	logic [31:0] A, B, C, D, E;
	
	logic [BITWIDTH-1:0] word_counter;
	
	/* ### start pulse detection ##############################################
	
	CPU asserts a start pulse ...
	
										  ___________________________________________________
	start_signal:		__________|                                                   |_______________________________________
	
										 ^
										 |
										 
								 ACTUAL START
						
	
	We are using the start_signal to derive a 50MHz related start pulse ..., which is only high for 20ns ... 
	
							             _
							____________| |________________________________________________________________________________________
	
	
	We use this start pulse to trigger our sha-1 processing stage ...
	
	*/
	
	// with the following structure, we are detecting the rising edge of our start signal ... 
	
	logic [3:0] sync_reg = 0;
	
	// shifting data (start signal) from the right-hand side. shifting everything to the left ... newest data is placed at the LSB side ...
	always_ff@(posedge clk)
		begin : start_detection
			if(reset_n == 1'b0)
				sync_reg <= 4'b0000;
			else
				sync_reg <= {sync_reg[2:0],start};
		
		end : start_detection

	// comparator that continuously evaluates the content of our sync_reg ...
	logic sync_start; assign sync_start = (sync_reg == 4'b0011) ? 1'b1 : 1'b0; 	
	
	
	// ### 'state-machine' ... #######################################################################################################
			
		
	logic [BITWIDTH-1:0] state_counter = 'd0;
	
	always_ff@(posedge clk)
		begin : state_machine
			if(reset_n == 1'b0)
				begin
					state_counter <= 0;
					word_counter <= 'd0;
					state 		  <= __RESET;
				end
			else
				begin
					case(state)
						__RESET:	
							begin
								state_counter <= 0;
								word_counter <= 'd0;
								state 		  <= __IDLE;
							end	
						__IDLE: 
							begin
								state_counter <= 0;
								word_counter  <= 'd16;
								
								A <= Hash[0];
								B <= Hash[1];
								C <= Hash[2];
								D <= Hash[3];
								E <= Hash[4];
								
								word_array[0] 	<= data[31:0];
								word_array[1] 	<= data[63:32];
								word_array[2] 	<= data[95:64];
								word_array[3] 	<= data[127:96];
								word_array[4] 	<= data[159:128];
								word_array[5] 	<= data[191:160];
								word_array[6] 	<= data[223:192];
								word_array[7] 	<= data[255:224];
								word_array[8] 	<= data[287:256];
								word_array[9] 	<= data[319:288];
								word_array[10] <= data[351:320];
								word_array[11] <= data[383:352];
								word_array[12] <= data[415:384];
								word_array[13] <= data[447:416];
								word_array[14] <= data[479:448];
								word_array[15] <= data[511:480];
									
								if(word_counter < 80)
								begin									
									word_array[word_counter] <= `circularleftshift((word_array[word_counter-3] ^ word_array[word_counter-8] ^ word_array[word_counter-14] ^ word_array[word_counter-16]), 1);
									word_counter <= word_counter + 1;
								end
	
								if(sync_start)
									state <= __PROC;
							end
						__PROC: 
							begin									
							   if(state_counter >= 0 && state_counter <= 19)
								begin		
									A <= `circularleftshift(A,5) + ((B & C) | ( (~B) & D)) + E + K[0] + word_array[state_counter];

								end
								else if(state_counter >= 20 && state_counter <= 39)
								begin
									A <= `circularleftshift(A,5) + (B ^ C ^ D) + E + K[1] + word_array[state_counter];
									
								end
								else if(state_counter >= 40 && state_counter <= 59)
								begin
									A <= `circularleftshift(A,5) + ((B & C) | (B & D) | (C & D)) + E + K[2] + word_array[state_counter];
									
								end
								else if(state_counter >= 60 && state_counter <= 79)
								begin
									A <= `circularleftshift(A,5) + (B ^ C ^ D) + E + K[3] + word_array[state_counter];
									
								end		
									
								B <= A;
								C <= `circularleftshift(B, 30);
								D <= C;
								E <= D;
								
								if(state_counter == ITERATIONS)
									begin
										state_counter <= 0;
										state         <= __DONE;
									end
								else
									begin
										state_counter <= state_counter + 1;
										state         <= __PROC;
									end
							end
						__DONE:
							begin
								state_counter <= 0;
								
//								$display("A == %x\n",A);
//								$display("B == %x\n",B);
//								$display("C == %x\n",C);
//								$display("D == %x\n",D);
//								$display("E == %x\n",E);
								
								q = {Hash[0]+A, Hash[1]+B, Hash[2]+C, Hash[3]+D, Hash[4]+E};
								$display("q == %x\n",q);
								
								state			  <= __IDLE;
							end
						default:
							begin
								state_counter <= 0;
								state 		  <= __RESET;
							end
					endcase
				end
			end : state_machine

// ### 'state-machine' ENDS ... #######################################################################################################

		
	assign done = (state == __DONE) ? 1'b1 : 1'b0;
	

endmodule 