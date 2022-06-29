 `include "define.sv"
 `include "Mux_64_1.sv" 
 `include "Mux_8_1.sv"  
 `include "Mux_2_1.sv"   
 //`include "../mem/SRAM_SP_2048_rtl.v"
 //`include "SRAM_SP_2048.v"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:mem_wrapper           mem_wrapper                                                                                                                                 
 //==============================================                                                

        

	module mem_wrapper(    
		clk,
		rst_n,
		write    ,
		write_d0 ,
		bank0    ,
		bank1    ,
		bank2    ,
		bank3    ,
		bank4    ,
		bank5    ,
		bank6    ,
		bank7    ,	
		bank_d0  ,
		addr0    ,
		addr1    ,
		addr2    ,
		addr3    ,
		addr4    ,
		addr5    ,
		addr6    ,
		addr7    ,	
		addr_d0  ,
		mem_IN_0 ,
		mem_IN_1 ,
		mem_IN_2 ,
		mem_IN_3 ,
		mem_IN_4 ,
		mem_IN_5 ,
		mem_IN_6 ,
		mem_IN_7 ,	
		mem_IN_d0,
		mem_OUT_0,
		mem_OUT_1,
		mem_OUT_2,
		mem_OUT_3,
		mem_OUT_4,
		mem_OUT_5,
		mem_OUT_6,
		mem_OUT_7,
		mem_OUT_d0
	);  
	
	parameter bank_num = 'd61;
	
	
 	input clk;
	input rst_n;
	input write;
	input write_d0;	
	input [`BANK_WIDTH-1:0] bank0; //first data we want to access
	input [`BANK_WIDTH-1:0] bank1; 
	input [`BANK_WIDTH-1:0] bank2; 
	input [`BANK_WIDTH-1:0] bank3; 
	input [`BANK_WIDTH-1:0] bank4; 
	input [`BANK_WIDTH-1:0] bank5; 
	input [`BANK_WIDTH-1:0] bank6; 
	input [`BANK_WIDTH-1:0] bank7; 
	input [`BANK_WIDTH-1:0] bank_d0;	
	input [`ADDR_WIDTH-1:0] addr0; //first address we want to access
	input [`ADDR_WIDTH-1:0] addr1; 
	input [`ADDR_WIDTH-1:0] addr2; 
	input [`ADDR_WIDTH-1:0] addr3; 
	input [`ADDR_WIDTH-1:0] addr4; 
	input [`ADDR_WIDTH-1:0] addr5; 
	input [`ADDR_WIDTH-1:0] addr6; 
	input [`ADDR_WIDTH-1:0] addr7; 	
	input [`ADDR_WIDTH-1:0] addr_d0;
	input [`DATA_WIDTH-1:0] mem_IN_0;
	input [`DATA_WIDTH-1:0] mem_IN_1;
	input [`DATA_WIDTH-1:0] mem_IN_2;
	input [`DATA_WIDTH-1:0] mem_IN_3;
	input [`DATA_WIDTH-1:0] mem_IN_4;
	input [`DATA_WIDTH-1:0] mem_IN_5; 
	input [`DATA_WIDTH-1:0] mem_IN_6;
	input [`DATA_WIDTH-1:0] mem_IN_7;	
	input [`DATA_WIDTH-1:0] mem_IN_d0;
	output logic[`DATA_WIDTH-1:0] mem_OUT_0; 
	output logic[`DATA_WIDTH-1:0] mem_OUT_1; 
	output logic[`DATA_WIDTH-1:0] mem_OUT_2; 
	output logic[`DATA_WIDTH-1:0] mem_OUT_3; 
	output logic[`DATA_WIDTH-1:0] mem_OUT_4; 
	output logic[`DATA_WIDTH-1:0] mem_OUT_5; 
	output logic[`DATA_WIDTH-1:0] mem_OUT_6; 
	output logic[`DATA_WIDTH-1:0] mem_OUT_7;	
	output logic[`DATA_WIDTH-1:0] mem_OUT_d0;








	logic CEN_Out_delay[0:bank_num-1];
	logic CEN_Out[0:bank_num-1];  //chip enable active low 
	logic [`ADDR_WIDTH-1:0]A_Out[0:bank_num-1];	
	logic [`DATA_WIDTH-1:0]D_Out[0:bank_num-1];	
	logic [`ADDR_WIDTH-1:0]mux_2_A_Out[0:bank_num-1];	
	logic [`DATA_WIDTH-1:0]mux_2_D_Out[0:bank_num-1];		
	logic mux_2_write_out[0:bank_num-1];
	logic mux_2_CEN_out[0:bank_num-1];
	
	logic [`DATA_WIDTH-1:0]Q_Out[0:bank_num-1];
	logic [`DATA_WIDTH-1:0]mem_OUT[0:7];
	
	logic[3:0] sel_in [0:bank_num-1];
	logic[`BANK_WIDTH-1:0] sel_out [0:7];
	logic[`DATA_WIDTH-1:0] mem_OUT_d0_tmp;


	logic [`DATA_WIDTH-1:0]zero_data_width;
	
	logic sel_in_d0 [0:bank_num-1];
	
	assign zero_data_width = 'd0;
	
// generate sel_in[0-61]	
always@(*) begin
	if			(bank0 == 'd0) sel_in[0] = 'd0;
	else if		(bank1 == 'd0) sel_in[0] = 'd1;
	else if		(bank2 == 'd0) sel_in[0] = 'd2;
	else if		(bank3 == 'd0) sel_in[0] = 'd3;
	else if		(bank4 == 'd0) sel_in[0] = 'd4;
	else if		(bank5 == 'd0) sel_in[0] = 'd5;
	else if		(bank6 == 'd0) sel_in[0] = 'd6;
	else if		(bank7 == 'd0) sel_in[0] = 'd7;
	else 					   sel_in[0] = 'd8; // 8 is turn off
end
always@(*) begin
	if			(bank0 == 'd1) sel_in[1] = 'd0;
	else if		(bank1 == 'd1) sel_in[1] = 'd1;
	else if		(bank2 == 'd1) sel_in[1] = 'd2;
	else if		(bank3 == 'd1) sel_in[1] = 'd3;
	else if		(bank4 == 'd1) sel_in[1] = 'd4;
	else if		(bank5 == 'd1) sel_in[1] = 'd5;
	else if		(bank6 == 'd1) sel_in[1] = 'd6;
	else if		(bank7 == 'd1) sel_in[1] = 'd7;
	else 					   sel_in[1] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd2) sel_in[2] = 'd0;
	else if		(bank1 == 'd2) sel_in[2] = 'd1;
	else if		(bank2 == 'd2) sel_in[2] = 'd2;
	else if		(bank3 == 'd2) sel_in[2] = 'd3;
	else if		(bank4 == 'd2) sel_in[2] = 'd4;
	else if		(bank5 == 'd2) sel_in[2] = 'd5;
	else if		(bank6 == 'd2) sel_in[2] = 'd6;
	else if		(bank7 == 'd2) sel_in[2] = 'd7;
	else 					   sel_in[2] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd3) sel_in[3] = 'd0;
	else if		(bank1 == 'd3) sel_in[3] = 'd1;
	else if		(bank2 == 'd3) sel_in[3] = 'd2;
	else if		(bank3 == 'd3) sel_in[3] = 'd3;
	else if		(bank4 == 'd3) sel_in[3] = 'd4;
	else if		(bank5 == 'd3) sel_in[3] = 'd5;
	else if		(bank6 == 'd3) sel_in[3] = 'd6;
	else if		(bank7 == 'd3) sel_in[3] = 'd7;
	else 					   sel_in[3] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd4) sel_in[4] = 'd0;
	else if		(bank1 == 'd4) sel_in[4] = 'd1;
	else if		(bank2 == 'd4) sel_in[4] = 'd2;
	else if		(bank3 == 'd4) sel_in[4] = 'd3;
	else if		(bank4 == 'd4) sel_in[4] = 'd4;
	else if		(bank5 == 'd4) sel_in[4] = 'd5;
	else if		(bank6 == 'd4) sel_in[4] = 'd6;
	else if		(bank7 == 'd4) sel_in[4] = 'd7;
	else 					   sel_in[4] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd5) sel_in[5] = 'd0;
	else if		(bank1 == 'd5) sel_in[5] = 'd1;
	else if		(bank2 == 'd5) sel_in[5] = 'd2;
	else if		(bank3 == 'd5) sel_in[5] = 'd3;
	else if		(bank4 == 'd5) sel_in[5] = 'd4;
	else if		(bank5 == 'd5) sel_in[5] = 'd5;
	else if		(bank6 == 'd5) sel_in[5] = 'd6;
	else if		(bank7 == 'd5) sel_in[5] = 'd7;
	else 					   sel_in[5] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd6) sel_in[6] = 'd0;
	else if		(bank1 == 'd6) sel_in[6] = 'd1;
	else if		(bank2 == 'd6) sel_in[6] = 'd2;
	else if		(bank3 == 'd6) sel_in[6] = 'd3;
	else if		(bank4 == 'd6) sel_in[6] = 'd4;
	else if		(bank5 == 'd6) sel_in[6] = 'd5;
	else if		(bank6 == 'd6) sel_in[6] = 'd6;
	else if		(bank7 == 'd6) sel_in[6] = 'd7;
	else 					   sel_in[6] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd7) sel_in[7] = 'd0;
	else if		(bank1 == 'd7) sel_in[7] = 'd1;
	else if		(bank2 == 'd7) sel_in[7] = 'd2;
	else if		(bank3 == 'd7) sel_in[7] = 'd3;
	else if		(bank4 == 'd7) sel_in[7] = 'd4;
	else if		(bank5 == 'd7) sel_in[7] = 'd5;
	else if		(bank6 == 'd7) sel_in[7] = 'd6;
	else if		(bank7 == 'd7) sel_in[7] = 'd7;
	else 					   sel_in[7] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd8) sel_in[8] = 'd0;
	else if		(bank1 == 'd8) sel_in[8] = 'd1;
	else if		(bank2 == 'd8) sel_in[8] = 'd2;
	else if		(bank3 == 'd8) sel_in[8] = 'd3;
	else if		(bank4 == 'd8) sel_in[8] = 'd4;
	else if		(bank5 == 'd8) sel_in[8] = 'd5;
	else if		(bank6 == 'd8) sel_in[8] = 'd6;
	else if		(bank7 == 'd8) sel_in[8] = 'd7;
	else 					   sel_in[8] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd9) sel_in[9] = 'd0;
	else if		(bank1 == 'd9) sel_in[9] = 'd1;
	else if		(bank2 == 'd9) sel_in[9] = 'd2;
	else if		(bank3 == 'd9) sel_in[9] = 'd3;
	else if		(bank4 == 'd9) sel_in[9] = 'd4;
	else if		(bank5 == 'd9) sel_in[9] = 'd5;
	else if		(bank6 == 'd9) sel_in[9] = 'd6;
	else if		(bank7 == 'd9) sel_in[9] = 'd7;
	else 					   sel_in[9] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd10) sel_in[10] = 'd0;
	else if		(bank1 == 'd10) sel_in[10] = 'd1;
	else if		(bank2 == 'd10) sel_in[10] = 'd2;
	else if		(bank3 == 'd10) sel_in[10] = 'd3;
	else if		(bank4 == 'd10) sel_in[10] = 'd4;
	else if		(bank5 == 'd10) sel_in[10] = 'd5;
	else if		(bank6 == 'd10) sel_in[10] = 'd6;
	else if		(bank7 == 'd10) sel_in[10] = 'd7;
	else 					   sel_in[10] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd11) sel_in[11] = 'd0;
	else if		(bank1 == 'd11) sel_in[11] = 'd1;
	else if		(bank2 == 'd11) sel_in[11] = 'd2;
	else if		(bank3 == 'd11) sel_in[11] = 'd3;
	else if		(bank4 == 'd11) sel_in[11] = 'd4;
	else if		(bank5 == 'd11) sel_in[11] = 'd5;
	else if		(bank6 == 'd11) sel_in[11] = 'd6;
	else if		(bank7 == 'd11) sel_in[11] = 'd7;
	else 					   sel_in[11] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd12) sel_in[12] = 'd0;
	else if		(bank1 == 'd12) sel_in[12] = 'd1;
	else if		(bank2 == 'd12) sel_in[12] = 'd2;
	else if		(bank3 == 'd12) sel_in[12] = 'd3;
	else if		(bank4 == 'd12) sel_in[12] = 'd4;
	else if		(bank5 == 'd12) sel_in[12] = 'd5;
	else if		(bank6 == 'd12) sel_in[12] = 'd6;
	else if		(bank7 == 'd12) sel_in[12] = 'd7;
	else 					   sel_in[12] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd13) sel_in[13] = 'd0;
	else if		(bank1 == 'd13) sel_in[13] = 'd1;
	else if		(bank2 == 'd13) sel_in[13] = 'd2;
	else if		(bank3 == 'd13) sel_in[13] = 'd3;
	else if		(bank4 == 'd13) sel_in[13] = 'd4;
	else if		(bank5 == 'd13) sel_in[13] = 'd5;
	else if		(bank6 == 'd13) sel_in[13] = 'd6;
	else if		(bank7 == 'd13) sel_in[13] = 'd7;
	else 					   sel_in[13] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd14) sel_in[14] = 'd0;
	else if		(bank1 == 'd14) sel_in[14] = 'd1;
	else if		(bank2 == 'd14) sel_in[14] = 'd2;
	else if		(bank3 == 'd14) sel_in[14] = 'd3;
	else if		(bank4 == 'd14) sel_in[14] = 'd4;
	else if		(bank5 == 'd14) sel_in[14] = 'd5;
	else if		(bank6 == 'd14) sel_in[14] = 'd6;
	else if		(bank7 == 'd14) sel_in[14] = 'd7;
	else 					   sel_in[14] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd15) sel_in[15] = 'd0;
	else if		(bank1 == 'd15) sel_in[15] = 'd1;
	else if		(bank2 == 'd15) sel_in[15] = 'd2;
	else if		(bank3 == 'd15) sel_in[15] = 'd3;
	else if		(bank4 == 'd15) sel_in[15] = 'd4;
	else if		(bank5 == 'd15) sel_in[15] = 'd5;
	else if		(bank6 == 'd15) sel_in[15] = 'd6;
	else if		(bank7 == 'd15) sel_in[15] = 'd7;
	else 					   sel_in[15] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd16) sel_in[16] = 'd0;
	else if		(bank1 == 'd16) sel_in[16] = 'd1;
	else if		(bank2 == 'd16) sel_in[16] = 'd2;
	else if		(bank3 == 'd16) sel_in[16] = 'd3;
	else if		(bank4 == 'd16) sel_in[16] = 'd4;
	else if		(bank5 == 'd16) sel_in[16] = 'd5;
	else if		(bank6 == 'd16) sel_in[16] = 'd6;
	else if		(bank7 == 'd16) sel_in[16] = 'd7;
	else 					   sel_in[16] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd17) sel_in[17] = 'd0;
	else if		(bank1 == 'd17) sel_in[17] = 'd1;
	else if		(bank2 == 'd17) sel_in[17] = 'd2;
	else if		(bank3 == 'd17) sel_in[17] = 'd3;
	else if		(bank4 == 'd17) sel_in[17] = 'd4;
	else if		(bank5 == 'd17) sel_in[17] = 'd5;
	else if		(bank6 == 'd17) sel_in[17] = 'd6;
	else if		(bank7 == 'd17) sel_in[17] = 'd7;
	else 					   sel_in[17] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd18) sel_in[18] = 'd0;
	else if		(bank1 == 'd18) sel_in[18] = 'd1;
	else if		(bank2 == 'd18) sel_in[18] = 'd2;
	else if		(bank3 == 'd18) sel_in[18] = 'd3;
	else if		(bank4 == 'd18) sel_in[18] = 'd4;
	else if		(bank5 == 'd18) sel_in[18] = 'd5;
	else if		(bank6 == 'd18) sel_in[18] = 'd6;
	else if		(bank7 == 'd18) sel_in[18] = 'd7;
	else 					   sel_in[18] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd19) sel_in[19] = 'd0;
	else if		(bank1 == 'd19) sel_in[19] = 'd1;
	else if		(bank2 == 'd19) sel_in[19] = 'd2;
	else if		(bank3 == 'd19) sel_in[19] = 'd3;
	else if		(bank4 == 'd19) sel_in[19] = 'd4;
	else if		(bank5 == 'd19) sel_in[19] = 'd5;
	else if		(bank6 == 'd19) sel_in[19] = 'd6;
	else if		(bank7 == 'd19) sel_in[19] = 'd7;
	else 					   sel_in[19] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd20) sel_in[20] = 'd0;
	else if		(bank1 == 'd20) sel_in[20] = 'd1;
	else if		(bank2 == 'd20) sel_in[20] = 'd2;
	else if		(bank3 == 'd20) sel_in[20] = 'd3;
	else if		(bank4 == 'd20) sel_in[20] = 'd4;
	else if		(bank5 == 'd20) sel_in[20] = 'd5;
	else if		(bank6 == 'd20) sel_in[20] = 'd6;
	else if		(bank7 == 'd20) sel_in[20] = 'd7;
	else 					   sel_in[20] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd21) sel_in[21] = 'd0;
	else if		(bank1 == 'd21) sel_in[21] = 'd1;
	else if		(bank2 == 'd21) sel_in[21] = 'd2;
	else if		(bank3 == 'd21) sel_in[21] = 'd3;
	else if		(bank4 == 'd21) sel_in[21] = 'd4;
	else if		(bank5 == 'd21) sel_in[21] = 'd5;
	else if		(bank6 == 'd21) sel_in[21] = 'd6;
	else if		(bank7 == 'd21) sel_in[21] = 'd7;
	else 					   sel_in[21] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd22) sel_in[22] = 'd0;
	else if		(bank1 == 'd22) sel_in[22] = 'd1;
	else if		(bank2 == 'd22) sel_in[22] = 'd2;
	else if		(bank3 == 'd22) sel_in[22] = 'd3;
	else if		(bank4 == 'd22) sel_in[22] = 'd4;
	else if		(bank5 == 'd22) sel_in[22] = 'd5;
	else if		(bank6 == 'd22) sel_in[22] = 'd6;
	else if		(bank7 == 'd22) sel_in[22] = 'd7;
	else 					   sel_in[22] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd23) sel_in[23] = 'd0;
	else if		(bank1 == 'd23) sel_in[23] = 'd1;
	else if		(bank2 == 'd23) sel_in[23] = 'd2;
	else if		(bank3 == 'd23) sel_in[23] = 'd3;
	else if		(bank4 == 'd23) sel_in[23] = 'd4;
	else if		(bank5 == 'd23) sel_in[23] = 'd5;
	else if		(bank6 == 'd23) sel_in[23] = 'd6;
	else if		(bank7 == 'd23) sel_in[23] = 'd7;
	else 					   sel_in[23] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd24) sel_in[24] = 'd0;
	else if		(bank1 == 'd24) sel_in[24] = 'd1;
	else if		(bank2 == 'd24) sel_in[24] = 'd2;
	else if		(bank3 == 'd24) sel_in[24] = 'd3;
	else if		(bank4 == 'd24) sel_in[24] = 'd4;
	else if		(bank5 == 'd24) sel_in[24] = 'd5;
	else if		(bank6 == 'd24) sel_in[24] = 'd6;
	else if		(bank7 == 'd24) sel_in[24] = 'd7;
	else 					   sel_in[24] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd25) sel_in[25] = 'd0;
	else if		(bank1 == 'd25) sel_in[25] = 'd1;
	else if		(bank2 == 'd25) sel_in[25] = 'd2;
	else if		(bank3 == 'd25) sel_in[25] = 'd3;
	else if		(bank4 == 'd25) sel_in[25] = 'd4;
	else if		(bank5 == 'd25) sel_in[25] = 'd5;
	else if		(bank6 == 'd25) sel_in[25] = 'd6;
	else if		(bank7 == 'd25) sel_in[25] = 'd7;
	else 					   sel_in[25] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd26) sel_in[26] = 'd0;
	else if		(bank1 == 'd26) sel_in[26] = 'd1;
	else if		(bank2 == 'd26) sel_in[26] = 'd2;
	else if		(bank3 == 'd26) sel_in[26] = 'd3;
	else if		(bank4 == 'd26) sel_in[26] = 'd4;
	else if		(bank5 == 'd26) sel_in[26] = 'd5;
	else if		(bank6 == 'd26) sel_in[26] = 'd6;
	else if		(bank7 == 'd26) sel_in[26] = 'd7;
	else 					   sel_in[26] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd27) sel_in[27] = 'd0;
	else if		(bank1 == 'd27) sel_in[27] = 'd1;
	else if		(bank2 == 'd27) sel_in[27] = 'd2;
	else if		(bank3 == 'd27) sel_in[27] = 'd3;
	else if		(bank4 == 'd27) sel_in[27] = 'd4;
	else if		(bank5 == 'd27) sel_in[27] = 'd5;
	else if		(bank6 == 'd27) sel_in[27] = 'd6;
	else if		(bank7 == 'd27) sel_in[27] = 'd7;
	else 					   sel_in[27] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd28) sel_in[28] = 'd0;
	else if		(bank1 == 'd28) sel_in[28] = 'd1;
	else if		(bank2 == 'd28) sel_in[28] = 'd2;
	else if		(bank3 == 'd28) sel_in[28] = 'd3;
	else if		(bank4 == 'd28) sel_in[28] = 'd4;
	else if		(bank5 == 'd28) sel_in[28] = 'd5;
	else if		(bank6 == 'd28) sel_in[28] = 'd6;
	else if		(bank7 == 'd28) sel_in[28] = 'd7;
	else 					   sel_in[28] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd29) sel_in[29] = 'd0;
	else if		(bank1 == 'd29) sel_in[29] = 'd1;
	else if		(bank2 == 'd29) sel_in[29] = 'd2;
	else if		(bank3 == 'd29) sel_in[29] = 'd3;
	else if		(bank4 == 'd29) sel_in[29] = 'd4;
	else if		(bank5 == 'd29) sel_in[29] = 'd5;
	else if		(bank6 == 'd29) sel_in[29] = 'd6;
	else if		(bank7 == 'd29) sel_in[29] = 'd7;
	else 					   sel_in[29] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd30) sel_in[30] = 'd0;
	else if		(bank1 == 'd30) sel_in[30] = 'd1;
	else if		(bank2 == 'd30) sel_in[30] = 'd2;
	else if		(bank3 == 'd30) sel_in[30] = 'd3;
	else if		(bank4 == 'd30) sel_in[30] = 'd4;
	else if		(bank5 == 'd30) sel_in[30] = 'd5;
	else if		(bank6 == 'd30) sel_in[30] = 'd6;
	else if		(bank7 == 'd30) sel_in[30] = 'd7;
	else 					   sel_in[30] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd31) sel_in[31] = 'd0;
	else if		(bank1 == 'd31) sel_in[31] = 'd1;
	else if		(bank2 == 'd31) sel_in[31] = 'd2;
	else if		(bank3 == 'd31) sel_in[31] = 'd3;
	else if		(bank4 == 'd31) sel_in[31] = 'd4;
	else if		(bank5 == 'd31) sel_in[31] = 'd5;
	else if		(bank6 == 'd31) sel_in[31] = 'd6;
	else if		(bank7 == 'd31) sel_in[31] = 'd7;
	else 					   sel_in[31] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd32) sel_in[32] = 'd0;
	else if		(bank1 == 'd32) sel_in[32] = 'd1;
	else if		(bank2 == 'd32) sel_in[32] = 'd2;
	else if		(bank3 == 'd32) sel_in[32] = 'd3;
	else if		(bank4 == 'd32) sel_in[32] = 'd4;
	else if		(bank5 == 'd32) sel_in[32] = 'd5;
	else if		(bank6 == 'd32) sel_in[32] = 'd6;
	else if		(bank7 == 'd32) sel_in[32] = 'd7;
	else 					   sel_in[32] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd33) sel_in[33] = 'd0;
	else if		(bank1 == 'd33) sel_in[33] = 'd1;
	else if		(bank2 == 'd33) sel_in[33] = 'd2;
	else if		(bank3 == 'd33) sel_in[33] = 'd3;
	else if		(bank4 == 'd33) sel_in[33] = 'd4;
	else if		(bank5 == 'd33) sel_in[33] = 'd5;
	else if		(bank6 == 'd33) sel_in[33] = 'd6;
	else if		(bank7 == 'd33) sel_in[33] = 'd7;
	else 					   sel_in[33] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd34) sel_in[34] = 'd0;
	else if		(bank1 == 'd34) sel_in[34] = 'd1;
	else if		(bank2 == 'd34) sel_in[34] = 'd2;
	else if		(bank3 == 'd34) sel_in[34] = 'd3;
	else if		(bank4 == 'd34) sel_in[34] = 'd4;
	else if		(bank5 == 'd34) sel_in[34] = 'd5;
	else if		(bank6 == 'd34) sel_in[34] = 'd6;
	else if		(bank7 == 'd34) sel_in[34] = 'd7;
	else 					   sel_in[34] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd35) sel_in[35] = 'd0;
	else if		(bank1 == 'd35) sel_in[35] = 'd1;
	else if		(bank2 == 'd35) sel_in[35] = 'd2;
	else if		(bank3 == 'd35) sel_in[35] = 'd3;
	else if		(bank4 == 'd35) sel_in[35] = 'd4;
	else if		(bank5 == 'd35) sel_in[35] = 'd5;
	else if		(bank6 == 'd35) sel_in[35] = 'd6;
	else if		(bank7 == 'd35) sel_in[35] = 'd7;
	else 					   sel_in[35] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd36) sel_in[36] = 'd0;
	else if		(bank1 == 'd36) sel_in[36] = 'd1;
	else if		(bank2 == 'd36) sel_in[36] = 'd2;
	else if		(bank3 == 'd36) sel_in[36] = 'd3;
	else if		(bank4 == 'd36) sel_in[36] = 'd4;
	else if		(bank5 == 'd36) sel_in[36] = 'd5;
	else if		(bank6 == 'd36) sel_in[36] = 'd6;
	else if		(bank7 == 'd36) sel_in[36] = 'd7;
	else 					   sel_in[36] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd37) sel_in[37] = 'd0;
	else if		(bank1 == 'd37) sel_in[37] = 'd1;
	else if		(bank2 == 'd37) sel_in[37] = 'd2;
	else if		(bank3 == 'd37) sel_in[37] = 'd3;
	else if		(bank4 == 'd37) sel_in[37] = 'd4;
	else if		(bank5 == 'd37) sel_in[37] = 'd5;
	else if		(bank6 == 'd37) sel_in[37] = 'd6;
	else if		(bank7 == 'd37) sel_in[37] = 'd7;
	else 					   sel_in[37] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd38) sel_in[38] = 'd0;
	else if		(bank1 == 'd38) sel_in[38] = 'd1;
	else if		(bank2 == 'd38) sel_in[38] = 'd2;
	else if		(bank3 == 'd38) sel_in[38] = 'd3;
	else if		(bank4 == 'd38) sel_in[38] = 'd4;
	else if		(bank5 == 'd38) sel_in[38] = 'd5;
	else if		(bank6 == 'd38) sel_in[38] = 'd6;
	else if		(bank7 == 'd38) sel_in[38] = 'd7;
	else 					   sel_in[38] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd39) sel_in[39] = 'd0;
	else if		(bank1 == 'd39) sel_in[39] = 'd1;
	else if		(bank2 == 'd39) sel_in[39] = 'd2;
	else if		(bank3 == 'd39) sel_in[39] = 'd3;
	else if		(bank4 == 'd39) sel_in[39] = 'd4;
	else if		(bank5 == 'd39) sel_in[39] = 'd5;
	else if		(bank6 == 'd39) sel_in[39] = 'd6;
	else if		(bank7 == 'd39) sel_in[39] = 'd7;
	else 					   sel_in[39] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd40) sel_in[40] = 'd0;
	else if		(bank1 == 'd40) sel_in[40] = 'd1;
	else if		(bank2 == 'd40) sel_in[40] = 'd2;
	else if		(bank3 == 'd40) sel_in[40] = 'd3;
	else if		(bank4 == 'd40) sel_in[40] = 'd4;
	else if		(bank5 == 'd40) sel_in[40] = 'd5;
	else if		(bank6 == 'd40) sel_in[40] = 'd6;
	else if		(bank7 == 'd40) sel_in[40] = 'd7;
	else 					   sel_in[40] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd41) sel_in[41] = 'd0;
	else if		(bank1 == 'd41) sel_in[41] = 'd1;
	else if		(bank2 == 'd41) sel_in[41] = 'd2;
	else if		(bank3 == 'd41) sel_in[41] = 'd3;
	else if		(bank4 == 'd41) sel_in[41] = 'd4;
	else if		(bank5 == 'd41) sel_in[41] = 'd5;
	else if		(bank6 == 'd41) sel_in[41] = 'd6;
	else if		(bank7 == 'd41) sel_in[41] = 'd7;
	else 					   sel_in[41] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd42) sel_in[42] = 'd0;
	else if		(bank1 == 'd42) sel_in[42] = 'd1;
	else if		(bank2 == 'd42) sel_in[42] = 'd2;
	else if		(bank3 == 'd42) sel_in[42] = 'd3;
	else if		(bank4 == 'd42) sel_in[42] = 'd4;
	else if		(bank5 == 'd42) sel_in[42] = 'd5;
	else if		(bank6 == 'd42) sel_in[42] = 'd6;
	else if		(bank7 == 'd42) sel_in[42] = 'd7;
	else 					   sel_in[42] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd43) sel_in[43] = 'd0;
	else if		(bank1 == 'd43) sel_in[43] = 'd1;
	else if		(bank2 == 'd43) sel_in[43] = 'd2;
	else if		(bank3 == 'd43) sel_in[43] = 'd3;
	else if		(bank4 == 'd43) sel_in[43] = 'd4;
	else if		(bank5 == 'd43) sel_in[43] = 'd5;
	else if		(bank6 == 'd43) sel_in[43] = 'd6;
	else if		(bank7 == 'd43) sel_in[43] = 'd7;
	else 					   sel_in[43] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd44) sel_in[44] = 'd0;
	else if		(bank1 == 'd44) sel_in[44] = 'd1;
	else if		(bank2 == 'd44) sel_in[44] = 'd2;
	else if		(bank3 == 'd44) sel_in[44] = 'd3;
	else if		(bank4 == 'd44) sel_in[44] = 'd4;
	else if		(bank5 == 'd44) sel_in[44] = 'd5;
	else if		(bank6 == 'd44) sel_in[44] = 'd6;
	else if		(bank7 == 'd44) sel_in[44] = 'd7;
	else 					   sel_in[44] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd45) sel_in[45] = 'd0;
	else if		(bank1 == 'd45) sel_in[45] = 'd1;
	else if		(bank2 == 'd45) sel_in[45] = 'd2;
	else if		(bank3 == 'd45) sel_in[45] = 'd3;
	else if		(bank4 == 'd45) sel_in[45] = 'd4;
	else if		(bank5 == 'd45) sel_in[45] = 'd5;
	else if		(bank6 == 'd45) sel_in[45] = 'd6;
	else if		(bank7 == 'd45) sel_in[45] = 'd7;
	else 					   sel_in[45] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd46) sel_in[46] = 'd0;
	else if		(bank1 == 'd46) sel_in[46] = 'd1;
	else if		(bank2 == 'd46) sel_in[46] = 'd2;
	else if		(bank3 == 'd46) sel_in[46] = 'd3;
	else if		(bank4 == 'd46) sel_in[46] = 'd4;
	else if		(bank5 == 'd46) sel_in[46] = 'd5;
	else if		(bank6 == 'd46) sel_in[46] = 'd6;
	else if		(bank7 == 'd46) sel_in[46] = 'd7;
	else 					   sel_in[46] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd47) sel_in[47] = 'd0;
	else if		(bank1 == 'd47) sel_in[47] = 'd1;
	else if		(bank2 == 'd47) sel_in[47] = 'd2;
	else if		(bank3 == 'd47) sel_in[47] = 'd3;
	else if		(bank4 == 'd47) sel_in[47] = 'd4;
	else if		(bank5 == 'd47) sel_in[47] = 'd5;
	else if		(bank6 == 'd47) sel_in[47] = 'd6;
	else if		(bank7 == 'd47) sel_in[47] = 'd7;
	else 					   sel_in[47] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd48) sel_in[48] = 'd0;
	else if		(bank1 == 'd48) sel_in[48] = 'd1;
	else if		(bank2 == 'd48) sel_in[48] = 'd2;
	else if		(bank3 == 'd48) sel_in[48] = 'd3;
	else if		(bank4 == 'd48) sel_in[48] = 'd4;
	else if		(bank5 == 'd48) sel_in[48] = 'd5;
	else if		(bank6 == 'd48) sel_in[48] = 'd6;
	else if		(bank7 == 'd48) sel_in[48] = 'd7;
	else 					   sel_in[48] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd49) sel_in[49] = 'd0;
	else if		(bank1 == 'd49) sel_in[49] = 'd1;
	else if		(bank2 == 'd49) sel_in[49] = 'd2;
	else if		(bank3 == 'd49) sel_in[49] = 'd3;
	else if		(bank4 == 'd49) sel_in[49] = 'd4;
	else if		(bank5 == 'd49) sel_in[49] = 'd5;
	else if		(bank6 == 'd49) sel_in[49] = 'd6;
	else if		(bank7 == 'd49) sel_in[49] = 'd7;
	else 					   sel_in[49] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd50) sel_in[50] = 'd0;
	else if		(bank1 == 'd50) sel_in[50] = 'd1;
	else if		(bank2 == 'd50) sel_in[50] = 'd2;
	else if		(bank3 == 'd50) sel_in[50] = 'd3;
	else if		(bank4 == 'd50) sel_in[50] = 'd4;
	else if		(bank5 == 'd50) sel_in[50] = 'd5;
	else if		(bank6 == 'd50) sel_in[50] = 'd6;
	else if		(bank7 == 'd50) sel_in[50] = 'd7;
	else 					   sel_in[50] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd51) sel_in[51] = 'd0;
	else if		(bank1 == 'd51) sel_in[51] = 'd1;
	else if		(bank2 == 'd51) sel_in[51] = 'd2;
	else if		(bank3 == 'd51) sel_in[51] = 'd3;
	else if		(bank4 == 'd51) sel_in[51] = 'd4;
	else if		(bank5 == 'd51) sel_in[51] = 'd5;
	else if		(bank6 == 'd51) sel_in[51] = 'd6;
	else if		(bank7 == 'd51) sel_in[51] = 'd7;
	else 					   sel_in[51] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd52) sel_in[52] = 'd0;
	else if		(bank1 == 'd52) sel_in[52] = 'd1;
	else if		(bank2 == 'd52) sel_in[52] = 'd2;
	else if		(bank3 == 'd52) sel_in[52] = 'd3;
	else if		(bank4 == 'd52) sel_in[52] = 'd4;
	else if		(bank5 == 'd52) sel_in[52] = 'd5;
	else if		(bank6 == 'd52) sel_in[52] = 'd6;
	else if		(bank7 == 'd52) sel_in[52] = 'd7;
	else 					   sel_in[52] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd53) sel_in[53] = 'd0;
	else if		(bank1 == 'd53) sel_in[53] = 'd1;
	else if		(bank2 == 'd53) sel_in[53] = 'd2;
	else if		(bank3 == 'd53) sel_in[53] = 'd3;
	else if		(bank4 == 'd53) sel_in[53] = 'd4;
	else if		(bank5 == 'd53) sel_in[53] = 'd5;
	else if		(bank6 == 'd53) sel_in[53] = 'd6;
	else if		(bank7 == 'd53) sel_in[53] = 'd7;
	else 					   sel_in[53] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd54) sel_in[54] = 'd0;
	else if		(bank1 == 'd54) sel_in[54] = 'd1;
	else if		(bank2 == 'd54) sel_in[54] = 'd2;
	else if		(bank3 == 'd54) sel_in[54] = 'd3;
	else if		(bank4 == 'd54) sel_in[54] = 'd4;
	else if		(bank5 == 'd54) sel_in[54] = 'd5;
	else if		(bank6 == 'd54) sel_in[54] = 'd6;
	else if		(bank7 == 'd54) sel_in[54] = 'd7;
	else 					   sel_in[54] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd55) sel_in[55] = 'd0;
	else if		(bank1 == 'd55) sel_in[55] = 'd1;
	else if		(bank2 == 'd55) sel_in[55] = 'd2;
	else if		(bank3 == 'd55) sel_in[55] = 'd3;
	else if		(bank4 == 'd55) sel_in[55] = 'd4;
	else if		(bank5 == 'd55) sel_in[55] = 'd5;
	else if		(bank6 == 'd55) sel_in[55] = 'd6;
	else if		(bank7 == 'd55) sel_in[55] = 'd7;
	else 					   sel_in[55] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd56) sel_in[56] = 'd0;
	else if		(bank1 == 'd56) sel_in[56] = 'd1;
	else if		(bank2 == 'd56) sel_in[56] = 'd2;
	else if		(bank3 == 'd56) sel_in[56] = 'd3;
	else if		(bank4 == 'd56) sel_in[56] = 'd4;
	else if		(bank5 == 'd56) sel_in[56] = 'd5;
	else if		(bank6 == 'd56) sel_in[56] = 'd6;
	else if		(bank7 == 'd56) sel_in[56] = 'd7;
	else 					   sel_in[56] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd57) sel_in[57] = 'd0;
	else if		(bank1 == 'd57) sel_in[57] = 'd1;
	else if		(bank2 == 'd57) sel_in[57] = 'd2;
	else if		(bank3 == 'd57) sel_in[57] = 'd3;
	else if		(bank4 == 'd57) sel_in[57] = 'd4;
	else if		(bank5 == 'd57) sel_in[57] = 'd5;
	else if		(bank6 == 'd57) sel_in[57] = 'd6;
	else if		(bank7 == 'd57) sel_in[57] = 'd7;
	else 					   sel_in[57] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd58) sel_in[58] = 'd0;
	else if		(bank1 == 'd58) sel_in[58] = 'd1;
	else if		(bank2 == 'd58) sel_in[58] = 'd2;
	else if		(bank3 == 'd58) sel_in[58] = 'd3;
	else if		(bank4 == 'd58) sel_in[58] = 'd4;
	else if		(bank5 == 'd58) sel_in[58] = 'd5;
	else if		(bank6 == 'd58) sel_in[58] = 'd6;
	else if		(bank7 == 'd58) sel_in[58] = 'd7;
	else 					   sel_in[58] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd59) sel_in[59] = 'd0;
	else if		(bank1 == 'd59) sel_in[59] = 'd1;
	else if		(bank2 == 'd59) sel_in[59] = 'd2;
	else if		(bank3 == 'd59) sel_in[59] = 'd3;
	else if		(bank4 == 'd59) sel_in[59] = 'd4;
	else if		(bank5 == 'd59) sel_in[59] = 'd5;
	else if		(bank6 == 'd59) sel_in[59] = 'd6;
	else if		(bank7 == 'd59) sel_in[59] = 'd7;
	else 					   sel_in[59] = 'd8;
end
always@(*) begin
	if			(bank0 == 'd60) sel_in[60] = 'd0;
	else if		(bank1 == 'd60) sel_in[60] = 'd1;
	else if		(bank2 == 'd60) sel_in[60] = 'd2;
	else if		(bank3 == 'd60) sel_in[60] = 'd3;
	else if		(bank4 == 'd60) sel_in[60] = 'd4;
	else if		(bank5 == 'd60) sel_in[60] = 'd5;
	else if		(bank6 == 'd60) sel_in[60] = 'd6;
	else if		(bank7 == 'd60) sel_in[60] = 'd7;
	else 					   sel_in[60] = 'd8;
end
// end generate sel_in[0-61]

// generate sel_in_d0[0-61]	
always@(*) begin
	if			(bank_d0 == 'd0) sel_in_d0[0] = 'd1;
	else 	                     sel_in_d0[0] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd1) sel_in_d0[1] = 'd1;
	else 	                     sel_in_d0[1] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd2) sel_in_d0[2] = 'd1;
	else 	                     sel_in_d0[2] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd3) sel_in_d0[3] = 'd1;
	else 	                     sel_in_d0[3] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd4) sel_in_d0[4] = 'd1;
	else 	                     sel_in_d0[4] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd5) sel_in_d0[5] = 'd1;
	else 	                     sel_in_d0[5] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd6) sel_in_d0[6] = 'd1;
	else 	                     sel_in_d0[6] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd7) sel_in_d0[7] = 'd1;
	else 	                     sel_in_d0[7] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd8) sel_in_d0[8] = 'd1;
	else 	                     sel_in_d0[8] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd9) sel_in_d0[9] = 'd1;
	else 	                     sel_in_d0[9] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd10) sel_in_d0[10] = 'd1;
	else 	                     sel_in_d0[10] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd11) sel_in_d0[11] = 'd1;
	else 	                     sel_in_d0[11] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd12) sel_in_d0[12] = 'd1;
	else 	                     sel_in_d0[12] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd13) sel_in_d0[13] = 'd1;
	else 	                     sel_in_d0[13] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd14) sel_in_d0[14] = 'd1;
	else 	                     sel_in_d0[14] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd15) sel_in_d0[15] = 'd1;
	else 	                     sel_in_d0[15] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd16) sel_in_d0[16] = 'd1;
	else 	                     sel_in_d0[16] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd17) sel_in_d0[17] = 'd1;
	else 	                     sel_in_d0[17] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd18) sel_in_d0[18] = 'd1;
	else 	                     sel_in_d0[18] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd19) sel_in_d0[19] = 'd1;
	else 	                     sel_in_d0[19] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd20) sel_in_d0[20] = 'd1;
	else 	                     sel_in_d0[20] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd21) sel_in_d0[21] = 'd1;
	else 	                     sel_in_d0[21] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd22) sel_in_d0[22] = 'd1;
	else 	                     sel_in_d0[22] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd23) sel_in_d0[23] = 'd1;
	else 	                     sel_in_d0[23] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd24) sel_in_d0[24] = 'd1;
	else 	                     sel_in_d0[24] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd25) sel_in_d0[25] = 'd1;
	else 	                     sel_in_d0[25] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd26) sel_in_d0[26] = 'd1;
	else 	                     sel_in_d0[26] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd27) sel_in_d0[27] = 'd1;
	else 	                     sel_in_d0[27] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd28) sel_in_d0[28] = 'd1;
	else 	                     sel_in_d0[28] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd29) sel_in_d0[29] = 'd1;
	else 	                     sel_in_d0[29] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd30) sel_in_d0[30] = 'd1;
	else 	                     sel_in_d0[30] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd31) sel_in_d0[31] = 'd1;
	else 	                     sel_in_d0[31] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd32) sel_in_d0[32] = 'd1;
	else 	                     sel_in_d0[32] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd33) sel_in_d0[33] = 'd1;
	else 	                     sel_in_d0[33] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd34) sel_in_d0[34] = 'd1;
	else 	                     sel_in_d0[34] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd35) sel_in_d0[35] = 'd1;
	else 	                     sel_in_d0[35] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd36) sel_in_d0[36] = 'd1;
	else 	                     sel_in_d0[36] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd37) sel_in_d0[37] = 'd1;
	else 	                     sel_in_d0[37] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd38) sel_in_d0[38] = 'd1;
	else 	                     sel_in_d0[38] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd39) sel_in_d0[39] = 'd1;
	else 	                     sel_in_d0[39] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd40) sel_in_d0[40] = 'd1;
	else 	                     sel_in_d0[40] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd41) sel_in_d0[41] = 'd1;
	else 	                     sel_in_d0[41] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd42) sel_in_d0[42] = 'd1;
	else 	                     sel_in_d0[42] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd43) sel_in_d0[43] = 'd1;
	else 	                     sel_in_d0[43] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd44) sel_in_d0[44] = 'd1;
	else 	                     sel_in_d0[44] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd45) sel_in_d0[45] = 'd1;
	else 	                     sel_in_d0[45] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd46) sel_in_d0[46] = 'd1;
	else 	                     sel_in_d0[46] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd47) sel_in_d0[47] = 'd1;
	else 	                     sel_in_d0[47] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd48) sel_in_d0[48] = 'd1;
	else 	                     sel_in_d0[48] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd49) sel_in_d0[49] = 'd1;
	else 	                     sel_in_d0[49] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd50) sel_in_d0[50] = 'd1;
	else 	                     sel_in_d0[50] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd51) sel_in_d0[51] = 'd1;
	else 	                     sel_in_d0[51] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd52) sel_in_d0[52] = 'd1;
	else 	                     sel_in_d0[52] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd53) sel_in_d0[53] = 'd1;
	else 	                     sel_in_d0[53] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd54) sel_in_d0[54] = 'd1;
	else 	                     sel_in_d0[54] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd55) sel_in_d0[55] = 'd1;
	else 	                     sel_in_d0[55] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd56) sel_in_d0[56] = 'd1;
	else 	                     sel_in_d0[56] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd57) sel_in_d0[57] = 'd1;
	else 	                     sel_in_d0[57] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd58) sel_in_d0[58] = 'd1;
	else 	                     sel_in_d0[58] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd59) sel_in_d0[59] = 'd1;
	else 	                     sel_in_d0[59] = 'd0;
end
always@(*) begin
	if			(bank_d0 == 'd60) sel_in_d0[60] = 'd1;
	else 	                     sel_in_d0[60] = 'd0;
end
// end generate sel_in_d0[0-61]



	genvar i;


	



	// input 8-1 mux 
	generate
		for(i = 0; i < 61; i = i + 1) begin : kk
		 Mux_8_1 mux_in(
			.A_0    (addr0     ),                                                                                         
			.A_1    (addr1     ),                                                                                         
			.A_2    (addr2     ),                                                                                                                                                                     
			.A_3    (addr3     ), 
			.A_4    (addr4     ),  
			.A_5    (addr5     ),  
			.A_6    (addr6     ),  	
			.A_7    (addr7      ),
			.D_0    (mem_IN_0  ),                                                                                         
			.D_1    (mem_IN_1  ),                                                                                         
			.D_2    (mem_IN_2  ),                                                                                                                                                                     
			.D_3    (mem_IN_3  ), 
			.D_4    (mem_IN_4  ),  
			.D_5    (mem_IN_5  ),  
			.D_6    (mem_IN_6  ),  	
			.D_7    (mem_IN_7  ),	
			.sel    (sel_in[i] ),
			.CEN_Out(CEN_Out[i]),
			.A_Out  (A_Out[i]  ),
			.D_Out  (D_Out[i]  )
		); 	
		end
	endgenerate

	// input 2-1 mux  for d0 and sum
	generate
		for(i = 0; i < 61; i = i + 1) begin : kkk
		 Mux_2_1 mux_2_in(
			.sel      (sel_in_d0[i]),
			.A_0      (A_Out[i]     ),     // origin                                                                                        
			.A_1      (addr_d0    ),    // d0                                                                                      
			.D_0      (D_Out[i]  ),                                                                                         
			.D_1      (mem_IN_d0  ),                                                                                         	
			.CEN_0    (CEN_Out[i]),
			.CEN_1    (~sel_in_d0[i]),	
			.WEN_0    (write),
			.WEN_1    (write_d0),			
			.A_Out    (mux_2_A_Out[i]  ),
			.D_Out    (mux_2_D_Out[i]  ),
			.CEN_out  (mux_2_CEN_out[i]),	
			.WEN_out  (mux_2_write_out[i])				
		); 	
		end
	endgenerate

logic [`BANK_WIDTH-1:0]sel_out_d0;
always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		sel_out[0] <= 'd63;
		sel_out[1] <= 'd63;
		sel_out[2] <= 'd63;
		sel_out[3] <= 'd63;
		sel_out[4] <= 'd63;
		sel_out[5] <= 'd63;
		sel_out[6] <= 'd63;
		sel_out[7] <= 'd63;	
		sel_out_d0 <= 'd63;
	end
	else begin
		sel_out[0] <= bank0;
		sel_out[1] <= bank1;
		sel_out[2] <= bank2;
		sel_out[3] <= bank3;
		sel_out[4] <= bank4;
		sel_out[5] <= bank5;
		sel_out[6] <= bank6;
		sel_out[7] <= bank7;		
		sel_out_d0 <= bank_d0;
	end
