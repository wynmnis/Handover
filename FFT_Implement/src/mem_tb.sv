  `include "define.sv"
  //`include "AGU_1.sv"
  //`include "AGU_2.sv" 
  `include "mem_wrapper.sv"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:TOP           TOP                                                                                                                                 
 //==============================================                                                
 `timescale 1ns/1ps   
 `define CYCLE 5.0 // Cycle time
 `define MAX 100000 // Max cycle number
 `define period 20

 
  module mem_wrapper_tb; 
  
   	reg clk;
	reg rst_n;
	reg write;
	reg [`BANK_WIDTH-1:0] bank0; //first data we want to access
	reg [`BANK_WIDTH-1:0] bank1; 
	reg [`BANK_WIDTH-1:0] bank2; 
	reg [`BANK_WIDTH-1:0] bank3; 
	reg [`BANK_WIDTH-1:0] bank4; 
	reg [`BANK_WIDTH-1:0] bank5; 
	reg [`BANK_WIDTH-1:0] bank6; 
	reg [`ADDR_WIDTH-1:0] addr0; //first address we want to access
	reg [`ADDR_WIDTH-1:0] addr1; 
	reg [`ADDR_WIDTH-1:0] addr2; 
	reg [`ADDR_WIDTH-1:0] addr3; 
	reg [`ADDR_WIDTH-1:0] addr4; 
	reg [`ADDR_WIDTH-1:0] addr5; 
	reg [`ADDR_WIDTH-1:0] addr6; 
	reg [`DATA_WIDTH-1:0] mem_IN_0;
	reg [`DATA_WIDTH-1:0] mem_IN_1;
	reg [`DATA_WIDTH-1:0] mem_IN_2;
	reg [`DATA_WIDTH-1:0] mem_IN_3;
	reg [`DATA_WIDTH-1:0] mem_IN_4;
	reg [`DATA_WIDTH-1:0] mem_IN_5; 
	reg [`DATA_WIDTH-1:0] mem_IN_6;

	wire [`DATA_WIDTH-1:0] mem_OUT_0; 
	wire [`DATA_WIDTH-1:0] mem_OUT_1; 
	wire [`DATA_WIDTH-1:0] mem_OUT_2; 
	wire [`DATA_WIDTH-1:0] mem_OUT_3; 
	wire [`DATA_WIDTH-1:0] mem_OUT_4; 
	wire [`DATA_WIDTH-1:0] mem_OUT_5; 
	wire [`DATA_WIDTH-1:0] mem_OUT_6; 

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

	



	always #(`CYCLE/2) clk = ~clk;	

	integer i;
	integer n;
	string prog_path;
	
	
	initial begin
		clk = 0; rst_n = 1;	
		#(`CYCLE) rst_n = 0;
	//end
