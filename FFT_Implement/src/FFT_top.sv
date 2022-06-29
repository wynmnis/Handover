 `timescale 1ns/1ps   
 `include "define.sv"
 `include "FFT_IN_mux.sv" 
 `include "Config_FFT.sv"      
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:TOP           TOP                                                                                                                                 
 //==============================================                                                
                                                                                                                                                                         
 module FFT_top(
	clk, rst_n, 
	FFT_0,
    FFT_1,
    FFT_2,
    FFT_3,
	FFT_4,
    FFT_5,
    FFT_6,
    FFT_7,	
	modular,
	point,
	point_2_mode,
	pre_sel,
	inverse,
	FFT_LAST_STAGE,
	IFFT_LAST_STAGE,	
	sum_trigger,
	sum_trigger_delay8,
	sum_in,	
	sum_out,
	d0_in,
	d0_out,	
	mem_IN_0,	
	mem_IN_1,	
	mem_IN_2,	
	mem_IN_3,	
	mem_IN_4,	
	mem_IN_5,	
	mem_IN_6,
	mem_IN_7,	
	POINTWISE_COEF_0,
	POINTWISE_COEF_1,
	POINTWISE_COEF_2,
	POINTWISE_COEF_3,
	POINTWISE_COEF_4,
	POINTWISE_COEF_5,
	POINTWISE_COEF_6,
	POINTWISE_COEF_7	
 );                                                                                                                                                                           

	
	input [2:0]pre_sel;
	input clk;
	input rst_n;
	input [2:0]point;
	input point_2_mode;
	input inverse;
	input FFT_LAST_STAGE;
	input IFFT_LAST_STAGE;
	input sum_trigger;	
	input sum_trigger_delay8;
	input [`DATA_WIDTH-1:0] sum_in;	
	output logic [`DATA_WIDTH-1:0] sum_out;	
	input [`DATA_WIDTH-1:0]d0_in;	
	output logic [`DATA_WIDTH-1:0] d0_out;			
	output logic[`DATA_WIDTH-1:0] mem_IN_0; 
	output logic[`DATA_WIDTH-1:0] mem_IN_1;
	output logic[`DATA_WIDTH-1:0] mem_IN_2;
	output logic[`DATA_WIDTH-1:0] mem_IN_3;
	output logic[`DATA_WIDTH-1:0] mem_IN_4;
	output logic[`DATA_WIDTH-1:0] mem_IN_5;
	output logic[`DATA_WIDTH-1:0] mem_IN_6;
	output logic[`DATA_WIDTH-1:0] mem_IN_7;

	input [`DATA_WIDTH-1:0] FFT_0;
	input [`DATA_WIDTH-1:0] FFT_1;
	input [`DATA_WIDTH-1:0] FFT_2;
	input [`DATA_WIDTH-1:0] FFT_3;	
	input [`DATA_WIDTH-1:0] FFT_4;
	input [`DATA_WIDTH-1:0] FFT_5;
	input [`DATA_WIDTH-1:0] FFT_6;
	input [`DATA_WIDTH-1:0] FFT_7;	
	input [`DATA_WIDTH-1:0] modular;

	input [`DATA_WIDTH-1:0] POINTWISE_COEF_0;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_1;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_2;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_3;	
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_4;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_5;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_6;	
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_7;	
	
	logic [`DATA_WIDTH-1:0] mem_OUT_0;
	logic [`DATA_WIDTH-1:0] mem_OUT_1;
	logic [`DATA_WIDTH-1:0] mem_OUT_2;
	logic [`DATA_WIDTH-1:0] mem_OUT_3;
	logic [`DATA_WIDTH-1:0] mem_OUT_4;
	logic [`DATA_WIDTH-1:0] mem_OUT_5;
	logic [`DATA_WIDTH-1:0] mem_OUT_6;
	logic [`DATA_WIDTH-1:0] mem_OUT_7;	
	
	logic [`DATA_WIDTH-1:0] FFT_IN_0;
	logic [`DATA_WIDTH-1:0] FFT_IN_1;
	logic [`DATA_WIDTH-1:0] FFT_IN_2;
	logic [`DATA_WIDTH-1:0] FFT_IN_3;	
	logic [`DATA_WIDTH-1:0] FFT_IN_4;
	logic [`DATA_WIDTH-1:0] FFT_IN_5;
	logic [`DATA_WIDTH-1:0] FFT_IN_6;
	logic [`DATA_WIDTH-1:0] FFT_IN_7;
	logic [`DATA_WIDTH-1:0] FFT_IN_8;
	logic [`DATA_WIDTH-1:0] FFT_IN_9;
	logic [`DATA_WIDTH-1:0] FFT_IN_10;
	logic [`DATA_WIDTH-1:0] FFT_IN_11;
	
	logic [`DATA_WIDTH-1:0] FFT_OUT_0;
	logic [`DATA_WIDTH-1:0] FFT_OUT_1;
	logic [`DATA_WIDTH-1:0] FFT_OUT_2;
	logic [`DATA_WIDTH-1:0] FFT_OUT_3;
	logic [`DATA_WIDTH-1:0] FFT_OUT_4;
	logic [`DATA_WIDTH-1:0] FFT_OUT_5;
	logic [`DATA_WIDTH-1:0] FFT_OUT_6;
	logic [`DATA_WIDTH-1:0] FFT_OUT_7;

