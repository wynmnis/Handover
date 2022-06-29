 `include "define.sv"
 `include "AddMod.sv" 
 `include "SubMod.sv"  
 `include "Mux.sv"  
 `include "MulMod.sv"  
 `include "PRE_COMPUTED_DATA.sv"
 //==============================================  
 //Writer: Ryan Huang                              
 //                                                
 //Note:multiplier                                 
 //==============================================  
 `timescale 1ns/1ps                                
 module Config_FFT(                                       
    clk      ,  
    rst_n    ,  
    pre_sel ,  
    point    ,
	modular  ,
	inverse  ,
	FFT_LAST_STAGE,	  //need to mul precomputed data
	IFFT_LAST_STAGE,  //need to add do	
	sum_trigger,       //store sum from DFT to register
	sum_trigger_delay8,
	sum_in,
	sum_out,
	d0_in,
	d0_out,
	FFT_IN_0 ,
    FFT_IN_1 ,
    FFT_IN_2 ,
    FFT_IN_3 ,
    FFT_IN_4 ,
    FFT_IN_5 ,
    FFT_IN_6 ,
    FFT_IN_7 ,
    FFT_IN_8 ,
    FFT_IN_9 ,   
    FFT_IN_10 , 
    FFT_IN_11 ,	
    FFT_OUT_0,
    FFT_OUT_1,
    FFT_OUT_2,
    FFT_OUT_3,
    FFT_OUT_4,
    FFT_OUT_5,
    FFT_OUT_6,
    FFT_OUT_7,	
	POINTWISE_COEF_0,
	POINTWISE_COEF_1,
	POINTWISE_COEF_2,
	POINTWISE_COEF_3,
	POINTWISE_COEF_4,
	POINTWISE_COEF_5,
	POINTWISE_COEF_6,
	POINTWISE_COEF_7
 );                                                

	parameter DATA_WIDTH = `DATA_WIDTH;
	
	input clk        ;                                      
	input rst_n      ; 
	input [2:0] pre_sel   ;
	input [2:0] point;
	input inverse	 ;
	input FFT_LAST_STAGE;
	input IFFT_LAST_STAGE;
	input sum_trigger;
	input sum_trigger_delay8;
	input [`DATA_WIDTH-1:0] sum_in;	
	output logic [`DATA_WIDTH-1:0] sum_out;	
	input [`DATA_WIDTH-1:0]d0_in;	
	output logic [`DATA_WIDTH-1:0] d0_out;		
	input [`DATA_WIDTH-1:0] FFT_IN_0;
	input [`DATA_WIDTH-1:0] FFT_IN_1;
	input [`DATA_WIDTH-1:0] FFT_IN_2;
	input [`DATA_WIDTH-1:0] FFT_IN_3;
	input [`DATA_WIDTH-1:0] FFT_IN_4;
	input [`DATA_WIDTH-1:0] FFT_IN_5;
	input [`DATA_WIDTH-1:0] FFT_IN_6;	
	input [`DATA_WIDTH-1:0] FFT_IN_7;
	input [`DATA_WIDTH-1:0] FFT_IN_8;
	input [`DATA_WIDTH-1:0] FFT_IN_9;
	input [`DATA_WIDTH-1:0] FFT_IN_10;	
	input [`DATA_WIDTH-1:0] FFT_IN_11;
	output [`DATA_WIDTH-1:0] FFT_OUT_0;
	output [`DATA_WIDTH-1:0] FFT_OUT_1;
	output [`DATA_WIDTH-1:0] FFT_OUT_2;
	output [`DATA_WIDTH-1:0] FFT_OUT_3;
	output [`DATA_WIDTH-1:0] FFT_OUT_4;
	output [`DATA_WIDTH-1:0] FFT_OUT_5;
	output [`DATA_WIDTH-1:0] FFT_OUT_6;	
	output [`DATA_WIDTH-1:0] FFT_OUT_7;	
	input [`DATA_WIDTH-1:0]  modular  ;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_0;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_1;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_2;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_3;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_4;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_5;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_6;
	input [`DATA_WIDTH-1:0] POINTWISE_COEF_7;	
	
	logic 	   ctrl_s0     ;
	logic[1:0] ctrl_s1	   ;
	logic      ctrl_s2     ;
	logic      ctrl_s3     ;
	logic      ctrl_s4     ;
	logic      ctrl_s5     ;

	logic [`DATA_WIDTH-1:0] C70 ;
	logic [`DATA_WIDTH-1:0] C71 ;
	logic [`DATA_WIDTH-1:0] C72 ;
	logic [`DATA_WIDTH-1:0] C73 ;
	logic [`DATA_WIDTH-1:0] C74 ;
	logic [`DATA_WIDTH-1:0] C75 ;
	logic [`DATA_WIDTH-1:0] C76 ;
	logic [`DATA_WIDTH-1:0] C77 ;
	logic [`DATA_WIDTH-1:0] C50 ;
	logic [`DATA_WIDTH-1:0] C51 ;
	logic [`DATA_WIDTH-1:0] C52 ;
	logic [`DATA_WIDTH-1:0] C53 ;
	logic [`DATA_WIDTH-1:0] C54 ;
	logic [`DATA_WIDTH-1:0] C40 ;
	logic [`DATA_WIDTH-1:0] C30 ;
	logic [`DATA_WIDTH-1:0] C31 ;
	
	logic [`DATA_WIDTH-1:0] c0 ;
	logic [`DATA_WIDTH-1:0] c1 ;	
	logic [`DATA_WIDTH-1:0] c2 ;	
	logic [`DATA_WIDTH-1:0] c3 ;	
	logic [`DATA_WIDTH-1:0] c4 ;	
	logic [`DATA_WIDTH-1:0] c5 ;	
	logic [`DATA_WIDTH-1:0] c6 ;	
	logic [`DATA_WIDTH-1:0] c7 ;	
	
	logic [`DATA_WIDTH-1:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19;
	logic [`DATA_WIDTH-1:0] s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s38;
	logic [`DATA_WIDTH-1:0] m0,m1,m2,m3,m4,m5,m6,m7;
	logic [`DATA_WIDTH-1:0] mux0,mux1,mux2,mux3,mux4,mux5,mux6,mux7,mux8,mux9,mux10,mux11,mux12,mux13;	
	logic [`BR_PRECOMPUTE_WIDTH-1:0] Pre_computing;
	logic [`DATA_WIDTH-1:0] m4_inv;
	logic [`DATA_WIDTH-1:0] m7_inv;
	
	logic [`DATA_WIDTH-1:0] s17_tmp ;
	logic [`DATA_WIDTH-1:0] s15_tmp ;
	logic [`DATA_WIDTH-1:0] s8_tmp  ;
	logic [`DATA_WIDTH-1:0] s9_tmp  ;
	logic [`DATA_WIDTH-1:0] s10_tmp ;
	logic [`DATA_WIDTH-1:0] s16_tmp ;
	logic [`DATA_WIDTH-1:0] s12_tmp ;
	logic [`DATA_WIDTH-1:0] s13_tmp ;
	logic [`DATA_WIDTH-1:0] s14_tmp ;
	
	logic [`DATA_WIDTH-1:0] s17_tmp_delay_1 ;
	logic [`DATA_WIDTH-1:0] s17_tmp_delay_2 ;
	logic [`DATA_WIDTH-1:0] s37_tmp_delay_1 ;
	logic [`DATA_WIDTH-1:0] s37_tmp_delay_2 ;
	 							  
	logic [`DATA_WIDTH-1:0] s17_tmp_delay_3 ;
	logic [`DATA_WIDTH-1:0] s19_tmp  		  ;
	logic [`DATA_WIDTH-1:0] m3_tmp      	  ;
	logic [`DATA_WIDTH-1:0] s20_tmp  		  ;
	logic [`DATA_WIDTH-1:0] s37_tmp_delay_3 ;
	logic [`DATA_WIDTH-1:0] s37_tmp_delay_4 ;	
	logic [`DATA_WIDTH-1:0] m2_tmp  		  ;
	logic [`DATA_WIDTH-1:0] mux4_tmp 	      ;
	logic [`DATA_WIDTH-1:0] s22_tmp  		  ;
	logic [`DATA_WIDTH-1:0] mux5_tmp 	      ;
	logic [`DATA_WIDTH-1:0] s23_tmp  		  ;
	logic [`DATA_WIDTH-1:0] mux6_tmp  	  ;
	logic [`DATA_WIDTH-1:0] m6_tmp  		  ;
	logic [`DATA_WIDTH-1:0] s24_tmp 	      ;
	
	logic	 ctrl_s0_delay_1;
	logic	 ctrl_s0_delay_2;
	logic	 ctrl_s0_delay_3;
	logic[1:0]ctrl_s1_delay_1;
	logic[1:0]ctrl_s1_delay_2;
	logic[1:0]ctrl_s1_delay_3;
	logic	 ctrl_s2_delay_1;
	logic	 ctrl_s2_delay_2;
	logic	 ctrl_s2_delay_3;
	logic	 ctrl_s2_delay_4;
	logic	 ctrl_s3_delay_1;
	logic	 ctrl_s3_delay_2;
	logic	 ctrl_s3_delay_3;
	logic	 ctrl_s3_delay_4;
	logic	 ctrl_s4_delay_1;
	logic	 ctrl_s4_delay_2;
	logic	 ctrl_s4_delay_3;
	logic	 ctrl_s5_delay_1;
	logic	 ctrl_s5_delay_2;
	logic	 ctrl_s5_delay_3;

	logic[`DATA_WIDTH-1:0] FFT_IN_8_tmp ;	
	logic[`DATA_WIDTH-1:0] FFT_IN_8_delay_1 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_8_delay_2 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_8_delay_3 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_8_delay_4 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_9_tmp ;	
	logic[`DATA_WIDTH-1:0] FFT_IN_9_delay_1 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_9_delay_2 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_9_delay_3 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_9_delay_4 ;	
	logic[`DATA_WIDTH-1:0] FFT_IN_10_tmp ;	
	logic[`DATA_WIDTH-1:0] FFT_IN_10_delay_1 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_10_delay_2 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_10_delay_3 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_10_delay_4 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_11_tmp ;	
	logic[`DATA_WIDTH-1:0] FFT_IN_11_delay_1 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_11_delay_2 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_11_delay_3 ;
	logic[`DATA_WIDTH-1:0] FFT_IN_11_delay_4 ;
	
	logic [`DATA_WIDTH-1:0] inv_2;
	logic [`DATA_WIDTH-1:0] inv_3;	
	logic [`DATA_WIDTH-1:0] inv_4;
	logic [`DATA_WIDTH-1:0] inv_5;	
	logic [`DATA_WIDTH-1:0] inv_7;
	
	logic[`DATA_WIDTH-1:0] MUL_COEF_0;
	logic[`DATA_WIDTH-1:0] MUL_COEF_1;
	logic[`DATA_WIDTH-1:0] MUL_COEF_2;
	logic[`DATA_WIDTH-1:0] MUL_COEF_3;
	logic[`DATA_WIDTH-1:0] MUL_COEF_4;
	logic[`DATA_WIDTH-1:0] MUL_COEF_5;
	logic[`DATA_WIDTH-1:0] MUL_COEF_6;
	logic[`DATA_WIDTH-1:0] MUL_COEF_7;	

	logic [`DATA_WIDTH-1:0]s17_tmp_delay_4;
	logic [`DATA_WIDTH-1:0]s31_tmp		;   
	logic [`DATA_WIDTH-1:0]mux9_tmp 		;
	logic [`DATA_WIDTH-1:0]s33_tmp		;	
	logic [`DATA_WIDTH-1:0]s34_tmp		;	
	logic [`DATA_WIDTH-1:0]s35_tmp		;	
	logic [`DATA_WIDTH-1:0]s36_tmp		;	
	logic [`DATA_WIDTH-1:0]s37_tmp		;	
	logic [`DATA_WIDTH-1:0]s38_tmp		;	
	logic [`DATA_WIDTH-1:0] m_0;
	logic [`DATA_WIDTH-1:0] m_1;
	logic [`DATA_WIDTH-1:0] m_2;
	logic [`DATA_WIDTH-1:0] m_3;
	logic [`DATA_WIDTH-1:0] m_4;
	logic [`DATA_WIDTH-1:0] m_5;
	logic [`DATA_WIDTH-1:0] m_6;	
	logic [`DATA_WIDTH-1:0] m_7;	
	logic [`DATA_WIDTH-1:0] a_0;
	logic [`DATA_WIDTH-1:0] a_1;
	logic [`DATA_WIDTH-1:0] a_2;
	logic [`DATA_WIDTH-1:0] a_3;
	logic [`DATA_WIDTH-1:0] a_4;
	logic [`DATA_WIDTH-1:0] a_5;
	logic [`DATA_WIDTH-1:0] a_6;	
	logic [`DATA_WIDTH-1:0] a_7;

	reg [`DATA_WIDTH-1:0] mem_IN_0_tmp;
	reg [`DATA_WIDTH-1:0] mem_IN_1_tmp;
	reg [`DATA_WIDTH-1:0] mem_IN_2_tmp;
	reg [`DATA_WIDTH-1:0] mem_IN_3_tmp;
	reg [`DATA_WIDTH-1:0] mem_IN_4_tmp;
	reg [`DATA_WIDTH-1:0] mem_IN_5_tmp;
	reg [`DATA_WIDTH-1:0] mem_IN_6_tmp;
	reg [`DATA_WIDTH-1:0] mem_IN_7_tmp;
	
	reg [`DATA_WIDTH-1:0]out_0 ;
	reg [`DATA_WIDTH-1:0]out_1 ;
	reg [`DATA_WIDTH-1:0]out_2 ;
	reg [`DATA_WIDTH-1:0]out_3 ;
	reg [`DATA_WIDTH-1:0]out_4 ;
	reg [`DATA_WIDTH-1:0]out_5 ;
	reg [`DATA_WIDTH-1:0]out_6 ;
	reg [`DATA_WIDTH-1:0]out_7 ;
	logic [`DATA_WIDTH-1:0]zero;
	assign zero = 'd0;
	
	
	
