 `include "define.sv"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:Modular Adder           out = ((A - B) < 0) ? ((A-B)+q) : (A+B)                                                                                                                                 
 //==============================================                                                
 `timescale 1ns/1ps                                                                              
                                                                                                 
 module SubMod(                                                                                  
	A_in,                                                                                         
	B_in,                                                                                         
	modular,
	result                                                                                        
 );                                                                                              
																								
	input [`DATA_WIDTH-1:0] A_in;                                                                  
	input [`DATA_WIDTH-1:0] B_in;      
	reg [`DATA_WIDTH_ADD-1:0] C;    
	input [`DATA_WIDTH-1:0] modular;                                                                                                                                                                                                                                                 
	output reg [`DATA_WIDTH-1:0] result;   
	reg [`DATA_WIDTH_ADD-1:0] C_tmp;                                                             

																								
	always@(*) begin
		C = A_in - B_in;
		C_tmp = C + modular;
		result = (C[`DATA_WIDTH] == 1'b1) ? C_tmp : C;	
	end  																						 
	
 endmodule                                                                                       
