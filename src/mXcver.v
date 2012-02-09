/*
Developed By Subtleware Corporation Pte Ltd 2011
File		:
Description	:
Remarks		:
Revision	:
	Date	Author	Description
*/

module mXcver #(parameter pXcverName="AltCycIV") (

	input	i_SerRx,
	output	o_SerTx,
	
	input 	i_RefClk125M,
	output 	o_TxClk,
	input	i_CalClk,
	input	i_GxBPwrDwn,
	input	i_XcverDigitalRst,
	output	o_PllLocked,
	output	o_SignalDetect,
	output	[07:00] 	o8_RxCodeGroup,
	output	o_RxCodeInvalid,
	output	o_RxCodeCtrl,
	
	input	[07:00] 	i8_TxCodeGroup,
	input	i_TxCodeValid,
	input	i_TxCodeCtrl,
	input	i_TxForceNegDisp,
	output	o_RunningDisparity);



	generate 		
	if(pXcverName=="AltCycIV")
		wire [04:00] w5_ReconfigFromGxb;
		wire [03:00] w4_ReconfigToGxb;
		wire w_Reconfiguring;
		begin:AltCycIVXcver
		mAltGX u0AltGX (
		.cal_blk_clk		(i_CalClk),
		.gxb_powerdown		(i_GxBPwrDwn),
		.pll_inclk			(i_RefClk125M),
		.reconfig_clk		(i_CalClk),
		.reconfig_togxb		(w4_ReconfigToGxb),
		.rx_analogreset		(1'b0),
		.pll_locked			(o_PllLocked),
		.reconfig_fromgxb	(w5_ReconfigFromGxb),
		
		.rx_digitalreset	(i_XcverDigitalRst),
		.rx_datain			(i_SerRx),
		.tx_dataout			(o_SerTx),
			
		.tx_ctrlenable		(i_TxCodeCtrl),
		.tx_datain			(i8_TxCodeGroup),
		.tx_digitalreset	(i_XcverDigitalRst),
			
		.rx_errdetect		(o_RxCodeInvalid),
		.rx_ctrldetect		(o_RxCodeCtrl),
		.rx_dataout			(o8_RxCodeGroup),	
		.rx_disperr			(),		
		.rx_patterndetect	(),
		.rx_rlv				(),
		.rx_syncstatus		(o_SignalDetect),
		.tx_clkout			(o_TxClk));
		
		assign o_RunningDisparity = 1'b0;
		
		  mAltGXReconfig u0AltGXReconfig(
			.reconfig_clk		(i_CalClk),
			.reconfig_fromgxb 	(w5_ReconfigFromGxb),
			.busy				(w_Reconfiguring),
			.reconfig_togxb		(w4_ReconfigToGxb));		
		end	
	endgenerate
	
	
	

	
	
endmodule