FFT_IN_mux FFT_IN_MUX( 
	.point    (point),
	.point_2_mode(point_2_mode), 
	.mem_OUT_0(FFT_0),
	.mem_OUT_1(FFT_1),
	.mem_OUT_2(FFT_2),
	.mem_OUT_3(FFT_3),
	.mem_OUT_4(FFT_4),
	.mem_OUT_5(FFT_5),
	.mem_OUT_6(FFT_6),
	.mem_OUT_7(FFT_7),	
	.FFT_IN_0(FFT_IN_0),
	.FFT_IN_1(FFT_IN_1),
	.FFT_IN_2(FFT_IN_2),
	.FFT_IN_3(FFT_IN_3),
	.FFT_IN_4(FFT_IN_4),
	.FFT_IN_5(FFT_IN_5),
	.FFT_IN_6(FFT_IN_6),
	.FFT_IN_7(FFT_IN_7),
	.FFT_IN_8(FFT_IN_8),
	.FFT_IN_9(FFT_IN_9),
	.FFT_IN_10(FFT_IN_10),
	.FFT_IN_11(FFT_IN_11)	
 ); 

Config_FFT CONFIG_FFT(                                       
    .clk      (clk     ),  
    .rst_n    (rst_n   ),  
    .pre_sel (pre_sel),  
    .point    (point   ),
	.modular  (modular ),
	.inverse  (inverse ),	
	.FFT_LAST_STAGE(FFT_LAST_STAGE),	
	.IFFT_LAST_STAGE(IFFT_LAST_STAGE),	
	.sum_trigger(sum_trigger),
	.sum_trigger_delay8(sum_trigger_delay8),
	.sum_in (sum_in ),
	.sum_out(sum_out),
	.d0_in  (d0_in  ),
	.d0_out (d0_out ),	
	.FFT_IN_0 (FFT_IN_0),
    .FFT_IN_1 (FFT_IN_1),
    .FFT_IN_2 (FFT_IN_2),
    .FFT_IN_3 (FFT_IN_3),
    .FFT_IN_4 (FFT_IN_4),
    .FFT_IN_5 (FFT_IN_5),
    .FFT_IN_6 (FFT_IN_6),
    .FFT_IN_7 (FFT_IN_7),
    .FFT_IN_8 (FFT_IN_8),
    .FFT_IN_9 (FFT_IN_9), 
    .FFT_IN_10 (FFT_IN_10),
    .FFT_IN_11 (FFT_IN_11), 	
    .FFT_OUT_0(FFT_OUT_0),
    .FFT_OUT_1(FFT_OUT_1),
    .FFT_OUT_2(FFT_OUT_2),
    .FFT_OUT_3(FFT_OUT_3),
    .FFT_OUT_4(FFT_OUT_4),
    .FFT_OUT_5(FFT_OUT_5),
    .FFT_OUT_6(FFT_OUT_6),
    .FFT_OUT_7(FFT_OUT_7),	
	.POINTWISE_COEF_0(POINTWISE_COEF_0),
	.POINTWISE_COEF_1(POINTWISE_COEF_1),
	.POINTWISE_COEF_2(POINTWISE_COEF_2),
	.POINTWISE_COEF_3(POINTWISE_COEF_3),
	.POINTWISE_COEF_4(POINTWISE_COEF_4),
	.POINTWISE_COEF_5(POINTWISE_COEF_5),
	.POINTWISE_COEF_6(POINTWISE_COEF_6),
	.POINTWISE_COEF_7(POINTWISE_COEF_7)	
 );
 
 
 
