  `include "define.sv"
  //`include "AGU_1.sv"
  //`include "AGU_2.sv" 
  `include "AGU_INTEGRATE.sv"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:TOP           TOP                                                                                                                                 
 //==============================================                                                
 `timescale 1ns/1ps   
 `define CYCLE 5.0 // Cycle time
 `define MAX 100000 // Max cycle number
 `define period 20
 
 
 module AGU_tb;    
 
 	reg [2:0]ctrl_sig;
	reg clk;
	reg rst_n;
	reg [2:0]point;
	reg point_2_mode;
	//reg [`INDEX_WIDTH_M-1:0]M1;
	//reg [`INDEX_WIDTH_N-1:0]N1;
	
	always #(`CYCLE/2) clk = ~clk;
 
 	 wire[`INDEX_WIDTH_M-1:0]m1_0;   
	 wire[`INDEX_WIDTH_M-1:0]m1_1;
	 wire[`INDEX_WIDTH_M-1:0]m1_2;
	 wire[`INDEX_WIDTH_M-1:0]m2_0;   
	 wire[`INDEX_WIDTH_M-1:0]m2_1;
	 wire[`INDEX_WIDTH_M-1:0]m2_2;
	
	reg [`INDEX_WIDTH_M-1:0]M1;
	reg [`INDEX_WIDTH_M-1:0]M2;
	reg [`INDEX_WIDTH_N-1:0]N0;		
	reg [`INDEX_WIDTH_N-1:0]N1;	
	reg [`INDEX_WIDTH_N-1:0]N2;		
	reg [`INDEX_WIDTH_M-1:0]M1M2;   
	reg [`INDEX_WIDTH_M-1:0]M0M1;
	reg [`INDEX_WIDTH_M-1:0]M0M2;
	//wire [`ROM_length-1:0]Read_Reg1;
	//wire [`ROM_length-1:0]Read_Reg2;
	//wire [`ROM_length-1:0]Read_Reg3;
	//wire [`ROM_length-1:0]Read_Reg4;
	//wire [`ROM_length-1:0]Read_Reg5;
	//wire [`ROM_length-1:0]Read_Reg6;
	//wire [`ROM_length-1:0]Read_Reg7;
	wire [`BANK_WIDTH-1:0]bank0;   
	wire [`BANK_WIDTH-1:0]bank1;
	wire [`BANK_WIDTH-1:0]bank2;	
	wire [`BANK_WIDTH-1:0]bank3;   
	wire [`BANK_WIDTH-1:0]bank4;
	wire [`BANK_WIDTH-1:0]bank5;	
	wire [`BANK_WIDTH-1:0]bank6; 
	wire [`BANK_WIDTH-1:0]bank7; 	
	wire [`ADDR_WIDTH-1:0]addr0;
	wire [`ADDR_WIDTH-1:0]addr1;	
	wire [`ADDR_WIDTH-1:0]addr2;   
	wire [`ADDR_WIDTH-1:0]addr3;
	wire [`ADDR_WIDTH-1:0]addr4;
	wire [`ADDR_WIDTH-1:0]addr5;   
	wire [`ADDR_WIDTH-1:0]addr6; 
	wire [`ADDR_WIDTH-1:0]addr7;  
	logic [2:0]factor_idx;
	logic [1:0]case_41;
 
 
 /*
	  AGU_1 agu_1( //gen m1 and m2 to compute n0                                                                                  
		.ctrl_sig(ctrl_sig),    
		.clk	 (clk	 ),                                           
		.rst_n	 (rst_n	 ), 
		.point	 (point	 ),
		.M1		 (M1		 ),
		.m1_0    (m1_0    ),   
		.m1_1    (m1_1    ),
		.m1_2    (m1_2    ),
		.m2_0    (m2_0    ),   
		.m2_1    (m2_1    ),
		.m2_2    (m2_2    )	
	  );
	*/
/*	
	AGU_2 agu_2(                                                                                  
		.ctrl_sig	(ctrl_sig),    
		.clk		(clk	),                                           
		.rst_n		(rst_n	), 	
		.N1			(N1		),
		.n1_out		(n1_out	),
		.n2_out     (n2_out  )
	);   
*/	