end
	//assign sel_out[0] = bank0;
	//assign sel_out[1] = bank1;
	//assign sel_out[2] = bank2;	
	//assign sel_out[3] = bank3;	
	//assign sel_out[4] = bank4;	
	//assign sel_out[5] = bank5;	
	//assign sel_out[6] = bank6;
	//assign sel_out[7] = bank7;

	wire [64-1:0]Q_Out_64[0:bank_num-1];
	logic [64-`DATA_WIDTH-1:0] zero;
	assign zero = 'd0;
	
	// sram instance
	generate
		for(i = 0; i < 61; i = i + 1) begin : GG
		 SRAM_SP_2048 sram(
			.Q(Q_Out_64[i]),         //ouput data
			.CLK(clk),        
			.CEN(mux_2_CEN_out[i]/*'d0*/),       //chip enable : Low in enable
			.WEN(mux_2_write_out[i]),     	//write enable : Low in enable
			.A(mux_2_A_Out[i]),         //addr
			.D({zero,mux_2_D_Out[i]}),         //input data
			.EMA(3'd0)
		); 	
		assign Q_Out[i] = Q_Out_64[i][`DATA_WIDTH-1:0];
		end
	endgenerate

	// 8 (64-1 mux)
	generate
		for(i = 0; i < 8; i = i + 1) begin :gg
		 Mux_64_1 mux_out(
			.Q_0  (Q_Out[0] )  ,
			.Q_1  (Q_Out[1] )  ,
			.Q_2  (Q_Out[2] )  ,
			.Q_3  (Q_Out[3] )  ,
			.Q_4  (Q_Out[4] )  ,
			.Q_5  (Q_Out[5] )  ,
			.Q_6  (Q_Out[6] )  ,
			.Q_7  (Q_Out[7] )  ,
			.Q_8  (Q_Out[8] )  ,
			.Q_9  (Q_Out[9] )  ,
			.Q_10 (Q_Out[10])  ,
			.Q_11 (Q_Out[11])  ,
			.Q_12 (Q_Out[12])  ,
			.Q_13 (Q_Out[13])  ,
			.Q_14 (Q_Out[14])  ,
			.Q_15 (Q_Out[15])  ,
			.Q_16 (Q_Out[16])  ,
			.Q_17 (Q_Out[17])  ,
			.Q_18 (Q_Out[18])  ,
			.Q_19 (Q_Out[19])  ,
			.Q_20 (Q_Out[20])  ,
			.Q_21 (Q_Out[21])  ,
			.Q_22 (Q_Out[22])  ,
			.Q_23 (Q_Out[23])  ,
			.Q_24 (Q_Out[24])  ,
			.Q_25 (Q_Out[25])  ,
			.Q_26 (Q_Out[26])  ,
			.Q_27 (Q_Out[27])  ,
			.Q_28 (Q_Out[28])  ,
			.Q_29 (Q_Out[29])  ,
			.Q_30 (Q_Out[30])  ,
			.Q_31 (Q_Out[31])  ,
			.Q_32 (Q_Out[32])  ,
			.Q_33 (Q_Out[33])  ,
			.Q_34 (Q_Out[34])  ,
			.Q_35 (Q_Out[35])  ,
			.Q_36 (Q_Out[36])  ,
			.Q_37 (Q_Out[37])  ,
			.Q_38 (Q_Out[38])  ,
			.Q_39 (Q_Out[39])  ,
			.Q_40 (Q_Out[40])  ,
			.Q_41 (Q_Out[41])  ,
			.Q_42 (Q_Out[42])  ,
			.Q_43 (Q_Out[43])  ,
			.Q_44 (Q_Out[44])  ,
			.Q_45 (Q_Out[45])  ,
			.Q_46 (Q_Out[46])  ,
			.Q_47 (Q_Out[47])  ,
			.Q_48 (Q_Out[48])  ,
			.Q_49 (Q_Out[49])  ,
			.Q_50 (Q_Out[50])  ,
			.Q_51 (Q_Out[51])  ,
			.Q_52 (Q_Out[52])  ,
			.Q_53 (Q_Out[53])  ,
			.Q_54 (Q_Out[54])  ,
			.Q_55 (Q_Out[55])  ,
			.Q_56 (Q_Out[56])  ,
			.Q_57 (Q_Out[57])  ,
			.Q_58 (Q_Out[58])  ,
			.Q_59 (Q_Out[59])  ,
			.Q_60 (Q_Out[60])  ,
			.Q_61 (zero_data_width)  ,
			.Q_62 (zero_data_width)  ,
			.Q_63 (zero_data_width)  ,
			.sel  (sel_out[i])  ,
			.Q_out(mem_OUT[i]) 
		); 	
		end
	endgenerate

		 Mux_64_1 mux_out(
			.Q_0  (Q_Out[0] )  ,
			.Q_1  (Q_Out[1] )  ,
			.Q_2  (Q_Out[2] )  ,
			.Q_3  (Q_Out[3] )  ,
			.Q_4  (Q_Out[4] )  ,
			.Q_5  (Q_Out[5] )  ,
			.Q_6  (Q_Out[6] )  ,
			.Q_7  (Q_Out[7] )  ,
			.Q_8  (Q_Out[8] )  ,
			.Q_9  (Q_Out[9] )  ,
			.Q_10 (Q_Out[10])  ,
			.Q_11 (Q_Out[11])  ,
			.Q_12 (Q_Out[12])  ,
			.Q_13 (Q_Out[13])  ,
			.Q_14 (Q_Out[14])  ,
			.Q_15 (Q_Out[15])  ,
			.Q_16 (Q_Out[16])  ,
			.Q_17 (Q_Out[17])  ,
			.Q_18 (Q_Out[18])  ,
			.Q_19 (Q_Out[19])  ,
			.Q_20 (Q_Out[20])  ,
			.Q_21 (Q_Out[21])  ,
			.Q_22 (Q_Out[22])  ,
			.Q_23 (Q_Out[23])  ,
			.Q_24 (Q_Out[24])  ,
			.Q_25 (Q_Out[25])  ,
			.Q_26 (Q_Out[26])  ,
			.Q_27 (Q_Out[27])  ,
			.Q_28 (Q_Out[28])  ,
			.Q_29 (Q_Out[29])  ,
			.Q_30 (Q_Out[30])  ,
			.Q_31 (Q_Out[31])  ,
			.Q_32 (Q_Out[32])  ,
			.Q_33 (Q_Out[33])  ,
			.Q_34 (Q_Out[34])  ,
			.Q_35 (Q_Out[35])  ,
			.Q_36 (Q_Out[36])  ,
			.Q_37 (Q_Out[37])  ,
			.Q_38 (Q_Out[38])  ,
			.Q_39 (Q_Out[39])  ,
			.Q_40 (Q_Out[40])  ,
			.Q_41 (Q_Out[41])  ,
			.Q_42 (Q_Out[42])  ,
			.Q_43 (Q_Out[43])  ,
			.Q_44 (Q_Out[44])  ,
			.Q_45 (Q_Out[45])  ,
			.Q_46 (Q_Out[46])  ,
			.Q_47 (Q_Out[47])  ,
			.Q_48 (Q_Out[48])  ,
			.Q_49 (Q_Out[49])  ,
			.Q_50 (Q_Out[50])  ,
			.Q_51 (Q_Out[51])  ,
			.Q_52 (Q_Out[52])  ,
			.Q_53 (Q_Out[53])  ,
			.Q_54 (Q_Out[54])  ,
			.Q_55 (Q_Out[55])  ,
			.Q_56 (Q_Out[56])  ,
			.Q_57 (Q_Out[57])  ,
			.Q_58 (Q_Out[58])  ,
			.Q_59 (Q_Out[59])  ,
			.Q_60 (Q_Out[60])  ,
			.Q_61 (zero_data_width)  ,
			.Q_62 (zero_data_width)  ,
			.Q_63 (zero_data_width)  ,
			.sel  (sel_out_d0)  ,   // remem to delay
			.Q_out(mem_OUT_d0_tmp) 
		); 	


logic delay1;
always@(posedge clk or posedge rst_n) begin
	if(rst_n) begin
		 mem_OUT_0 <= 'd0;
		 mem_OUT_1 <= 'd0;
		 mem_OUT_2 <= 'd0;
		 mem_OUT_3 <= 'd0;
		 mem_OUT_4 <= 'd0;
		 mem_OUT_5 <= 'd0;
		 mem_OUT_6 <= 'd0;
		 mem_OUT_7 <= 'd0;
		 mem_OUT_d0<= 'd0;
	end
	else begin
			 mem_OUT_0 <= mem_OUT[0];
			 mem_OUT_1 <= mem_OUT[1];
			 mem_OUT_2 <= mem_OUT[2];
			 mem_OUT_3 <= mem_OUT[3];
			 mem_OUT_4 <= mem_OUT[4];
			 mem_OUT_5 <= mem_OUT[5];
			 mem_OUT_6 <= mem_OUT[6];	
			 mem_OUT_7 <= mem_OUT[7];	
			 mem_OUT_d0<= mem_OUT_d0_tmp;	
	end

end



	


 endmodule