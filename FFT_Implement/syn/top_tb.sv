  `timescale 1ns/1ps    
  `include "../src/define.sv"
  `include "top_syn.v"  
  `include "/usr/cad/synopsys/CBDK_TSMC90GUTM_Arm_f1.0/CIC/Verilog/tsmc090.v"
  //`include "SRAM_SP_2048.v"
  //`include "../mem/SRAM_SP_2048.v"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:TOP           TOP                                                                                                                                 
 //==============================================                                                 
 `define CYCLE 4.0 // Cycle time
 `define MAX 262000 // Max cycle number


 
  module top_tb; 
  
   	logic clk;
	logic rst_n;
	logic start;
	logic [`DATA_WIDTH-1:0]modular;
	logic done;
	string prog_path;
	string output_path;

	integer i;
	integer n;	
	integer mem_out[61];
	assign modular = 'd55822321;

	logic [63:0] Mem_0 [2048];
	logic [63:0] Mem_1 [2048];
	logic [63:0] Mem_2 [2048];
	logic [63:0] Mem_3 [2048];
	logic [63:0] Mem_4 [2048];
	logic [63:0] Mem_5 [2048];
	logic [63:0] Mem_6 [2048];
	logic [63:0] Mem_7 [2048];
	logic [63:0] Mem_8 [2048];
	logic [63:0] Mem_9 [2048];
	logic [63:0] Mem_10[2048];
	logic [63:0] Mem_11[2048];
	logic [63:0] Mem_12[2048];
	logic [63:0] Mem_13[2048];
	logic [63:0] Mem_14[2048];
	logic [63:0] Mem_15[2048];
	logic [63:0] Mem_16[2048];
	logic [63:0] Mem_17[2048];
	logic [63:0] Mem_18[2048];
	logic [63:0] Mem_19[2048];
	logic [63:0] Mem_20[2048];
	logic [63:0] Mem_21[2048];
	logic [63:0] Mem_22[2048];
	logic [63:0] Mem_23[2048];
	logic [63:0] Mem_24[2048];
	logic [63:0] Mem_25[2048];
	logic [63:0] Mem_26[2048];
	logic [63:0] Mem_27[2048];
	logic [63:0] Mem_28[2048];
	logic [63:0] Mem_29[2048];
	logic [63:0] Mem_30[2048];
	logic [63:0] Mem_31[2048];
	logic [63:0] Mem_32[2048];
	logic [63:0] Mem_33[2048];
	logic [63:0] Mem_34[2048];
	logic [63:0] Mem_35[2048];
	logic [63:0] Mem_36[2048];
	logic [63:0] Mem_37[2048];
	logic [63:0] Mem_38[2048];
	logic [63:0] Mem_39[2048];
	logic [63:0] Mem_40[2048];
	logic [63:0] Mem_41[2048];
	logic [63:0] Mem_42[2048];
	logic [63:0] Mem_43[2048];
	logic [63:0] Mem_44[2048];
	logic [63:0] Mem_45[2048];
	logic [63:0] Mem_46[2048];
	logic [63:0] Mem_47[2048];
	logic [63:0] Mem_48[2048];
	logic [63:0] Mem_49[2048];
	logic [63:0] Mem_50[2048];
	logic [63:0] Mem_51[2048];
	logic [63:0] Mem_52[2048];
	logic [63:0] Mem_53[2048];
	logic [63:0] Mem_54[2048];
	logic [63:0] Mem_55[2048];
	logic [63:0] Mem_56[2048];
	logic [63:0] Mem_57[2048];
	logic [63:0] Mem_58[2048];
	logic [63:0] Mem_59[2048];
	logic [63:0] Mem_60[2048];
	
	//logic [63:0] Mem_out[61][2048];
	always #(`CYCLE*0.5) clk = ~clk;	


