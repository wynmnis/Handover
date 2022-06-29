 `timescale 1ns/1ps 
 `include "Registers.sv"
 `include "AGU_INTEGRATE.sv"
 `include "FFT_top.sv"
 `include "Ping_Pong_mem.sv"
 `include "Delay_buffer.sv" 

 //==============================================  
 //Writer: Ryan Huang                              
 //                                                
 //Note:multiplier                                 
 //==============================================  


`define IDLE       6'd0
`define DFT_31_2   6'd1
`define DFT_31_3   6'd2
`define DFT_31_5   6'd3
`define IDFT_31_2  6'd4
`define IDFT_31_3  6'd5
`define IDFT_31_5  6'd6
`define DFT_41_5   6'd7
`define DFT_41_4   6'd8
`define DFT_41_2   6'd9
`define IDFT_41_5  6'd10
`define IDFT_41_2  6'd11
`define IDFT_41_4  6'd12
`define DFT_61_3   6'd13
`define DFT_61_4   6'd14
`define DFT_61_5   6'd15
`define IDFT_61_3  6'd16
`define IDFT_61_4  6'd17
`define IDFT_61_5  6'd18
`define buffer_0   6'd19
`define buffer_1   6'd20 
`define buffer_2   6'd21
`define buffer_3   6'd22
`define buffer_4   6'd23 
`define buffer_5   6'd24
`define buffer_6   6'd25 
`define buffer_7   6'd26
`define buffer_8   6'd27
`define buffer_9   6'd28 
`define buffer_10  6'd29
`define buffer_11  6'd30
`define buffer_12  6'd31 
`define buffer_13  6'd32
`define buffer_14  6'd33
`define buffer_15  6'd34 
`define buffer_16  6'd35







 module top(                                       
    input clk      ,  
    input rst_n    ,
	input start	   ,
	input [`DATA_WIDTH-1:0]modular,
	output logic done
 );   
	
		logic [5:0] CS, NS;
		logic DFT_31_2_done, DFT_31_3_done, DFT_31_5_done;
		logic IDFT_31_2_done, IDFT_31_3_done, IDFT_31_5_done;
		logic DFT_41_2_done, DFT_41_4_done, DFT_41_5_done;
		logic IDFT_41_2_done, IDFT_41_4_done, IDFT_41_5_done;
		logic DFT_61_3_done, DFT_61_4_done, DFT_61_5_done;
		logic IDFT_61_3_done, IDFT_61_4_done, IDFT_61_5_done;
		logic start_delay;
			
		logic [2:0] point;
		logic point_2_mode;
		logic [2:0]factor_idx;
		logic [1:0]case_41; // 1: point = 5; 2: point = 4 or 2
		logic [`INDEX_WIDTH_M-1:0]M1;
		logic [`INDEX_WIDTH_M-1:0]M2;	
		logic [`INDEX_WIDTH_N-1:0]N0;		
		logic [`INDEX_WIDTH_N-1:0]N1;
		logic [`INDEX_WIDTH_N-1:0]N2;	
		logic [`INDEX_WIDTH_M-1:0]M1M2;   
		logic [`INDEX_WIDTH_M-1:0]M0M1;
		logic [`INDEX_WIDTH_M-1:0]M0M2;
		logic [`BANK_WIDTH-1:0]bank0;   
		logic [`BANK_WIDTH-1:0]bank1;
		logic [`BANK_WIDTH-1:0]bank2;	
		logic [`BANK_WIDTH-1:0]bank3;   
		logic [`BANK_WIDTH-1:0]bank4;
		logic [`BANK_WIDTH-1:0]bank5;	
		logic [`BANK_WIDTH-1:0]bank6; 
		logic [`BANK_WIDTH-1:0]bank7; 	
		logic [`ADDR_WIDTH-1:0]addr0;
		logic [`ADDR_WIDTH-1:0]addr1;	
		logic [`ADDR_WIDTH-1:0]addr2;   
		logic [`ADDR_WIDTH-1:0]addr3;
		logic [`ADDR_WIDTH-1:0]addr4;
		logic [`ADDR_WIDTH-1:0]addr5;   
		logic [`ADDR_WIDTH-1:0]addr6;
		logic [`ADDR_WIDTH-1:0]addr7;
		logic AGU_2_done;
		logic AGU_2_done_out;
		logic [2:0] pre_sel; //1: 31; 2: 41; 3: 61
		logic [5:0] Read_Reg0;
		logic [5:0] Read_Reg1;
		logic [5:0] Read_Reg2;
		logic [5:0] Read_Reg3;
		logic [5:0] Read_Reg4;
		logic [5:0] Read_Reg5;
		logic [5:0] Read_Reg6;
		logic [5:0] Read_Reg7;
		logic [`DATA_WIDTH-1:0] Read_Data0;
		logic [`DATA_WIDTH-1:0] Read_Data1;
		logic [`DATA_WIDTH-1:0] Read_Data2;
		logic [`DATA_WIDTH-1:0] Read_Data3;
		logic [`DATA_WIDTH-1:0] Read_Data4;
		logic [`DATA_WIDTH-1:0] Read_Data5;
		logic [`DATA_WIDTH-1:0] Read_Data6;
		logic [`DATA_WIDTH-1:0] Read_Data7;
	
		logic inverse;
		logic FFT_LAST_STAGE;
		logic IFFT_LAST_STAGE;
		logic sum_trigger;	
		logic [`DATA_WIDTH-1:0] sum_in;	
		logic [`DATA_WIDTH-1:0] sum_out;	
		logic [`DATA_WIDTH-1:0]d0_in;	
		logic [`DATA_WIDTH-1:0] d0_out;		
		logic [`DATA_WIDTH-1:0] d0;	
		logic [`DATA_WIDTH-1:0] mem_IN_0; 
		logic [`DATA_WIDTH-1:0] mem_IN_1;
		logic [`DATA_WIDTH-1:0] mem_IN_2;
		logic [`DATA_WIDTH-1:0] mem_IN_3;
		logic [`DATA_WIDTH-1:0] mem_IN_4;
		logic [`DATA_WIDTH-1:0] mem_IN_5;
		logic [`DATA_WIDTH-1:0] mem_IN_6;
		logic [`DATA_WIDTH-1:0] mem_IN_7;
/*		
		logic [`DATA_WIDTH-1:0] FFT_0;
		logic [`DATA_WIDTH-1:0] FFT_1;
		logic [`DATA_WIDTH-1:0] FFT_2;
		logic [`DATA_WIDTH-1:0] FFT_3;	
		logic [`DATA_WIDTH-1:0] FFT_4;
		logic [`DATA_WIDTH-1:0] FFT_5;
		logic [`DATA_WIDTH-1:0] FFT_6;
		logic [`DATA_WIDTH-1:0] FFT_7;	
*/		
		//logic [`DATA_WIDTH-1:0] modular;
		
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_0;
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_1;
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_2;
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_3;	
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_4;
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_5;
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_6;	
		logic [`DATA_WIDTH-1:0] POINTWISE_COEF_7;

		logic [1:0]sel_write_group; //0: mem0, 1: mem1, otherwises: do nothing
		logic [`BANK_WIDTH-1:0]bank0_write ;
		logic [`BANK_WIDTH-1:0]bank1_write ;
		logic [`BANK_WIDTH-1:0]bank2_write ;
		logic [`BANK_WIDTH-1:0]bank3_write ;
		logic [`BANK_WIDTH-1:0]bank4_write ;
		logic [`BANK_WIDTH-1:0]bank5_write ;
		logic [`BANK_WIDTH-1:0]bank6_write ;
		logic [`BANK_WIDTH-1:0]bank7_write ;	
		logic [`ADDR_WIDTH-1:0]addr0_write ;
		logic [`ADDR_WIDTH-1:0]addr1_write ;
		logic [`ADDR_WIDTH-1:0]addr2_write ;
		logic [`ADDR_WIDTH-1:0]addr3_write ;
		logic [`ADDR_WIDTH-1:0]addr4_write ;
		logic [`ADDR_WIDTH-1:0]addr5_write ;
		logic [`ADDR_WIDTH-1:0]addr6_write ;
		logic [`ADDR_WIDTH-1:0]addr7_write ;

		logic [1:0]sel_read_group         ;
/*		logic [`BANK_WIDTH-1:0]bank0_read  ;
		logic [`BANK_WIDTH-1:0]bank1_read  ;
		logic [`BANK_WIDTH-1:0]bank2_read  ;
		logic [`BANK_WIDTH-1:0]bank3_read  ;
		logic [`BANK_WIDTH-1:0]bank4_read  ;
		logic [`BANK_WIDTH-1:0]bank5_read  ;
		logic [`BANK_WIDTH-1:0]bank6_read  ;
		logic [`BANK_WIDTH-1:0]bank7_read  ;	
		logic [`ADDR_WIDTH-1:0]addr0_read  ;
		logic [`ADDR_WIDTH-1:0]addr1_read  ;
		logic [`ADDR_WIDTH-1:0]addr2_read  ;
		logic [`ADDR_WIDTH-1:0]addr3_read  ;
		logic [`ADDR_WIDTH-1:0]addr4_read  ;
		logic [`ADDR_WIDTH-1:0]addr5_read  ;
		logic [`ADDR_WIDTH-1:0]addr6_read  ;	
		logic [`ADDR_WIDTH-1:0]addr7_read  ;
*/
	    logic[`DATA_WIDTH-1:0]mem_OUT_0	  ;
	    logic[`DATA_WIDTH-1:0]mem_OUT_1	  ;
	    logic[`DATA_WIDTH-1:0]mem_OUT_2	  ;
	    logic[`DATA_WIDTH-1:0]mem_OUT_3	  ;
	    logic[`DATA_WIDTH-1:0]mem_OUT_4	  ;
	    logic[`DATA_WIDTH-1:0]mem_OUT_5	  ;
	    logic[`DATA_WIDTH-1:0]mem_OUT_6	  ;
	    logic[`DATA_WIDTH-1:0]mem_OUT_7	  ;
		logic reset;

		logic [1:0]sel_group_d0					;    //0: mem0, 1: mem1, otherwises: do nothing
		logic write_d0							;
		logic [`BANK_WIDTH-1:0]bank_d0    		;		
		logic [`ADDR_WIDTH-1:0]addr_d0  	    ;	
		logic [`DATA_WIDTH-1:0]mem_IN_d0 	    ;	
		logic [`DATA_WIDTH-1:0]mem_OUT_d0	    ; 		
		logic [1:0]sel_group_sum				;	
		logic write_sum							;		
		logic [`BANK_WIDTH-1:0]bank_sum    		;
		logic [`BANK_WIDTH-1:0]bank_sum_out    		;		
		logic [`ADDR_WIDTH-1:0]addr_sum    		;
		logic [`ADDR_WIDTH-1:0]addr_sum_out    		;		
		logic [`DATA_WIDTH-1:0]mem_IN_sum 	    ;
		logic [`DATA_WIDTH-1:0]mem_IN_sum_out 	    ;		
		logic [`DATA_WIDTH-1:0]mem_OUT_sum	    ;

		logic [`INDEX_WIDTH_N_ADD-1:0] n0_0_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_1_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_2_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_3_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_4_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_5_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_6_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_7_sub_1 ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_0_sub_1_out ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_1_sub_1_out ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_2_sub_1_out ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_3_sub_1_out ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_4_sub_1_out ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_5_sub_1_out ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_6_sub_1_out ;
		logic [`INDEX_WIDTH_N_ADD-1:0] n0_7_sub_1_out ;		
		logic sum_trigger_delay1;
		logic sum_trigger_delay2;
		logic sum_trigger_delay3;
		logic sum_trigger_delay4;
		logic sum_trigger_delay5;
		logic sum_trigger_delay6;
		logic sum_trigger_delay7;
		logic sum_trigger_delay8;
		logic sum_trigger_delay9;
		logic sum_trigger_delay10;	
		logic sum_trigger_delay11;	
		logic sum_trigger_delay12;	
		logic sum_trigger_delay13;			
		logic m1_out_0_LSB;

		
		logic WEN_d0;
		logic [3:0]cnt,cnt_add_1 ;

		assign done = IDFT_61_5_done;		
		assign bank_d0 = bank_sum;
		assign addr_d0 = addr_sum;	

		

	 
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			CS <= 'd0;
			start_delay <= 'd0;
		end
		else begin
			CS <= NS ;
			start_delay <= start;
		end
	end	 

	always_comb begin
		case(NS)
			`IDLE :begin
				reset = 'd1		;
				N0    = 'd0     ;	
				N1    = 'd0     ;
				N2    = 'd0	    ;			
				point = 'd0;
				point_2_mode = 'd0;	
				factor_idx = 'd3;
				case_41 = 'd0;			
				M1    = 'd0     ;
				M2    = 'd0     ;		
				M1M2  = 'd0     ;
				M0M1  = 'd0     ;
				M0M2  = 'd0     ;
				inverse = 'd0;
				sel_read_group = 'd2; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd2; //0: mem0, 1: mem1, otherwises: do nothing
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;	
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;
				pre_sel	      = 'd0; //1: 31; 2: 41; 3: 61				
			end		
			`DFT_31_2 :begin
				reset = 'd0		;			
				N0    = 'd31     ;	
				N1    = 'd41     ;
				N2    = 'd61	 ;			
				point = 'd2;
				point_2_mode = 'd0;	
				factor_idx = 'd0;
				case_41 = 'd0;			
				M1    = 'd3     ;
				M2    = 'd5     ;		
				M1M2  = 'd15     ;
				M0M1  = 'd6     ;
				M0M2  = 'd10     ;	
				inverse = 'd0;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end				
			`DFT_31_3 :begin
				reset = 'd0		;			
				N0    = 'd31     ;	
				N1    = 'd41     ;
				N2    = 'd61	 ;			
				point = 'd3;
				point_2_mode = 'd0;	
				factor_idx = 'd0;
				case_41 = 'd0;			
				M1    = 'd2     ;
				M2    = 'd5     ;		
				M1M2  = 'd10     ;
				M0M1  = 'd6     ;
				M0M2  = 'd15     ;
				inverse = 'd0;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;
				pre_sel	      = 'd0;				
			end	
			`DFT_31_5 :begin
				reset = 'd0		;			
				N0    = 'd31     ;	
				N1    = 'd41     ;
				N2    = 'd61	 ;			
				point = 'd5;
				point_2_mode = 'd0;	
				factor_idx = 'd0;
				case_41 = 'd0;			
				M1    = 'd2     ;
				M2    = 'd3     ;		
				M1M2  = 'd6     ;
				M0M1  = 'd10    ;
				M0M2  = 'd15    ;
				inverse = 'd0;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing
				FFT_LAST_STAGE = 'd1;
				IFFT_LAST_STAGE = 'd0;
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd1;
				write_sum	  = 'd0;
				pre_sel	      = 'd1;	 //1: 31; 2: 41; 3: 61		
			end	
			`IDFT_31_2 :begin
				reset = 'd0		;			
				N0    = 'd31     ;	
				N1    = 'd41     ;
				N2    = 'd61	 ;			
				point = 'd2;
				point_2_mode = 'd0;	
				factor_idx = 'd0;
				case_41 = 'd0;			
				M1    = 'd3     ;
				M2    = 'd5     ;		
				M1M2  = 'd15     ;
				M0M1  = 'd6     ;
				M0M2  = 'd10     ;	
				inverse = 'd1;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end	
			`IDFT_31_3 :begin
				reset = 'd0		;			
				N0    = 'd31     ;	
				N1    = 'd41     ;
				N2    = 'd61	 ;			
				point = 'd3;
				point_2_mode = 'd0;	
				factor_idx = 'd0;
				case_41 = 'd0;			
				M1    = 'd2     ;
				M2    = 'd5     ;		
				M1M2  = 'd10     ;
				M0M1  = 'd6     ;
				M0M2  = 'd15     ;
				inverse = 'd1;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;
				pre_sel	      = 'd0;
			end
			`IDFT_31_5 :begin
				reset = 'd0		;			
				N0    = 'd31     ;	
				N1    = 'd41     ;
				N2    = 'd61	 ;			
				point = 'd5;
				point_2_mode = 'd0;	
				factor_idx = 'd0;
				case_41 = 'd0;			
				M1    = 'd2     ;
				M2    = 'd3     ;		
				M1M2  = 'd6     ;
				M0M1  = 'd10    ;
				M0M2  = 'd15    ;
				inverse = 'd1;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd1;
				sel_group_d0  = 'd0;
				write_d0	  = ~sum_trigger_delay13;
				sel_group_sum = 'd1;
				write_sum	  = 'd1;
				pre_sel	      = 'd0;			
			end	
			`DFT_41_5 :begin
				reset = 'd0		;			
				N0    = 'd41     ;	
				N1    = 'd31     ;
				N2    = 'd61	    ;			
				point = 'd5;
				point_2_mode = 'd0;	
				factor_idx = 'd1;
				case_41 = 'd1;			
				M1    = 'd8     ;
				M2    = 'd0     ;		
				M1M2  = 'd8     ; //M1
				M0M1  = 'd0     ;
				M0M2  = 'd5     ; //M0	
				inverse = 'd0;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;	
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end
			`DFT_41_4 :begin
				reset = 'd0		;			
				N0    = 'd41     ;	
				N1    = 'd31     ;
				N2    = 'd61	    ;			
				point = 'd4;
				point_2_mode = 'd0;	
				factor_idx = 'd1;
				case_41 = 'd2;			
				M1    = 'd2     ;
				M2    = 'd5     ;		
				M1M2  = 'd5     ; 
				M0M1  = 'd8     ;
				M0M2  = 'd0     ; 	
				inverse = 'd0;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;	
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd4;	//1: 31; 2: 41; 3: 61; 4: 4-2 DFT; 5: 2-4 IDFT			
			end		
			`DFT_41_2 :begin
				reset = 'd0		;			
				N0    = 'd41     ;	
				N1    = 'd31     ;
				N2    = 'd61	    ;			
				point = 'd2;
				point_2_mode = 'd1; // 4 2-DFT para	
				factor_idx = 'd1;
				case_41 = 'd2;		/// 'd2 for point 2 and 4	
				M1    = 'd4     ;
				M2    = 'd5     ;		
				M1M2  = 'd5     ; 
				M0M1  = 'd8     ;
				M0M2  = 'd0     ; 	
				inverse = 'd0;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd1;
				IFFT_LAST_STAGE = 'd0;	
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd1;
				write_sum	  = 'd0;	
				pre_sel	      = 'd2; //1: 31; 2: 41; 3: 61			
			end
			`IDFT_41_5 :begin
				reset = 'd0		;			
				N0    = 'd41     ;	
				N1    = 'd31     ;
				N2    = 'd61	    ;			
				point = 'd5;
				point_2_mode = 'd0;	
				factor_idx = 'd1;
				case_41 = 'd1;			
				M1    = 'd8     ;
				M2    = 'd0     ;		
				M1M2  = 'd8     ; //M1
				M0M1  = 'd0     ;
				M0M2  = 'd5     ; //M0	
				inverse = 'd1;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;	
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end	
			`IDFT_41_2 :begin
				reset = 'd0		;			
				N0    = 'd41     ;	
				N1    = 'd31     ;
				N2    = 'd61	    ;			
				point = 'd2;
				point_2_mode = 'd1; // 4 2-DFT para	
				factor_idx = 'd1;
				case_41 = 'd2;		/// 'd2 for point 2 and 4	
				M1    = 'd4     ;
				M2    = 'd5     ;		
				M1M2  = 'd5     ; 
				M0M1  = 'd8     ;
				M0M2  = 'd0     ; 	
				inverse = 'd1;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;	
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd5; //1: 31; 2: 41; 3: 61	
			end
			`IDFT_41_4 :begin
				reset = 'd0		;			
				N0    = 'd41     ;	
				N1    = 'd31     ;
				N2    = 'd61	    ;			
				point = 'd4;
				point_2_mode = 'd0;	
				factor_idx = 'd1;
				case_41 = 'd2;			
				M1    = 'd2     ;
				M2    = 'd5     ;		
				M1M2  = 'd5     ; 
				M0M1  = 'd8     ;
				M0M2  = 'd0     ; 	
				inverse = 'd1;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd1;	
				sel_group_d0  = 'd0;
				write_d0	  = ~sum_trigger_delay13;
				sel_group_sum = 'd1;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;	//1: 31; 2: 41; 3: 61; 4: 4-2 DFT; 5: 2-4 IDFT		
			end
			`DFT_61_3 :begin
				reset = 'd0		;			
				N0    = 'd61     ;	
				N1    = 'd31     ;
				N2    = 'd41	    ;			
				point = 'd3;
				point_2_mode = 'd0;	
				factor_idx = 'd2;
				case_41 = 'd0;			
				M1    = 'd4     ;
				M2    = 'd5     ;		
				M1M2  = 'd20     ;
				M0M1  = 'd12     ;
				M0M2  = 'd15     ;	
				inverse = 'd0;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;		
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end	
			`DFT_61_4 :begin
				reset = 'd0		;			
				N0    = 'd61     ;	
				N1    = 'd31     ;
				N2    = 'd41	    ;			
				point = 'd4;
				point_2_mode = 'd0;	
				factor_idx = 'd2;
				case_41 = 'd0;			
				M1    = 'd3     ;
				M2    = 'd5     ;		
				M1M2  = 'd15     ;
				M0M1  = 'd12     ;
				M0M2  = 'd20     ;	
				inverse = 'd0;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;		
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end		
			`DFT_61_5 :begin
				reset = 'd0		;			
				N0    = 'd61     ;	
				N1    = 'd31     ;
				N2    = 'd41	    ;			
				point = 'd5;
				point_2_mode = 'd0;	
				factor_idx = 'd2;
				case_41 = 'd0;			
				M1    = 'd3     ;
				M2    = 'd4     ;		
				M1M2  = 'd12     ;
				M0M1  = 'd15     ;
				M0M2  = 'd20     ;	
				inverse = 'd0;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd1;
				IFFT_LAST_STAGE = 'd0;		
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd1;
				write_sum	  = 'd0;	
				pre_sel	      = 'd3;				
			end		
			`IDFT_61_3 :begin
				reset = 'd0		;			
				N0    = 'd61     ;	
				N1    = 'd31     ;
				N2    = 'd41	    ;			
				point = 'd3;
				point_2_mode = 'd0;	
				factor_idx = 'd2;
				case_41 = 'd0;			
				M1    = 'd4     ;
				M2    = 'd5     ;		
				M1M2  = 'd20     ;
				M0M1  = 'd12     ;
				M0M2  = 'd15     ;	
				inverse = 'd1;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;		
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end	
			`IDFT_61_4 :begin
				reset = 'd0		;			
				N0    = 'd61     ;	
				N1    = 'd31     ;
				N2    = 'd41	    ;			
				point = 'd4;
				point_2_mode = 'd0;	
				factor_idx = 'd2;
				case_41 = 'd0;			
				M1    = 'd3     ;
				M2    = 'd5     ;		
				M1M2  = 'd15     ;
				M0M1  = 'd12     ;
				M0M2  = 'd20     ;	
				inverse = 'd1;
				sel_read_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;		
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end	
			`IDFT_61_5 :begin
				reset = 'd0		;			
				N0    = 'd61     ;	
				N1    = 'd31     ;
				N2    = 'd41	    ;			
				point = 'd5;
				point_2_mode = 'd0;	
				factor_idx = 'd2;
				case_41 = 'd0;			
				M1    = 'd3     ;
				M2    = 'd4     ;		
				M1M2  = 'd12     ;
				M0M1  = 'd15     ;
				M0M2  = 'd20     ;	
				inverse = 'd1;
				sel_read_group = 'd1; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd0; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd1;		
				sel_group_d0  = 'd0;
				write_d0	  = ~sum_trigger_delay13;
				sel_group_sum = 'd1;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end				
			`buffer_0, `buffer_1, `buffer_2, `buffer_3, `buffer_4, `buffer_5, `buffer_6, 
			`buffer_7, `buffer_8, `buffer_9, `buffer_10, `buffer_11, `buffer_12, `buffer_13,
			`buffer_14, `buffer_15, `buffer_16: begin
				reset = 'd1		;			
				N0    = 'd0     ;	
				N1    = 'd0     ;
				N2    = 'd0	    ;			
				point = 'd0;
				point_2_mode = 'd0;	
				factor_idx = 'd3;
				case_41 = 'd0;			
				M1    = 'd0     ;
				M2    = 'd0     ;		
				M1M2  = 'd0     ;
				M0M1  = 'd0     ;
				M0M2  = 'd0     ;	
				inverse = 'd0;
				sel_read_group = 'd2; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd2; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;		
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end
			default  :begin
				reset = 'd1		;			
				N0    = 'd0     ;	
				N1    = 'd0     ;
				N2    = 'd0	    ;			
				point = 'd0;
				point_2_mode = 'd0;	
				factor_idx = 'd3;
				case_41 = 'd0;			
				M1    = 'd0     ;
				M2    = 'd0     ;		
				M1M2  = 'd0     ;
				M0M1  = 'd0     ;
				M0M2  = 'd0     ;	
				inverse = 'd0;
				sel_read_group = 'd2; //0: mem0, 1: mem1, otherwises: do nothing	
				sel_write_group = 'd2; //0: mem0, 1: mem1, otherwises: do nothing	
				FFT_LAST_STAGE = 'd0;
				IFFT_LAST_STAGE = 'd0;		
				sel_group_d0  = 'd2;
				write_d0	  = 'd1;
				sel_group_sum = 'd2;
				write_sum	  = 'd1;	
				pre_sel	      = 'd0;				
			end	
		endcase
	end

logic AGU_2_done_out_delay1, AGU_2_done_out_delay2;

//assign AGU_2_done_out_delay1 = AGU_2_done_out;

always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		AGU_2_done_out_delay1 <= 'd0;
		AGU_2_done_out_delay2 <= 'd0;
		DFT_31_2_done <= 'd0;
		DFT_31_3_done <= 'd0;
		DFT_31_5_done <= 'd0;		
		IDFT_31_2_done <= 'd0;
		IDFT_31_3_done <= 'd0;
		IDFT_31_5_done <= 'd0;	
		DFT_41_2_done <= 'd0;
		DFT_41_4_done <= 'd0;
		DFT_41_5_done <= 'd0;		
		IDFT_41_2_done <= 'd0;
		IDFT_41_4_done <= 'd0;
		IDFT_41_5_done <= 'd0;	
		DFT_61_3_done <= 'd0;
		DFT_61_4_done <= 'd0;
		DFT_61_5_done <= 'd0;		
		IDFT_61_3_done <= 'd0;
		IDFT_61_4_done <= 'd0;
		IDFT_61_5_done <= 'd0;		
	end
	else begin
		AGU_2_done_out_delay1 <= AGU_2_done_out;
		AGU_2_done_out_delay2 <= AGU_2_done_out_delay1;		
		if(CS == `DFT_31_2) DFT_31_2_done <= AGU_2_done_out_delay2;
		else DFT_31_2_done <= 'd0;
		if(CS == `DFT_31_3) DFT_31_3_done <= AGU_2_done_out_delay2;
		else DFT_31_3_done <= 'd0;		
		if(CS == `DFT_31_5) DFT_31_5_done <= AGU_2_done_out_delay2;
		else DFT_31_5_done <= 'd0;		
		if(CS == `IDFT_31_2) IDFT_31_2_done <= AGU_2_done_out_delay2;
		else IDFT_31_2_done <= 'd0;
		if(CS == `IDFT_31_3) IDFT_31_3_done <= AGU_2_done_out_delay2;
		else IDFT_31_3_done <= 'd0;		
		if(CS == `IDFT_31_5) IDFT_31_5_done <= AGU_2_done_out_delay2;
		else IDFT_31_5_done <= 'd0;	
		
		if(CS == `DFT_41_2) DFT_41_2_done <= AGU_2_done_out_delay2;
		else DFT_41_2_done <= 'd0;
		if(CS == `DFT_41_4) DFT_41_4_done <= AGU_2_done_out_delay2;
		else DFT_41_4_done <= 'd0;		
		if(CS == `DFT_41_5) DFT_41_5_done <= AGU_2_done_out_delay2;
		else DFT_41_5_done <= 'd0;	
		if(CS == `IDFT_41_2) IDFT_41_2_done <= AGU_2_done_out_delay2;
		else IDFT_41_2_done <= 'd0;
		if(CS == `IDFT_41_4) IDFT_41_4_done <= AGU_2_done_out_delay2;
		else IDFT_41_4_done <= 'd0;		
		if(CS == `IDFT_41_5) IDFT_41_5_done <= AGU_2_done_out_delay2;
		else IDFT_41_5_done <= 'd0;	
		
		if(CS == `DFT_61_3) DFT_61_3_done <= AGU_2_done_out_delay2;
		else DFT_61_3_done <= 'd0;
		if(CS == `DFT_61_4) DFT_61_4_done <= AGU_2_done_out_delay2;
		else DFT_61_4_done <= 'd0;		
		if(CS == `DFT_61_5) DFT_61_5_done <= AGU_2_done_out_delay2;
		else DFT_61_5_done <= 'd0;	
		if(CS == `IDFT_61_3) IDFT_61_3_done <= AGU_2_done_out_delay2;
		else IDFT_61_3_done <= 'd0;
		if(CS == `IDFT_61_4) IDFT_61_4_done <= AGU_2_done_out_delay2;
		else IDFT_61_4_done <= 'd0;		
		if(CS == `IDFT_61_5) IDFT_61_5_done <= AGU_2_done_out_delay2;
		else IDFT_61_5_done <= 'd0;			
	end
/*
	if(NS == `DFT_31_3) begin
		if(AGU_2_done_out) DFT_31_3_done = 'd1;
		else DFT_31_3_done = 'd0;
	end
	else  DFT_31_3_done = 'd0;	

	if(NS == `DFT_31_5) begin
		if(AGU_2_done_out) DFT_31_5_done = 'd1;
		else DFT_31_5_done = 'd0;
	end
	else  DFT_31_5_done = 'd0;	
*/	
end 
	 
	always_comb begin
	  case(CS)
		`IDLE :begin
		   if(start_delay) NS = `DFT_31_2; 
		   else NS = `IDLE;
		end
		`DFT_31_2 :begin
		   if(DFT_31_2_done) NS = `buffer_0; 
		   else NS = `DFT_31_2;
		end	
		`buffer_0 :begin
			NS = `DFT_31_3;
		end			
		`DFT_31_3 :begin
		   if(DFT_31_3_done) NS = `buffer_1; 
		   else NS = `DFT_31_3;
		end		
		`buffer_1 :begin
			NS = `DFT_31_5;
		end				
		`DFT_31_5 :begin
		   if(DFT_31_5_done) NS = `buffer_2; 
		   else NS = `DFT_31_5;
		end		
		`buffer_2 :begin
			NS = `IDFT_31_2;
		end			
		`IDFT_31_2 :begin
		   if(IDFT_31_2_done) NS = `buffer_3; 
		   else NS = `IDFT_31_2;
		end
		`buffer_3 :begin
			NS = `IDFT_31_3;
		end			
		`IDFT_31_3 :begin
		   if(IDFT_31_3_done) NS = `buffer_4; 
		   else NS = `IDFT_31_3;
		end	
		`buffer_4 :begin
			NS = `IDFT_31_5;
		end			
		`IDFT_31_5 :begin
		   if(IDFT_31_5_done) NS = `buffer_5; 
		   else NS = `IDFT_31_5;
		end	
		`buffer_5 :begin
			NS = `DFT_41_5;
		end			
		`DFT_41_5 :begin
		   if(DFT_41_5_done) NS = `buffer_6; 
		   else NS = `DFT_41_5;
		end	
		`buffer_6 :begin
			NS = `DFT_41_4;
		end			
		`DFT_41_4 :begin
		   if(DFT_41_4_done) NS = `buffer_7; 
		   else NS = `DFT_41_4;
		end	
		`buffer_7 :begin
			NS = `DFT_41_2;
		end			
		`DFT_41_2 :begin
		   if(DFT_41_2_done) NS = `buffer_8; 
		   else NS = `DFT_41_2;
		end	
		`buffer_8 :begin
			NS = `IDFT_41_5;
		end			
		`IDFT_41_5 :begin
		   if(IDFT_41_5_done) NS = `buffer_9; 
		   else NS = `IDFT_41_5;
		end
		`buffer_9 :begin
			NS = `IDFT_41_2;
		end			
		`IDFT_41_2 :begin
		   if(IDFT_41_2_done) NS = `buffer_10; 
		   else NS = `IDFT_41_2;
		end		
		`buffer_10 :begin
			NS = `IDFT_41_4;
		end			
		`IDFT_41_4 :begin
		   if(IDFT_41_4_done) NS = `buffer_11; 
		   else NS = `IDFT_41_4;
		end	
		`buffer_11 :begin
			NS = `DFT_61_3;
		end			
		`DFT_61_3 :begin
		   if(DFT_61_3_done) NS = `buffer_12; 
		   else NS = `DFT_61_3;
		end	
		`buffer_12 :begin
			NS = `DFT_61_4;
		end				
		`DFT_61_4 :begin
		   if(DFT_61_4_done) NS = `buffer_13; 
		   else NS = `DFT_61_4;
		end	
		`buffer_13 :begin
			NS = `DFT_61_5;
		end				
		`DFT_61_5 :begin
		   if(DFT_61_5_done) NS = `buffer_14; 
		   else NS = `DFT_61_5;
		end	
		`buffer_14 :begin
			NS = `IDFT_61_3;
		end			
		`IDFT_61_3 :begin
		   if(IDFT_61_3_done) NS = `buffer_15; 
		   else NS = `IDFT_61_3;
		end	
		`buffer_15 :begin
			NS = `IDFT_61_4;
		end			
		`IDFT_61_4 :begin
		   if(IDFT_61_4_done) NS = `buffer_16; 
		   else NS = `IDFT_61_4;
		end	
		`buffer_16 :begin
			NS = `IDFT_61_5;
		end			
		`IDFT_61_5 :begin
		   if(IDFT_61_5_done) NS = `IDLE; 
		   else NS = `IDFT_61_5;
		end			
		default : begin
		  NS = `IDLE;
		end
	  endcase
	end	 
	 
	 
	 
AGU_INTEGRATE agu_integrate(                                                                                      
    .clk		 (clk		),                                           
    .rst_n		 (reset		), 
	.point		 (point		),
	.point_2_mode(point_2_mode	),
	.factor_idx	 (factor_idx	),	//0: 31; 1: 41; 2: 61
	.case_41	 (case_41		),  //1: point = 5; 2: point = 4 or 2
	.M1			 (M1			),
	.M2			 (M2			),	
	.N0			 (N0			),
	.N1			 (N1			),
	.N2			 (N2			),	
	.M1M2		 (M1M2		),
	.M0M1		 (M0M1		),
	.M0M2		 (M0M2		),
	.bank0_out		 (bank0		),
	.bank1_out		 (bank1		),
	.bank2_out		 (bank2		),
	.bank3_out		 (bank3		),
	.bank4_out		 (bank4		),
	.bank5_out		 (bank5		),
	.bank6_out		 (bank6		),
	.bank7_out		 (bank7		),	
	.addr0_out		 (addr0		),
	.addr1_out		 (addr1		),
	.addr2_out		 (addr2		),
	.addr3_out		 (addr3		),
	.addr4_out		 (addr4		),
	.addr5_out		 (addr5		),
	.addr6_out		 (addr6		),
	.addr7_out		 (addr7		),
	.AGU_2_done  (AGU_2_done),
	.n0_0_sub_1	  (n0_0_sub_1),	
	.n0_1_sub_1	  (n0_1_sub_1),
	.n0_2_sub_1	  (n0_2_sub_1),
	.n0_3_sub_1	  (n0_3_sub_1),
	.n0_4_sub_1	  (n0_4_sub_1),
	.n0_5_sub_1	  (n0_5_sub_1),
	.n0_6_sub_1	  (n0_6_sub_1),
	.n0_7_sub_1   (n0_7_sub_1),
	.sum_trigger	(sum_trigger)		  ,
	.bank_sum_out		(bank_sum	)		  ,
	.addr_sum_out	    (addr_sum	)		  ,
	.m1_out_0_LSB	(m1_out_0_LSB)
); 	 



always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		//sum_out <= 'd0; 
		sum_trigger_delay1 <= 'd0;
		sum_trigger_delay2 <= 'd0;
		sum_trigger_delay3 <= 'd0;
		sum_trigger_delay4 <= 'd0;
		sum_trigger_delay5 <= 'd0;
		sum_trigger_delay6 <= 'd0;
		sum_trigger_delay7 <= 'd0;
		sum_trigger_delay8 <= 'd0;
		sum_trigger_delay9 <= 'd0;	
		sum_trigger_delay10<= 'd0;	
		sum_trigger_delay11<= 'd0;			
	end
	else begin
		if(reset) begin
			sum_trigger_delay1 <= 'd0;
			sum_trigger_delay2 <= 'd0;
			sum_trigger_delay3 <= 'd0;
			sum_trigger_delay4 <= 'd0;
			sum_trigger_delay5 <= 'd0;
			sum_trigger_delay6 <= 'd0;
			sum_trigger_delay7 <= 'd0;
			sum_trigger_delay8 <= 'd0;	
			sum_trigger_delay9 <= 'd0;	
			sum_trigger_delay10<= 'd0;	
			sum_trigger_delay11<= 'd0;	
			sum_trigger_delay12 <= 'd0;	
			sum_trigger_delay13 <= 'd0;				
		end
		else begin
			sum_trigger_delay1 <= sum_trigger;   
			sum_trigger_delay2 <= sum_trigger_delay1;	 //delay 2 for write_d0	
			sum_trigger_delay3 <= sum_trigger_delay2;		
			sum_trigger_delay4 <= sum_trigger_delay3;		
			sum_trigger_delay5 <= sum_trigger_delay4;		
			sum_trigger_delay6 <= sum_trigger_delay5;		
			sum_trigger_delay7 <= sum_trigger_delay6;		
			sum_trigger_delay8 <= sum_trigger_delay7;	
			sum_trigger_delay9 <= sum_trigger_delay8;	
			sum_trigger_delay10 <= sum_trigger_delay9;	
			sum_trigger_delay11 <= sum_trigger_delay10;	
			sum_trigger_delay12 <= sum_trigger_delay11;	
			sum_trigger_delay13 <= sum_trigger_delay12;	
			
		end		
			
	end
end

	
	 
	 
FFT_top FFT_TOP(
	.clk     (clk     ), 
	.rst_n   (reset   ), 
	.FFT_0   (mem_OUT_0),
    .FFT_1   (mem_OUT_1),
    .FFT_2   (mem_OUT_2),
    .FFT_3   (mem_OUT_3),
	.FFT_4   (mem_OUT_4),
    .FFT_5   (mem_OUT_5),
    .FFT_6   (mem_OUT_6),
    .FFT_7   (mem_OUT_7),	
	.modular (modular ),
	.point   (point   ),
	.point_2_mode   (point_2_mode   ),	
	.pre_sel(pre_sel),
	.inverse (inverse ),
	.FFT_LAST_STAGE(FFT_LAST_STAGE),
	.IFFT_LAST_STAGE(IFFT_LAST_STAGE),	
	.sum_trigger(sum_trigger),
	.sum_trigger_delay8(sum_trigger_delay8),
	.sum_in (mem_OUT_sum ),
	.sum_out(mem_IN_sum),
	.d0_in  (mem_OUT_d0  ),
	.d0_out (mem_IN_d0 ),	
	.mem_IN_0(mem_IN_0),	
	.mem_IN_1(mem_IN_1),	
	.mem_IN_2(mem_IN_2),	
	.mem_IN_3(mem_IN_3),	
	.mem_IN_4(mem_IN_4),	
	.mem_IN_5(mem_IN_5),	
	.mem_IN_6(mem_IN_6),
	.mem_IN_7(mem_IN_7),	
	.POINTWISE_COEF_0(POINTWISE_COEF_0),
	.POINTWISE_COEF_1(POINTWISE_COEF_1),
	.POINTWISE_COEF_2(POINTWISE_COEF_2),
	.POINTWISE_COEF_3(POINTWISE_COEF_3),
	.POINTWISE_COEF_4(POINTWISE_COEF_4),
	.POINTWISE_COEF_5(POINTWISE_COEF_5),
	.POINTWISE_COEF_6(POINTWISE_COEF_6),
	.POINTWISE_COEF_7(POINTWISE_COEF_7)
 ); 	 


	logic [`BANK_WIDTH-1:0]bank_sum_ping_pong_in;
	logic [`ADDR_WIDTH-1:0]addr_sum_ping_pong_in;
	logic [`BANK_WIDTH-1:0]bank_d0_ping_pong_in;
	logic [`ADDR_WIDTH-1:0]addr_d0_ping_pong_in;	 

Ping_Pong_mem PING_PONG_MEM(    
		.clk		    (clk		    ),
		.rst_n	 	    (reset	 	    ),		
			
		.sel_write_group(sel_write_group), //0: mem0, 1: mem1, otherwises: do nothing
		.bank0_write    (bank0_write    ),
		.bank1_write    (bank1_write    ),
		.bank2_write    (bank2_write    ),
		.bank3_write    (bank3_write    ),
		.bank4_write    (bank4_write    ),
		.bank5_write    (bank5_write    ),
		.bank6_write    (bank6_write    ),
		.bank7_write    (bank7_write    ),		
		.addr0_write    (addr0_write    ),
		.addr1_write    (addr1_write    ),
		.addr2_write    (addr2_write    ),
		.addr3_write    (addr3_write    ),
		.addr4_write    (addr4_write    ),
		.addr5_write    (addr5_write    ),
		.addr6_write    (addr6_write    ),
		.addr7_write    (addr7_write    ),	
					
		.sel_read_group (sel_read_group ),
		.bank0_read     (bank0			),
		.bank1_read     (bank1			),
		.bank2_read     (bank2			),
		.bank3_read     (bank3			),
		.bank4_read     (bank4			),
		.bank5_read     (bank5			),
		.bank6_read     (bank6			),
		.bank7_read     (bank7			),		
		.addr0_read     (addr0			),
		.addr1_read     (addr1			),
		.addr2_read     (addr2			),
		.addr3_read     (addr3			),
		.addr4_read     (addr4			),
		.addr5_read     (addr5			),
		.addr6_read     (addr6			),		
		.addr7_read     (addr7			),	
					  
		.mem_IN_0 	    (mem_IN_0 	    ),
		.mem_IN_1 	    (mem_IN_1 	    ),
		.mem_IN_2 	    (mem_IN_2 	    ),
		.mem_IN_3 	    (mem_IN_3 	    ),
		.mem_IN_4 	    (mem_IN_4 	    ),
		.mem_IN_5 	    (mem_IN_5 	    ),
		.mem_IN_6 	    (mem_IN_6 	    ),
		.mem_IN_7 	    (mem_IN_7 	    ),
					  
		.mem_OUT_0	    (mem_OUT_0	    ),
		.mem_OUT_1	    (mem_OUT_1	    ),
		.mem_OUT_2	    (mem_OUT_2	    ),
		.mem_OUT_3	    (mem_OUT_3	    ),
		.mem_OUT_4	    (mem_OUT_4	    ),
		.mem_OUT_5	    (mem_OUT_5	    ),
		.mem_OUT_6	    (mem_OUT_6	    ),		
		.mem_OUT_7	    (mem_OUT_7	    ),

		.sel_group_d0        (sel_group_d0  ),    //0: mem0, 1: mem1, otherwises: do nothing	
		.write_d0            (write_d0      ),
		.bank_d0    		 (bank_d0_ping_pong_in    	),		
		.addr_d0  	   		 (addr_d0_ping_pong_in  	   	),	
		.mem_IN_d0 	   		 (mem_IN_sum_out	   	),	  //share mem_IN_sum_out because sum and d0 will not write ate the same time
		.mem_OUT_d0			 (mem_OUT_d0	), 		
		.sel_group_sum		 (sel_group_sum	),
		.write_sum           (write_sum     ),
		.bank_sum      		 (bank_sum_ping_pong_in 	), 
		.addr_sum      		 (addr_sum_ping_pong_in 	),		
		.mem_IN_sum 	     (mem_IN_sum_out),
		.mem_OUT_sum	     (mem_OUT_sum	)	
	);   
	
	
	assign bank_sum_ping_pong_in = (IFFT_LAST_STAGE)? bank_sum : bank_sum_out;	//delay or not
	assign addr_sum_ping_pong_in = (IFFT_LAST_STAGE)? addr_sum : addr_sum_out;
	
	assign bank_d0_ping_pong_in = (write_d0)? bank_sum : bank_sum_out;	//delay or not
	assign addr_d0_ping_pong_in = (write_d0)? addr_sum : addr_sum_out;



/*	
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			WEN_d0 <= 'd1;
			cnt <= 'd0;
		end
		else begin
			if(reset) begin 
				cnt <= 'd0;
				WEN_d0 <= 'd1;
			end
			else begin
				if()
			end
		end
	end
	
	assign cnt_add_1 = cnt + 'd1;
*/	
	
	 
	Registers REGISTERS(
		.clk       (clk ),
		.rst_n     (reset ),
		.sel	   (pre_sel	      ), //1: 31; 2: 41; 3: 61
		.m1_out_0  (m1_out_0_LSB),
		.Read_Reg0 (n0_0_sub_1_out),
		.Read_Reg1 (n0_1_sub_1_out),
		.Read_Reg2 (n0_2_sub_1_out),
		.Read_Reg3 (n0_3_sub_1_out),
		.Read_Reg4 (n0_4_sub_1_out),
		.Read_Reg5 (n0_5_sub_1_out),
		.Read_Reg6 (n0_6_sub_1_out),
		.Read_Reg7 (n0_7_sub_1_out),
		.Read_Data0(POINTWISE_COEF_0),
		.Read_Data1(POINTWISE_COEF_1),
		.Read_Data2(POINTWISE_COEF_2),
		.Read_Data3(POINTWISE_COEF_3),
		.Read_Data4(POINTWISE_COEF_4),
		.Read_Data5(POINTWISE_COEF_5),
		.Read_Data6(POINTWISE_COEF_6),
		.Read_Data7(POINTWISE_COEF_7)
	);	 
	
logic[`DATA_WIDTH-1:0] mem_IN_sum_d0;

assign mem_IN_sum_d0 = (IFFT_LAST_STAGE)? mem_IN_d0 : mem_IN_sum;
	 
Delay_buffer DELAY_BUFFER(
		.clk      (clk      )    ,        
		.rst_n    (reset	    )    ,      
		.bank0    (bank0    )    ,
		.bank1    (bank1    )    ,
		.bank2    (bank2    )    ,
		.bank3    (bank3    )    ,
		.bank4    (bank4    )    ,
		.bank5    (bank5    )    ,
		.bank6    (bank6    )    ,
		.bank7    (bank7    )    ,
		.addr0    (addr0    )    ,
		.addr1    (addr1    )    ,
		.addr2    (addr2    )    ,
		.addr3    (addr3    )    ,
		.addr4    (addr4    )    ,
		.addr5    (addr5    )    ,
		.addr6    (addr6    )    ,		
		.addr7    (addr7    )    ,	
		.AGU_2_done(AGU_2_done)	 ,	
		.n0_0_sub_1 (n0_0_sub_1) ,
        .n0_1_sub_1 (n0_1_sub_1) ,
        .n0_2_sub_1 (n0_2_sub_1) ,
        .n0_3_sub_1 (n0_3_sub_1) ,
        .n0_4_sub_1 (n0_4_sub_1) ,
        .n0_5_sub_1 (n0_5_sub_1) ,
        .n0_6_sub_1 (n0_6_sub_1) ,
        .n0_7_sub_1 (n0_7_sub_1) ,	
		.bank_sum      		(bank_sum 		), 
		.addr_sum      		(addr_sum 		), 		
		.mem_IN_sum 	    (mem_IN_sum_d0 	),	
		.bank0_out(bank0_write)    ,
		.bank1_out(bank1_write)    ,
		.bank2_out(bank2_write)    ,
		.bank3_out(bank3_write)    ,
		.bank4_out(bank4_write)    ,
		.bank5_out(bank5_write)    ,
		.bank6_out(bank6_write)    ,
		.bank7_out(bank7_write)    ,
		.addr0_out(addr0_write)    ,
		.addr1_out(addr1_write)    ,
		.addr2_out(addr2_write)    ,
		.addr3_out(addr3_write)    ,
		.addr4_out(addr4_write)    ,
		.addr5_out(addr5_write)    ,
		.addr6_out(addr6_write)    ,
		.addr7_out(addr7_write)    ,
		.AGU_2_done_out(AGU_2_done_out),
		.n0_0_sub_1_out (n0_0_sub_1_out) ,
        .n0_1_sub_1_out (n0_1_sub_1_out) ,
        .n0_2_sub_1_out (n0_2_sub_1_out) ,
        .n0_3_sub_1_out (n0_3_sub_1_out) ,
        .n0_4_sub_1_out (n0_4_sub_1_out) ,
        .n0_5_sub_1_out (n0_5_sub_1_out) ,
        .n0_6_sub_1_out (n0_6_sub_1_out) ,
        .n0_7_sub_1_out (n0_7_sub_1_out) ,
		.bank_sum_out      		(bank_sum_out 		), 
		.addr_sum_out      		(addr_sum_out 		),		
		.mem_IN_sum_out 	    (mem_IN_sum_out 	)			
		
);	 
	 
	 
	 
	 
	 
	 

	 
endmodule	 