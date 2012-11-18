//////////////////////////////////////////////////////////////////////
////                                                              ////
////  RMON.v                                                      ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects.cgi/web/ethernet_tri_mode/////
////                                                              ////
////  Author(s):                                                  ////
////      - Jon Gao (gaojon@yahoo.com)                            ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//                                                                    
// CVS Revision History                                               
//                                                                    
// $Log: not supported by cvs2svn $
// Revision 1.3  2006/01/19 14:07:53  maverickist
// verification is complete.
//
// Revision 1.2  2005/12/16 06:44:16  Administrator
// replaced tab with space.
// passed 9.6k length frame test.
//
// Revision 1.1.1.1  2005/12/13 01:51:44  Administrator
// no message
// 

module RMON ( 
Clk                 ,
Reset               ,
//Tx_RMON            
Tx_pkt_type_rmon    ,
Tx_pkt_length_rmon  ,
Tx_apply_rmon       ,
Tx_pkt_err_type_rmon,
//Tx_RMON            
Rx_pkt_type_rmon    ,
Rx_pkt_length_rmon  ,
Rx_apply_rmon       ,
Rx_pkt_err_type_rmon,
//CPU                
CPU_rd_addr         ,
CPU_rd_apply        ,
CPU_rd_grant        ,
CPU_rd_dout         

);
input               Clk                 ;
input               Reset               ;
                    //Tx_RMON
input   [2:0]       Tx_pkt_type_rmon    ;
input   [15:0]      Tx_pkt_length_rmon  ;
input               Tx_apply_rmon       ;
input   [2:0]       Tx_pkt_err_type_rmon;
                    //Tx_RMON
input   [2:0]       Rx_pkt_type_rmon    ;
input   [15:0]      Rx_pkt_length_rmon  ;
input               Rx_apply_rmon       ;
input   [2:0]       Rx_pkt_err_type_rmon;
                    //CPU
input   [5:0]       CPU_rd_addr         ;
input               CPU_rd_apply        ;
output              CPU_rd_grant        ;
output  [31:0]      CPU_rd_dout         ;

//******************************************************************************  
//interface signals
//******************************************************************************  
wire                Reg_apply_0     ;
wire    [4:0]       Reg_addr_0      ;
wire    [15:0]      Reg_data_0      ;
wire                Reg_next_0      ;
wire                Reg_apply_1     ;
wire    [4:0]       Reg_addr_1      ;
wire    [15:0]      Reg_data_1      ;
wire                Reg_next_1      ;
wire    [5:0]       Addra           ;
wire    [31:0]      Dina            ;
wire    [31:0]      Douta           ;
wire                Wea             ;

//******************************************************************************  

assign      RxAddrb=0;
assign      TxAddrb=0;

RMON_addr_gen U_0_Rx_RMON_addr_gen(
.Clk                    (Clk                        ),                                            
.Reset                  (Reset                      ),                              
 //RMON                 (//RMON                     ),                                 
.Pkt_type_rmon          (Rx_pkt_type_rmon           ),                          
.Pkt_length_rmon        (Rx_pkt_length_rmon         ),                                  
.Apply_rmon             (Rx_apply_rmon              ),
.Pkt_err_type_rmon      (Rx_pkt_err_type_rmon       ),                             
 //Rmon_ctrl            (//Rron_ctrl                ),                                          
.Reg_apply              (Reg_apply_0                ),                          
.Reg_addr               (Reg_addr_0                 ),                              
.Reg_data               (Reg_data_0                 ),                              
.Reg_next               (Reg_next_0                 ),                              
 //CPU                  (//CPU                       ),                                 
.Reg_drop_apply         (                           ));

RMON_addr_gen U_0_Tx_RMON_addr_gen(
.Clk                    (Clk                        ),                                            
.Reset                  (Reset                      ),                              
 //RMON                 (//RMON                     ),                                 
.Pkt_type_rmon          (Tx_pkt_type_rmon           ),                          
.Pkt_length_rmon        (Tx_pkt_length_rmon         ),                                  
.Apply_rmon             (Tx_apply_rmon              ),
.Pkt_err_type_rmon      (Tx_pkt_err_type_rmon       ),                             
 //Rmon_ctrl            (//Rron_ctrl                ),                                              
.Reg_apply              (Reg_apply_1                ),                          
.Reg_addr               (Reg_addr_1                 ),                              
.Reg_data               (Reg_data_1                 ),                              
.Reg_next               (Reg_next_1                 ),                              
 //CPU                  (//CPU                       ),                                 
.Reg_drop_apply         (                           ));

RMON_CTRL U_RMON_CTRL(
.Clk                    (Clk                        ),        
.Reset                  (Reset                      ), 
 //RMON_CTRL            (//RMON_CTRL                ),  
.Reg_apply_0            (Reg_apply_0                ),         
.Reg_addr_0             (Reg_addr_0                 ), 
.Reg_data_0             (Reg_data_0                 ), 
.Reg_next_0             (Reg_next_0                 ), 
.Reg_apply_1            (Reg_apply_1                ),         
.Reg_addr_1             (Reg_addr_1                 ), 
.Reg_data_1             (Reg_data_1                 ), 
.Reg_next_1             (Reg_next_1                 ), 
 //dual-port ram        (//dual-port ram            ),  
.Addra                  (Addra                      ), 
.Dina                   (Dina                       ), 
.Douta                  (Douta                      ), 
.Wea                    (Wea                        ),       
 //CPU                  (//CPU                      ),    
.CPU_rd_addr            (CPU_rd_addr                ),     
.CPU_rd_apply           (CPU_rd_apply               ), 
.CPU_rd_grant           (CPU_rd_grant               ), 
.CPU_rd_dout            (CPU_rd_dout                ) 
);

RMON_dpram U_Rx_RMON_dpram(
.Reset                  (Reset                      ),       
.Clk                    (Clk                        ), 
//port-a for Rmon       (//port-a for Rmon          ),
.Addra                  (Addra                      ),
.Dina                   (Dina                       ),
.Douta                  (                           ),
.Wea                    (Wea                        ),
//port-b for CPU        (//port-b for CPU           ),
.Addrb                  (Addra                      ),
.Doutb                  (Douta                      ));

endmodule