PRE_COMPUTED_DATA PRE_COMPUTED_DATA( 
	.inverse      (inverse      ) ,
	.Pre_computing(Pre_computing) ,
	.C70          (C70          ) ,
	.C71          (C71          ) ,
	.C72          (C72          ) ,
	.C73          (C73          ) ,
	.C74          (C74          ) ,
	.C75          (C75          ) ,
	.C76          (C76          ) ,
	.C77          (C77          ) ,
	.C50          (C50          ) ,
	.C51          (C51          ) ,
	.C52          (C52          ) ,
	.C53          (C53          ) ,
	.C54          (C54          ) ,
	.C40          (C40          ) ,
	.C30          (C30          ) ,
	.C31          (C31          ) ,
	.inv_2        (inv_2        ) ,
	.inv_3	      (inv_3	    ) ,
	.inv_4	      (inv_4	    ) ,
	.inv_5	      (inv_5	    ) ,
	.inv_7	      (inv_7	    ) 	
 ); 

	always@(*) begin  // coefficient
    	case(point)
			3'd7: begin
				c0 = C70;
				c1 = C71;
				c2 = C73;
				c3 = C72;
				c4 = C74;
				c5 = C75;
				c6 = C77;
				c7 = C76;				
			end
			3'd5: begin
				c0 = C50;
				c1 = C51;
				c2 = 'd0;
				c3 = 'd0;
				c4 = C54;
				c5 = 'd0;
				c6 = C52;   // -C52 = modular - C52 
				c7 = C53;	
			end				
			3'd4: begin
				c0 = 'd0;
				c1 = 'd1;
				c2 = 'd0;
				c3 = 'd1;
				c4 = 'd0;
				c5 = 'd1;
				c6 = 'd0;
				c7 = C40;
			end					
			3'd3: begin
				c0 = C30;
				c1 = 'd0;
				c2 = C30;
				c3 = 'd0;
				c4 = 'd0;
				c5 = C31;
				c6 = 'd0;
				c7 = C31;
			end				
			3'd2: begin
				c0 = 'd0;
				c1 = 'd0;
				c2 = 'd0;
				c3 = 'd0;
				c4 = 'd0;
				c5 = 'd1;
				c6 = 'd0;
				c7 = modular - 'd1;  // -1 = modular - 1
			end				
			default: begin
				c0 = 'd0;
				c1 = 'd0;
				c2 = 'd0;
				c3 = 'd0;
				c4 = 'd0;
				c5 = 'd0;
				c6 = 'd0;
				c7 = 'd0;
			end					
		endcase 		
	end
	
	always@(*) begin  //mux control signal
    	case(point)
			3'd7: begin
				ctrl_s0 = 'd0;
				ctrl_s1 = 'd0;
				ctrl_s2 = 'd0;
				ctrl_s3 = 'd0;
				ctrl_s4 = 'd0;
				ctrl_s5 = 'd0;				
			end
			3'd5: begin
				ctrl_s0 = 'd1;
				ctrl_s1 = 'd0;
				ctrl_s2 = 'd0;
				ctrl_s3 = 'd0;
				ctrl_s4 = 'd1;
				ctrl_s5 = 'd1;
			end				
			3'd4: begin
				ctrl_s0 = 'd0;
				ctrl_s1 = 'd1;
				ctrl_s2 = 'd0;
				ctrl_s3 = 'd0;
				ctrl_s4 = 'd1;
				ctrl_s5 = 'd1;
			end					
			3'd3: begin
				ctrl_s0 = 'd0;
				ctrl_s1 = 'd2;
				ctrl_s2 = 'd1;
				ctrl_s3 = 'd0;
				ctrl_s4 = 'd0;
				ctrl_s5 = 'd1;
			end				
			3'd2: begin
				ctrl_s0 = 'd0;
				ctrl_s1 = 'd1;
				ctrl_s2 = 'd1;
				ctrl_s3 = 'd1;
				ctrl_s4 = 'd1;
				ctrl_s5 = 'd0;
			end				
			default: begin
				ctrl_s0 = 'd0;
				ctrl_s1 = 'd0;
				ctrl_s2 = 'd0;
				ctrl_s3 = 'd0;
				ctrl_s4 = 'd0;
				ctrl_s5 = 'd0;
			end					
		endcase 	
	end	
	
	AddMod S1(                                                        
		.A_in(FFT_IN_1),                                                                                         
		.B_in(FFT_IN_2),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s1)                                                  
	);  
	SubMod S2(                                                        
		.A_in(FFT_IN_1),                                                                                         
		.B_in(FFT_IN_2),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s2)                                                  
	);  
	AddMod S3(                                                        
		.A_in(FFT_IN_3),                                                                                         
		.B_in(FFT_IN_4),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s3)                                                  
	);  
	SubMod S4(                                                        
		.A_in(FFT_IN_3),                                                                                         
		.B_in(FFT_IN_4),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s4)                                                  
	);  
	AddMod S5(                                                        
		.A_in(FFT_IN_5),                                                                                         
		.B_in(FFT_IN_6),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s5)                                                  
	);  
	SubMod S6(                                                        
		.A_in(FFT_IN_5),                                                                                         
		.B_in(FFT_IN_6),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s6)                                                  
	);




	logic [`DATA_WIDTH-1:0] s1_pip_1;
	logic [`DATA_WIDTH-1:0] s2_pip_1;
	logic [`DATA_WIDTH-1:0] s3_pip_1;
	logic [`DATA_WIDTH-1:0] s4_pip_1;
	logic [`DATA_WIDTH-1:0] s5_pip_1;
	logic [`DATA_WIDTH-1:0] s6_pip_1;
	logic [`DATA_WIDTH-1:0] FFT_IN_0_pip_1;
	logic [`DATA_WIDTH-1:0] FFT_IN_7_pip_1;
	logic [`DATA_WIDTH-1:0] FFT_IN_8_pip_1;
	logic [`DATA_WIDTH-1:0] FFT_IN_9_pip_1;
	logic [`DATA_WIDTH-1:0] FFT_IN_10_pip_1;
	logic [`DATA_WIDTH-1:0] FFT_IN_11_pip_1;	
	
	
	//pipeline
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			s1_pip_1 <= 'd0;
			s2_pip_1 <= 'd0;
			s3_pip_1 <= 'd0;
			s4_pip_1 <= 'd0;
			s5_pip_1 <= 'd0;
			s6_pip_1 <= 'd0;
			FFT_IN_0_pip_1 <= 'd0;
			FFT_IN_7_pip_1 <= 'd0;
			FFT_IN_8_pip_1 <= 'd0;
			FFT_IN_9_pip_1 <= 'd0;
			FFT_IN_10_pip_1 <= 'd0;
			FFT_IN_11_pip_1 <= 'd0;			
		end
		else begin
			s1_pip_1 <= s1;
			s2_pip_1 <= s2;
			s3_pip_1 <= s3;
			s4_pip_1 <= s4;
			s5_pip_1 <= s5;
			s6_pip_1 <= s6;	
			FFT_IN_0_pip_1 <= FFT_IN_0;		
			FFT_IN_7_pip_1 <=  FFT_IN_7;
			FFT_IN_8_pip_1 <=  FFT_IN_8;
			FFT_IN_9_pip_1 <=  FFT_IN_9;
			FFT_IN_10_pip_1 <= FFT_IN_10;
			FFT_IN_11_pip_1 <= FFT_IN_11;					
		end
	end
	
	logic 	   ctrl_s0_pip_1     ;
	logic[1:0] ctrl_s1_pip_1	 ;
	logic      ctrl_s2_pip_1     ;
	logic      ctrl_s3_pip_1     ;
	logic      ctrl_s4_pip_1     ;
	logic      ctrl_s5_pip_1     ;

	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			ctrl_s0_pip_1 <= 'd0;
			ctrl_s1_pip_1 <= 'd0;
			ctrl_s2_pip_1 <= 'd0;
			ctrl_s3_pip_1 <= 'd0;
			ctrl_s4_pip_1 <= 'd0;
			ctrl_s5_pip_1 <= 'd0;
		end               
		else begin        
			ctrl_s0_pip_1 <= ctrl_s0;
			ctrl_s1_pip_1 <= ctrl_s1;
			ctrl_s2_pip_1 <= ctrl_s2;
			ctrl_s3_pip_1 <= ctrl_s3;
			ctrl_s4_pip_1 <= ctrl_s4;
			ctrl_s5_pip_1 <= ctrl_s5;		
		end
	end


	
	AddMod S7(                                                        
		.A_in(s1_pip_1),                                                                                         
		.B_in(s3_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s7)                                                  
	);  
	SubMod S8(                                                        
		.A_in(s1_pip_1),                                                                                         
		.B_in(s3_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s8)                                                  
	); 
	Mux MUX7(
		.A_in(zero),                                                                                         
		.B_in(s1_pip_1),                                                                                         
		.sel(ctrl_s2),                                                                                                                                                                     
		.result(mux7)   		
	);
	SubMod S9(                                                        
		.A_in(s5_pip_1),                                                                                         
		.B_in(mux7),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s9)                                                  
	); 
	SubMod S10(                                                        
		.A_in(s3),                                                                                         
		.B_in(s5_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s10)                                                  
	); 
	AddMod S11(                                                        
		.A_in(s2_pip_1),                                                                                         
		.B_in(s4_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s11)                                                  
	); 
	SubMod S12(                                                        
		.A_in(s2_pip_1),                                                                                         
		.B_in(s4_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s12)                                                  
	); 
	SubMod S13(                                                        
		.A_in(s6_pip_1),                                                                                         
		.B_in(s2_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s13)                                                  
	); 
	SubMod S14(                                                        
		.A_in(s4_pip_1),                                                                                         
		.B_in(s6_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s14)                                                  
	); 	
	Mux MUX8(
		.A_in(zero),                                                                                         
		.B_in(s5_pip_1),                                                                                         
		.sel(ctrl_s2),                                                                                                                                                                     
		.result(mux8)   		
	);
	AddMod S15(                                                        
		.A_in(s7),                                                                                         
		.B_in(mux8),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s15)                                                  
	); 
	AddMod S16(                                                        
		.A_in(s11),                                                                                         
		.B_in(s6_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s16)                                                  
	); 
	AddMod S17(                                                        
		.A_in(FFT_IN_0_pip_1),                                                                                         
		.B_in(s15),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s17)                                                  
	);
	AddMod S37(                                                        
		.A_in(s9),                                                                                         
		.B_in(FFT_IN_7_pip_1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s37)                                                  
	);

	logic [`DATA_WIDTH-1:0]s17_pip_2      ;
	logic [`DATA_WIDTH-1:0]s37_pip_2      ;
	logic [`DATA_WIDTH-1:0]FFT_IN_8_pip_2 ;
	logic [`DATA_WIDTH-1:0]FFT_IN_9_pip_2 ;
	logic [`DATA_WIDTH-1:0]FFT_IN_10_pip_2;
	logic [`DATA_WIDTH-1:0]FFT_IN_11_pip_2;	
	logic 	   ctrl_s0_pip_2     ;
	logic[1:0] ctrl_s1_pip_2	   ;
	logic      ctrl_s2_pip_2     ;
	logic      ctrl_s3_pip_2     ;
	logic      ctrl_s4_pip_2     ;
	logic      ctrl_s5_pip_2     ;	
	//pipe here
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			s17_pip_2       <= 'd0;
			s37_pip_2       <= 'd0;
			FFT_IN_8_pip_2  <= 'd0;
			FFT_IN_9_pip_2  <= 'd0;
			FFT_IN_10_pip_2 <= 'd0;
			FFT_IN_11_pip_2	<= 'd0;		
		end
		else begin
			s17_pip_2       <= s17;
			s37_pip_2       <= s37;
			FFT_IN_8_pip_2  <= FFT_IN_8_pip_1;
			FFT_IN_9_pip_2  <= FFT_IN_9_pip_1;
			FFT_IN_10_pip_2 <= FFT_IN_10_pip_1;
			FFT_IN_11_pip_2	<= FFT_IN_11_pip_1;			
		end
	end 

	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			ctrl_s0_pip_2 ='d0;
			ctrl_s1_pip_2 ='d0;
			ctrl_s2_pip_2 ='d0;
			ctrl_s3_pip_2 ='d0;
			ctrl_s4_pip_2 ='d0;
			ctrl_s5_pip_2 ='d0;
		end
		else begin
			ctrl_s0_pip_2 = ctrl_s0_pip_1;
			ctrl_s1_pip_2 = ctrl_s1_pip_1;
			ctrl_s2_pip_2 = ctrl_s2_pip_1;
			ctrl_s3_pip_2 = ctrl_s3_pip_1;
			ctrl_s4_pip_2 = ctrl_s4_pip_1;
			ctrl_s5_pip_2 = ctrl_s5_pip_1;		
		end
	end 
	
	MulMod M0(                                                                                  
		.A_in(s15_tmp),                                                                                         
		.B_in(c0),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m0)                                                                                        
	);   
	MulMod M1(                                                                                  
		.A_in(s8_tmp),                                                                                         
		.B_in(c1),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m1)                                                                                        
	); 
	MulMod M2(                                                                                  
		.A_in(s9_tmp),                                                                                         
		.B_in(c2),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m2)                                                                                        
	); 
	MulMod M3(                                                                                  
		.A_in(s10_tmp),                                                                                         
		.B_in(c3),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m3)                                                                                        
	); 
	MulMod M4(                                                                                  
		.A_in(s16_tmp),                                                                                         
		.B_in(c4),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m4)                                                                                        
	); 
	MulMod M5(                                                                                  
		.A_in(s12_tmp),                                                                                         
		.B_in(c5),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m5)                                                                                        
	); 
	MulMod M6(                                                                                  
		.A_in(s13_tmp),                                                                                         
		.B_in(c6),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m6)                                                                                        
	); 
	MulMod M7(                                                                                  
		.A_in(s14_tmp),                                                                                         
		.B_in(c7),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m7)                                                                                        
	); 	
	Mux MUX1(
		.A_in(zero),                                                                                         
		.B_in(s17_tmp_delay_2),                                                                                         
		.sel(ctrl_s1_delay_3[0]),                                                                                                                                                                     
		.result(mux1)   		
	);
	AddMod S18(                                                        
		.A_in(m0),                                                                                         
		.B_in(mux1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s18)                                                  
	);
	AddMod S19(                                                        
		.A_in(s18),                                                                                         
		.B_in(m1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s19)                                                  
	);
	SubMod S20(                                                        
		.A_in(s18),                                                                                         
		.B_in(m1),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s20)                                                  
	);
	SubMod S21(                                                        
		.A_in(s18),                                                                                         
		.B_in(m3),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s21)                                                  
	);	
	assign m4_inv = modular - m4; 	
	Mux MUX2(
		.A_in(m4_inv),    
		//.A_in(m5),  		
		.B_in(m4),                                                                                         
		.sel(ctrl_s0_delay_3),                                                                                                                                                                     
		.result(mux2)   		
	);
	Mux MUX3(
		.A_in(m6),                                                                                         
		.B_in(m5),                                                                                         
		.sel(ctrl_s4_delay_3),                                                                                                                                                                     
		.result(mux3)   		
	);	
	AddMod S22(                                                        
		.A_in(mux3),                                                                                         
		.B_in(mux2),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s22)                                                  
	);
	SubMod S23(                                                        
		.A_in(m4),                                                                                         
		.B_in(m5),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s23)                                                  
	);
	SubMod S24(                                                        
		.A_in(m4),                                                                                         
		.B_in(m7),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s24)                                                  
	);
	AddMod S25(                                                        
		.A_in(s19_tmp),                                                                                         
		.B_in(m3_tmp),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s25)                                                  
	);
	SubMod S26(                                                        
		.A_in(s20_tmp),                                                                                         
		.B_in(m2_tmp),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s26)                                                  
	);
	//MUX4
	always@(*) begin
		if(ctrl_s1_delay_3 == 2'd1) mux4 = m5;
		else if (ctrl_s1_delay_3 == 2'd2) mux4 = s37_tmp_delay_2;
		else mux4 = s21;
	end
	AddMod S27(                                                        
		.A_in(mux4_tmp),                                                                                         
		.B_in(m2_tmp),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s27)                                                  
	);	
	
	Mux MUX10(
		.A_in(FFT_IN_8_delay_3),                                                                                         
		.B_in(s27),                                                                                         
		.sel(ctrl_s3_delay_4),                                                                                                                                                                     
		.result(mux10)   		
	);	
	Mux MUX5(
		.A_in(zero),                                                                                         
		.B_in(m7),                                                                                         
		.sel(ctrl_s5_delay_3),                                                                                                                                                                     
		.result(mux5)   		
	);		
	AddMod S28(                                                        
		.A_in(s22_tmp),                                                                                         
		.B_in(mux5_tmp),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s28)                                                  
	);		
	assign m7_inv = modular - m7; 	
	Mux MUX6(
		.A_in(m7_inv),                                                                                         
		.B_in(m6),                                                                                         
		.sel(ctrl_s0_delay_3),                                                                                                                                                                     
		.result(mux6)   		
	);
	SubMod S29(                                                        
		.A_in(s23_tmp),                                                                                         
		.B_in(mux6_tmp),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s29)                                                  
	);	
	AddMod S30(                                                        
		.A_in(m6_tmp),                                                                                         
		.B_in(s24_tmp),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s30)                                                  
	);	
	Mux MUX11(
		.A_in(FFT_IN_9_delay_3),                                                                                         
		.B_in(s30),                                                                                         
		.sel(ctrl_s3_delay_4),                                                                                                                                                                     
		.result(mux11)   		
	);		
	Mux MUX12(
		.A_in(FFT_IN_10_delay_3),                                                                                         
		.B_in(s25),                                                                                         
		.sel(ctrl_s3_delay_4),                                                                                                                                                                     
		.result(mux12)   		
	);	
	Mux MUX13(
		.A_in(FFT_IN_11_delay_3),                                                                                         
		.B_in(s28),                                                                                         
		.sel(ctrl_s3_delay_4),                                                                                                                                                                     
		.result(mux13)   		
	);	
	AddMod S31(                                                        
		.A_in(s25),                                                                                         
		.B_in(s28),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s31)                                                  
	);
	AddMod S32(                                                        
		.A_in(s26),                                                                                         
		.B_in(s29),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s32)                                                  
	);
	AddMod S33(                                                        
		.A_in(mux10),                                                                                         
		.B_in(mux11),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s33)                                                  
	);	
	SubMod S34(                                                        
		.A_in(mux12),                                                                                         
		.B_in(mux13),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s34)                                                  
	);
	SubMod S35(                                                        
		.A_in(s26),                                                                                         
		.B_in(s29),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s35)                                                  
	);
	SubMod S36(                                                        
		.A_in(mux10),                                                                                         
		.B_in(mux11),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s36)                                                  
	);
	AddMod S38(                                                        
		.A_in(FFT_IN_10_delay_3),                                                                                         
		.B_in(mux13),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(s38)                                                  
	);	
	Mux MUX9(
		.A_in(s37_tmp_delay_3),                                                                                         
		.B_in(s32),                                                                                         
		.sel(ctrl_s2_delay_4),                                                                                                                                                                     
		.result(mux9)   		
	);
 
