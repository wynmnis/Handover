`include "define.sv" 
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:AGU_1           for second PFA index mapping n2,n3                                                                                                                                 
 //==============================================                                                
 `timescale 1ns/1ps                                                                              
                                                                                                 
 module AGU_2( 
	m1_done,
	AGU_1_done,    
    clk,                                           
    rst_n, 	
	N1,
	N2,	
	n1_out,
	n2_out,
	AGU_2_done,
	case_41
 );                                                                                              
	input m1_done; 
	input AGU_1_done;    
    input clk;                                           
    input rst_n; 	
	input [1:0]case_41;
	input  [`INDEX_WIDTH_N-1:0]N1;
	input  [`INDEX_WIDTH_N-1:0]N2;	
	output logic[`INDEX_WIDTH_N-1:0]n1_out;   
	output logic[`INDEX_WIDTH_N-1:0]n2_out;
	output logic AGU_2_done;


	logic[`INDEX_WIDTH_N-1:0]n1;   
	logic[`INDEX_WIDTH_N-1:0]n2;																						
    logic [`INDEX_WIDTH_N-1:0]n1_add1;
	logic [`INDEX_WIDTH_N-1:0]n2_add_mux1;
	logic [`INDEX_WIDTH_N-1:0] mux0;
	logic [`INDEX_WIDTH_N-1:0] mux1;
	logic [`INDEX_WIDTH_N-1:0] mux2;
	logic [`INDEX_WIDTH_N-1:0] mux3;	
	


	
	assign n1_add1 = n1 + mux3;
	assign n2_add_mux1 = n2 + mux1;
	assign AGU_2_done = (n2_add_mux1 == N2) ? 1'b1 : 1'b0;
	assign mux2 = (AGU_2_done) ? 'd0 : n2_add_mux1;
	assign mux3 = (case_41==2'd1) ? m1_done : AGU_1_done;	

	assign n1_out = n1;
	assign n2_out = n2;	
	
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			n1 <= 0;
			n2 <= 0;
		
		end
		else begin
			n1 <= mux0;
			n2 <= mux2;	
			
		end
	end

		always@(*) begin
			if(n1_add1 == N1) begin
				mux0 = 'd0;
				mux1 = 'd1;		
			end
			else begin
				mux0 = n1_add1;
				mux1 = 'd0;				
			end
		end

	
 endmodule   