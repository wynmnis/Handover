  `include "define.sv"
  `include "FFT_top.sv"  
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:TOP           TOP                                                                                                                                 
 //==============================================                                                
 `timescale 1ns/1ps   
 `define CYCLE 5.0 // Cycle time
 `define MAX 100000 // Max cycle number
 `define period 20
                                                                                                                                                                         
 module top_tb;                                                                                                                                                                           

	
	reg [2:0]ctrl_sig;
	reg clk;
	reg rst_n;
	reg [2:0]point;
	reg inverse;
	always #(`CYCLE/2) clk = ~clk;	
	
	wire FFT_LAST_STAGE ;
	
	wire [`DATA_WIDTH-1:0] mem_OUT_0;
	wire [`DATA_WIDTH-1:0] mem_OUT_1;
	wire [`DATA_WIDTH-1:0] mem_OUT_2;
	wire [`DATA_WIDTH-1:0] mem_OUT_3;
	wire [`DATA_WIDTH-1:0] mem_OUT_4;
	wire [`DATA_WIDTH-1:0] mem_OUT_5;
	wire [`DATA_WIDTH-1:0] mem_OUT_6;
	wire [`DATA_WIDTH-1:0] mem_OUT_7;

	wire [`DATA_WIDTH-1:0] FFT_IN_0;
	wire [`DATA_WIDTH-1:0] FFT_IN_1;
	wire [`DATA_WIDTH-1:0] FFT_IN_2;
	wire [`DATA_WIDTH-1:0] FFT_IN_3;	
	wire [`DATA_WIDTH-1:0] FFT_IN_4;
	wire [`DATA_WIDTH-1:0] FFT_IN_5;
	wire [`DATA_WIDTH-1:0] FFT_IN_6;
	wire [`DATA_WIDTH-1:0] FFT_IN_7;
	wire [`DATA_WIDTH-1:0] FFT_IN_8;
	wire [`DATA_WIDTH-1:0] FFT_IN_9;
	wire [`DATA_WIDTH-1:0] FFT_IN_10;
	wire [`DATA_WIDTH-1:0] FFT_IN_11;	

	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_0;
	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_1;
	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_2;
	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_3;	
	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_4;
	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_5;
	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_6;
	wire [`DATA_WIDTH-1:0] POINTWISE_COEF_7;	

	wire [`DATA_WIDTH-1:0] FFT_OUT_0;
	wire [`DATA_WIDTH-1:0] FFT_OUT_1;
	wire [`DATA_WIDTH-1:0] FFT_OUT_2;
	wire [`DATA_WIDTH-1:0] FFT_OUT_3;
	wire [`DATA_WIDTH-1:0] FFT_OUT_4;
	wire [`DATA_WIDTH-1:0] FFT_OUT_5;
	wire [`DATA_WIDTH-1:0] FFT_OUT_6;
	wire [`DATA_WIDTH-1:0] FFT_OUT_7;	

	wire [`DATA_WIDTH-1:0] mem_IN_0; 
	wire [`DATA_WIDTH-1:0] mem_IN_1;
	wire [`DATA_WIDTH-1:0] mem_IN_2;
	wire [`DATA_WIDTH-1:0] mem_IN_3;
	wire [`DATA_WIDTH-1:0] mem_IN_4;
	wire [`DATA_WIDTH-1:0] mem_IN_5;
	wire [`DATA_WIDTH-1:0] mem_IN_6;
	wire [`DATA_WIDTH-1:0] mem_IN_7;
	wire [`DATA_WIDTH-1:0] FFT_0;
	wire [`DATA_WIDTH-1:0] FFT_1;
	wire [`DATA_WIDTH-1:0] FFT_2;
	wire [`DATA_WIDTH-1:0] FFT_3;	
	wire [`DATA_WIDTH-1:0] FFT_4;
	wire [`DATA_WIDTH-1:0] FFT_5;
	wire [`DATA_WIDTH-1:0] FFT_6;
	wire [`DATA_WIDTH-1:0] FFT_7;	
	wire [`DATA_WIDTH-1:0] modular;


	assign FFT_LAST_STAGE = 0;
	assign FFT_0  = 10;
	assign FFT_1  = 2 ;
	assign FFT_2  = 32;
	assign FFT_3  = 44;
	assign FFT_4  = 5 ;
	assign FFT_5  = 67;
	assign FFT_6  = 7 ;
	assign FFT_7  = 6 ;	
	//assign modular = 1720321;
	assign modular = 50'd55822321;
	
    assign POINTWISE_COEF_0 = 1 ;
	assign POINTWISE_COEF_1 = 1 ;
	assign POINTWISE_COEF_2 = 1 ;
	assign POINTWISE_COEF_3 = 1 ;	
	assign POINTWISE_COEF_4 = 1 ;
	assign POINTWISE_COEF_5 = 1 ;
	assign POINTWISE_COEF_6 = 1 ;
	assign POINTWISE_COEF_7 = 1 ;

	initial begin
		// FFT test
		clk = 0; 
		rst_n = 1;
		point = 0;			
		inverse = 0;
		#(`CYCLE) rst_n = 0;

		#(`CYCLE)
		point = 5;			
		inverse = 0;
		#(`CYCLE) 		

		#(`CYCLE)
		point = 4;			
		inverse = 0;
		#(`CYCLE) 	

		#(`CYCLE) 
		point = 3;			
		inverse = 0;
		#(`CYCLE) 

		#(`CYCLE)
		point = 2;			
		inverse = 0;
		#(`CYCLE) 

		// IFFT test


		#(`CYCLE)
		point = 5;			
		inverse = 1;
		#(`CYCLE) 	

		#(`CYCLE)
		point = 4;			
		inverse = 1;
		#(`CYCLE) 	

		#(`CYCLE)
		point = 3;			
		inverse = 1;
		#(`CYCLE) 

		#(`CYCLE) 
		point = 2;			
		inverse = 1;
		#(`CYCLE) 









		
		#(`CYCLE*`MAX)
			$finish;			
	end