/*
FFT_OUT_mux FFT_OUT_MUX( 
	.point    (point),
	.FFT_OUT_0(FFT_OUT_0),
    .FFT_OUT_1(FFT_OUT_1),
    .FFT_OUT_2(FFT_OUT_2),
    .FFT_OUT_3(FFT_OUT_3),
    .FFT_OUT_4(FFT_OUT_4),
    .FFT_OUT_5(FFT_OUT_5),
    .FFT_OUT_6(FFT_OUT_6),
    .FFT_OUT_7(FFT_OUT_7),	
    .mem_IN_0(mem_IN_0),
    .mem_IN_1(mem_IN_1),
    .mem_IN_2(mem_IN_2),
    .mem_IN_3(mem_IN_3),
    .mem_IN_4(mem_IN_4),
    .mem_IN_5(mem_IN_5),
    .mem_IN_6(mem_IN_6),
    .mem_IN_7(mem_IN_7)	
 ); 
*/

/*
	assign mem_IN_0 =	FFT_OUT_0 ;
	assign mem_IN_1 =	FFT_OUT_1 ;
	assign mem_IN_2 =	FFT_OUT_2 ;
	assign mem_IN_3 =	FFT_OUT_3 ;
	assign mem_IN_4 =	FFT_OUT_4 ;
	assign mem_IN_5 =	FFT_OUT_5 ;
	assign mem_IN_6 =   FFT_OUT_6 ;
	assign mem_IN_7 =   FFT_OUT_7 ;
*/



logic [`DATA_WIDTH-1:0]FFT_OUT_0_delay1;
logic [`DATA_WIDTH-1:0]FFT_OUT_1_delay1;
logic [`DATA_WIDTH-1:0]FFT_OUT_2_delay1;
logic [`DATA_WIDTH-1:0]FFT_OUT_3_delay1;
logic [`DATA_WIDTH-1:0]FFT_OUT_4_delay1;
logic [`DATA_WIDTH-1:0]FFT_OUT_5_delay1;
logic [`DATA_WIDTH-1:0]FFT_OUT_6_delay1;
logic [`DATA_WIDTH-1:0]FFT_OUT_7_delay1;






always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		mem_IN_0 <=	'd0 ;	
		mem_IN_1 <=	'd0 ;
		mem_IN_2 <=	'd0 ;
		mem_IN_3 <=	'd0 ;
		mem_IN_4 <=	'd0 ;
		mem_IN_5 <=	'd0 ;
		mem_IN_6 <= 'd0 ;
		mem_IN_7 <= 'd0 ;
		//FFT_OUT_0_delay1  <= 'd0 ;
		//FFT_OUT_1_delay1  <= 'd0 ;
		//FFT_OUT_2_delay1  <= 'd0 ;
		//FFT_OUT_3_delay1  <= 'd0 ;
		//FFT_OUT_4_delay1  <= 'd0 ;
		//FFT_OUT_5_delay1  <= 'd0 ;
		//FFT_OUT_6_delay1  <= 'd0 ;
		//FFT_OUT_7_delay1  <= 'd0 ;
	end
	else begin
		mem_IN_0 <=	FFT_OUT_0 ;	
		mem_IN_1 <=	FFT_OUT_1 ;
		mem_IN_2 <=	FFT_OUT_2 ;
		mem_IN_3 <=	FFT_OUT_3 ;
		mem_IN_4 <=	FFT_OUT_4 ;
		mem_IN_5 <=	FFT_OUT_5 ;
		mem_IN_6 <= FFT_OUT_6 ;
		mem_IN_7 <= FFT_OUT_7 ;	
	/*
		mem_IN_0 <=	FFT_OUT_0_delay1 ;	
		mem_IN_1 <=	FFT_OUT_1_delay1 ;
		mem_IN_2 <=	FFT_OUT_2_delay1 ;
		mem_IN_3 <=	FFT_OUT_3_delay1 ;
		mem_IN_4 <=	FFT_OUT_4_delay1 ;
		mem_IN_5 <=	FFT_OUT_5_delay1 ;
		mem_IN_6 <= FFT_OUT_6_delay1 ;
		mem_IN_7 <= FFT_OUT_7_delay1 ;		
		FFT_OUT_0_delay1  <= FFT_OUT_0 ;
		FFT_OUT_1_delay1  <= FFT_OUT_1 ;
		FFT_OUT_2_delay1  <= FFT_OUT_2 ;
		FFT_OUT_3_delay1  <= FFT_OUT_3 ;
		FFT_OUT_4_delay1  <= FFT_OUT_4 ;
		FFT_OUT_5_delay1  <= FFT_OUT_5 ;
		FFT_OUT_6_delay1  <= FFT_OUT_6 ;
		FFT_OUT_7_delay1  <= FFT_OUT_7 ;
	*/		
	end
end


	
 endmodule    