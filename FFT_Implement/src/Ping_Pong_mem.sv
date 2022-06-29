 `include "define.sv"
 `include "mem_wrapper.sv"
 //`include "SRAM_SP_2048.v"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:PP mem_wrapper           mem_wrapper                                                                                                                                 
 //==============================================                                                
        

	module Ping_Pong_mem(    
		input clk		 ,
		input rst_n	 ,		
		
		input [1:0]sel_write_group, //0: mem0, 1: mem1, otherwises: do nothing	
		input [`BANK_WIDTH-1:0]bank0_write    ,
		input [`BANK_WIDTH-1:0]bank1_write    ,
		input [`BANK_WIDTH-1:0]bank2_write    ,
		input [`BANK_WIDTH-1:0]bank3_write    ,
		input [`BANK_WIDTH-1:0]bank4_write    ,
		input [`BANK_WIDTH-1:0]bank5_write    ,
		input [`BANK_WIDTH-1:0]bank6_write    ,
		input [`BANK_WIDTH-1:0]bank7_write    ,				
		input [`ADDR_WIDTH-1:0]addr0_write    ,
		input [`ADDR_WIDTH-1:0]addr1_write    ,
		input [`ADDR_WIDTH-1:0]addr2_write    ,
		input [`ADDR_WIDTH-1:0]addr3_write    ,
		input [`ADDR_WIDTH-1:0]addr4_write    ,
		input [`ADDR_WIDTH-1:0]addr5_write    ,
		input [`ADDR_WIDTH-1:0]addr6_write    ,
		input [`ADDR_WIDTH-1:0]addr7_write    ,	

		
		input [1:0]sel_read_group,	
		input [`BANK_WIDTH-1:0]bank0_read    ,
		input [`BANK_WIDTH-1:0]bank1_read    ,
		input [`BANK_WIDTH-1:0]bank2_read    ,
		input [`BANK_WIDTH-1:0]bank3_read    ,
		input [`BANK_WIDTH-1:0]bank4_read    ,
		input [`BANK_WIDTH-1:0]bank5_read    ,
		input [`BANK_WIDTH-1:0]bank6_read    ,
		input [`BANK_WIDTH-1:0]bank7_read    ,
		
		input [`ADDR_WIDTH-1:0]addr0_read    ,
		input [`ADDR_WIDTH-1:0]addr1_read    ,
		input [`ADDR_WIDTH-1:0]addr2_read    ,
		input [`ADDR_WIDTH-1:0]addr3_read    ,
		input [`ADDR_WIDTH-1:0]addr4_read    ,
		input [`ADDR_WIDTH-1:0]addr5_read    ,
		input [`ADDR_WIDTH-1:0]addr6_read    ,		
		input [`ADDR_WIDTH-1:0]addr7_read    ,
		
		
		input [`DATA_WIDTH-1:0]mem_IN_0 	  ,
		input [`DATA_WIDTH-1:0]mem_IN_1 	  ,
		input [`DATA_WIDTH-1:0]mem_IN_2 	  ,
		input [`DATA_WIDTH-1:0]mem_IN_3 	  ,
		input [`DATA_WIDTH-1:0]mem_IN_4 	  ,
		input [`DATA_WIDTH-1:0]mem_IN_5 	  ,
		input [`DATA_WIDTH-1:0]mem_IN_6 	  ,
		input [`DATA_WIDTH-1:0]mem_IN_7 	  ,
	
		
		output logic[`DATA_WIDTH-1:0]mem_OUT_0	  ,
		output logic[`DATA_WIDTH-1:0]mem_OUT_1	  ,
		output logic[`DATA_WIDTH-1:0]mem_OUT_2	  ,
		output logic[`DATA_WIDTH-1:0]mem_OUT_3	  ,
		output logic[`DATA_WIDTH-1:0]mem_OUT_4	  ,
		output logic[`DATA_WIDTH-1:0]mem_OUT_5	  ,
		output logic[`DATA_WIDTH-1:0]mem_OUT_6	  ,		
		output logic[`DATA_WIDTH-1:0]mem_OUT_7	  ,


		input [1:0]sel_group_d0,    //0: mem0, 1: mem1, otherwises: do nothing
		input write_d0,
		input [`BANK_WIDTH-1:0]bank_d0    		,		
		input [`ADDR_WIDTH-1:0]addr_d0  	    ,	
		input [`DATA_WIDTH-1:0]mem_IN_d0 	    ,	
		output logic[`DATA_WIDTH-1:0]mem_OUT_d0	, 		
		input [1:0]sel_group_sum				,	
		input write_sum							,		
		input [`BANK_WIDTH-1:0]bank_sum    		,
		input [`ADDR_WIDTH-1:0]addr_sum    		,		
		input [`DATA_WIDTH-1:0]mem_IN_sum 	    ,
		output logic[`DATA_WIDTH-1:0]mem_OUT_sum	   		
	);  
	
	parameter bank_num = 'd61;
	
	logic write_G0 ; 
	logic write_d0_G0 ; 	
	
	logic [`BANK_WIDTH-1:0]bank0_G0  ; 
	logic [`BANK_WIDTH-1:0]bank1_G0  ; 
	logic [`BANK_WIDTH-1:0]bank2_G0  ; 
	logic [`BANK_WIDTH-1:0]bank3_G0  ; 
	logic [`BANK_WIDTH-1:0]bank4_G0  ; 
	logic [`BANK_WIDTH-1:0]bank5_G0  ; 
	logic [`BANK_WIDTH-1:0]bank6_G0  ; 
	logic [`BANK_WIDTH-1:0]bank7_G0  ; 
	logic [`BANK_WIDTH-1:0]bank_d0_G0  ; 	
		   
	logic [`ADDR_WIDTH-1:0]addr0_G0   ;
	logic [`ADDR_WIDTH-1:0]addr1_G0   ;
	logic [`ADDR_WIDTH-1:0]addr2_G0   ;
	logic [`ADDR_WIDTH-1:0]addr3_G0   ;
	logic [`ADDR_WIDTH-1:0]addr4_G0   ;
	logic [`ADDR_WIDTH-1:0]addr5_G0   ;
	logic [`ADDR_WIDTH-1:0]addr6_G0   ;
	logic [`ADDR_WIDTH-1:0]addr7_G0   ;
	logic [`ADDR_WIDTH-1:0]addr_d0_G0   ;	
	 
	logic [`DATA_WIDTH-1:0]mem_IN_0_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_1_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_2_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_3_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_4_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_5_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_6_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_7_G0 ;
	logic [`DATA_WIDTH-1:0]mem_IN_d0_G0 ;
	
	logic [`DATA_WIDTH-1:0] mem_OUT_0_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_1_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_2_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_3_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_4_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_5_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_6_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_7_G0 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_d0_G0 ;
	
	logic write_G1   ;
	logic write_d0_G1   ;	
	logic [`BANK_WIDTH-1:0]bank0_G1  ; 
	logic [`BANK_WIDTH-1:0]bank1_G1  ; 
	logic [`BANK_WIDTH-1:0]bank2_G1  ; 
	logic [`BANK_WIDTH-1:0]bank3_G1  ; 
	logic [`BANK_WIDTH-1:0]bank4_G1  ; 
	logic [`BANK_WIDTH-1:0]bank5_G1  ; 
	logic [`BANK_WIDTH-1:0]bank6_G1  ; 
	logic [`BANK_WIDTH-1:0]bank7_G1  ; 
	logic [`BANK_WIDTH-1:0]bank_d0_G1  ;	
								  
	logic [`ADDR_WIDTH-1:0]addr0_G1   ;
	logic [`ADDR_WIDTH-1:0]addr1_G1   ;
	logic [`ADDR_WIDTH-1:0]addr2_G1   ;
	logic [`ADDR_WIDTH-1:0]addr3_G1   ;
	logic [`ADDR_WIDTH-1:0]addr4_G1   ;
	logic [`ADDR_WIDTH-1:0]addr5_G1   ;
	logic [`ADDR_WIDTH-1:0]addr6_G1   ;
	logic [`ADDR_WIDTH-1:0]addr7_G1   ;
	logic [`ADDR_WIDTH-1:0]addr_d0_G1   ;	
	 
	logic [`DATA_WIDTH-1:0]mem_IN_0_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_1_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_2_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_3_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_4_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_5_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_6_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_7_G1 ;
	logic [`DATA_WIDTH-1:0]mem_IN_d0_G1 ;	

	logic [`DATA_WIDTH-1:0] mem_OUT_0_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_1_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_2_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_3_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_4_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_5_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_6_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_7_G1 ;
	logic [`DATA_WIDTH-1:0] mem_OUT_d0_G1 ;

	always@(*) begin
		if(sel_group_d0 == 'd0) begin
			write_d0_G0 = write_d0;
			bank_d0_G0  = bank_d0;
			addr_d0_G0  = addr_d0;
			mem_IN_d0_G0 = mem_IN_d0;
		end
		else if (sel_group_sum == 'd0) begin
			write_d0_G0 = write_sum;
			bank_d0_G0  = bank_sum;
			addr_d0_G0  = addr_sum;
			mem_IN_d0_G0 = mem_IN_sum;			
		end
		else begin
			write_d0_G0 = 'd1;
			bank_d0_G0  = 'd63;
			addr_d0_G0  = 'd2047;
			mem_IN_d0_G0 = 'd0;				
		end
	end

	always@(*) begin
		if(sel_group_d0 == 'd1) begin
			write_d0_G1 = write_d0;
			bank_d0_G1  = bank_d0;
			addr_d0_G1  = addr_d0;
			mem_IN_d0_G1 = mem_IN_d0;
		end
		else if (sel_group_sum == 'd1) begin
			write_d0_G1 = write_sum;
			bank_d0_G1  = bank_sum;
			addr_d0_G1  = addr_sum;
			mem_IN_d0_G1 = mem_IN_sum;			
		end
		else begin
			write_d0_G1 = 'd1;
			bank_d0_G1  = 'd63;
			addr_d0_G1  = 'd2047;
			mem_IN_d0_G1 = 'd0;				
		end
	end

	always@(*) begin  //input G0 demux
		if(sel_write_group == 'd0) begin
			write_G0    =      'd0 ;       //write enable
			bank0_G0    =      bank0_write ;
			bank1_G0    =      bank1_write ;
			bank2_G0    =      bank2_write ;
			bank3_G0    =      bank3_write ;
			bank4_G0    =      bank4_write ;
			bank5_G0    =      bank5_write ;
			bank6_G0    =      bank6_write ;
			bank7_G0    =      bank7_write ;	
					    
			addr0_G0    =      addr0_write ;
			addr1_G0    =      addr1_write ;
			addr2_G0    =      addr2_write ;
			addr3_G0    =      addr3_write ;
			addr4_G0    =      addr4_write ;
			addr5_G0    =      addr5_write ;
			addr6_G0    =      addr6_write ;
			addr7_G0    =      addr7_write ;
			
			mem_IN_0_G0 =   mem_IN_0 ;
			mem_IN_1_G0 =   mem_IN_1 ;
			mem_IN_2_G0 =   mem_IN_2 ;
			mem_IN_3_G0 =   mem_IN_3 ;
			mem_IN_4_G0 =   mem_IN_4 ;
			mem_IN_5_G0 =   mem_IN_5 ;
			mem_IN_6_G0 =   mem_IN_6 ;
			mem_IN_7_G0 =   mem_IN_7 ;			
		end
		else if (sel_read_group == 'd0) begin
			write_G0 =       'd1 ; //write disable : read
			bank0_G0 =       bank0_read ; 
			bank1_G0 =       bank1_read ;
			bank2_G0 =       bank2_read ;
			bank3_G0 =       bank3_read ;
			bank4_G0 =       bank4_read ;
			bank5_G0 =       bank5_read ;
			bank6_G0 =       bank6_read ;
			bank7_G0 =       bank7_read ;
			
			addr0_G0 =       addr0_read ;
			addr1_G0 =       addr1_read ;
			addr2_G0 =       addr2_read ;
			addr3_G0 =       addr3_read ;
			addr4_G0 =       addr4_read ;
			addr5_G0 =       addr5_read ;
			addr6_G0 =       addr6_read ;
			addr7_G0 =       addr7_read ;
			
			mem_IN_0_G0 =    'd0 ;
			mem_IN_1_G0 =    'd0 ;
			mem_IN_2_G0 =    'd0 ;
			mem_IN_3_G0 =    'd0 ;
			mem_IN_4_G0 =    'd0 ;
			mem_IN_5_G0 =    'd0 ;
			mem_IN_6_G0 =    'd0 ;	
			mem_IN_7_G0 =    'd0 ;				
		end	
		else begin
			write_G0 =       'd1 ;
			bank0_G0 =       'd63 ;  // close 
			bank1_G0 =       'd63 ;
			bank2_G0 =       'd63 ;
			bank3_G0 =       'd63 ;
			bank4_G0 =       'd63 ;
			bank5_G0 =       'd63 ;
			bank6_G0 =       'd63 ;
			bank7_G0 =       'd63 ;
			
			addr0_G0 =       'd2047 ;
			addr1_G0 =       'd2047 ;
			addr2_G0 =       'd2047 ;
			addr3_G0 =       'd2047 ;
			addr4_G0 =       'd2047 ;
			addr5_G0 =       'd2047 ;
			addr6_G0 =       'd2047 ;
			addr7_G0 =       'd2047 ;			
			
			mem_IN_0_G0 =    'd0 ;
			mem_IN_1_G0 =    'd0 ;
			mem_IN_2_G0 =    'd0 ;
			mem_IN_3_G0 =    'd0 ;
			mem_IN_4_G0 =    'd0 ;
			mem_IN_5_G0 =    'd0 ;
			mem_IN_6_G0 =    'd0 ;	
			mem_IN_7_G0 =    'd0 ;			
		end			
	end

	always@(*) begin  //input G1 demux
		if(sel_write_group == 'd1) begin
			write_G1 =      'd0 ;       //write enable
			bank0_G1 =      bank0_write ;
			bank1_G1 =      bank1_write ;
			bank2_G1 =      bank2_write ;
			bank3_G1 =      bank3_write ;
			bank4_G1 =      bank4_write ;
			bank5_G1 =      bank5_write ;
			bank6_G1 =      bank6_write ;
			bank7_G1 =      bank7_write ;			
			
			addr0_G1 =      addr0_write ;
			addr1_G1 =      addr1_write ;
			addr2_G1 =      addr2_write ;
			addr3_G1 =      addr3_write ;
			addr4_G1 =      addr4_write ;
			addr5_G1 =      addr5_write ;
			addr6_G1 =      addr6_write ;
			addr7_G1 =      addr7_write ;			
			
			mem_IN_0_G1 =   mem_IN_0 ;
			mem_IN_1_G1 =   mem_IN_1 ;
			mem_IN_2_G1 =   mem_IN_2 ;
			mem_IN_3_G1 =   mem_IN_3 ;
			mem_IN_4_G1 =   mem_IN_4 ;
			mem_IN_5_G1 =   mem_IN_5 ;
			mem_IN_6_G1 =   mem_IN_6 ;
			mem_IN_7_G1 =   mem_IN_7 ;			
		end
		else if (sel_read_group == 'd1) begin
			write_G1 =       'd1 ; //write disable : read
			bank0_G1 =       bank0_read ; 
			bank1_G1 =       bank1_read ;
			bank2_G1 =       bank2_read ;
			bank3_G1 =       bank3_read ;
			bank4_G1 =       bank4_read ;
			bank5_G1 =       bank5_read ;
			bank6_G1 =       bank6_read ;
			bank7_G1 =       bank7_read ;			
			
			addr0_G1 =       addr0_read ;
			addr1_G1 =       addr1_read ;
			addr2_G1 =       addr2_read ;
			addr3_G1 =       addr3_read ;
			addr4_G1 =       addr4_read ;
			addr5_G1 =       addr5_read ;
			addr6_G1 =       addr6_read ;
			addr7_G1 =       addr7_read ;			
			
			mem_IN_0_G1 =    'd0 ;
			mem_IN_1_G1 =    'd0 ;
			mem_IN_2_G1 =    'd0 ;
			mem_IN_3_G1 =    'd0 ;
			mem_IN_4_G1 =    'd0 ;
			mem_IN_5_G1 =    'd0 ;
			mem_IN_6_G1 =    'd0 ;	
			mem_IN_7_G1 =    'd0 ;				
		end	
		else begin
			write_G1 =       'd1 ;
			bank0_G1 =       'd63 ;  // close 
			bank1_G1 =       'd63 ;
			bank2_G1 =       'd63 ;
			bank3_G1 =       'd63 ;
			bank4_G1 =       'd63 ;
			bank5_G1 =       'd63 ;
			bank6_G1 =       'd63 ;
			bank7_G1 =       'd63 ;			
			
			addr0_G1 =       'd2047 ;
			addr1_G1 =       'd2047 ;
			addr2_G1 =       'd2047 ;
			addr3_G1 =       'd2047 ;
			addr4_G1 =       'd2047 ;
			addr5_G1 =       'd2047 ;
			addr6_G1 =       'd2047 ;
			addr7_G1 =       'd2047 ;
			
			mem_IN_0_G1 =    'd0 ;
			mem_IN_1_G1 =    'd0 ;
			mem_IN_2_G1 =    'd0 ;
			mem_IN_3_G1 =    'd0 ;
			mem_IN_4_G1 =    'd0 ;
			mem_IN_5_G1 =    'd0 ;
			mem_IN_6_G1 =    'd0 ;		
			mem_IN_7_G1 =    'd0 ;				
		end			
	end


	always@(*) begin //output mux 
		if(sel_group_d0 == 'd0) begin
			mem_OUT_d0 = mem_OUT_d0_G0;
		end
		else if (sel_group_d0 == 'd1) begin
			mem_OUT_d0 = mem_OUT_d0_G1;
		end
		else begin
			mem_OUT_d0 = 'd0  ;
		end
	end
	
	always@(*) begin //output mux 
		if(sel_group_sum == 'd0) begin
			mem_OUT_sum = mem_OUT_d0_G0;
		end
		else if (sel_group_sum == 'd1) begin
			mem_OUT_sum = mem_OUT_d0_G1;
		end
		else begin
			mem_OUT_sum = 'd0  ;
		end
	end	

	always@(*) begin  //output mux  
		if(sel_read_group == 1'b0) begin // sel need to delay maybe
			mem_OUT_0 =	mem_OUT_0_G0  ;
			mem_OUT_1 = mem_OUT_1_G0  ;
			mem_OUT_2 = mem_OUT_2_G0  ;
			mem_OUT_3 = mem_OUT_3_G0  ;
			mem_OUT_4 = mem_OUT_4_G0  ;
			mem_OUT_5 = mem_OUT_5_G0  ;
			mem_OUT_6 =	mem_OUT_6_G0  ;
			mem_OUT_7 =	mem_OUT_7_G0  ;			
		end
		else if(sel_read_group == 1'b1) begin
			mem_OUT_0 =	mem_OUT_0_G1  ;
			mem_OUT_1 = mem_OUT_1_G1  ;
			mem_OUT_2 = mem_OUT_2_G1  ;
			mem_OUT_3 = mem_OUT_3_G1  ;
			mem_OUT_4 = mem_OUT_4_G1  ;
			mem_OUT_5 = mem_OUT_5_G1  ;
			mem_OUT_6 =	mem_OUT_6_G1  ;		
			mem_OUT_7 =	mem_OUT_7_G1  ;				
		end			
		else begin
			mem_OUT_0 = 'd0  ;
			mem_OUT_1 = 'd0  ;
			mem_OUT_2 = 'd0  ;
			mem_OUT_3 = 'd0  ;
			mem_OUT_4 = 'd0  ;
			mem_OUT_5 = 'd0  ;
			mem_OUT_6 = 'd0  ;
			mem_OUT_7 = 'd0  ;			
		end
	end	




	mem_wrapper GROUP_0(    
		.clk	  (clk),
		.rst_n	  (rst_n),
		.write    (write_G0),
		.write_d0 (write_d0_G0),		
		.bank0    (bank0_G0),
		.bank1    (bank1_G0),
		.bank2    (bank2_G0),
		.bank3    (bank3_G0),
		.bank4    (bank4_G0),
		.bank5    (bank5_G0),
		.bank6    (bank6_G0),
		.bank7    (bank7_G0),
		.bank_d0  (bank_d0_G0),		
		.addr0    (addr0_G0),
		.addr1    (addr1_G0),
		.addr2    (addr2_G0),
		.addr3    (addr3_G0),
		.addr4    (addr4_G0),
		.addr5    (addr5_G0),
		.addr6    (addr6_G0),
		.addr7    (addr7_G0),
		.addr_d0  (addr_d0_G0),		
		.mem_IN_0 (mem_IN_0_G0 ),
		.mem_IN_1 (mem_IN_1_G0 ),
		.mem_IN_2 (mem_IN_2_G0 ),
		.mem_IN_3 (mem_IN_3_G0 ),
		.mem_IN_4 (mem_IN_4_G0 ),
		.mem_IN_5 (mem_IN_5_G0 ),
		.mem_IN_6 (mem_IN_6_G0 ),
		.mem_IN_7 (mem_IN_7_G0 ),
		.mem_IN_d0(mem_IN_d0_G0 ),		
		.mem_OUT_0(mem_OUT_0_G0 ),
		.mem_OUT_1(mem_OUT_1_G0 ),
		.mem_OUT_2(mem_OUT_2_G0 ),
		.mem_OUT_3(mem_OUT_3_G0 ),
		.mem_OUT_4(mem_OUT_4_G0 ),
		.mem_OUT_5(mem_OUT_5_G0 ),
		.mem_OUT_6(mem_OUT_6_G0 ),		
		.mem_OUT_7(mem_OUT_7_G0 ),
		.mem_OUT_d0(mem_OUT_d0_G0 )		
	);
	
	mem_wrapper GROUP_1(    
		.clk	  (clk),
		.rst_n	  (rst_n),
		.write    (write_G1),
		.write_d0 (write_d0_G1),		
		.bank0    (bank0_G1),
		.bank1    (bank1_G1),
		.bank2    (bank2_G1),
		.bank3    (bank3_G1),
		.bank4    (bank4_G1),
		.bank5    (bank5_G1),
		.bank6    (bank6_G1),
		.bank7    (bank7_G1),
		.bank_d0  (bank_d0_G1),		
		.addr0    (addr0_G1),
		.addr1    (addr1_G1),
		.addr2    (addr2_G1),
		.addr3    (addr3_G1),
		.addr4    (addr4_G1),
		.addr5    (addr5_G1),
		.addr6    (addr6_G1),
		.addr7    (addr7_G1),
		.addr_d0   (addr_d0_G1),		
		.mem_IN_0 (mem_IN_0_G1 ),
		.mem_IN_1 (mem_IN_1_G1 ),
		.mem_IN_2 (mem_IN_2_G1 ),
		.mem_IN_3 (mem_IN_3_G1 ),
		.mem_IN_4 (mem_IN_4_G1 ),
		.mem_IN_5 (mem_IN_5_G1 ),
		.mem_IN_6 (mem_IN_6_G1 ),
		.mem_IN_7 (mem_IN_7_G1 ),
		.mem_IN_d0(mem_IN_d0_G1 ),		
		.mem_OUT_0(mem_OUT_0_G1 ),
		.mem_OUT_1(mem_OUT_1_G1 ),
		.mem_OUT_2(mem_OUT_2_G1 ),
		.mem_OUT_3(mem_OUT_3_G1 ),
		.mem_OUT_4(mem_OUT_4_G1 ),
		.mem_OUT_5(mem_OUT_5_G1 ),
		.mem_OUT_6(mem_OUT_6_G1 ),		
		.mem_OUT_7(mem_OUT_7_G1 ),
		.mem_OUT_d0(mem_OUT_d0_G1 )				
	);

 endmodule