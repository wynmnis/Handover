`timescale 1ns/1ps 
`include "define.sv" 

module Registers(
	input clk,rst_n,
	input [2:0] sel, //1: 31; 2: 41; 3: 61; 4: 4-2 DFT; 5: 2-4 IDFT
	input m1_out_0,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg0,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg1,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg2,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg3,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg4,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg5,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg6,
	input [`INDEX_WIDTH_N_ADD-1:0] Read_Reg7,
	output logic [`DATA_WIDTH-1:0] Read_Data0,
	output logic [`DATA_WIDTH-1:0] Read_Data1,
	output logic [`DATA_WIDTH-1:0] Read_Data2,
	output logic [`DATA_WIDTH-1:0] Read_Data3,
	output logic [`DATA_WIDTH-1:0] Read_Data4,
	output logic [`DATA_WIDTH-1:0] Read_Data5,
	output logic [`DATA_WIDTH-1:0] Read_Data6,
	output logic [`DATA_WIDTH-1:0] Read_Data7
);

logic [`DATA_WIDTH-1:0] rader_30_pre [30];
logic [`DATA_WIDTH-1:0] rader_40_pre [40];
logic [`DATA_WIDTH-1:0] rader_60_pre [60];

	always@(posedge clk or posedge rst_n)
	  begin
		if(rst_n)begin 
			rader_30_pre[0]  = 'h353c7f0 ;
			rader_30_pre[1]  = 'hf9b6e7  ;
			rader_30_pre[2]  = 'h106b284 ;
			rader_30_pre[3]  = 'h23ff31f ;
			rader_30_pre[4]  = 'h3049d4  ;
			rader_30_pre[5]  = 'h8b353e  ;
			rader_30_pre[6]  = 'h6d1a7e  ;
			rader_30_pre[7]  = 'h1449f   ;
			rader_30_pre[8]  = 'ha82a4f  ;
			rader_30_pre[9]  = 'h202a35  ;
			rader_30_pre[10] = 'h2d75d5f ;
			rader_30_pre[11] = 'ha0aed2  ;
			rader_30_pre[12] = 'h3277ada ;
			rader_30_pre[13] = 'h33e5958 ;
			rader_30_pre[14] = 'h4bd971  ;
			rader_30_pre[15] = 'h2d8b8ea ;
			rader_30_pre[16] = 'h10194f8 ;
			rader_30_pre[17] = 'h6f8c8d  ;
			rader_30_pre[18] = 'h2131d49 ;
			rader_30_pre[19] = 'hd316a5  ;
			rader_30_pre[20] = 'hff522   ;
			rader_30_pre[21] = 'hafbaa5  ;
			rader_30_pre[22] = 'ha9b98b  ;
			rader_30_pre[23] = 'h30c3cf4 ;
			rader_30_pre[24] = 'h26bb1cd ;
			rader_30_pre[25] = 'h10f7139 ;
			rader_30_pre[26] = 'h2635dbd ;
			rader_30_pre[27] = 'h1bc6ae7 ;
			rader_30_pre[28] = 'h712cc2  ;
			rader_30_pre[29] = 'h10166e9 ;
		end
	end

	always@(posedge clk or posedge rst_n)
	  begin
		if(rst_n)begin 
			rader_40_pre[0]  = 'h353c7f0;
			rader_40_pre[1]  = 'h1e435e;
			rader_40_pre[2]  = 'h3507254;
			rader_40_pre[3]  = 'h3db306;
			rader_40_pre[4]  = 'h14f9035;
			rader_40_pre[5]  = 'h2738355;
			rader_40_pre[6]  = 'h15e906d;
			rader_40_pre[7]  = 'h19776bf;
			rader_40_pre[8]  = 'he843cd;
			rader_40_pre[9]  = 'h2af9445;
			rader_40_pre[10] = 'h1b1b84f;
			rader_40_pre[11] = 'h89a2c3;
			rader_40_pre[12] = 'h3d63ed;
			rader_40_pre[13] = 'h1e30d68;
			rader_40_pre[14] = 'h2ba5221;
			rader_40_pre[15] = 'h111fe31;
			rader_40_pre[16] = 'h347d46a;
			rader_40_pre[17] = 'h2a26d0e;
			rader_40_pre[18] = 'h2b9bcff;
			rader_40_pre[19] = 'hb759c8;
			rader_40_pre[20] = 'h66122;
			rader_40_pre[21] = 'h33b02fe;
			rader_40_pre[22] = 'h2d42683;
			rader_40_pre[23] = 'h243bfa5;
			rader_40_pre[24] = 'h1856075;
			rader_40_pre[25] = 'h2351737;
			rader_40_pre[26] = 'h24828b4;
			rader_40_pre[27] = 'h60ef15;
			rader_40_pre[28] = 'h1de5b48;
			rader_40_pre[29] = 'h3109d68;
			rader_40_pre[30] = 'h1d4b143;
			rader_40_pre[31] = 'hdbf5fc;
			rader_40_pre[32] = 'h4ef750;
			rader_40_pre[33] = 'h2e80de9;
			rader_40_pre[34] = 'h1bb7ec7;
			rader_40_pre[35] = 'h1fd8601;
			rader_40_pre[36] = 'h26f0929;
			rader_40_pre[37] = 'h1a9ec5e;
			rader_40_pre[38] = 'h18dbf9d;
			rader_40_pre[39] = 'h91a5cd;			
		end
	end

	always@(posedge clk or posedge rst_n)
	  begin
		if(rst_n)begin 
			rader_60_pre[0]  = 'h353c7f0;
			rader_60_pre[1]  = 'hd6ee76 ;
			rader_60_pre[2]  = 'h520af6 ;
			rader_60_pre[3]  = 'h21a3234;
			rader_60_pre[4]  = 'h1cdbbad;
			rader_60_pre[5]  = 'h3630c3 ;
			rader_60_pre[6]  = 'h1c4225c;
			rader_60_pre[7]  = 'h169cb40;
			rader_60_pre[8]  = 'h46095d ;
			rader_60_pre[9]  = 'hf2771f ;
			rader_60_pre[10] = 'hf76fc  ;
			rader_60_pre[11] = 'hb35fc7 ;
			rader_60_pre[12] = 'h96e957 ;
			rader_60_pre[13] = 'h120d546;
			rader_60_pre[14] = 'h1613251;
			rader_60_pre[15] = 'h136de40;
			rader_60_pre[16] = 'h4567ec ;
			rader_60_pre[17] = 'h29db317;
			rader_60_pre[18] = 'h2da81e ;
			rader_60_pre[19] = 'h11bbf7b;
			rader_60_pre[20] = 'h2ae0945;
			rader_60_pre[21] = 'h325b987;
			rader_60_pre[22] = 'hbdadb9 ;
			rader_60_pre[23] = 'h15bf808;
			rader_60_pre[24] = 'h2a09353;
			rader_60_pre[25] = 'h2fa7792;
			rader_60_pre[26] = 'h13051d ;
			rader_60_pre[27] = 'h1c7eeb6;
			rader_60_pre[28] = 'h1769dcf;
			rader_60_pre[29] = 'h9598c3 ;
			rader_60_pre[30] = 'h2cf496d;
			rader_60_pre[31] = 'h975073 ;
			rader_60_pre[32] = 'h201b0df;
			rader_60_pre[33] = 'h2f26198;
			rader_60_pre[34] = 'h1499f5 ;
			rader_60_pre[35] = 'hc32d07 ;
			rader_60_pre[36] = 'h2264798;
			rader_60_pre[37] = 'h3250d1e;
			rader_60_pre[38] = 'h23826f5;
			rader_60_pre[39] = 'h22822fa;	
			rader_60_pre[40] = 'h22609d2;
			rader_60_pre[41] = 'hde116a ;
			rader_60_pre[42] = 'h276895f;
			rader_60_pre[43] = 'h8d830f ;
			rader_60_pre[44] = 'hc50fc7 ;
			rader_60_pre[45] = 'h41ebd8 ;
			rader_60_pre[46] = 'h32ef583;
			rader_60_pre[47] = 'h27d0128;
			rader_60_pre[48] = 'h16bd376;
			rader_60_pre[49] = 'h199101f;
			rader_60_pre[50] = 'h2e5503a;
			rader_60_pre[51] = 'h1bf7b31;
			rader_60_pre[52] = 'h302218 ;
			rader_60_pre[53] = 'h2a1a00d;
			rader_60_pre[54] = 'h205163d;
			rader_60_pre[55] = 'h127394b;
			rader_60_pre[56] = 'h9ddf3a ;
			rader_60_pre[57] = 'h2f20743;
			rader_60_pre[58] = 'h1e11e84;
			rader_60_pre[59] = 'h27ed7f2;			
		end
	end

/////read reg

/* 4-point DFT to 2-point DFT tw
1
44257439
10475752
12591110
*/

/* 2-point IDFT to 4-point IDFT tw
1
1
1
43231211
1
45346569
1
11564882
*/

logic m1_out_0_bar; // depend on FFT delay
assign m1_out_0_bar = ~m1_out_0; 

always@(*)///reg1
	begin
		case(sel)  //1: 31; 2: 41; 3: 61; 4: 4-2 DFT; 5: 2-4 IDFT 
			'd1: begin  //5-point end
				Read_Data0 = rader_30_pre[Read_Reg0];
				Read_Data1 = rader_30_pre[Read_Reg1];
				Read_Data2 = rader_30_pre[Read_Reg2];
				Read_Data3 = rader_30_pre[Read_Reg3];
				Read_Data4 = rader_30_pre[Read_Reg4];
				Read_Data5 = 'd1;
				Read_Data6 = 'd1;
				Read_Data7 = 'd1;	
			end              
			'd2: begin    //2-point end  
				Read_Data0 = rader_40_pre[Read_Reg0];
				Read_Data1 = rader_40_pre[Read_Reg1];
				Read_Data2 = rader_40_pre[Read_Reg2];
				Read_Data3 = rader_40_pre[Read_Reg3];
				Read_Data4 = rader_40_pre[Read_Reg4];
				Read_Data5 = rader_40_pre[Read_Reg5];
				Read_Data6 = rader_40_pre[Read_Reg6];
				Read_Data7 = rader_40_pre[Read_Reg7];	
			end              
			'd3: begin    //5-point end
				Read_Data0 = rader_60_pre[Read_Reg0];
				Read_Data1 = rader_60_pre[Read_Reg1];
				Read_Data2 = rader_60_pre[Read_Reg2];
				Read_Data3 = rader_60_pre[Read_Reg3];
				Read_Data4 = rader_60_pre[Read_Reg4];
				Read_Data5 = 'd1;
				Read_Data6 = 'd1;
				Read_Data7 = 'd1;	
			end		
			'd4: begin    //4-point DFT  
				if(m1_out_0) begin
					Read_Data0 = 'd1;
					Read_Data1 = 'd44257439;
					Read_Data2 = 'd10475752;
					Read_Data3 = 'd12591110;
					Read_Data4 = 'd1;
					Read_Data5 = 'd1;
					Read_Data6 = 'd1;
					Read_Data7 = 'd1;	
				end
				else begin
					Read_Data0 = 'd1;
					Read_Data1 = 'd1;
					Read_Data2 = 'd1;
					Read_Data3 = 'd1;
					Read_Data4 = 'd1;
					Read_Data5 = 'd1;
					Read_Data6 = 'd1;
					Read_Data7 = 'd1;				
				end
			end
			'd5: begin    //2-point IDFT  tw*inv_2 
				Read_Data0 = 'd27911161;
				Read_Data1 = 'd27911161;
				Read_Data2 = 'd27911161;
				Read_Data3 = 'd49526766;
				Read_Data4 = 'd27911161;
				Read_Data5 = 'd50584445;
				Read_Data6 = 'd27911161;
				Read_Data7 = 'd5782441;
			end			
			default : begin
				Read_Data0 = 'd99;
				Read_Data1 = 'd99;
				Read_Data2 = 'd99;
				Read_Data3 = 'd99;
				Read_Data4 = 'd99;
				Read_Data5 = 'd99;
				Read_Data6 = 'd99;
				Read_Data7 = 'd99;			
			end
		endcase
		
	end
endmodule