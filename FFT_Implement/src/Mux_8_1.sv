`include "define.sv"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:8-1 Mux                                                                                                
 //============================================== 
 `timescale 1ns/1ps    
 
module Mux_8_1(                                                                                        
	A_0,                                                                                         
	A_1,                                                                                         
	A_2,                                                                                                                                                                     
	A_3, 
	A_4,  
	A_5,  
	A_6,  	
	A_7,	
	D_0,                                                                                         
	D_1,                                                                                         
	D_2,                                                                                                                                                                     
	D_3, 
	D_4,  
	D_5,  
	D_6,  	
	D_7,	
    sel,
    CEN_Out,
	A_Out,
	D_Out
); 	
                                                                                        
	input [`ADDR_WIDTH-1:0] A_0;                                                                                         
	input [`ADDR_WIDTH-1:0] A_1;                                                                                         
	input [`ADDR_WIDTH-1:0] A_2;                                                                                                                                                                     
	input [`ADDR_WIDTH-1:0] A_3; 
	input [`ADDR_WIDTH-1:0] A_4;  
	input [`ADDR_WIDTH-1:0] A_5;  
	input [`ADDR_WIDTH-1:0] A_6;  	
	input [`ADDR_WIDTH-1:0] A_7;
	input [`DATA_WIDTH-1:0] D_0;                                                                                         
	input [`DATA_WIDTH-1:0] D_1;                                                                                         
	input [`DATA_WIDTH-1:0] D_2;                                                                                                                                                                     
	input [`DATA_WIDTH-1:0] D_3; 
	input [`DATA_WIDTH-1:0] D_4;  
	input [`DATA_WIDTH-1:0] D_5;  
	input [`DATA_WIDTH-1:0] D_6;  	
	input [`DATA_WIDTH-1:0] D_7;	
    input [3:0] sel;
    output reg CEN_Out;
	output reg [`ADDR_WIDTH-1:0] A_Out;
	output reg [`DATA_WIDTH-1:0] D_Out;


	
	always@(*) begin
		case(sel)
			'd0: begin
				CEN_Out = 'd0;
				A_Out     = A_0;
				D_Out     = D_0;
			end
			'd1: begin
				CEN_Out = 'd0;
				A_Out     = A_1;
				D_Out     = D_1;
			end
			'd2: begin
				CEN_Out = 'd0;
				A_Out     = A_2;
				D_Out     = D_2;
			end
			'd3: begin
				CEN_Out = 'd0;
				A_Out     = A_3;
				D_Out     = D_3;
			end
			'd4: begin
				CEN_Out = 'd0;
				A_Out     = A_4;
				D_Out     = D_4;
			end
			'd5: begin
				CEN_Out = 'd0;
				A_Out     = A_5;
				D_Out     = D_5;
			end
			'd6: begin
				CEN_Out = 'd0;
				A_Out     = A_6;
				D_Out     = D_6;
			end
			'd7: begin
				CEN_Out = 'd0; 
				A_Out     = A_7;
				D_Out     = D_7;
			end				
			default: begin
				CEN_Out = 'd1; // off
				A_Out     = 'd2047;
				D_Out     = 'd0;
			end				
		endcase
	end		
endmodule