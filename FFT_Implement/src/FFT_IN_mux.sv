`include "define.sv" 
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:FFT_mux1          mux after mem bank and before PE, reindex the input of config FFT                                                                                                                             
 //==============================================                                                
 `timescale 1ns/1ps                                                                              
                                                                                                 
 module FFT_IN_mux( 
	point,
	point_2_mode,
	mem_OUT_0,
	mem_OUT_1,
	mem_OUT_2,
	mem_OUT_3,
	mem_OUT_4,
	mem_OUT_5,
	mem_OUT_6,
	mem_OUT_7,	
	FFT_IN_0,
	FFT_IN_1,
	FFT_IN_2,
	FFT_IN_3,
	FFT_IN_4,
	FFT_IN_5,
	FFT_IN_6,
	FFT_IN_7,
	FFT_IN_8,
	FFT_IN_9,
	FFT_IN_10,
	FFT_IN_11	
 );   
 	
	input [2:0]point;  //
	input point_2_mode;
	input [`DATA_WIDTH-1:0]  mem_OUT_0; 
	input [`DATA_WIDTH-1:0]  mem_OUT_1; 
	input [`DATA_WIDTH-1:0]  mem_OUT_2; 
	input [`DATA_WIDTH-1:0]  mem_OUT_3; 
	input [`DATA_WIDTH-1:0]  mem_OUT_4; 
	input [`DATA_WIDTH-1:0]  mem_OUT_5; 
	input [`DATA_WIDTH-1:0]  mem_OUT_6; 
	input [`DATA_WIDTH-1:0]  mem_OUT_7; 	
	output reg [`DATA_WIDTH-1:0] FFT_IN_0; 
	output reg [`DATA_WIDTH-1:0] FFT_IN_1;
	output reg [`DATA_WIDTH-1:0] FFT_IN_2;
	output reg [`DATA_WIDTH-1:0] FFT_IN_3;
	output reg [`DATA_WIDTH-1:0] FFT_IN_4;
	output reg [`DATA_WIDTH-1:0] FFT_IN_5;
    output reg [`DATA_WIDTH-1:0] FFT_IN_6;
    output reg [`DATA_WIDTH-1:0] FFT_IN_7;
    output reg [`DATA_WIDTH-1:0] FFT_IN_8;
    output reg [`DATA_WIDTH-1:0] FFT_IN_9;
    output reg [`DATA_WIDTH-1:0] FFT_IN_10;
    output reg [`DATA_WIDTH-1:0] FFT_IN_11;
	
	
	always@(*) begin
    	case(point)
			3'd7: begin
				FFT_IN_0 = mem_OUT_0;
				FFT_IN_1 = mem_OUT_1;
				FFT_IN_2 = mem_OUT_6;
				FFT_IN_3 = mem_OUT_4;
				FFT_IN_4 = mem_OUT_3;
				FFT_IN_5 = mem_OUT_2;
				FFT_IN_6 = mem_OUT_5;
				FFT_IN_7 =  'd0;
				FFT_IN_8 =  'd0;
				FFT_IN_9 =  'd0;
				FFT_IN_10 = 'd0;
				FFT_IN_11 = 'd0;				
			end
			3'd5: begin
				FFT_IN_0 = mem_OUT_0;
				FFT_IN_1 = mem_OUT_1;
				FFT_IN_2 = mem_OUT_4;
				FFT_IN_3 = mem_OUT_3;
				FFT_IN_4 = mem_OUT_2;
				FFT_IN_5 =  'd0;
				FFT_IN_6 =  'd0;
				FFT_IN_7 =  'd0;
				FFT_IN_8 =  'd0;
				FFT_IN_9 =  'd0;
				FFT_IN_10 = 'd0;
				FFT_IN_11 = 'd0;					
			end				
			3'd4: begin
				FFT_IN_0 = 'd0;
				FFT_IN_1 = mem_OUT_0;
				FFT_IN_2 = mem_OUT_2;
				FFT_IN_3 = 'd0;
				FFT_IN_4 = 'd0;
				FFT_IN_5 = mem_OUT_1;
				FFT_IN_6 = mem_OUT_3;
				FFT_IN_7 = 'd0;
				FFT_IN_8 = 'd0;
				FFT_IN_9 = 'd0;
				FFT_IN_10 = 'd0;
				FFT_IN_11 = 'd0;	
			end					
			3'd3: begin
				FFT_IN_0 = mem_OUT_0;
				FFT_IN_1 = mem_OUT_1;
				FFT_IN_2 = mem_OUT_2;
				FFT_IN_3 = 'd0;
				FFT_IN_4 = 'd0;
				FFT_IN_5 = mem_OUT_4;
				FFT_IN_6 = mem_OUT_5;
				FFT_IN_7 = mem_OUT_3;
				FFT_IN_8 =  'd0;
				FFT_IN_9 =  'd0;
				FFT_IN_10 = 'd0;
				FFT_IN_11 = 'd0;					
			end				
			3'd2: begin
				if(point_2_mode) begin
					FFT_IN_0 = 'd0;
					FFT_IN_1 = mem_OUT_0;
					FFT_IN_2 = mem_OUT_1;
					FFT_IN_3 = 'd0;
					FFT_IN_4 = 'd0;
					FFT_IN_5 = mem_OUT_2;
					FFT_IN_6 = mem_OUT_3;
					FFT_IN_7 = 'd0;
					FFT_IN_8 = mem_OUT_4;
					FFT_IN_9 = mem_OUT_5;
					FFT_IN_10 = mem_OUT_6;
					FFT_IN_11 = mem_OUT_7;	
				end
				else begin
					FFT_IN_0 = 'd0;
					FFT_IN_1 = mem_OUT_0;
					FFT_IN_2 = mem_OUT_1;
					FFT_IN_3 = 'd0;
					FFT_IN_4 = 'd0;
					FFT_IN_5 = mem_OUT_2;
					FFT_IN_6 = mem_OUT_3;
					FFT_IN_7 = 'd0;
					FFT_IN_8 = mem_OUT_4;
					FFT_IN_9 = mem_OUT_5;
					FFT_IN_10 = 'd0;
					FFT_IN_11 = 'd0;					
				end
				
			end				
			default: begin
				FFT_IN_0 =  'd0;
				FFT_IN_1 =  'd0;
				FFT_IN_2 =  'd0;
				FFT_IN_3 =  'd0;
				FFT_IN_4 =  'd0;
				FFT_IN_5 =  'd0;
				FFT_IN_6 =  'd0;
				FFT_IN_7 =  'd0;
				FFT_IN_8 =  'd0;
				FFT_IN_9 =  'd0;
				FFT_IN_10 = 'd0;
				FFT_IN_11 = 'd0;					
			end					
		endcase  
    end


	
endmodule