 `include "define.sv"
 
 
 	module Delay_buffer(    
		input clk          ,        
		input rst_n        ,      
		input [`BANK_WIDTH-1:0]bank0        ,
		input [`BANK_WIDTH-1:0]bank1        ,
		input [`BANK_WIDTH-1:0]bank2        ,
		input [`BANK_WIDTH-1:0]bank3        ,
		input [`BANK_WIDTH-1:0]bank4        ,
		input [`BANK_WIDTH-1:0]bank5        ,
		input [`BANK_WIDTH-1:0]bank6        ,
		input [`BANK_WIDTH-1:0]bank7        ,
		input [`ADDR_WIDTH-1:0]addr0        ,
		input [`ADDR_WIDTH-1:0]addr1        ,
		input [`ADDR_WIDTH-1:0]addr2        ,
		input [`ADDR_WIDTH-1:0]addr3        ,
		input [`ADDR_WIDTH-1:0]addr4        ,
		input [`ADDR_WIDTH-1:0]addr5        ,
		input [`ADDR_WIDTH-1:0]addr6        ,		
		input [`ADDR_WIDTH-1:0]addr7        ,	
		input  AGU_2_done,
		input [`INDEX_WIDTH_N_ADD-1:0] n0_0_sub_1 ,		
		input [`INDEX_WIDTH_N_ADD-1:0] n0_1_sub_1 ,		
		input [`INDEX_WIDTH_N_ADD-1:0] n0_2_sub_1 ,		
		input [`INDEX_WIDTH_N_ADD-1:0] n0_3_sub_1 ,		
		input [`INDEX_WIDTH_N_ADD-1:0] n0_4_sub_1 ,		
		input [`INDEX_WIDTH_N_ADD-1:0] n0_5_sub_1 ,		
		input [`INDEX_WIDTH_N_ADD-1:0] n0_6_sub_1 ,		
		input [`INDEX_WIDTH_N_ADD-1:0] n0_7_sub_1 ,	
		input [`BANK_WIDTH-1:0]bank_sum           ,
		input [`ADDR_WIDTH-1:0]addr_sum           ,		
		input [`DATA_WIDTH-1:0]mem_IN_sum		  ,
		output logic[`BANK_WIDTH-1:0]bank0_out    ,
		output logic[`BANK_WIDTH-1:0]bank1_out    ,
		output logic[`BANK_WIDTH-1:0]bank2_out    ,
		output logic[`BANK_WIDTH-1:0]bank3_out    ,
		output logic[`BANK_WIDTH-1:0]bank4_out    ,
		output logic[`BANK_WIDTH-1:0]bank5_out    ,
		output logic[`BANK_WIDTH-1:0]bank6_out    ,
		output logic[`BANK_WIDTH-1:0]bank7_out    ,
		output logic[`ADDR_WIDTH-1:0]addr0_out    ,
		output logic[`ADDR_WIDTH-1:0]addr1_out    ,
		output logic[`ADDR_WIDTH-1:0]addr2_out    ,
		output logic[`ADDR_WIDTH-1:0]addr3_out    ,
		output logic[`ADDR_WIDTH-1:0]addr4_out    ,
		output logic[`ADDR_WIDTH-1:0]addr5_out    ,
		output logic[`ADDR_WIDTH-1:0]addr6_out    ,
		output logic[`ADDR_WIDTH-1:0]addr7_out    ,
		output logic AGU_2_done_out,
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_0_sub_1_out ,		
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_1_sub_1_out ,		
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_2_sub_1_out ,		
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_3_sub_1_out ,		
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_4_sub_1_out ,		
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_5_sub_1_out ,		
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_6_sub_1_out ,		
		output logic [`INDEX_WIDTH_N_ADD-1:0] n0_7_sub_1_out ,
		output [`BANK_WIDTH-1:0]bank_sum_out           ,
		output logic[`ADDR_WIDTH-1:0]addr_sum_out      ,		
		output [`DATA_WIDTH-1:0]mem_IN_sum_out		  		
	); 
	
	logic[`BANK_WIDTH-1:0]bank0_delay[14];
    logic[`BANK_WIDTH-1:0]bank1_delay[14];
    logic[`BANK_WIDTH-1:0]bank2_delay[14];
    logic[`BANK_WIDTH-1:0]bank3_delay[14];
    logic[`BANK_WIDTH-1:0]bank4_delay[14];
    logic[`BANK_WIDTH-1:0]bank5_delay[14];
    logic[`BANK_WIDTH-1:0]bank6_delay[14];
    logic[`BANK_WIDTH-1:0]bank7_delay[14];
    logic[`ADDR_WIDTH-1:0]addr0_delay[14];
    logic[`ADDR_WIDTH-1:0]addr1_delay[14];
    logic[`ADDR_WIDTH-1:0]addr2_delay[14];
    logic[`ADDR_WIDTH-1:0]addr3_delay[14];
    logic[`ADDR_WIDTH-1:0]addr4_delay[14];
    logic[`ADDR_WIDTH-1:0]addr5_delay[14];
    logic[`ADDR_WIDTH-1:0]addr6_delay[14];
    logic[`ADDR_WIDTH-1:0]addr7_delay[14];
	logic			 AGU_2_done_delay[14];
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_0_sub_1_delay[11] ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_1_sub_1_delay[11] ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_2_sub_1_delay[11] ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_3_sub_1_delay[11] ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_4_sub_1_delay[11] ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_5_sub_1_delay[11] ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_6_sub_1_delay[11] ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n0_7_sub_1_delay[11] ;
	logic [`BANK_WIDTH-1:0]bank_sum_delay[12];
	logic [`ADDR_WIDTH-1:0]addr_sum_delay[12];
	logic [`DATA_WIDTH-1:0]mem_IN_sum_delay[10];	

	assign bank0_delay[0] =  bank0  ;
	assign bank1_delay[0] =  bank1  ;
	assign bank2_delay[0] =  bank2  ;
	assign bank3_delay[0] =  bank3  ;
	assign bank4_delay[0] =  bank4  ;
	assign bank5_delay[0] =  bank5  ;
	assign bank6_delay[0] =  bank6  ;
	assign bank7_delay[0] =  bank7  ;
	assign addr0_delay[0] =  addr0  ;
	assign addr1_delay[0] =  addr1  ;
	assign addr2_delay[0] =  addr2  ;
	assign addr3_delay[0] =  addr3  ;
	assign addr4_delay[0] =  addr4  ;
	assign addr5_delay[0] =  addr5  ;
    assign addr6_delay[0] =  addr6  ;
    assign addr7_delay[0] =  addr7  ;
    assign AGU_2_done_delay[0] = AGU_2_done ;
	assign n0_0_sub_1_delay[0] = n0_0_sub_1;
    assign n0_1_sub_1_delay[0] = n0_1_sub_1;
    assign n0_2_sub_1_delay[0] = n0_2_sub_1;
    assign n0_3_sub_1_delay[0] = n0_3_sub_1;
    assign n0_4_sub_1_delay[0] = n0_4_sub_1;
    assign n0_5_sub_1_delay[0] = n0_5_sub_1;
    assign n0_6_sub_1_delay[0] = n0_6_sub_1;
    assign n0_7_sub_1_delay[0] = n0_7_sub_1;
	assign bank_sum_delay[0] = bank_sum   ;
	assign addr_sum_delay[0] = addr_sum   ;	
    assign mem_IN_sum_delay[0] = mem_IN_sum ;


	
	
	assign bank0_out =  bank0_delay[13]  ;
	assign bank1_out =  bank1_delay[13]  ;
	assign bank2_out =  bank2_delay[13]  ;
	assign bank3_out =  bank3_delay[13]  ;
	assign bank4_out =  bank4_delay[13]  ;
	assign bank5_out =  bank5_delay[13]  ;
	assign bank6_out =  bank6_delay[13]  ;
	assign bank7_out =  bank7_delay[13]  ;
	assign addr0_out =  addr0_delay[13]  ;
	assign addr1_out =  addr1_delay[13]  ;
	assign addr2_out =  addr2_delay[13]  ;
	assign addr3_out =  addr3_delay[13]  ;
	assign addr4_out =  addr4_delay[13]  ;
	assign addr5_out =  addr5_delay[13]  ;
    assign addr6_out =  addr6_delay[13]  ;
    assign addr7_out =  addr7_delay[13]  ;
    assign AGU_2_done_out = AGU_2_done_delay[13];	
	assign n0_0_sub_1_out = n0_0_sub_1_delay[10];
	assign n0_1_sub_1_out = n0_1_sub_1_delay[10];
	assign n0_2_sub_1_out = n0_2_sub_1_delay[10];
	assign n0_3_sub_1_out = n0_3_sub_1_delay[10];
	assign n0_4_sub_1_out = n0_4_sub_1_delay[10];
	assign n0_5_sub_1_out = n0_5_sub_1_delay[10];
	assign n0_6_sub_1_out = n0_6_sub_1_delay[10];
	assign n0_7_sub_1_out = n0_7_sub_1_delay[10];
	assign bank_sum_out = bank_sum_delay[11] ;
	assign addr_sum_out = addr_sum_delay[11] ;	
    assign mem_IN_sum_out = mem_IN_sum_delay[9] ;
	
	genvar i;	
	generate
		for(i = 0; i < 13; i = i + 1) begin : delay
			always@(posedge clk or posedge rst_n) begin
				if(rst_n) begin
					bank0_delay[i+1] <= 'd63	;	
					bank1_delay[i+1] <= 'd63	;	
					bank2_delay[i+1] <= 'd63	;	
					bank3_delay[i+1] <= 'd63	;	
					bank4_delay[i+1] <= 'd63	;	
					bank5_delay[i+1] <= 'd63	;	
					bank6_delay[i+1] <= 'd63	;	
					bank7_delay[i+1] <= 'd63	;	
					addr0_delay[i+1] <= 'd2047	;	
					addr1_delay[i+1] <= 'd2047	;	
					addr2_delay[i+1] <= 'd2047	;	
					addr3_delay[i+1] <= 'd2047	;	
					addr4_delay[i+1] <= 'd2047	;	
					addr5_delay[i+1] <= 'd2047	;	
					addr6_delay[i+1] <= 'd2047	;	
					addr7_delay[i+1] <= 'd2047	;	
					AGU_2_done_delay[i+1] <= 'd0;
					//bank_sum_delay[i+1] <= 'd63;
					//addr_sum_delay[i+1] <= 'd2047;					
				end
				else begin
					bank0_delay[i+1] <= bank0_delay[i]	;	
					bank1_delay[i+1] <= bank1_delay[i]	;	
					bank2_delay[i+1] <= bank2_delay[i]	;	
					bank3_delay[i+1] <= bank3_delay[i]	;	
					bank4_delay[i+1] <= bank4_delay[i]	;	
					bank5_delay[i+1] <= bank5_delay[i]	;	
					bank6_delay[i+1] <= bank6_delay[i]	;	
					bank7_delay[i+1] <= bank7_delay[i]	;	
					addr0_delay[i+1] <= addr0_delay[i]	;	
					addr1_delay[i+1] <= addr1_delay[i]	;	
					addr2_delay[i+1] <= addr2_delay[i]	;	
					addr3_delay[i+1] <= addr3_delay[i]	;	
					addr4_delay[i+1] <= addr4_delay[i]	;	
					addr5_delay[i+1] <= addr5_delay[i]	;	
					addr6_delay[i+1] <= addr6_delay[i]	;	
					addr7_delay[i+1] <= addr7_delay[i]	;	
					AGU_2_done_delay[i+1] <= AGU_2_done_delay[i];
					//bank_sum_delay[i+1]   <= bank_sum_delay[i]  ;	
					//addr_sum_delay[i+1]   <= addr_sum_delay[i]  ;					
				end
			end
		end
	endgenerate		

	generate
		for(i = 0; i < 11; i = i + 1) begin : delay4
			always@(posedge clk or posedge rst_n) begin
				if(rst_n) begin
					bank_sum_delay[i+1] <= 'd63;
					addr_sum_delay[i+1] <= 'd2047;					
				end
				else begin
					bank_sum_delay[i+1]   <= bank_sum_delay[i]  ;	
					addr_sum_delay[i+1]   <= addr_sum_delay[i]  ;					
				end
			end
		end
	endgenerate	

	generate
		for(i = 0; i < 9; i = i + 1) begin : delay3
			always@(posedge clk or posedge rst_n) begin
				if(rst_n) begin
					mem_IN_sum_delay[i+1] <= 'd0;					
				end
				else begin
					mem_IN_sum_delay[i+1] <= mem_IN_sum_delay[i];						
				end
			end
		end
	endgenerate	

	generate
		for(i = 0; i < 10; i = i + 1) begin : delay2
			always@(posedge clk or posedge rst_n) begin
				if(rst_n) begin	
					n0_0_sub_1_delay[i+1] <= 'd0;
					n0_1_sub_1_delay[i+1] <= 'd0;
					n0_2_sub_1_delay[i+1] <= 'd0;
					n0_3_sub_1_delay[i+1] <= 'd0;
					n0_4_sub_1_delay[i+1] <= 'd0;
					n0_5_sub_1_delay[i+1] <= 'd0;
					n0_6_sub_1_delay[i+1] <= 'd0;
					n0_7_sub_1_delay[i+1] <= 'd0;
					//mem_IN_sum_delay[i+1] <= 'd0;					
				end
				else begin
					n0_0_sub_1_delay[i+1] <= n0_0_sub_1_delay[i];
                    n0_1_sub_1_delay[i+1] <= n0_1_sub_1_delay[i];
                    n0_2_sub_1_delay[i+1] <= n0_2_sub_1_delay[i];
                    n0_3_sub_1_delay[i+1] <= n0_3_sub_1_delay[i];
                    n0_4_sub_1_delay[i+1] <= n0_4_sub_1_delay[i];
                    n0_5_sub_1_delay[i+1] <= n0_5_sub_1_delay[i];
                    n0_6_sub_1_delay[i+1] <= n0_6_sub_1_delay[i];
                    n0_7_sub_1_delay[i+1] <= n0_7_sub_1_delay[i];
					//mem_IN_sum_delay[i+1] <= mem_IN_sum_delay[i];					
				end
			end
		end
	endgenerate	
	
	endmodule