always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		s17_tmp  <= 0;
		s15_tmp  <= 0;
		s8_tmp   <= 0;
		s37_tmp  <= 0;
		s9_tmp   <= 0;
		s10_tmp  <= 0;		
		s16_tmp  <= 0;	
		s12_tmp  <= 0;				
		s13_tmp  <= 0;	
		s14_tmp  <= 0;			
	end
	else begin
		s17_tmp  <= s17_pip_2;
		s15_tmp  <= s15;
		s8_tmp   <= s8;
		s37_tmp  <= s37_pip_2;
		s9_tmp   <= s9;
		s10_tmp  <= s10;		
		s16_tmp  <= s16;	
		s12_tmp  <= s12;				
		s13_tmp  <= s13;	
		s14_tmp  <= s14;		
	end
end  

always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin		
		s17_tmp_delay_1  <= 0;
		s17_tmp_delay_2  <= 0;		
		s37_tmp_delay_1  <= 0;
		s37_tmp_delay_2  <= 0;					
	end
	else begin	
		s17_tmp_delay_1  <= s17_tmp;
		s17_tmp_delay_2  <= s17_tmp_delay_1;		
		s37_tmp_delay_1  <= s37_tmp;
		s37_tmp_delay_2  <= s37_tmp_delay_1;	
	end