top TOP(                                       
    .clk  (clk  )   ,  
    .rst_n(rst_n)   ,
	.start(start)	,
	.modular(modular),
	.done(done)
 ); 

    initial $sdf_annotate("top_syn.sdf", TOP);

	initial begin
		$value$plusargs("output_path=%s", output_path);
		clk = 0; 
		rst_n = 1;
		start = 0;		
		#(`CYCLE)
		rst_n = 0;
		start = 1;
		
		while (1)
		begin
			#(`CYCLE)
			if(done) break;
		end

				mem_out[0] =  $fopen({output_path, "/mem_0_out.txt" }, "w");
				mem_out[1] =  $fopen({output_path, "/mem_1_out.txt" }, "w");
				mem_out[2] =  $fopen({output_path, "/mem_2_out.txt" }, "w");
				mem_out[3] =  $fopen({output_path, "/mem_3_out.txt" }, "w");
				mem_out[4] =  $fopen({output_path, "/mem_4_out.txt" }, "w");
				mem_out[5] =  $fopen({output_path, "/mem_5_out.txt" }, "w");
				mem_out[6] =  $fopen({output_path, "/mem_6_out.txt" }, "w");
				mem_out[7] =  $fopen({output_path, "/mem_7_out.txt" }, "w");
				mem_out[8] =  $fopen({output_path, "/mem_8_out.txt" }, "w");
				mem_out[9] =  $fopen({output_path, "/mem_9_out.txt" }, "w");
				mem_out[10] = $fopen({output_path, "/mem_10_out.txt"}, "w");
				mem_out[11] = $fopen({output_path, "/mem_11_out.txt"}, "w");
				mem_out[12] = $fopen({output_path, "/mem_12_out.txt"}, "w");
				mem_out[13] = $fopen({output_path, "/mem_13_out.txt"}, "w");
				mem_out[14] = $fopen({output_path, "/mem_14_out.txt"}, "w");
				mem_out[15] = $fopen({output_path, "/mem_15_out.txt"}, "w");
				mem_out[16] = $fopen({output_path, "/mem_16_out.txt"}, "w");
				mem_out[17] = $fopen({output_path, "/mem_17_out.txt"}, "w");
				mem_out[18] = $fopen({output_path, "/mem_18_out.txt"}, "w");
				mem_out[19] = $fopen({output_path, "/mem_19_out.txt"}, "w");
				mem_out[20] = $fopen({output_path, "/mem_20_out.txt"}, "w");
				mem_out[21] = $fopen({output_path, "/mem_21_out.txt"}, "w");
				mem_out[22] = $fopen({output_path, "/mem_22_out.txt"}, "w");
				mem_out[23] = $fopen({output_path, "/mem_23_out.txt"}, "w");
				mem_out[24] = $fopen({output_path, "/mem_24_out.txt"}, "w");
				mem_out[25] = $fopen({output_path, "/mem_25_out.txt"}, "w");
				mem_out[26] = $fopen({output_path, "/mem_26_out.txt"}, "w");
				mem_out[27] = $fopen({output_path, "/mem_27_out.txt"}, "w");
				mem_out[28] = $fopen({output_path, "/mem_28_out.txt"}, "w");
				mem_out[29] = $fopen({output_path, "/mem_29_out.txt"}, "w");
				mem_out[30] = $fopen({output_path, "/mem_30_out.txt"}, "w");
				mem_out[31] = $fopen({output_path, "/mem_31_out.txt"}, "w");
				mem_out[32] = $fopen({output_path, "/mem_32_out.txt"}, "w");
				mem_out[33] = $fopen({output_path, "/mem_33_out.txt"}, "w");
				mem_out[34] = $fopen({output_path, "/mem_34_out.txt"}, "w");
				mem_out[35] = $fopen({output_path, "/mem_35_out.txt"}, "w");
				mem_out[36] = $fopen({output_path, "/mem_36_out.txt"}, "w");
				mem_out[37] = $fopen({output_path, "/mem_37_out.txt"}, "w");
				mem_out[38] = $fopen({output_path, "/mem_38_out.txt"}, "w");
				mem_out[39] = $fopen({output_path, "/mem_39_out.txt"}, "w");
				mem_out[40] = $fopen({output_path, "/mem_40_out.txt"}, "w");
				mem_out[41] = $fopen({output_path, "/mem_41_out.txt"}, "w");
				mem_out[42] = $fopen({output_path, "/mem_42_out.txt"}, "w");
				mem_out[43] = $fopen({output_path, "/mem_43_out.txt"}, "w");
				mem_out[44] = $fopen({output_path, "/mem_44_out.txt"}, "w");
				mem_out[45] = $fopen({output_path, "/mem_45_out.txt"}, "w");
				mem_out[46] = $fopen({output_path, "/mem_46_out.txt"}, "w");
				mem_out[47] = $fopen({output_path, "/mem_47_out.txt"}, "w");
				mem_out[48] = $fopen({output_path, "/mem_48_out.txt"}, "w");
				mem_out[49] = $fopen({output_path, "/mem_49_out.txt"}, "w");
				mem_out[50] = $fopen({output_path, "/mem_50_out.txt"}, "w");
				mem_out[51] = $fopen({output_path, "/mem_51_out.txt"}, "w");
				mem_out[52] = $fopen({output_path, "/mem_52_out.txt"}, "w");
				mem_out[53] = $fopen({output_path, "/mem_53_out.txt"}, "w");
				mem_out[54] = $fopen({output_path, "/mem_54_out.txt"}, "w");
				mem_out[55] = $fopen({output_path, "/mem_55_out.txt"}, "w");
				mem_out[56] = $fopen({output_path, "/mem_56_out.txt"}, "w");
				mem_out[57] = $fopen({output_path, "/mem_57_out.txt"}, "w");
				mem_out[58] = $fopen({output_path, "/mem_58_out.txt"}, "w");
				mem_out[59] = $fopen({output_path, "/mem_59_out.txt"}, "w");
				mem_out[60] = $fopen({output_path, "/mem_60_out.txt"}, "w");
			
		
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[0 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_0__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[1 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_1__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[2 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_2__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[3 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_3__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[4 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_4__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[5 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_5__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[6 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_6__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[7 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_7__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[8 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_8__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[9 ], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_9__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[10], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_10__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[11], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_11__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[12], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_12__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[13], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_13__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[14], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_14__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[15], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_15__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[16], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_16__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[17], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_17__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[18], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_18__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[19], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_19__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[20], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_20__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[21], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_21__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[22], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_22__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[23], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_23__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[24], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_24__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[25], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_25__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[26], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_26__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[27], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_27__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[28], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_28__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[29], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_29__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[30], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_30__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[31], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_31__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[32], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_32__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[33], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_33__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[34], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_34__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[35], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_35__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[36], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_36__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[37], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_37__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[38], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_38__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[39], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_39__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[40], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_40__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[41], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_41__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[42], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_42__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[43], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_43__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[44], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_44__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[45], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_45__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[46], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_46__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[47], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_47__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[48], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_48__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[49], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_49__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[50], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_50__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[51], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_51__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[52], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_52__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[53], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_53__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[54], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_54__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[55], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_55__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[56], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_56__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[57], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_57__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[58], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_58__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[59], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_59__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[60], "%d\n", TOP.PING_PONG_MEM_GROUP_0.GG_60__sram.mem[n])	; end

/*
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[0 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_0__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[1 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_1__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[2 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_2__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[3 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_3__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[4 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_4__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[5 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_5__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[6 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_6__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[7 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_7__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[8 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_8__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[9 ], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_9__sram.mem[n] )	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[10], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_10__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[11], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_11__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[12], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_12__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[13], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_13__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[14], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_14__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[15], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_15__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[16], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_16__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[17], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_17__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[18], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_18__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[19], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_19__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[20], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_20__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[21], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_21__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[22], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_22__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[23], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_23__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[24], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_24__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[25], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_25__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[26], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_26__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[27], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_27__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[28], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_28__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[29], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_29__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[30], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_30__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[31], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_31__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[32], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_32__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[33], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_33__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[34], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_34__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[35], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_35__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[36], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_36__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[37], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_37__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[38], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_38__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[39], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_39__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[40], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_40__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[41], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_41__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[42], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_42__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[43], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_43__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[44], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_44__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[45], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_45__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[46], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_46__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[47], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_47__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[48], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_48__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[49], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_49__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[50], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_50__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[51], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_51__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[52], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_52__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[53], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_53__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[54], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_54__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[55], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_55__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[56], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_56__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[57], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_57__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[58], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_58__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[59], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_59__sram.mem[n])	; end
		for( n = 0; n < 2048; n = n + 1) begin $fwrite(mem_out[60], "%d\n", TOP.PING_PONG_MEM.GROUP_0.GG_60__sram.mem[n])	; end
*/		
		$display("sucess !\n");
		$finish;		
		
	end	

	
	

	
	initial begin
	    $value$plusargs("prog_path=%s", prog_path);
		#(2*`CYCLE) 
		$readmemh({prog_path, "/bank_0.txt" },  Mem_0 );
		$readmemh({prog_path, "/bank_1.txt" },  Mem_1 );
		$readmemh({prog_path, "/bank_2.txt" },  Mem_2 );
		$readmemh({prog_path, "/bank_3.txt" },  Mem_3 );
		$readmemh({prog_path, "/bank_4.txt" },  Mem_4 );
		$readmemh({prog_path, "/bank_5.txt" },  Mem_5 );
		$readmemh({prog_path, "/bank_6.txt" },  Mem_6 );
		$readmemh({prog_path, "/bank_7.txt" },  Mem_7 );
		$readmemh({prog_path, "/bank_8.txt" },  Mem_8 );
		$readmemh({prog_path, "/bank_9.txt" },  Mem_9 );
		$readmemh({prog_path, "/bank_10.txt"}, Mem_10);
		$readmemh({prog_path, "/bank_11.txt"}, Mem_11);
		$readmemh({prog_path, "/bank_12.txt"}, Mem_12);
		$readmemh({prog_path, "/bank_13.txt"}, Mem_13);
		$readmemh({prog_path, "/bank_14.txt"}, Mem_14);
		$readmemh({prog_path, "/bank_15.txt"}, Mem_15);
		$readmemh({prog_path, "/bank_16.txt"}, Mem_16);
		$readmemh({prog_path, "/bank_17.txt"}, Mem_17);
		$readmemh({prog_path, "/bank_18.txt"}, Mem_18);
		$readmemh({prog_path, "/bank_19.txt"}, Mem_19);
		$readmemh({prog_path, "/bank_20.txt"}, Mem_20);
		$readmemh({prog_path, "/bank_21.txt"}, Mem_21);
		$readmemh({prog_path, "/bank_22.txt"}, Mem_22);
		$readmemh({prog_path, "/bank_23.txt"}, Mem_23);
		$readmemh({prog_path, "/bank_24.txt"}, Mem_24);
		$readmemh({prog_path, "/bank_25.txt"}, Mem_25);
		$readmemh({prog_path, "/bank_26.txt"}, Mem_26);
		$readmemh({prog_path, "/bank_27.txt"}, Mem_27);
		$readmemh({prog_path, "/bank_28.txt"}, Mem_28);
		$readmemh({prog_path, "/bank_29.txt"}, Mem_29);
		$readmemh({prog_path, "/bank_30.txt"}, Mem_30);
		$readmemh({prog_path, "/bank_31.txt"}, Mem_31);
		$readmemh({prog_path, "/bank_32.txt"}, Mem_32);
		$readmemh({prog_path, "/bank_33.txt"}, Mem_33);
		$readmemh({prog_path, "/bank_34.txt"}, Mem_34);
		$readmemh({prog_path, "/bank_35.txt"}, Mem_35);
		$readmemh({prog_path, "/bank_36.txt"}, Mem_36);
		$readmemh({prog_path, "/bank_37.txt"}, Mem_37);
		$readmemh({prog_path, "/bank_38.txt"}, Mem_38);
		$readmemh({prog_path, "/bank_39.txt"}, Mem_39);
		$readmemh({prog_path, "/bank_40.txt"}, Mem_40);
		$readmemh({prog_path, "/bank_41.txt"}, Mem_41);
		$readmemh({prog_path, "/bank_42.txt"}, Mem_42);
		$readmemh({prog_path, "/bank_43.txt"}, Mem_43);
		$readmemh({prog_path, "/bank_44.txt"}, Mem_44);
		$readmemh({prog_path, "/bank_45.txt"}, Mem_45);
		$readmemh({prog_path, "/bank_46.txt"}, Mem_46);
		$readmemh({prog_path, "/bank_47.txt"}, Mem_47);
		$readmemh({prog_path, "/bank_48.txt"}, Mem_48);
		$readmemh({prog_path, "/bank_49.txt"}, Mem_49);
		$readmemh({prog_path, "/bank_50.txt"}, Mem_50);
		$readmemh({prog_path, "/bank_51.txt"}, Mem_51);
		$readmemh({prog_path, "/bank_52.txt"}, Mem_52);
		$readmemh({prog_path, "/bank_53.txt"}, Mem_53);
		$readmemh({prog_path, "/bank_54.txt"}, Mem_54);
		$readmemh({prog_path, "/bank_55.txt"}, Mem_55);
		$readmemh({prog_path, "/bank_56.txt"}, Mem_56);
		$readmemh({prog_path, "/bank_57.txt"}, Mem_57);
		$readmemh({prog_path, "/bank_58.txt"}, Mem_58);
		$readmemh({prog_path, "/bank_59.txt"}, Mem_59);
		$readmemh({prog_path, "/bank_60.txt"}, Mem_60);
/*
		for( n = 0; n < 20; n = n + 1) begin
			$display("%d", Mem_0[n])		;
		end
*/	
		
		for( n = 0; n < 2048; n = n + 1) begin
			TOP.PING_PONG_MEM_GROUP_0.GG_0__sram.mem[n] =  Mem_0[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_1__sram.mem[n] =  Mem_1[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_2__sram.mem[n] =  Mem_2[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_3__sram.mem[n] =  Mem_3[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_4__sram.mem[n] =  Mem_4[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_5__sram.mem[n] =  Mem_5[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_6__sram.mem[n] =  Mem_6[n];	
			TOP.PING_PONG_MEM_GROUP_0.GG_7__sram.mem[n] =  Mem_7[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_8__sram.mem[n] =  Mem_8[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_9__sram.mem[n] =  Mem_9[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_10__sram.mem[n] = Mem_10[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_11__sram.mem[n] = Mem_11[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_12__sram.mem[n] = Mem_12[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_13__sram.mem[n] = Mem_13[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_14__sram.mem[n] = Mem_14[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_15__sram.mem[n] = Mem_15[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_16__sram.mem[n] = Mem_16[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_17__sram.mem[n] = Mem_17[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_18__sram.mem[n] = Mem_18[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_19__sram.mem[n] = Mem_19[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_20__sram.mem[n] = Mem_20[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_21__sram.mem[n] = Mem_21[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_22__sram.mem[n] = Mem_22[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_23__sram.mem[n] = Mem_23[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_24__sram.mem[n] = Mem_24[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_25__sram.mem[n] = Mem_25[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_26__sram.mem[n] = Mem_26[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_27__sram.mem[n] = Mem_27[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_28__sram.mem[n] = Mem_28[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_29__sram.mem[n] = Mem_29[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_30__sram.mem[n] = Mem_30[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_31__sram.mem[n] = Mem_31[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_32__sram.mem[n] = Mem_32[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_33__sram.mem[n] = Mem_33[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_34__sram.mem[n] = Mem_34[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_35__sram.mem[n] = Mem_35[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_36__sram.mem[n] = Mem_36[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_37__sram.mem[n] = Mem_37[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_38__sram.mem[n] = Mem_38[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_39__sram.mem[n] = Mem_39[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_40__sram.mem[n] = Mem_40[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_41__sram.mem[n] = Mem_41[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_42__sram.mem[n] = Mem_42[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_43__sram.mem[n] = Mem_43[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_44__sram.mem[n] = Mem_44[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_45__sram.mem[n] = Mem_45[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_46__sram.mem[n] = Mem_46[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_47__sram.mem[n] = Mem_47[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_48__sram.mem[n] = Mem_48[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_49__sram.mem[n] = Mem_49[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_50__sram.mem[n] = Mem_50[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_51__sram.mem[n] = Mem_51[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_52__sram.mem[n] = Mem_52[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_53__sram.mem[n] = Mem_53[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_54__sram.mem[n] = Mem_54[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_55__sram.mem[n] = Mem_55[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_56__sram.mem[n] = Mem_56[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_57__sram.mem[n] = Mem_57[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_58__sram.mem[n] = Mem_58[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_59__sram.mem[n] = Mem_59[n];
			TOP.PING_PONG_MEM_GROUP_0.GG_60__sram.mem[n] = Mem_60[n];
		end
		/*
		for( n = 0; n < 2048; n = n + 1) begin
			TOP.PING_PONG_MEM.GROUP_0.GG_0__sram.mem[n] =  Mem_0[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_1__sram.mem[n] =  Mem_1[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_2__sram.mem[n] =  Mem_2[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_3__sram.mem[n] =  Mem_3[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_4__sram.mem[n] =  Mem_4[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_5__sram.mem[n] =  Mem_5[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_6__sram.mem[n] =  Mem_6[n];	
			TOP.PING_PONG_MEM.GROUP_0.GG_7__sram.mem[n] =  Mem_7[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_8__sram.mem[n] =  Mem_8[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_9__sram.mem[n] =  Mem_9[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_10__sram.mem[n] = Mem_10[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_11__sram.mem[n] = Mem_11[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_12__sram.mem[n] = Mem_12[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_13__sram.mem[n] = Mem_13[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_14__sram.mem[n] = Mem_14[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_15__sram.mem[n] = Mem_15[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_16__sram.mem[n] = Mem_16[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_17__sram.mem[n] = Mem_17[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_18__sram.mem[n] = Mem_18[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_19__sram.mem[n] = Mem_19[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_20__sram.mem[n] = Mem_20[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_21__sram.mem[n] = Mem_21[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_22__sram.mem[n] = Mem_22[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_23__sram.mem[n] = Mem_23[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_24__sram.mem[n] = Mem_24[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_25__sram.mem[n] = Mem_25[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_26__sram.mem[n] = Mem_26[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_27__sram.mem[n] = Mem_27[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_28__sram.mem[n] = Mem_28[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_29__sram.mem[n] = Mem_29[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_30__sram.mem[n] = Mem_30[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_31__sram.mem[n] = Mem_31[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_32__sram.mem[n] = Mem_32[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_33__sram.mem[n] = Mem_33[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_34__sram.mem[n] = Mem_34[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_35__sram.mem[n] = Mem_35[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_36__sram.mem[n] = Mem_36[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_37__sram.mem[n] = Mem_37[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_38__sram.mem[n] = Mem_38[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_39__sram.mem[n] = Mem_39[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_40__sram.mem[n] = Mem_40[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_41__sram.mem[n] = Mem_41[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_42__sram.mem[n] = Mem_42[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_43__sram.mem[n] = Mem_43[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_44__sram.mem[n] = Mem_44[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_45__sram.mem[n] = Mem_45[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_46__sram.mem[n] = Mem_46[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_47__sram.mem[n] = Mem_47[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_48__sram.mem[n] = Mem_48[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_49__sram.mem[n] = Mem_49[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_50__sram.mem[n] = Mem_50[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_51__sram.mem[n] = Mem_51[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_52__sram.mem[n] = Mem_52[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_53__sram.mem[n] = Mem_53[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_54__sram.mem[n] = Mem_54[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_55__sram.mem[n] = Mem_55[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_56__sram.mem[n] = Mem_56[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_57__sram.mem[n] = Mem_57[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_58__sram.mem[n] = Mem_58[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_59__sram.mem[n] = Mem_59[n];
			TOP.PING_PONG_MEM.GROUP_0.GG_60__sram.mem[n] = Mem_60[n];
		end
		*/
	    #(`CYCLE*`MAX)		
			$display("error !\n");
			$finish;
end





	 initial begin
		//$dumpvars();
		//$dumpfile("top_tb_test.vcd");
		//$fsdbDumpfile("top_tb.fsdb");
		//$fsdbDumpvars("+struct", "+mda", TOP);
		
	end	
	
	endmodule