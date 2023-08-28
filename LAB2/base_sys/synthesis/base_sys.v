// base_sys.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module base_sys (
		input  wire       clk_clk,          //       clk.clk
		input  wire       pio_input_export, // pio_input.export
		output wire [7:0] pio_leds_export,  //  pio_leds.export
		input  wire       reset_reset_n     //     reset.reset_n
	);

	wire  [31:0] nios2_cpu_data_master_readdata;                                // mm_interconnect_0:nios2_cpu_data_master_readdata -> nios2_cpu:d_readdata
	wire         nios2_cpu_data_master_waitrequest;                             // mm_interconnect_0:nios2_cpu_data_master_waitrequest -> nios2_cpu:d_waitrequest
	wire         nios2_cpu_data_master_debugaccess;                             // nios2_cpu:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:nios2_cpu_data_master_debugaccess
	wire  [16:0] nios2_cpu_data_master_address;                                 // nios2_cpu:d_address -> mm_interconnect_0:nios2_cpu_data_master_address
	wire   [3:0] nios2_cpu_data_master_byteenable;                              // nios2_cpu:d_byteenable -> mm_interconnect_0:nios2_cpu_data_master_byteenable
	wire         nios2_cpu_data_master_read;                                    // nios2_cpu:d_read -> mm_interconnect_0:nios2_cpu_data_master_read
	wire         nios2_cpu_data_master_readdatavalid;                           // mm_interconnect_0:nios2_cpu_data_master_readdatavalid -> nios2_cpu:d_readdatavalid
	wire         nios2_cpu_data_master_write;                                   // nios2_cpu:d_write -> mm_interconnect_0:nios2_cpu_data_master_write
	wire  [31:0] nios2_cpu_data_master_writedata;                               // nios2_cpu:d_writedata -> mm_interconnect_0:nios2_cpu_data_master_writedata
	wire  [31:0] nios2_cpu_instruction_master_readdata;                         // mm_interconnect_0:nios2_cpu_instruction_master_readdata -> nios2_cpu:i_readdata
	wire         nios2_cpu_instruction_master_waitrequest;                      // mm_interconnect_0:nios2_cpu_instruction_master_waitrequest -> nios2_cpu:i_waitrequest
	wire  [16:0] nios2_cpu_instruction_master_address;                          // nios2_cpu:i_address -> mm_interconnect_0:nios2_cpu_instruction_master_address
	wire         nios2_cpu_instruction_master_read;                             // nios2_cpu:i_read -> mm_interconnect_0:nios2_cpu_instruction_master_read
	wire         nios2_cpu_instruction_master_readdatavalid;                    // mm_interconnect_0:nios2_cpu_instruction_master_readdatavalid -> nios2_cpu:i_readdatavalid
	wire         mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:sys_jtag_uart_avalon_jtag_slave_chipselect -> sys_jtag_uart:av_chipselect
	wire  [31:0] mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_readdata;    // sys_jtag_uart:av_readdata -> mm_interconnect_0:sys_jtag_uart_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_waitrequest; // sys_jtag_uart:av_waitrequest -> mm_interconnect_0:sys_jtag_uart_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:sys_jtag_uart_avalon_jtag_slave_address -> sys_jtag_uart:av_address
	wire         mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:sys_jtag_uart_avalon_jtag_slave_read -> sys_jtag_uart:av_read_n
	wire         mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:sys_jtag_uart_avalon_jtag_slave_write -> sys_jtag_uart:av_write_n
	wire  [31:0] mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:sys_jtag_uart_avalon_jtag_slave_writedata -> sys_jtag_uart:av_writedata
	wire  [31:0] mm_interconnect_0_sys_id_control_slave_readdata;               // sys_id:readdata -> mm_interconnect_0:sys_id_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sys_id_control_slave_address;                // mm_interconnect_0:sys_id_control_slave_address -> sys_id:address
	wire  [31:0] mm_interconnect_0_nios2_cpu_debug_mem_slave_readdata;          // nios2_cpu:debug_mem_slave_readdata -> mm_interconnect_0:nios2_cpu_debug_mem_slave_readdata
	wire         mm_interconnect_0_nios2_cpu_debug_mem_slave_waitrequest;       // nios2_cpu:debug_mem_slave_waitrequest -> mm_interconnect_0:nios2_cpu_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_nios2_cpu_debug_mem_slave_debugaccess;       // mm_interconnect_0:nios2_cpu_debug_mem_slave_debugaccess -> nios2_cpu:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_nios2_cpu_debug_mem_slave_address;           // mm_interconnect_0:nios2_cpu_debug_mem_slave_address -> nios2_cpu:debug_mem_slave_address
	wire         mm_interconnect_0_nios2_cpu_debug_mem_slave_read;              // mm_interconnect_0:nios2_cpu_debug_mem_slave_read -> nios2_cpu:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_nios2_cpu_debug_mem_slave_byteenable;        // mm_interconnect_0:nios2_cpu_debug_mem_slave_byteenable -> nios2_cpu:debug_mem_slave_byteenable
	wire         mm_interconnect_0_nios2_cpu_debug_mem_slave_write;             // mm_interconnect_0:nios2_cpu_debug_mem_slave_write -> nios2_cpu:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_nios2_cpu_debug_mem_slave_writedata;         // mm_interconnect_0:nios2_cpu_debug_mem_slave_writedata -> nios2_cpu:debug_mem_slave_writedata
	wire         mm_interconnect_0_sys_mem_s1_chipselect;                       // mm_interconnect_0:sys_mem_s1_chipselect -> sys_mem:chipselect
	wire  [31:0] mm_interconnect_0_sys_mem_s1_readdata;                         // sys_mem:readdata -> mm_interconnect_0:sys_mem_s1_readdata
	wire  [13:0] mm_interconnect_0_sys_mem_s1_address;                          // mm_interconnect_0:sys_mem_s1_address -> sys_mem:address
	wire   [3:0] mm_interconnect_0_sys_mem_s1_byteenable;                       // mm_interconnect_0:sys_mem_s1_byteenable -> sys_mem:byteenable
	wire         mm_interconnect_0_sys_mem_s1_write;                            // mm_interconnect_0:sys_mem_s1_write -> sys_mem:write
	wire  [31:0] mm_interconnect_0_sys_mem_s1_writedata;                        // mm_interconnect_0:sys_mem_s1_writedata -> sys_mem:writedata
	wire         mm_interconnect_0_sys_mem_s1_clken;                            // mm_interconnect_0:sys_mem_s1_clken -> sys_mem:clken
	wire         mm_interconnect_0_sys_pio_out_s1_chipselect;                   // mm_interconnect_0:sys_pio_out_s1_chipselect -> sys_pio_out:chipselect
	wire  [31:0] mm_interconnect_0_sys_pio_out_s1_readdata;                     // sys_pio_out:readdata -> mm_interconnect_0:sys_pio_out_s1_readdata
	wire   [1:0] mm_interconnect_0_sys_pio_out_s1_address;                      // mm_interconnect_0:sys_pio_out_s1_address -> sys_pio_out:address
	wire         mm_interconnect_0_sys_pio_out_s1_write;                        // mm_interconnect_0:sys_pio_out_s1_write -> sys_pio_out:write_n
	wire  [31:0] mm_interconnect_0_sys_pio_out_s1_writedata;                    // mm_interconnect_0:sys_pio_out_s1_writedata -> sys_pio_out:writedata
	wire         mm_interconnect_0_sys_pio_in_s1_chipselect;                    // mm_interconnect_0:sys_pio_in_s1_chipselect -> sys_pio_in:chipselect
	wire  [31:0] mm_interconnect_0_sys_pio_in_s1_readdata;                      // sys_pio_in:readdata -> mm_interconnect_0:sys_pio_in_s1_readdata
	wire   [1:0] mm_interconnect_0_sys_pio_in_s1_address;                       // mm_interconnect_0:sys_pio_in_s1_address -> sys_pio_in:address
	wire         mm_interconnect_0_sys_pio_in_s1_write;                         // mm_interconnect_0:sys_pio_in_s1_write -> sys_pio_in:write_n
	wire  [31:0] mm_interconnect_0_sys_pio_in_s1_writedata;                     // mm_interconnect_0:sys_pio_in_s1_writedata -> sys_pio_in:writedata
	wire         mm_interconnect_0_sys_timer_s1_chipselect;                     // mm_interconnect_0:sys_timer_s1_chipselect -> sys_timer:chipselect
	wire  [15:0] mm_interconnect_0_sys_timer_s1_readdata;                       // sys_timer:readdata -> mm_interconnect_0:sys_timer_s1_readdata
	wire   [2:0] mm_interconnect_0_sys_timer_s1_address;                        // mm_interconnect_0:sys_timer_s1_address -> sys_timer:address
	wire         mm_interconnect_0_sys_timer_s1_write;                          // mm_interconnect_0:sys_timer_s1_write -> sys_timer:write_n
	wire  [15:0] mm_interconnect_0_sys_timer_s1_writedata;                      // mm_interconnect_0:sys_timer_s1_writedata -> sys_timer:writedata
	wire         mm_interconnect_0_sys_mem_s2_chipselect;                       // mm_interconnect_0:sys_mem_s2_chipselect -> sys_mem:chipselect2
	wire  [31:0] mm_interconnect_0_sys_mem_s2_readdata;                         // sys_mem:readdata2 -> mm_interconnect_0:sys_mem_s2_readdata
	wire  [13:0] mm_interconnect_0_sys_mem_s2_address;                          // mm_interconnect_0:sys_mem_s2_address -> sys_mem:address2
	wire   [3:0] mm_interconnect_0_sys_mem_s2_byteenable;                       // mm_interconnect_0:sys_mem_s2_byteenable -> sys_mem:byteenable2
	wire         mm_interconnect_0_sys_mem_s2_write;                            // mm_interconnect_0:sys_mem_s2_write -> sys_mem:write2
	wire  [31:0] mm_interconnect_0_sys_mem_s2_writedata;                        // mm_interconnect_0:sys_mem_s2_writedata -> sys_mem:writedata2
	wire         mm_interconnect_0_sys_mem_s2_clken;                            // mm_interconnect_0:sys_mem_s2_clken -> sys_mem:clken2
	wire         irq_mapper_receiver0_irq;                                      // sys_timer:irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                      // sys_pio_in:irq -> irq_mapper:receiver1_irq
	wire         irq_mapper_receiver2_irq;                                      // sys_jtag_uart:av_irq -> irq_mapper:receiver2_irq
	wire  [31:0] nios2_cpu_irq_irq;                                             // irq_mapper:sender_irq -> nios2_cpu:irq
	wire         rst_controller_reset_out_reset;                                // rst_controller:reset_out -> [irq_mapper:reset, mm_interconnect_0:nios2_cpu_reset_reset_bridge_in_reset_reset, nios2_cpu:reset_n, rst_translator:in_reset, sys_id:reset_n, sys_jtag_uart:rst_n, sys_mem:reset, sys_mem:reset2, sys_pio_in:reset_n, sys_pio_out:reset_n, sys_timer:reset_n]
	wire         rst_controller_reset_out_reset_req;                            // rst_controller:reset_req -> [nios2_cpu:reset_req, rst_translator:reset_req_in, sys_mem:reset_req, sys_mem:reset_req2]
	wire         nios2_cpu_debug_reset_request_reset;                           // nios2_cpu:debug_reset_request -> rst_controller:reset_in1

	base_sys_nios2_cpu nios2_cpu (
		.clk                                 (clk_clk),                                                 //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                         //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                      //                          .reset_req
		.d_address                           (nios2_cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (nios2_cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (nios2_cpu_data_master_read),                              //                          .read
		.d_readdata                          (nios2_cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (nios2_cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (nios2_cpu_data_master_write),                             //                          .write
		.d_writedata                         (nios2_cpu_data_master_writedata),                         //                          .writedata
		.d_readdatavalid                     (nios2_cpu_data_master_readdatavalid),                     //                          .readdatavalid
		.debug_mem_slave_debugaccess_to_roms (nios2_cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (nios2_cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (nios2_cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (nios2_cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (nios2_cpu_instruction_master_waitrequest),                //                          .waitrequest
		.i_readdatavalid                     (nios2_cpu_instruction_master_readdatavalid),              //                          .readdatavalid
		.irq                                 (nios2_cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (nios2_cpu_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_nios2_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_nios2_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_nios2_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_nios2_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_nios2_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_nios2_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_nios2_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_nios2_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                         // custom_instruction_master.readra
	);

	base_sys_sys_id sys_id (
		.clock    (clk_clk),                                         //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                 //         reset.reset_n
		.readdata (mm_interconnect_0_sys_id_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sys_id_control_slave_address)   //              .address
	);

	base_sys_sys_jtag_uart sys_jtag_uart (
		.clk            (clk_clk),                                                       //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                               //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver2_irq)                                       //               irq.irq
	);

	base_sys_sys_mem sys_mem (
		.clk         (clk_clk),                                 //   clk1.clk
		.address     (mm_interconnect_0_sys_mem_s1_address),    //     s1.address
		.clken       (mm_interconnect_0_sys_mem_s1_clken),      //       .clken
		.chipselect  (mm_interconnect_0_sys_mem_s1_chipselect), //       .chipselect
		.write       (mm_interconnect_0_sys_mem_s1_write),      //       .write
		.readdata    (mm_interconnect_0_sys_mem_s1_readdata),   //       .readdata
		.writedata   (mm_interconnect_0_sys_mem_s1_writedata),  //       .writedata
		.byteenable  (mm_interconnect_0_sys_mem_s1_byteenable), //       .byteenable
		.reset       (rst_controller_reset_out_reset),          // reset1.reset
		.reset_req   (rst_controller_reset_out_reset_req),      //       .reset_req
		.address2    (mm_interconnect_0_sys_mem_s2_address),    //     s2.address
		.chipselect2 (mm_interconnect_0_sys_mem_s2_chipselect), //       .chipselect
		.clken2      (mm_interconnect_0_sys_mem_s2_clken),      //       .clken
		.write2      (mm_interconnect_0_sys_mem_s2_write),      //       .write
		.readdata2   (mm_interconnect_0_sys_mem_s2_readdata),   //       .readdata
		.writedata2  (mm_interconnect_0_sys_mem_s2_writedata),  //       .writedata
		.byteenable2 (mm_interconnect_0_sys_mem_s2_byteenable), //       .byteenable
		.clk2        (clk_clk),                                 //   clk2.clk
		.reset2      (rst_controller_reset_out_reset),          // reset2.reset
		.reset_req2  (rst_controller_reset_out_reset_req),      //       .reset_req
		.freeze      (1'b0)                                     // (terminated)
	);

	base_sys_sys_pio_in sys_pio_in (
		.clk        (clk_clk),                                    //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),            //               reset.reset_n
		.address    (mm_interconnect_0_sys_pio_in_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_sys_pio_in_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_sys_pio_in_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_sys_pio_in_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_sys_pio_in_s1_readdata),   //                    .readdata
		.in_port    (pio_input_export),                           // external_connection.export
		.irq        (irq_mapper_receiver1_irq)                    //                 irq.irq
	);

	base_sys_sys_pio_out sys_pio_out (
		.clk        (clk_clk),                                     //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),             //               reset.reset_n
		.address    (mm_interconnect_0_sys_pio_out_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_sys_pio_out_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_sys_pio_out_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_sys_pio_out_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_sys_pio_out_s1_readdata),   //                    .readdata
		.out_port   (pio_leds_export)                              // external_connection.export
	);

	base_sys_sys_timer sys_timer (
		.clk        (clk_clk),                                   //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),           // reset.reset_n
		.address    (mm_interconnect_0_sys_timer_s1_address),    //    s1.address
		.writedata  (mm_interconnect_0_sys_timer_s1_writedata),  //      .writedata
		.readdata   (mm_interconnect_0_sys_timer_s1_readdata),   //      .readdata
		.chipselect (mm_interconnect_0_sys_timer_s1_chipselect), //      .chipselect
		.write_n    (~mm_interconnect_0_sys_timer_s1_write),     //      .write_n
		.irq        (irq_mapper_receiver0_irq)                   //   irq.irq
	);

	base_sys_mm_interconnect_0 mm_interconnect_0 (
		.sys_clk_clk_clk                             (clk_clk),                                                       //                           sys_clk_clk.clk
		.nios2_cpu_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                                // nios2_cpu_reset_reset_bridge_in_reset.reset
		.nios2_cpu_data_master_address               (nios2_cpu_data_master_address),                                 //                 nios2_cpu_data_master.address
		.nios2_cpu_data_master_waitrequest           (nios2_cpu_data_master_waitrequest),                             //                                      .waitrequest
		.nios2_cpu_data_master_byteenable            (nios2_cpu_data_master_byteenable),                              //                                      .byteenable
		.nios2_cpu_data_master_read                  (nios2_cpu_data_master_read),                                    //                                      .read
		.nios2_cpu_data_master_readdata              (nios2_cpu_data_master_readdata),                                //                                      .readdata
		.nios2_cpu_data_master_readdatavalid         (nios2_cpu_data_master_readdatavalid),                           //                                      .readdatavalid
		.nios2_cpu_data_master_write                 (nios2_cpu_data_master_write),                                   //                                      .write
		.nios2_cpu_data_master_writedata             (nios2_cpu_data_master_writedata),                               //                                      .writedata
		.nios2_cpu_data_master_debugaccess           (nios2_cpu_data_master_debugaccess),                             //                                      .debugaccess
		.nios2_cpu_instruction_master_address        (nios2_cpu_instruction_master_address),                          //          nios2_cpu_instruction_master.address
		.nios2_cpu_instruction_master_waitrequest    (nios2_cpu_instruction_master_waitrequest),                      //                                      .waitrequest
		.nios2_cpu_instruction_master_read           (nios2_cpu_instruction_master_read),                             //                                      .read
		.nios2_cpu_instruction_master_readdata       (nios2_cpu_instruction_master_readdata),                         //                                      .readdata
		.nios2_cpu_instruction_master_readdatavalid  (nios2_cpu_instruction_master_readdatavalid),                    //                                      .readdatavalid
		.nios2_cpu_debug_mem_slave_address           (mm_interconnect_0_nios2_cpu_debug_mem_slave_address),           //             nios2_cpu_debug_mem_slave.address
		.nios2_cpu_debug_mem_slave_write             (mm_interconnect_0_nios2_cpu_debug_mem_slave_write),             //                                      .write
		.nios2_cpu_debug_mem_slave_read              (mm_interconnect_0_nios2_cpu_debug_mem_slave_read),              //                                      .read
		.nios2_cpu_debug_mem_slave_readdata          (mm_interconnect_0_nios2_cpu_debug_mem_slave_readdata),          //                                      .readdata
		.nios2_cpu_debug_mem_slave_writedata         (mm_interconnect_0_nios2_cpu_debug_mem_slave_writedata),         //                                      .writedata
		.nios2_cpu_debug_mem_slave_byteenable        (mm_interconnect_0_nios2_cpu_debug_mem_slave_byteenable),        //                                      .byteenable
		.nios2_cpu_debug_mem_slave_waitrequest       (mm_interconnect_0_nios2_cpu_debug_mem_slave_waitrequest),       //                                      .waitrequest
		.nios2_cpu_debug_mem_slave_debugaccess       (mm_interconnect_0_nios2_cpu_debug_mem_slave_debugaccess),       //                                      .debugaccess
		.sys_id_control_slave_address                (mm_interconnect_0_sys_id_control_slave_address),                //                  sys_id_control_slave.address
		.sys_id_control_slave_readdata               (mm_interconnect_0_sys_id_control_slave_readdata),               //                                      .readdata
		.sys_jtag_uart_avalon_jtag_slave_address     (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_address),     //       sys_jtag_uart_avalon_jtag_slave.address
		.sys_jtag_uart_avalon_jtag_slave_write       (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_write),       //                                      .write
		.sys_jtag_uart_avalon_jtag_slave_read        (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_read),        //                                      .read
		.sys_jtag_uart_avalon_jtag_slave_readdata    (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_readdata),    //                                      .readdata
		.sys_jtag_uart_avalon_jtag_slave_writedata   (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_writedata),   //                                      .writedata
		.sys_jtag_uart_avalon_jtag_slave_waitrequest (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_waitrequest), //                                      .waitrequest
		.sys_jtag_uart_avalon_jtag_slave_chipselect  (mm_interconnect_0_sys_jtag_uart_avalon_jtag_slave_chipselect),  //                                      .chipselect
		.sys_mem_s1_address                          (mm_interconnect_0_sys_mem_s1_address),                          //                            sys_mem_s1.address
		.sys_mem_s1_write                            (mm_interconnect_0_sys_mem_s1_write),                            //                                      .write
		.sys_mem_s1_readdata                         (mm_interconnect_0_sys_mem_s1_readdata),                         //                                      .readdata
		.sys_mem_s1_writedata                        (mm_interconnect_0_sys_mem_s1_writedata),                        //                                      .writedata
		.sys_mem_s1_byteenable                       (mm_interconnect_0_sys_mem_s1_byteenable),                       //                                      .byteenable
		.sys_mem_s1_chipselect                       (mm_interconnect_0_sys_mem_s1_chipselect),                       //                                      .chipselect
		.sys_mem_s1_clken                            (mm_interconnect_0_sys_mem_s1_clken),                            //                                      .clken
		.sys_mem_s2_address                          (mm_interconnect_0_sys_mem_s2_address),                          //                            sys_mem_s2.address
		.sys_mem_s2_write                            (mm_interconnect_0_sys_mem_s2_write),                            //                                      .write
		.sys_mem_s2_readdata                         (mm_interconnect_0_sys_mem_s2_readdata),                         //                                      .readdata
		.sys_mem_s2_writedata                        (mm_interconnect_0_sys_mem_s2_writedata),                        //                                      .writedata
		.sys_mem_s2_byteenable                       (mm_interconnect_0_sys_mem_s2_byteenable),                       //                                      .byteenable
		.sys_mem_s2_chipselect                       (mm_interconnect_0_sys_mem_s2_chipselect),                       //                                      .chipselect
		.sys_mem_s2_clken                            (mm_interconnect_0_sys_mem_s2_clken),                            //                                      .clken
		.sys_pio_in_s1_address                       (mm_interconnect_0_sys_pio_in_s1_address),                       //                         sys_pio_in_s1.address
		.sys_pio_in_s1_write                         (mm_interconnect_0_sys_pio_in_s1_write),                         //                                      .write
		.sys_pio_in_s1_readdata                      (mm_interconnect_0_sys_pio_in_s1_readdata),                      //                                      .readdata
		.sys_pio_in_s1_writedata                     (mm_interconnect_0_sys_pio_in_s1_writedata),                     //                                      .writedata
		.sys_pio_in_s1_chipselect                    (mm_interconnect_0_sys_pio_in_s1_chipselect),                    //                                      .chipselect
		.sys_pio_out_s1_address                      (mm_interconnect_0_sys_pio_out_s1_address),                      //                        sys_pio_out_s1.address
		.sys_pio_out_s1_write                        (mm_interconnect_0_sys_pio_out_s1_write),                        //                                      .write
		.sys_pio_out_s1_readdata                     (mm_interconnect_0_sys_pio_out_s1_readdata),                     //                                      .readdata
		.sys_pio_out_s1_writedata                    (mm_interconnect_0_sys_pio_out_s1_writedata),                    //                                      .writedata
		.sys_pio_out_s1_chipselect                   (mm_interconnect_0_sys_pio_out_s1_chipselect),                   //                                      .chipselect
		.sys_timer_s1_address                        (mm_interconnect_0_sys_timer_s1_address),                        //                          sys_timer_s1.address
		.sys_timer_s1_write                          (mm_interconnect_0_sys_timer_s1_write),                          //                                      .write
		.sys_timer_s1_readdata                       (mm_interconnect_0_sys_timer_s1_readdata),                       //                                      .readdata
		.sys_timer_s1_writedata                      (mm_interconnect_0_sys_timer_s1_writedata),                      //                                      .writedata
		.sys_timer_s1_chipselect                     (mm_interconnect_0_sys_timer_s1_chipselect)                      //                                      .chipselect
	);

	base_sys_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.receiver2_irq (irq_mapper_receiver2_irq),       // receiver2.irq
		.sender_irq    (nios2_cpu_irq_irq)               //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                      // reset_in0.reset
		.reset_in1      (nios2_cpu_debug_reset_request_reset), // reset_in1.reset
		.clk            (clk_clk),                             //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),      // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req),  //          .reset_req
		.reset_req_in0  (1'b0),                                // (terminated)
		.reset_req_in1  (1'b0),                                // (terminated)
		.reset_in2      (1'b0),                                // (terminated)
		.reset_req_in2  (1'b0),                                // (terminated)
		.reset_in3      (1'b0),                                // (terminated)
		.reset_req_in3  (1'b0),                                // (terminated)
		.reset_in4      (1'b0),                                // (terminated)
		.reset_req_in4  (1'b0),                                // (terminated)
		.reset_in5      (1'b0),                                // (terminated)
		.reset_req_in5  (1'b0),                                // (terminated)
		.reset_in6      (1'b0),                                // (terminated)
		.reset_req_in6  (1'b0),                                // (terminated)
		.reset_in7      (1'b0),                                // (terminated)
		.reset_req_in7  (1'b0),                                // (terminated)
		.reset_in8      (1'b0),                                // (terminated)
		.reset_req_in8  (1'b0),                                // (terminated)
		.reset_in9      (1'b0),                                // (terminated)
		.reset_req_in9  (1'b0),                                // (terminated)
		.reset_in10     (1'b0),                                // (terminated)
		.reset_req_in10 (1'b0),                                // (terminated)
		.reset_in11     (1'b0),                                // (terminated)
		.reset_req_in11 (1'b0),                                // (terminated)
		.reset_in12     (1'b0),                                // (terminated)
		.reset_req_in12 (1'b0),                                // (terminated)
		.reset_in13     (1'b0),                                // (terminated)
		.reset_req_in13 (1'b0),                                // (terminated)
		.reset_in14     (1'b0),                                // (terminated)
		.reset_req_in14 (1'b0),                                // (terminated)
		.reset_in15     (1'b0),                                // (terminated)
		.reset_req_in15 (1'b0)                                 // (terminated)
	);

endmodule
