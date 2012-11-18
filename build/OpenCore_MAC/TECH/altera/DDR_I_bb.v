// megafunction wizard: %ALTDDIO_IN%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altddio_in 

// ============================================================
// File Name: DDR_I.v
// Megafunction Name(s):
// 			altddio_in
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.0 Build 235 06/17/2009 SP 2 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module DDR_I (
	datain,
	inclock,
	dataout_h,
	dataout_l);

	input	[4:0]  datain;
	input	  inclock;
	output	[4:0]  dataout_h;
	output	[4:0]  dataout_l;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ARESET_MODE NUMERIC "2"
// Retrieval info: PRIVATE: CLKEN NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Arria II GX"
// Retrieval info: PRIVATE: INVERT_INPUT_CLOCKS NUMERIC "0"
// Retrieval info: PRIVATE: POWER_UP_HIGH NUMERIC "0"
// Retrieval info: PRIVATE: SRESET_MODE NUMERIC "2"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WIDTH NUMERIC "5"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Arria II GX"
// Retrieval info: CONSTANT: INVERT_INPUT_CLOCKS STRING "OFF"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altddio_in"
// Retrieval info: CONSTANT: POWER_UP_HIGH STRING "OFF"
// Retrieval info: CONSTANT: WIDTH NUMERIC "5"
// Retrieval info: USED_PORT: datain 0 0 5 0 INPUT NODEFVAL datain[4..0]
// Retrieval info: USED_PORT: dataout_h 0 0 5 0 OUTPUT NODEFVAL dataout_h[4..0]
// Retrieval info: USED_PORT: dataout_l 0 0 5 0 OUTPUT NODEFVAL dataout_l[4..0]
// Retrieval info: USED_PORT: inclock 0 0 0 0 INPUT_CLK_EXT NODEFVAL inclock
// Retrieval info: CONNECT: @datain 0 0 5 0 datain 0 0 5 0
// Retrieval info: CONNECT: dataout_h 0 0 5 0 @dataout_h 0 0 5 0
// Retrieval info: CONNECT: dataout_l 0 0 5 0 @dataout_l 0 0 5 0
// Retrieval info: CONNECT: @inclock 0 0 0 0 inclock 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL DDR_I.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL DDR_I.ppf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL DDR_I.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL DDR_I.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL DDR_I.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL DDR_I_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL DDR_I_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