AGU_INTEGRATE agu_integrate(                                                                                  
	.ctrl_sig	 (ctrl_sig ),    
    .clk		 (clk		),                                           
    .rst_n		 (rst_n		), 
	.point		 (point		),
	.point_2_mode(point_2_mode	),
	.factor_idx	 (factor_idx	),	
	.case_41	 (case_41		),
	.M1			 (M1			),
	.M2			 (M2			),	
	.N0			 (N0			),
	.N1			 (N1			),
	.N2			 (N2			),	
	.M1M2		 (M1M2		),
	.M0M1		 (M0M1		),
	.M0M2		 (M0M2		),
	.bank0		 (bank0		),
	.bank1		 (bank1		),
	.bank2		 (bank2		),
	.bank3		 (bank3		),
	.bank4		 (bank4		),
	.bank5		 (bank5		),
	.bank6		 (bank6		),
	.bank7		 (bank7		),	
	.addr0		 (addr0		),
	.addr1		 (addr1		),
	.addr2		 (addr2		),
	.addr3		 (addr3		),
	.addr4		 (addr4		),
	.addr5		 (addr5		),
	.addr6		 (addr6		),
	.addr7		 (addr7		)
 );   
	 
	 initial begin
		clk = 'd0;		
		rst_n = 'd1;		
		#(`CYCLE) rst_n = 'd0;
// ------------31-DFT--------------//		
/*		
		N0    = 'd31     ;	
		N1    = 'd41     ;
		N2    = 'd61	 ;
/*		
/*		
		point = 'd2;
		point_2_mode = 'd0;	
		factor_idx = 'd0;
		case_41 = 'd0;			
		M1    = 'd3     ;
		M2    = 'd5     ;		
		M1M2  = 'd15     ;
		M0M1  = 'd6     ;
		M0M2  = 'd10     ;
*/
/*
		point = 'd3;
		point_2_mode = 'd0;	
		factor_idx = 'd0;
		case_41 = 'd0;			
		M1    = 'd2     ;
		M2    = 'd5     ;		
		M1M2  = 'd10     ;
		M0M1  = 'd6     ;
		M0M2  = 'd15     ;
*/
/*
		point = 'd5;
		point_2_mode = 'd0;	
		factor_idx = 'd0;
		case_41 = 'd0;		
		M1    = 'd2     ;
		M2    = 'd3     ;		
		M1M2  = 'd6     ;
		M0M1  = 'd10    ;
		M0M2  = 'd15    ;
*/
// ------------41-DFT--------------//		
/*		
		N0    = 'd41     ;	
		N1    = 'd31     ;
		N2    = 'd61	 ;
*/		
/*
		point = 'd5;
		point_2_mode = 'd0;	
		factor_idx = 'd1;
		case_41 = 'd1;     //1 for point 5
		M1    = 'd8     ;
		M2    = 'd0     ;		
		M1M2  = 'd8     ; // = M1
		M0M1  = 'd0     ; 
		M0M2  = 'd5     ; // = M2
*/			
/*		
		point = 'd4;
		point_2_mode = 'd0;	
		factor_idx = 'd1;
		case_41 = 'd2;		 //2 for point 4
		M1    = 'd2     ;
		M2    = 'd5     ;		
		M1M2  = 'd5     ;
		M0M1  = 'd8     ;
		M0M2  = 'd0     ;
*/
/*
		point = 'd2;
		point_2_mode = 'd1;	 // 4 para
		factor_idx = 'd1;
		case_41 = 'd2;		 //2 for point 4		
		M1    = 'd4     ;
		M2    = 'd5     ;		
		M1M2  = 'd5     ;
		M0M1  = 'd8     ;
		M0M2  = 'd0     ;
*/
// ------------61-DFT--------------//		
		
		N0    = 'd61     ;	
		N1    = 'd31     ;
		N2    = 'd41	 ;
		
/*
		point = 'd3;
		point_2_mode = 'd0;	
		factor_idx = 'd2;
		case_41 = 'd0;     
		M1    = 'd4     ;
		M2    = 'd5     ;		
		M1M2  = 'd20     ; // = M1
		M0M1  = 'd12     ; 
		M0M2  = 'd15     ; // = M2
*/			
/*		
		point = 'd4;
		point_2_mode = 'd0;	
		factor_idx = 'd2;
		case_41 = 'd0;		 
		M1    = 'd3     ;
		M2    = 'd5     ;		
		M1M2  = 'd15     ;
		M0M1  = 'd12     ;
		M0M2  = 'd20     ;
*/

		point = 'd5;
		point_2_mode = 'd0;	 // 4 para
		factor_idx = 'd2;
		case_41 = 'd0;		 	
		M1    = 'd3     ;
		M2    = 'd4     ;		
		M1M2  = 'd12     ;
		M0M1  = 'd15     ;
		M0M2  = 'd20     ;
	
		
		#(19100*`CYCLE) $finish;		
	 end
	 
	 initial begin
		$dumpvars();
		$dumpfile("AGU_tb.vcd");
		//$fsdbDumpfile("AGU_tb.fsdb");
		//$fsdbDumpvars("+struct", "+mda", agu_integrate);		
	end	
	 
	 endmodule
	 