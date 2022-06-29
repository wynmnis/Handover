`include "define.sv"
 //==============================================
 //Writer:Shi-Yong Wu                            
 //                                              
 //Note:Modular multiplier                       
 //using barrett reduction                       
 //==============================================
 `timescale 1ns/1ps                              
                                                 
 module BR(                                      
   S_in,                                         
   result,                                       
   Prime,                                        
   Pre_computing,                                
   rst_n,                                        
   clk                                           
 );                

   // alpha >= data_width + 1, beta <= -2, the quotient error is at most 1 
   parameter beta  				 = -2;
   parameter alpha				 = `MODULUS_WIDTH + 1;         // depenp on modulus bitsize
   parameter DOUBLE_DATA_WIDTH   = 2*(`DATA_WIDTH);
   parameter rf_FRI              = `MODULUS_WIDTH + beta; //n + beta   
   parameter DATA_FRI_RS_WIDTH   = DOUBLE_DATA_WIDTH - rf_FRI;  // DOUBLE_DATA_WIDTH - rf_FRI 
   parameter DATA_MULT_PRE_WIDTH = `BR_PRECOMPUTE_WIDTH + DATA_FRI_RS_WIDTH + 1;
   parameter rf_SEC              = alpha - beta;
                                                                                                 
   input [DOUBLE_DATA_WIDTH-1:0] S_in;                                                           
   input [`DATA_WIDTH-1:0] Prime;                                                                 
   input [`BR_PRECOMPUTE_WIDTH-1 :0] Pre_computing;                                                         
   input clk;                                                                                    
   input rst_n;                                                                                  
                                                                                                 
   output [`DATA_WIDTH-1:0] result;                                                               
                                                                                                 
   reg  [`DATA_WIDTH-1:0] result;                                                                 
   //                                                                                            
   reg [`DATA_WIDTH-1:0] Prime_reg;                                                               
   reg [`BR_PRECOMPUTE_WIDTH-1 :0] Pre_computing_reg;                                                       
   //                                                                                            
   reg  [DATA_FRI_RS_WIDTH-1:0]S_out_RS; //32-14 = 18                                            
   reg  [DATA_MULT_PRE_WIDTH-1:0]af_pre; //18+16 = 34    mult by pre_computing                   
   reg  [`DATA_WIDTH:0]Q;               //quotient                                                
   reg  [DOUBLE_DATA_WIDTH-1:0]QM;       //32 bits                                               
   reg  [`DATA_WIDTH:0]C_Minus_QM;                                                                
   reg  [`DATA_WIDTH:0]C_Minus_QM_1;                                                              
   reg  [`DATA_WIDTH-1:0]C_Minus_QM_MUX;                                                          
   logic [DATA_MULT_PRE_WIDTH-1:0]af_pre_delay1;
   logic [DOUBLE_DATA_WIDTH-1:0]S_in_delay1;  
   logic [`DATA_WIDTH-1:0] Prime_reg_delay1;    
	   
      always@(*) begin                                                                          
         S_out_RS = S_in >> rf_FRI;                                                             
         af_pre   = S_out_RS * Pre_computing_reg;
	// pipeline here
         Q        = af_pre_delay1 >> rf_SEC;                                                           
         QM       = Q * Prime_reg_delay1;                                                              
 	    //adder part                                                                           
         C_Minus_QM   = S_in_delay1 - QM;                                                              
         C_Minus_QM_1 = C_Minus_QM -Prime_reg_delay1;                                                   
                                                                                                 
         C_Minus_QM_MUX   = ((C_Minus_QM_1[`DATA_WIDTH] == 1'b1))? C_Minus_QM:C_Minus_QM_1;       
      end                                                                                        
                                                                                                 
   always@(posedge clk,posedge rst_n)begin                                                       
     if(rst_n)begin                                                                             
       result    <= 'd0;                                                                      
       Prime_reg <= 'd0;  
	   Prime_reg_delay1 <= 'd0;	   
       Pre_computing_reg <= 'd0; 
	   af_pre_delay1 <= 'd0;
	   S_in_delay1 <= 'd0;
 	end                                                                                          
 	else begin                                                                                   
       result    <= C_Minus_QM_MUX;
       Prime_reg <= Prime;
	   Prime_reg_delay1 <= Prime_reg;
       Pre_computing_reg <= Pre_computing;
	   af_pre_delay1 <= af_pre;
	   S_in_delay1 <= S_in;	   
 	end                                                                                          
   end                                                                                           
                                                                                                 
                                                                                                 
 endmodule                                                                                       