end  
 
always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		s17_tmp_delay_3 <= 0;
		s19_tmp  		<= 0;
		m3_tmp      	<= 0;
		s20_tmp  		<= 0;
		s37_tmp_delay_3 <= 0;
		m2_tmp  		<= 0;
		mux4_tmp 	    <= 0;
		s22_tmp  		<= 0;		
		mux5_tmp 	    <= 0;	
		s23_tmp  		<= 0;				
		mux6_tmp  		<= 0;	
		m6_tmp  		<= 0;		
		s24_tmp 		<= 0;	
	end
	else begin
		s17_tmp_delay_3 <= s17_tmp_delay_2;
		s19_tmp  		<= s19;
		m3_tmp      	<= m3;
		s20_tmp  		<= s20;
		s37_tmp_delay_3 <= s37_tmp_delay_2;
		m2_tmp  		<= m2;
		mux4_tmp 	    <= mux4;
		s22_tmp  		<= s22;		
		mux5_tmp 	    <= mux5;	
		s23_tmp  		<= s23;				
		mux6_tmp  		<= mux6;	
		m6_tmp  		<= m6;		
		s24_tmp 		<= s24;	
	end
end  

always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		FFT_IN_8_tmp <= 0;
		FFT_IN_8_delay_1 <= 0;
		FFT_IN_8_delay_2 <= 0;		
		FFT_IN_8_delay_3 <= 0;
		FFT_IN_8_delay_4 <= 0;	
		FFT_IN_9_tmp <= 0;		
		FFT_IN_9_delay_1 <= 0;
		FFT_IN_9_delay_2 <= 0;	
		FFT_IN_9_delay_3 <= 0;
		FFT_IN_9_delay_4 <= 0;	
		FFT_IN_10_tmp <= 0;		
		FFT_IN_10_delay_1 <= 0;
		FFT_IN_10_delay_2 <= 0;		
		FFT_IN_10_delay_3 <= 0;
		FFT_IN_10_delay_4 <= 0;	
		FFT_IN_11_tmp <= 0;		
		FFT_IN_11_delay_1 <= 0;
		FFT_IN_11_delay_2 <= 0;	
		FFT_IN_11_delay_3 <= 0;
		FFT_IN_11_delay_4 <= 0;		
	end
	else begin
		FFT_IN_8_tmp <= FFT_IN_8_pip_2;		
		FFT_IN_8_delay_1 <= FFT_IN_8_tmp;
		FFT_IN_8_delay_2 <= FFT_IN_8_delay_1;		
		FFT_IN_8_delay_3 <= FFT_IN_8_delay_2;
		FFT_IN_8_delay_4 <= FFT_IN_8_delay_3;		
		FFT_IN_9_tmp <= FFT_IN_9_pip_2;		
		FFT_IN_9_delay_1 <= FFT_IN_9_tmp;
		FFT_IN_9_delay_2 <= FFT_IN_9_delay_1;		
		FFT_IN_9_delay_3 <= FFT_IN_9_delay_2;
		FFT_IN_9_delay_4 <= FFT_IN_9_delay_3;
		FFT_IN_10_tmp <= FFT_IN_10_pip_2;		
		FFT_IN_10_delay_1 <= FFT_IN_10_tmp;		
		FFT_IN_10_delay_2 <= FFT_IN_10_delay_1;		
		FFT_IN_10_delay_3 <= FFT_IN_10_delay_2;
		FFT_IN_10_delay_4 <= FFT_IN_10_delay_3;
		FFT_IN_11_tmp <= FFT_IN_11_pip_2;		
		FFT_IN_11_delay_1 <= FFT_IN_11_tmp;		
		FFT_IN_11_delay_2 <= FFT_IN_11_delay_1;		
		FFT_IN_11_delay_3 <= FFT_IN_11_delay_2;
		FFT_IN_11_delay_4 <= FFT_IN_11_delay_3;			
	end
