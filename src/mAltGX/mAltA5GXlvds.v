

module mAltA5GXlvds (
	input 	i_SerRx,			
	output 	o_SerTx,			
	
	input 	i_RefClk125M,
	output 	o_CoreClk,				
	input 	i_GxBPwrDwn,
	input 	i_XcverDigitalRst,
    output 	o_PllLocked,
	
	output o_SignalDetect,		
	output [7:0] o8_RxCodeGroup,
	output 	o_RxCodeInvalid,	
	output 	o_RxCodeCtrl,		
	input 	i_RxBitSlip,
	
	input [7:0] i8_TxCodeGroup,
	input 	i_TxCodeValid,		
	input 	i_TxCodeCtrl,		
	input 	i_TxForceNegDisp,	
    output 	o_RunningDisparity);
	
	wire [9:0]	w10_txdata;
	wire [9:0]	w10_rxdata;
	wire [9:0] 	w10_txdatalocal;
	wire [9:0] 	w10_rxdatalocal;
	
	mAlt8b10benc u8b10bEnc(
	.clk			(o_CoreClk),
	.reset_n		(~i_XcverDigitalRst),
	.idle_ins		(~i_TxCodeValid),
	.kin			(i_TxCodeCtrl),
	.ena			(1'b1),
	.datain			(i8_TxCodeGroup),
	.rdin			(1'b0),
	.rdforce		(i_TxForceNegDisp),
	.kerr			(),
	.dataout		(w10_txdatalocal),
	.valid			(),
	.rdout			(o_RunningDisparity),
	.rdcascade		());	
	
	mAlt8b10bdec 	u8b10bDec(	
	.clk			(o_CoreClk),
	.reset_n		(~i_XcverDigitalRst),
	.idle_del		(),
	.ena			(1'b1),
	.datain			(w10_rxdatalocal),
	.rdforce		(1'b0),
	.rdin			(1'b0),
	.valid			(w_RxDataValid),
	.dataout		(o8_RxCodeGroup),
	.kout			(o_RxCodeCtrl),
	.kerr			(w_RxKErr),
	.rdcascade		(),
	.rdout			(),
	.rderr			(w_RxRdErr));
	
	assign o_RxCodeInvalid = w_RxKErr|w_RxRdErr;
	assign o_SignalDetect = w_RxDataValid|o_RxCodeCtrl;
	
	mAltArriaVlvdsRx ulvdsrx (
	.rx_channel_data_align (i_RxBitSlip),
	.rx_in			(i_SerRx),
	.rx_inclock		(i_RefClk125M),
	.rx_out			(w10_rxdata),
	.rx_locked		(o_PllLocked),
	.rx_outclock	(o_CoreClk));
	
	mAltArriaVlvdsTx ulvdstx(
	.tx_in			(w10_txdata),
	.tx_inclock		(i_RefClk125M),	
	.tx_coreclock	(w_TxClk),
	.tx_out			(o_SerTx));
	
	
	function [9:0] bitreverse ;
		input [9:0] in;
		integer I;
		begin
			for(I=0;I<10;I=I+1)
				bitreverse[I]=in[9-I];		
		end
	endfunction
	
	assign w10_txdata = bitreverse(w10_txdatalocal);
	assign w10_rxdatalocal = bitreverse(w10_rxdata);
	// mAltRateAdapter uRxAdapter(
	// .data	(w10_txdatalocal),
	// .rdclk	(w_TxClk),
	// .rdempty(rdempty),
	// .rdreq	(~rdempty),
	// .wrclk	(o_CoreClk),
	// .wrreq	(1'b1),
	// .q(w10_txdata));


endmodule 