/*	
		for( n = 0; n < 20; n = n + 1) begin
			$display("%d", MEM_WRAPPER.GG[0].sram.mem[n]);
		end

		#(`CYCLE) rst_n = 0;
		 write = 1; //write
		 bank0 = 'd0 ;
		 addr0 = 'd0 ;
		 mem_IN_0 = 'd99;
		 
		#(`CYCLE) 
		 write = 1; //read
		 bank0 = 'd0 ;
		 addr0 = 'd0 ;
		 //mem_IN_0 = 'd99;		 
*/		
		#(`CYCLE) 
		 write = 1; //read
		 bank0 = 'd0 ;
		 bank1 = 'd1 ;
		 bank2 = 'd2 ;
		 bank3 = 'd3 ;
		 bank4 = 'd4 ;
		 bank5 = 'd5 ;
		 bank6 = 'd6 ;
		 addr0 = 'd5 ;
		 addr1 = 'd1 ;
		 addr2 = 'd2 ;
		 addr3 = 'd3 ;
		 addr4 = 'd4 ;
		 addr5 = 'd5 ;
		 addr6 = 'd6 ;		
		 
		 #(`CYCLE) 
		 write = 1; //read
		 bank0 = 'd1 ;
		 bank1 = 'd8 ;
		 bank2 = 'd9 ;
		 bank3 = 'd10 ;
		 bank4 = 'd11 ;
		 bank5 = 'd12 ;
		 bank6 = 'd13 ;
		 addr0 = 'd11 ;
		 addr1 = 'd2 ;
		 addr2 = 'd4 ;
		 addr3 = 'd6 ;
		 addr4 = 'd8 ;
		 addr5 = 'd10 ;
		 addr6 = 'd12 ;	

		 #(`CYCLE) 
		 write = 1; //read
		 bank0 = 'd0 ;
		 bank1 = 'd15 ;
		 bank2 = 'd16 ;
		 bank3 = 'd17 ;
		 bank4 = 'd18 ;
		 bank5 = 'd19 ;
		 bank6 = 'd20 ;
		 addr0 = 'd4 ;
		 addr1 = 'd3 ;
		 addr2 = 'd5 ;
		 addr3 = 'd7 ;
		 addr4 = 'd9 ;
		 addr5 = 'd11 ;
		 addr6 = 'd13 ;		
		 
		 #(`CYCLE) 
		 write = 1; //read
		 bank0 = 'd1 ;
		 bank1 = 'd8 ;
		 bank2 = 'd9 ;
		 bank3 = 'd10 ;
		 bank4 = 'd11 ;
		 bank5 = 'd12 ;
		 bank6 = 'd13 ;
		 addr0 = 'd11 ;
		 addr1 = 'd2 ;
		 addr2 = 'd4 ;
		 addr3 = 'd6 ;
		 addr4 = 'd8 ;
		 addr5 = 'd10 ;
		 addr6 = 'd12 ;	
		 
		 #(`CYCLE) 
		 write = 0; //read
		 bank0 = 'd0 ;
		 bank1 = 'd8 ;
		 bank2 = 'd9 ;
		 bank3 = 'd10 ;
		 bank4 = 'd11 ;
		 bank5 = 'd12 ;
		 bank6 = 'd13 ;
		 addr0 = 'd1 ;
		 addr1 = 'd2 ;
		 addr2 = 'd4 ;
		 addr3 = 'd6 ;
		 addr4 = 'd8 ;
		 addr5 = 'd10 ;
		 addr6 = 'd12 ;	
		 mem_IN_0 = 'd999;		 
		 #(`CYCLE) 
		 write = 1; //read
		 bank0 = 'd1 ;
		 bank1 = 'd8 ;
		 bank2 = 'd9 ;
		 bank3 = 'd10 ;
		 bank4 = 'd11 ;
		 bank5 = 'd12 ;
		 bank6 = 'd13 ;
		 addr0 = 'd11 ;
		 addr1 = 'd2 ;
		 addr2 = 'd4 ;
		 addr3 = 'd6 ;
		 addr4 = 'd8 ;
		 addr5 = 'd10 ;
		 addr6 = 'd12 ;	
		 #(`CYCLE) 
		 write = 1; //read
		 bank0 = 'd0 ;
		 bank1 = 'd8 ;
		 bank2 = 'd9 ;
		 bank3 = 'd10 ;
		 bank4 = 'd11 ;
		 bank5 = 'd12 ;
		 bank6 = 'd13 ;
		 addr0 = 'd11 ;
		 addr1 = 'd2 ;
		 addr2 = 'd4 ;
		 addr3 = 'd6 ;
		 addr4 = 'd8 ;
		 addr5 = 'd10 ;
		 addr6 = 'd12 ;	
		 
		 #(`CYCLE) 
		 write = 0; //read
		 bank0 = 'd0 ;
		 bank1 = 'd8 ;
		 bank2 = 'd9 ;
		 bank3 = 'd10 ;
		 bank4 = 'd11 ;
		 bank5 = 'd12 ;
		 bank6 = 'd13 ;
		 addr0 = 'd11 ;
		 addr1 = 'd2 ;
		 addr2 = 'd4 ;
		 addr3 = 'd6 ;
		 addr4 = 'd8 ;
		 addr5 = 'd10 ;
		 addr6 = 'd12 ;	
		 mem_IN_0 = 'd998;	
		 
		 #(`CYCLE) 
		 #(50*`CYCLE);
		 #(50*`CYCLE);
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


	//for( i = 0; i < 60; i = i + 1)	begin
		for( n = 0; n < 2048; n = n + 1) begin
			MEM_WRAPPER.GG[0].sram.mem[n] =  Mem_0[n];
			MEM_WRAPPER.GG[1].sram.mem[n] =  Mem_1[n];
			MEM_WRAPPER.GG[2].sram.mem[n] =  Mem_2[n];
			MEM_WRAPPER.GG[3].sram.mem[n] =  Mem_3[n];
			MEM_WRAPPER.GG[4].sram.mem[n] =  Mem_4[n];
			MEM_WRAPPER.GG[5].sram.mem[n] =  Mem_5[n];
			MEM_WRAPPER.GG[6].sram.mem[n] =  Mem_6[n];	
			MEM_WRAPPER.GG[7].sram.mem[n] =  Mem_7[n];
			MEM_WRAPPER.GG[8].sram.mem[n] =  Mem_8[n];
			MEM_WRAPPER.GG[9].sram.mem[n] =  Mem_9[n];
			MEM_WRAPPER.GG[10].sram.mem[n] = Mem_10[n];
			MEM_WRAPPER.GG[11].sram.mem[n] = Mem_11[n];
			MEM_WRAPPER.GG[12].sram.mem[n] = Mem_12[n];
			MEM_WRAPPER.GG[13].sram.mem[n] = Mem_13[n];
			MEM_WRAPPER.GG[14].sram.mem[n] = Mem_14[n];
			MEM_WRAPPER.GG[15].sram.mem[n] = Mem_15[n];
			MEM_WRAPPER.GG[16].sram.mem[n] = Mem_16[n];
			MEM_WRAPPER.GG[17].sram.mem[n] = Mem_17[n];
			MEM_WRAPPER.GG[18].sram.mem[n] = Mem_18[n];
			MEM_WRAPPER.GG[19].sram.mem[n] = Mem_19[n];
			MEM_WRAPPER.GG[20].sram.mem[n] = Mem_20[n];
			MEM_WRAPPER.GG[21].sram.mem[n] = Mem_21[n];
			MEM_WRAPPER.GG[22].sram.mem[n] = Mem_22[n];
			MEM_WRAPPER.GG[23].sram.mem[n] = Mem_23[n];
			MEM_WRAPPER.GG[24].sram.mem[n] = Mem_24[n];
			MEM_WRAPPER.GG[25].sram.mem[n] = Mem_25[n];
			MEM_WRAPPER.GG[26].sram.mem[n] = Mem_26[n];
			MEM_WRAPPER.GG[27].sram.mem[n] = Mem_27[n];
			MEM_WRAPPER.GG[28].sram.mem[n] = Mem_28[n];
			MEM_WRAPPER.GG[29].sram.mem[n] = Mem_29[n];
			MEM_WRAPPER.GG[30].sram.mem[n] = Mem_30[n];
			MEM_WRAPPER.GG[31].sram.mem[n] = Mem_31[n];
			MEM_WRAPPER.GG[32].sram.mem[n] = Mem_32[n];
			MEM_WRAPPER.GG[33].sram.mem[n] = Mem_33[n];
			MEM_WRAPPER.GG[34].sram.mem[n] = Mem_34[n];
			MEM_WRAPPER.GG[35].sram.mem[n] = Mem_35[n];
			MEM_WRAPPER.GG[36].sram.mem[n] = Mem_36[n];
			MEM_WRAPPER.GG[37].sram.mem[n] = Mem_37[n];
			MEM_WRAPPER.GG[38].sram.mem[n] = Mem_38[n];
			MEM_WRAPPER.GG[39].sram.mem[n] = Mem_39[n];
			MEM_WRAPPER.GG[40].sram.mem[n] = Mem_40[n];
			MEM_WRAPPER.GG[41].sram.mem[n] = Mem_41[n];
			MEM_WRAPPER.GG[42].sram.mem[n] = Mem_42[n];
			MEM_WRAPPER.GG[43].sram.mem[n] = Mem_43[n];
			MEM_WRAPPER.GG[44].sram.mem[n] = Mem_44[n];
			MEM_WRAPPER.GG[45].sram.mem[n] = Mem_45[n];
			MEM_WRAPPER.GG[46].sram.mem[n] = Mem_46[n];
			MEM_WRAPPER.GG[47].sram.mem[n] = Mem_47[n];
			MEM_WRAPPER.GG[48].sram.mem[n] = Mem_48[n];
			MEM_WRAPPER.GG[49].sram.mem[n] = Mem_49[n];
			MEM_WRAPPER.GG[50].sram.mem[n] = Mem_50[n];
			MEM_WRAPPER.GG[51].sram.mem[n] = Mem_51[n];
			MEM_WRAPPER.GG[52].sram.mem[n] = Mem_52[n];
			MEM_WRAPPER.GG[53].sram.mem[n] = Mem_53[n];
			MEM_WRAPPER.GG[54].sram.mem[n] = Mem_54[n];
			MEM_WRAPPER.GG[55].sram.mem[n] = Mem_55[n];
			MEM_WRAPPER.GG[56].sram.mem[n] = Mem_56[n];
			MEM_WRAPPER.GG[57].sram.mem[n] = Mem_57[n];
			MEM_WRAPPER.GG[58].sram.mem[n] = Mem_58[n];
			MEM_WRAPPER.GG[59].sram.mem[n] = Mem_59[n];
			MEM_WRAPPER.GG[60].sram.mem[n] = Mem_60[n];
		end
	//end
end
	
mem_wrapper MEM_WRAPPER(    
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

	 initial begin
		$dumpvars();
		$dumpfile("mem_tb.vcd");
		//$fsdbDumpfile("mem_tb.fsdb");
		//$fsdbDumpvars("+struct", "+mda", MEM_WRAPPER);
		
	end	
	
	endmodule
	
	
	