end  
   
always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		ctrl_s0_delay_1	<= 0;
		ctrl_s0_delay_2 <= 0;
		ctrl_s0_delay_3 <= 0;
		ctrl_s1_delay_1	<= 0;
		ctrl_s1_delay_2 <= 0;
		ctrl_s1_delay_3	<= 0;
		ctrl_s2_delay_1	<= 0;
		ctrl_s2_delay_2 <= 0;
		ctrl_s2_delay_3	<= 0;
		ctrl_s2_delay_4	<= 0;
		ctrl_s3_delay_1	<= 0;
		ctrl_s3_delay_2 <= 0;
		ctrl_s3_delay_3	<= 0;
		ctrl_s3_delay_4	<= 0;	
		ctrl_s4_delay_1	<= 0;
		ctrl_s4_delay_2 <= 0;
		ctrl_s4_delay_3	<= 0;
		ctrl_s5_delay_1	<= 0;
		ctrl_s5_delay_2 <= 0;
		ctrl_s5_delay_3	<= 0;	
	end
	else begin
		ctrl_s0_delay_1	<= ctrl_s0_pip_2;
		ctrl_s0_delay_2 <= ctrl_s0_delay_1;
		ctrl_s0_delay_3 <= ctrl_s0_delay_2;
		ctrl_s1_delay_1	<= ctrl_s1_pip_2;
		ctrl_s1_delay_2 <= ctrl_s1_delay_1;
		ctrl_s1_delay_3	<= ctrl_s1_delay_2;
		ctrl_s2_delay_1	<= ctrl_s2_pip_2;
		ctrl_s2_delay_2 <= ctrl_s2_delay_1;
		ctrl_s2_delay_3	<= ctrl_s2_delay_2;
		ctrl_s2_delay_4	<= ctrl_s2_delay_3;
		ctrl_s3_delay_1	<= ctrl_s3_pip_2;
		ctrl_s3_delay_2 <= ctrl_s3_delay_1;
		ctrl_s3_delay_3	<= ctrl_s3_delay_2;
		ctrl_s3_delay_4	<= ctrl_s3_delay_3;	
		ctrl_s4_delay_1	<= ctrl_s4_pip_2;
		ctrl_s4_delay_2 <= ctrl_s4_delay_1;
		ctrl_s4_delay_3	<= ctrl_s4_delay_2;
		ctrl_s5_delay_1	<= ctrl_s5_pip_2;
		ctrl_s5_delay_2 <= ctrl_s5_delay_1;
		ctrl_s5_delay_3	<= ctrl_s5_delay_2;	
	end
