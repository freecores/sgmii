`define cSystemClkPeriod	8

`define cXmitCONFIG		3'b010
`define cXmitIDLE		3'b001
`define cXmitDATA		3'b100

`define D0_0	8'h00
`define D21_5	8'hB5
`define D2_2	8'h42
`define D5_6	8'hC5
`define D16_2	8'h50
`define K28_5	8'hBC
`define K23_7	8'hF7	//R/
`define K27_7	8'hFB	//S/
`define K29_7	8'hFD	//T/
`define K30_7	8'hFE	//V/

`define cReg4Default 	16'h0000
`define cReg0Default	16'h0000
`define cRegXDefault	16'h0000
`define cRegLinkTimerDefault	(10_000_000/8)