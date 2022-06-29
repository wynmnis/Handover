`include "BR.sv"  
`include "Mul.sv"  
`include "define.sv" 
 //==============================================                                                
 //Writer:Shi-Yong Wu                                                                            
 //                                                                                              
 //Note:Modular multiplier                                                                       
 //using barrett reduction                                                                       
 //==============================================                                                
 `timescale 1ns/1ps                                                                              
                                                                                                 
 module MulMod(                                                                                  
   A_in,                                                                                         
   B_in,                                                                                                                                                                               
   modular,                                                                                        
   Pre_computing,                                                                                
   clk,                                                                                          
   rst_n,                                                                                        
   result                                                                                        
 );                                                                                              
   parameter DOUBLE_DATA_WIDTH   = 2*(`DATA_WIDTH);
                                                                                                 
   input [`DATA_WIDTH-1:0] A_in;                                                                  
   input [`DATA_WIDTH-1:0] B_in;                                                                  
   input [`DATA_WIDTH-1:0] modular;                                                                 
   input [`BR_PRECOMPUTE_WIDTH-1:0] Pre_computing;                                                                                                                                      
   input clk;                                                                                    
   input rst_n;                                                                                  
                                                                                                 
   output [`DATA_WIDTH-1:0] result;                                                               
                                                                                                 
                                                                                                 
   wire [DOUBLE_DATA_WIDTH-1:0]S_wire;                                                                                                                                                                                                                  
                                                                                                 
	Mul M1(                                                                                       
		.A_in(A_in),                                                                                
		.B_in(B_in),                                                                                
		.clk(clk),                                                                                   
		.rst_n(rst_n),                                                                               
		.S_out(S_wire)                                                                                
	);                                                                                            
 
                                                                  
   BR BR1(                                                        
		.S_in(S_wire),                                      
		.result(result),                                        
		.Prime(modular),                                          
		.Pre_computing(Pre_computing),                          
		.rst_n(rst_n),                                          
		.clk(clk)                                               
	);                                                             
                                                                  
 endmodule                                                                                       