end

	always@(*) begin
		if(inverse) begin  //inverse signal should be delay
			case(point)
				3'd7: begin
					MUL_COEF_0 = inv_7;
					MUL_COEF_1 = inv_7;
					MUL_COEF_2 = inv_7;
					MUL_COEF_3 = inv_7;
					MUL_COEF_4 = inv_7;
					MUL_COEF_5 = inv_7;
					MUL_COEF_6 = inv_7;	
					MUL_COEF_7 = inv_7;						
				end
				3'd5: begin
					MUL_COEF_0 = inv_5;
					MUL_COEF_1 = inv_5;
					MUL_COEF_2 = inv_5;
					MUL_COEF_3 = inv_5;
					MUL_COEF_4 = inv_5;
					MUL_COEF_5 = inv_5;
					MUL_COEF_6 = inv_5;	
					MUL_COEF_7 = inv_5;					
				end		
				3'd4: begin
					MUL_COEF_0 = inv_4;
					MUL_COEF_1 = inv_4;
					MUL_COEF_2 = inv_4;
					MUL_COEF_3 = inv_4;
					MUL_COEF_4 = inv_4;
					MUL_COEF_5 = inv_4;
					MUL_COEF_6 = inv_4;		
					MUL_COEF_7 = inv_4;					
				end	
				3'd3: begin
					MUL_COEF_0 = inv_3;
					MUL_COEF_1 = inv_3;
					MUL_COEF_2 = inv_3;
					MUL_COEF_3 = inv_3;
					MUL_COEF_4 = inv_3;
					MUL_COEF_5 = inv_3;
					MUL_COEF_6 = inv_3;	
					MUL_COEF_7 = inv_3;					
				end	
				3'd2: begin
					if(pre_sel == 'd5) begin
						MUL_COEF_0 = POINTWISE_COEF_0;
						MUL_COEF_1 = POINTWISE_COEF_1;
						MUL_COEF_2 = POINTWISE_COEF_2;
						MUL_COEF_3 = POINTWISE_COEF_3;
						MUL_COEF_4 = POINTWISE_COEF_4;
						MUL_COEF_5 = POINTWISE_COEF_5;
						MUL_COEF_6 = POINTWISE_COEF_6;	
						MUL_COEF_7 = POINTWISE_COEF_7;											
					end
					else begin
						MUL_COEF_0 = inv_2;
						MUL_COEF_1 = inv_2;
						MUL_COEF_2 = inv_2;
						MUL_COEF_3 = inv_2;
						MUL_COEF_4 = inv_2;
						MUL_COEF_5 = inv_2;
						MUL_COEF_6 = inv_2;	
						MUL_COEF_7 = inv_2;	
					end
				end	
				default: begin
					MUL_COEF_0 = 1'b0;
					MUL_COEF_1 = 1'b0;
					MUL_COEF_2 = 1'b0;
					MUL_COEF_3 = 1'b0;
					MUL_COEF_4 = 1'b0;
					MUL_COEF_5 = 1'b0;
					MUL_COEF_6 = 1'b0;
					MUL_COEF_7 = 1'b0;					
				end
			endcase
		end 
		else begin
			if(FFT_LAST_STAGE) begin
				MUL_COEF_0 = POINTWISE_COEF_0;
				MUL_COEF_1 = POINTWISE_COEF_1;
				MUL_COEF_2 = POINTWISE_COEF_2;
				MUL_COEF_3 = POINTWISE_COEF_3;
				MUL_COEF_4 = POINTWISE_COEF_4;
				MUL_COEF_5 = POINTWISE_COEF_5;
				MUL_COEF_6 = POINTWISE_COEF_6;	
				MUL_COEF_7 = POINTWISE_COEF_7;				
			end
			else begin
				if(pre_sel == 'd4) begin
					MUL_COEF_0 = POINTWISE_COEF_0;
					MUL_COEF_1 = POINTWISE_COEF_1;
					MUL_COEF_2 = POINTWISE_COEF_2;
					MUL_COEF_3 = POINTWISE_COEF_3;
					MUL_COEF_4 = POINTWISE_COEF_4;
					MUL_COEF_5 = POINTWISE_COEF_5;
					MUL_COEF_6 = POINTWISE_COEF_6;	
					MUL_COEF_7 = POINTWISE_COEF_7;				
				end
				else begin
					MUL_COEF_0 = 1'b1;
					MUL_COEF_1 = 1'b1;
					MUL_COEF_2 = 1'b1;
					MUL_COEF_3 = 1'b1;
					MUL_COEF_4 = 1'b1;
					MUL_COEF_5 = 1'b1;
					MUL_COEF_6 = 1'b1;	
					MUL_COEF_7 = 1'b1;
				end
			end	
		end
	end


always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		s17_tmp_delay_4 <= 0;
		s37_tmp_delay_4 <= 0;		
		s31_tmp		    <= 0;
		mux9_tmp 		<= 0;
		s33_tmp			<= 0;
		s34_tmp			<= 0;
		s35_tmp			<= 0;
		s36_tmp			<= 0;
		s38_tmp			<= 0;		
	end
	else begin
		s17_tmp_delay_4 <= s17_tmp_delay_3  ;
		s37_tmp_delay_4 <= s37_tmp_delay_3  ;		
		s31_tmp		    <= s31		    	;
		mux9_tmp 		<= mux9 			;
		s33_tmp			<= s33				;
		s34_tmp			<= s34				;
		s35_tmp			<= s35				;
		s36_tmp			<= s36				;	
		s38_tmp			<= s38				;		
	end
end

//logic [`DATA_WIDTH-1:0]sum;
logic sum_trigger_delay1, sum_trigger_delay2, sum_trigger_delay3, sum_trigger_delay4, sum_trigger_delay9, sum_trigger_delay10;

always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		//sum_out <= 'd0; 
		sum_trigger_delay1 <= 'd0;
		sum_trigger_delay2 <= 'd0;	
		sum_trigger_delay3 <= 'd0;	
		sum_trigger_delay4 <= 'd0;			
		sum_trigger_delay9 <= 'd0;
		sum_trigger_delay10 <= 'd0;		
	end
	else begin
		sum_trigger_delay1 <= sum_trigger;   //delay 1 because read data need half cycle
		sum_trigger_delay2 <= sum_trigger_delay1;
		sum_trigger_delay3 <= sum_trigger_delay2;
		sum_trigger_delay4 <= sum_trigger_delay3;		
		sum_trigger_delay9 <= sum_trigger_delay8;
		sum_trigger_delay10 <= sum_trigger_delay9;		
		/*if(sum_trigger_delay2) begin  
			sum_out <= s17;
		end*/
	end
end

assign sum_out = (sum_trigger_delay4)? s17_pip_2 : 'd0;

logic [`DATA_WIDTH-1:0] d0_tmp, d0_tmp_2, d0_tmp_2_delay1, d0_tmp_2_delay2, d0_tmp_2_delay3, d0_tmp_2_delay4;
always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		d0_tmp <= 'd0;
	end
	else begin
		if(sum_trigger_delay4) begin 
			d0_tmp <= d0_in;	
		end
	end
end


logic [`DATA_WIDTH-1:0] D0, D0_delay1;
logic [`DATA_WIDTH-1:0] add_d0;

always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		d0_tmp_2 <= 'd0;
		d0_tmp_2_delay1 <= 'd0;
		d0_tmp_2_delay2 <= 'd0;
		d0_tmp_2_delay3 <= 'd0;
		d0_tmp_2_delay4 <= 'd0;		
		D0_delay1 <= 'd0;
	end
	else begin
		if(sum_trigger_delay10) begin 	
			d0_tmp_2 <= d0_tmp;
		end
		d0_tmp_2_delay1 <=d0_tmp_2;
		d0_tmp_2_delay2 <=d0_tmp_2_delay1;
		d0_tmp_2_delay3 <=d0_tmp_2_delay2;	
		d0_tmp_2_delay4 <=d0_tmp_2_delay3;			
		D0_delay1 <= D0;
	end
end


	AddMod A_8(                                                        
		.A_in(d0_in),                                                                                         
		.B_in(sum_in),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(D0)                                                  
	);	
	

assign d0_out = (sum_trigger_delay4)? (D0) : 'd0;
assign add_d0 = (IFFT_LAST_STAGE)? d0_tmp_2_delay1 : 'd0;


assign out_0 = s17_tmp_delay_4 ;
assign out_1 = s31_tmp         ;
assign out_2 = mux9_tmp        ;
assign out_3 = s33_tmp         ;
assign out_4 = s34_tmp         ;
assign out_5 = s35_tmp         ;
assign out_6 = s36_tmp         ;
assign out_7 = s38_tmp         ;

	always@(*) begin
    	case(point)
			3'd7: begin
				mem_IN_0_tmp = out_0 ;
				mem_IN_1_tmp = out_1 ;
				mem_IN_2_tmp = out_2 ;
				mem_IN_3_tmp = out_6 ;
				mem_IN_4_tmp = out_3 ;
				mem_IN_5_tmp = out_5 ;
				mem_IN_6_tmp = out_4 ;	
				mem_IN_7_tmp = 'd0		 ;
			end
			3'd5: begin
				mem_IN_0_tmp = out_0 ;
				mem_IN_1_tmp = out_1 ;
				mem_IN_2_tmp = out_2 ;
				mem_IN_3_tmp = out_5 ;
				mem_IN_4_tmp = out_4 ;
				mem_IN_5_tmp = 'd0 ;
				mem_IN_6_tmp = 'd0 ;
				mem_IN_7_tmp = 'd0 ;				
			end				
			3'd4: begin
				mem_IN_0_tmp = out_0 ;
				mem_IN_1_tmp = out_3 ;
				mem_IN_2_tmp = out_1 ;
				mem_IN_3_tmp = out_6 ;
				mem_IN_4_tmp = 'd0 ;
				mem_IN_5_tmp = 'd0 ;
				mem_IN_6_tmp = 'd0 ;	
				mem_IN_7_tmp = 'd0 ;				
			end					
			3'd3: begin
				mem_IN_0_tmp = out_0 ;
				mem_IN_1_tmp = out_1 ;
				mem_IN_2_tmp = out_4 ;
				mem_IN_3_tmp = out_2 ;
				mem_IN_4_tmp = out_3 ;
				mem_IN_5_tmp = out_6 ;
				mem_IN_6_tmp = 'd0 ;
				mem_IN_7_tmp = 'd0	;				
			end				
			3'd2: begin
				mem_IN_0_tmp = out_0 ;
				mem_IN_1_tmp = out_5 ;
				mem_IN_2_tmp = out_2 ;
				mem_IN_3_tmp = out_1 ;
				mem_IN_4_tmp = out_3 ;
				mem_IN_5_tmp = out_6 ;
				mem_IN_6_tmp = out_7 ;
				mem_IN_7_tmp = out_4 ;					
			end				
			default: begin
				mem_IN_0_tmp = 1'b0 ;
				mem_IN_1_tmp = 1'b0 ;
				mem_IN_2_tmp = 1'b0 ;
				mem_IN_3_tmp = 1'b0 ;
				mem_IN_4_tmp = 1'b0 ;
				mem_IN_5_tmp = 1'b0 ;
				mem_IN_6_tmp = 1'b0 ;	
				mem_IN_7_tmp = 1'b0 ;				
			end					
		endcase  
    end


	MulMod M_0(                                                                                  
		.A_in(mem_IN_0_tmp),                                                                                         
		.B_in(MUL_COEF_0),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_0)                                                                                        
	);   
	MulMod M_1(                                                                                  
		.A_in(mem_IN_1_tmp),                                                                                         
		.B_in(MUL_COEF_1),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_1)                                                                                        
	); 	
	MulMod M_2(                                                                                  
		.A_in(mem_IN_2_tmp),                                                                                         
		.B_in(MUL_COEF_2),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_2)                                                                                        
	); 
	MulMod M_3(                                                                                  
		.A_in(mem_IN_3_tmp),                                                                                         
		.B_in(MUL_COEF_3),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_3)                                                                                        
	); 	
	MulMod M_4(                                                                                  
		.A_in(mem_IN_4_tmp),                                                                                         
		.B_in(MUL_COEF_4),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_4)                                                                                        
	); 
	MulMod M_5(                                                                                  
		.A_in(mem_IN_5_tmp),                                                                                         
		.B_in(MUL_COEF_5),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_5)                                                                                        
	); 
	MulMod M_6(                                                                                  
		.A_in(mem_IN_6_tmp),                                                                                         
		.B_in(MUL_COEF_6),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_6)                                                                                        
	); 
	MulMod M_7(                                                                                  
		.A_in(mem_IN_7_tmp),                                                                                         
		.B_in(MUL_COEF_7),                                                                                                                                                                             
		.modular(modular),                                                                                        
		.Pre_computing(Pre_computing),                                                                                
		.clk(clk),                                                                                          
		.rst_n(rst_n),                                                                                        
		.result(m_7)                                                                                        
	); 

	AddMod A_0(                                                        
		.A_in(m_0),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_0)                                                  
	);	
	AddMod A_1(                                                        
		.A_in(m_1),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_1)                                                  
	);
	AddMod A_2(                                                        
		.A_in(m_2),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_2)                                                  
	);
	AddMod A_3(                                                        
		.A_in(m_3),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_3)                                                  
	);
	AddMod A_4(                                                        
		.A_in(m_4),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_4)                                                  
	);
	AddMod A_5(                                                        
		.A_in(m_5),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_5)                                                  
	);
	AddMod A_6(                                                        
		.A_in(m_6),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_6)                                                  
	);	
	AddMod A_7(                                                        
		.A_in(m_7),                                                                                         
		.B_in(add_d0),                                                                                         
		.modular(modular),                                                                                                                                                                     
		.result(a_7)                                                  
	);		
	


assign FFT_OUT_0 = (IFFT_LAST_STAGE)? a_0 : m_0;  //need to delay
assign FFT_OUT_1 = (IFFT_LAST_STAGE)? a_1 : m_1;
assign FFT_OUT_2 = (IFFT_LAST_STAGE)? a_2 : m_2;
assign FFT_OUT_3 = (IFFT_LAST_STAGE)? a_3 : m_3;
assign FFT_OUT_4 = (IFFT_LAST_STAGE)? a_4 : m_4;
assign FFT_OUT_5 = (IFFT_LAST_STAGE)? a_5 : m_5;
assign FFT_OUT_6 = (IFFT_LAST_STAGE)? a_6 : m_6;
assign FFT_OUT_7 = (IFFT_LAST_STAGE)? a_7 : m_7;

/*
assign FFT_OUT_0 = s17_tmp_delay_3  ;
assign FFT_OUT_1 = s31		    	;
assign FFT_OUT_2 = mux9 			;
assign FFT_OUT_3 = s33				;
assign FFT_OUT_4 = s34				;
assign FFT_OUT_5 = s35				;
assign FFT_OUT_6 = s36				;   
*/   
 endmodule    