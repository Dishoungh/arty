//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Sun Oct 13 19:02:21 2024
//Host        : trinity running 64-bit Gentoo Linux
//Command     : generate_target zynq_bd_wrapper.bd
//Design      : zynq_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module zynq_top
(
    inout wire[14:0] DDR_addr,
    inout wire[2:0] DDR_ba,
    inout wire DDR_cas_n,
    inout wire DDR_ck_n,
    inout wire DDR_ck_p,
    inout wire DDR_cke,
    inout wire DDR_cs_n,
    inout wire[3:0] DDR_dm,
    inout wire[31:0] DDR_dq,
    inout wire[3:0] DDR_dqs_n,
    inout wire[3:0] DDR_dqs_p,
    inout wire DDR_odt,
    inout wire DDR_ras_n,
    inout wire DDR_reset_n,
    inout wire DDR_we_n,
    inout wire FIXED_IO_ddr_vrn,
    inout wire FIXED_IO_ddr_vrp,
    inout wire[53:0] FIXED_IO_mio,
    inout wire FIXED_IO_ps_clk,
    inout wire FIXED_IO_ps_porb,
    inout wire FIXED_IO_ps_srstb,
    input wire[3:0] btn,
    output wire[3:0] led,
    output wire led4_r,
    output wire led4_g,
    output wire led4_b,
    output wire led5_r,
    output wire led5_g,
    output wire led5_b,
    inout wire spi_io0_io,
    inout wire spi_io1_io,
    inout wire spi_sck_io,
    inout wire spi_ss_io,
    input wire[1:0] sw
);

wire spi_io0_i;
wire spi_io0_o;
wire spi_io0_t;

wire spi_io1_i;
wire spi_io1_o;
wire spi_io1_t;

wire spi_sck_i;
wire spi_sck_o;
wire spi_sck_t;

wire spi_ss_i;
wire spi_ss_o;
wire spi_ss_t;

IOBUF spi_io0_iobuf
(
    .I(spi_io0_o),
    .IO(spi_io0_io),
    .O(spi_io0_i),
    .T(spi_io0_t)
);

IOBUF spi_io1_iobuf
(
    .I(spi_io1_o),
    .IO(spi_io1_io),
    .O(spi_io1_i),
    .T(spi_io1_t)
);

IOBUF spi_sck_iobuf
(
    .I(spi_sck_o),
    .IO(spi_sck_io),
    .O(spi_sck_i),
    .T(spi_sck_t)
);

IOBUF spi_ss_iobuf
(
    .I(spi_ss_o),
    .IO(spi_ss_io),
    .O(spi_ss_i),
    .T(spi_ss_t)
);

// Debounce Signals
parameter DEBOUNCE  = 32'd10000000;
wire clk;
wire[1:0] sw_debounced;
wire[3:0] btn_debounced;

debounce sw0
(
    .clk(clk),
    .arst(1'b0),
    .width(DEBOUNCE),
    .d(sw[0]),
    .q(sw_debounced[0])
);

debounce sw1
(
    .clk(clk),
    .arst(1'b0),
    .width(DEBOUNCE),
    .d(sw[1]),
    .q(sw_debounced[1])
);

debounce btn0
(
    .clk(clk),
    .arst(1'b0),
    .width(DEBOUNCE),
    .d(btn[0]),
    .q(btn_debounced[0])
);

debounce btn1
(
    .clk(clk),
    .arst(1'b0),
    .width(DEBOUNCE),
    .d(btn[1]),
    .q(btn_debounced[1])
);

debounce btn2
(
    .clk(clk),
    .arst(1'b0),
    .width(DEBOUNCE),
    .d(btn[2]),
    .q(btn_debounced[2])
);

debounce btn3
(
    .clk(clk),
    .arst(1'b0),
    .width(DEBOUNCE),
    .d(btn[3]),
    .q(btn_debounced[3])
);

zynq_bd zynq_bd_i
(
    .DDR_addr(DDR_addr),
    .DDR_ba(DDR_ba),
    .DDR_cas_n(DDR_cas_n),
    .DDR_ck_n(DDR_ck_n),
    .DDR_ck_p(DDR_ck_p),
    .DDR_cke(DDR_cke),
    .DDR_cs_n(DDR_cs_n),
    .DDR_dm(DDR_dm),
    .DDR_dq(DDR_dq),
    .DDR_dqs_n(DDR_dqs_n),
    .DDR_dqs_p(DDR_dqs_p),
    .DDR_odt(DDR_odt),
    .DDR_ras_n(DDR_ras_n),
    .DDR_reset_n(DDR_reset_n),
    .DDR_we_n(DDR_we_n),
    .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
    .FIXED_IO_mio(FIXED_IO_mio),
    .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
    .btns_4bits_tri_i(btn_debounced),
    .leds_4bits_tri_o(led),
    .rgb_led_tri_o({led5_b, led5_g, led5_r, led4_b, led4_g, led4_r}),
    .spi_io0_i(spi_io0_i),
    .spi_io0_o(spi_io0_o),
    .spi_io0_t(spi_io0_t),
    .spi_io1_i(spi_io1_i),
    .spi_io1_o(spi_io1_o),
    .spi_io1_t(spi_io1_t),
    .spi_sck_i(spi_sck_i),
    .spi_sck_o(spi_sck_o),
    .spi_sck_t(spi_sck_t),
    .spi_ss_i(spi_ss_i),
    .spi_ss_o(spi_ss_o),
    .spi_ss_t(spi_ss_t),
    .sws_2bits_tri_i(sw_debounced),
    .pl_clk(clk)
);

endmodule
