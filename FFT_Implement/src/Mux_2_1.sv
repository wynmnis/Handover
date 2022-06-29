`include "define.sv"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:8-1 Mux                                                                                                
 //============================================== 
 `timescale 1ns/1ps    
 
module Mux_2_1(     
	input sel							 ,																				
	input [`ADDR_WIDTH-1:0]A_0           ,
	input [`ADDR_WIDTH-1:0]A_1           ,
	input [`DATA_WIDTH-1:0]D_0           ,
	input [`DATA_WIDTH-1:0]D_1           ,
	logic CEN_0                          ,
	logic CEN_1                          ,
	logic WEN_0                          ,
	logic WEN_1                          ,
	output logic [`ADDR_WIDTH-1:0]A_Out  ,
	output logic [`DATA_WIDTH-1:0]D_Out  ,
	output logic CEN_out                 ,
	output logic WEN_out
); 	
                                                                                        
	
	always@(*) begin
		if(sel) begin
			A_Out    =  A_1   ;
            D_Out    = 	D_1   ;
			CEN_out  =  CEN_1 ;
			WEN_out  =  WEN_1 ;
		end
		else begin
			A_Out    =  A_0   ;
            D_Out    = 	D_0   ;
			CEN_out  =  CEN_0 ;
			WEN_out  =  WEN_0 ;		
		end
	end		
endmodule