//	initial begin
//		$fsdbDumpfile("top.fsdb");
//		$fsdbDumpvars(0, fft_tb);
//	end
	
	initial begin
		$dumpvars();
		$dumpfile("FFT_tb.vcd");	
		//$fsdbDumpfile("FFT_tb.fsdb");
		//$fsdbDumpvars("+struct", "+mda", FFT_TOP);
	end	

FFT_top FFT_TOP(
	.clk     (clk     ), 
	.rst_n   (rst_n   ), 
	.FFT_0   (FFT_0   ),
    .FFT_1   (FFT_1   ),
    .FFT_2   (FFT_2   ),
    .FFT_3   (FFT_3   ),
	.FFT_4   (FFT_4   ),
    .FFT_5   (FFT_5   ),
    .FFT_6   (FFT_6   ),
    .FFT_7   (FFT_7   ),	
	.modular (modular ),
	.point   (point   ),
	.ctrl_sig(ctrl_sig),
	.inverse (inverse ),
	.FFT_LAST_STAGE(FFT_LAST_STAGE),
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

/*
FFT_IN_mux FFT_IN_MUX( 
	.point    (point),
	.mem_OUT_0(FFT_0),
	.mem_OUT_1(FFT_1),
	.mem_OUT_2(FFT_2),
	.mem_OUT_3(FFT_3),
	.mem_OUT_4(FFT_4),
	.mem_OUT_5(FFT_5),
	.mem_OUT_6(FFT_6),
	.FFT_IN_0(FFT_IN_0),
	.FFT_IN_1(FFT_IN_1),
	.FFT_IN_2(FFT_IN_2),
	.FFT_IN_3(FFT_IN_3),
	.FFT_IN_4(FFT_IN_4),
	.FFT_IN_5(FFT_IN_5),
	.FFT_IN_6(FFT_IN_6),
	.FFT_IN_7(FFT_IN_7),
	.FFT_IN_8(FFT_IN_8),
	.FFT_IN_9(FFT_IN_9)
 ); 

Config_FFT CONFIG_FFT(                                       
    .clk      (clk     ),  
    .rst_n    (rst_n   ),  
    .ctrl_sig (ctrl_sig),  
    .point    (point   ),
	.modular  (modular ),
	.inverse  (inverse ),	
	.FFT_LAST_STAGE(FFT_LAST_STAGE),	
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
    .FFT_OUT_0(FFT_OUT_0),
    .FFT_OUT_1(FFT_OUT_1),
    .FFT_OUT_2(FFT_OUT_2),
    .FFT_OUT_3(FFT_OUT_3),
    .FFT_OUT_4(FFT_OUT_4),
    .FFT_OUT_5(FFT_OUT_5),
    .FFT_OUT_6(FFT_OUT_6)	
 );

FFT_OUT_mux FFT_OUT_MUX( 
	.point    (point),
	.FFT_OUT_0(FFT_OUT_0),
    .FFT_OUT_1(FFT_OUT_1),
    .FFT_OUT_2(FFT_OUT_2),
    .FFT_OUT_3(FFT_OUT_3),
    .FFT_OUT_4(FFT_OUT_4),
    .FFT_OUT_5(FFT_OUT_5),
    .FFT_OUT_6(FFT_OUT_6),
    .mem_IN_0(mem_IN_0),
    .mem_IN_1(mem_IN_1),
    .mem_IN_2(mem_IN_2),
    .mem_IN_3(mem_IN_3),
    .mem_IN_4(mem_IN_4),
    .mem_IN_5(mem_IN_5),
    .mem_IN_6(mem_IN_6)
 ); 
*/




	
 endmodule    