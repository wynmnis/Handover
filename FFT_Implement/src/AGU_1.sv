`include "define.sv" 
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:AGU           for second PFA index mapping n1   
 // point = 3 => 只要看 (m1_0,m2,0) (m1_1,m2,1) 
 // point > 3 => 只要看 (m1_0,m2,0)
 //==============================================                                                
                                                                             
                                                                                                 
 module AGU_1( //gen m1 and m2 to compute n0                                                                                  
    clk,                                           
    rst_n, 
	point,
	point_2_mode,	
	M1,
	M2,
	m1_out_0,   
	m1_out_1,
	m1_out_2,
	m1_out_3,	
	m2_out,  
	m1_done,
	AGU_1_done
 );                                        
   
    input clk;                                           
    input rst_n; 	
	input [2:0] point;
	input point_2_mode;
	input [`INDEX_WIDTH_M-1:0] M1 ;
	input [`INDEX_WIDTH_M-1:0] M2 ;	
	//input case_41;

	output logic [`INDEX_WIDTH_M-1:0]m1_out_0;
	output logic [`INDEX_WIDTH_M-1:0]m1_out_1;
	output logic [`INDEX_WIDTH_M-1:0]m1_out_2;
	output logic [`INDEX_WIDTH_M-1:0]m1_out_3;
	output logic [`INDEX_WIDTH_M-1:0]m2_out;
	output logic m1_done;		
	logic [1:0] point_sel;

	logic [`INDEX_WIDTH_M-1:0] m1_0_add1 ;
	logic [`INDEX_WIDTH_M-1:0] m1_0_add2 ;
	logic [`INDEX_WIDTH_M-1:0] m1_0_add3 ;
	logic [`INDEX_WIDTH_M-1:0] s0        ;
	logic [`INDEX_WIDTH_M-1:0] s4        ;
	logic [`INDEX_WIDTH_M-1:0] mux0		 ;
	logic [`INDEX_WIDTH_M-1:0] mux1      ;
	logic [`INDEX_WIDTH_M-1:0] mux2      ;
	logic [`INDEX_WIDTH_M-1:0] mux3      ;	
                     
	output logic AGU_1_done;	
	logic [`INDEX_WIDTH_M-1:0]m1_0;
	logic [`INDEX_WIDTH_M-1:0]m2_0;	
	
	
	assign m1_0_add1 = m1_0 + 'd1 ;  //s1
	assign m1_0_add2 = m1_0 + 'd2 ;  //s2
	assign m1_0_add3 = m1_0 + 'd3 ;  //s3	
	assign s0 = mux0 + 'd1 ;  //s0
	assign s4 = m2_0 + m1_done ;  //s4		
	assign mux1 = (m1_done) ? 'd0 : s0; //mux1
	assign mux2 = (AGU_1_done) ? 'd0 : s4; //mux2
	//assign mux3 = (case_41) ? 'd1 : m1_done; //mux3	
	
/*	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			m1_out_0 <= 'd0;
			m1_out_1 <= 'd0;
			m1_out_2 <= 'd0;
			m1_out_3 <= 'd0;
			m2_out   <= 'd0;
		end
		else begin
			m1_out_0 <= m1_0;
			m1_out_1 <= m1_0_add1 ;
			m1_out_2 <= m1_0_add2 ;
			m1_out_3 <= m1_0_add3 ;
			m2_out   <= m2_0 ;	
		end		
	end*/
			assign m1_out_0 = m1_0;
			assign m1_out_1 = m1_0_add1 ;
			assign m1_out_2 = m1_0_add2 ;
			assign m1_out_3 = m1_0_add3 ;
			assign m2_out   = m2_0 ;		

	always@(*)begin
		case(point)
			3'd2: begin
				if(point_2_mode)  // 0: 3 para; //1: 4 para
					point_sel = 2'd3;
				else
					point_sel = 2'd2;
			end
			3'd3: begin
				point_sel = 2'd1;				
			end
			3'd4: begin
				point_sel = 2'd0;				
			end			
			3'd5: begin
				point_sel = 2'd0;				
			end
			3'd7: begin
				point_sel = 2'd0;				
			end		
			default : begin
				point_sel = 2'd0;			
			end
		endcase
	end	
	
	always@(*)begin
		case(point_sel)
			2'd0: begin
				mux0 = m1_0;
			end
			2'd1: begin
				mux0 = m1_0_add1;				
			end
			2'd2: begin
				mux0 = m1_0_add2;				
			end
			2'd3: begin
				mux0 = m1_0_add3;				
			end			
		endcase
	end

	assign m1_done = (s0 == M1) ? 1'b1 : 1'b0;
	assign AGU_1_done = (s4 == M2) ? 1'b1 : 1'b0;	

	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			m1_0 <= 'd0;
			m2_0 <= 'd0;
		end
		else begin
			m1_0 <= mux1;
			m2_0 <= mux2;			
		end
	end
	
 endmodule   