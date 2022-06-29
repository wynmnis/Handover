`include "define.sv"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:2-1 Mux                                                                                                
 //============================================== 
 `timescale 1ns/1ps    
 
module Mux (
	A_in,                                                                                         
	B_in,                                                                                         
	sel,                                                                                                                                                                     
	result   		
); 
	
	input [`DATA_WIDTH-1:0] A_in;	
	input [`DATA_WIDTH-1:0] B_in;	
	input sel;
	output [`DATA_WIDTH-1:0] result;
	
	assign result = (sel) ? A_in : B_in;		
	
endmodule