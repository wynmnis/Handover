`include "define.sv" 
`include "AGU_1.sv"
`include "AGU_2.sv"

 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:AGU_INTEGRATE           Integrate AGU_1 and AGU_2                                                                                                                             
 //==============================================                                                                                                                             
                                                                                                 
 module AGU_INTEGRATE(                                                                                    
    clk,                                           
    rst_n, 
	point,
	point_2_mode,
	factor_idx,     // to distinguish n0,n1,n2
	case_41,
	M1,
	M2,	
	N0,
	N1,
	N2,
	M1M2,
	M0M1,
	M0M2,
	bank0_out,
	bank1_out,
	bank2_out,
	bank3_out,
	bank4_out,
	bank5_out,
	bank6_out,
	bank7_out,	
	addr0_out,
	addr1_out,
	addr2_out,
	addr3_out,
	addr4_out,
	addr5_out,
	addr6_out,
	addr7_out,
	AGU_2_done,
    n0_0_sub_1,	
    n0_1_sub_1,
    n0_2_sub_1,
    n0_3_sub_1,
    n0_4_sub_1,
    n0_5_sub_1,
    n0_6_sub_1,
    n0_7_sub_1,
	sum_trigger,
	bank_sum_out,
	addr_sum_out,
	m1_out_0_LSB
 );                                                                                              	
    input clk;                                           
    input rst_n; 	
	input [2:0] point;
	input point_2_mode;
	input [2:0]factor_idx;
	input [1:0]case_41; // 1: point = 5; 2: point = 4; 3: point = 2
	input [`INDEX_WIDTH_M-1:0]M1;
	input [`INDEX_WIDTH_M-1:0]M2;	
	input [`INDEX_WIDTH_N-1:0]N0;		
	input [`INDEX_WIDTH_N-1:0]N1;
	input [`INDEX_WIDTH_N-1:0]N2;	
	input [`INDEX_WIDTH_M-1:0]M1M2;   
	input [`INDEX_WIDTH_M-1:0]M0M1;
	input [`INDEX_WIDTH_M-1:0]M0M2;
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_0_sub_1;	
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_1_sub_1;
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_2_sub_1;
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_3_sub_1;
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_4_sub_1;
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_5_sub_1;
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_6_sub_1;
    output logic [`INDEX_WIDTH_N_ADD-1:0]n0_7_sub_1;
	
	
	output reg [`BANK_WIDTH-1:0]bank0_out;   
	output reg [`BANK_WIDTH-1:0]bank1_out;
	output reg [`BANK_WIDTH-1:0]bank2_out;	
	output reg [`BANK_WIDTH-1:0]bank3_out;   
	output reg [`BANK_WIDTH-1:0]bank4_out;
	output reg [`BANK_WIDTH-1:0]bank5_out;	
	output reg [`BANK_WIDTH-1:0]bank6_out; 
	output reg [`BANK_WIDTH-1:0]bank7_out; 	
	output reg [`ADDR_WIDTH-1:0]addr0_out;
	output reg [`ADDR_WIDTH-1:0]addr1_out;	
	output reg [`ADDR_WIDTH-1:0]addr2_out;   
	output reg [`ADDR_WIDTH-1:0]addr3_out;
	output reg [`ADDR_WIDTH-1:0]addr4_out;
	output reg [`ADDR_WIDTH-1:0]addr5_out;   
	output reg [`ADDR_WIDTH-1:0]addr6_out;
	output reg [`ADDR_WIDTH-1:0]addr7_out;	
	output AGU_2_done;	
	output logic sum_trigger;
	output logic [`BANK_WIDTH-1:0]bank_sum_out; 	
	output logic [`ADDR_WIDTH-1:0]addr_sum_out; 
	
	reg [`ADDR_WIDTH-1:0] mul_n1_41;
	logic [`BANK_WIDTH-1:0]bank_sum;
	logic [`ADDR_WIDTH-1:0]addr_sum;
	reg [`BANK_WIDTH-1:0]bank0;
	reg [`BANK_WIDTH-1:0]bank1;
	reg [`BANK_WIDTH-1:0]bank2;
	reg [`BANK_WIDTH-1:0]bank3;
	reg [`BANK_WIDTH-1:0]bank4;
	reg [`BANK_WIDTH-1:0]bank5;
	reg [`BANK_WIDTH-1:0]bank6;
	reg [`BANK_WIDTH-1:0]bank7;
	reg [`ADDR_WIDTH-1:0]addr0;
	reg [`ADDR_WIDTH-1:0]addr1;
	reg [`ADDR_WIDTH-1:0]addr2;
	reg [`ADDR_WIDTH-1:0]addr3;
	reg [`ADDR_WIDTH-1:0]addr4;
	reg [`ADDR_WIDTH-1:0]addr5;
	reg [`ADDR_WIDTH-1:0]addr6;
	reg [`ADDR_WIDTH-1:0]addr7;
	
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_0_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_1_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_2_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_3_tmp ;	
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_0_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_1_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_2_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_3_tmp_sub_N0 ;	
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_1 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_2 ;	
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_precom_3 ;	
	reg [`INDEX_WIDTH_N-1:0] n0_0 ;
	reg [`INDEX_WIDTH_N-1:0] n0_1 ;
	reg [`INDEX_WIDTH_N-1:0] n0_2 ;
	reg [`INDEX_WIDTH_N-1:0] n0_3 ;
	reg [`INDEX_WIDTH_N-1:0] n0_4 ;
	reg [`INDEX_WIDTH_N-1:0] n0_5 ;
	reg [`INDEX_WIDTH_N-1:0] n0_6 ;
	reg [`INDEX_WIDTH_N-1:0] n0_7 ;	

	reg [`INDEX_WIDTH_N_ADD-1:0] n0_0_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_1_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_2_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_3_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_4_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_5_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_6_tmp ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_7_tmp ;	
		
	reg [`INDEX_WIDTH_N_ADD-1:0] N0_sub_1;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_0_tmp_sub_N0 ;	
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_1_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_2_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_3_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_4_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_5_tmp_sub_N0 ;
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_6_tmp_sub_N0 ;	
	reg [`INDEX_WIDTH_N_ADD-1:0] n0_7_tmp_sub_N0 ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n1_add_n2, n1_add_n2_delay1 ;		

	logic [`INDEX_WIDTH_M-1:0]m1_out_0;
	logic [`INDEX_WIDTH_M-1:0]m1_out_1;
	logic [`INDEX_WIDTH_M-1:0]m1_out_2;
	logic [`INDEX_WIDTH_M-1:0]m1_out_3;	
	logic [`INDEX_WIDTH_M-1:0]m2_out;
	logic [`INDEX_WIDTH_N-1:0]m2_out_M0M1;
	
	logic rst_n_delay1;
	output logic m1_out_0_LSB ;
	
	assign m1_out_0_LSB = m1_out_0[0];
	
    wire AGU_1_done;
	
		
	logic [`INDEX_WIDTH_N-1:0]n1, n1_delay1;
	logic [`INDEX_WIDTH_N-1:0]n2, n2_delay1;	
	
	logic [`BANK_WIDTH:0]bank0_tmp;
	logic [`BANK_WIDTH:0]bank1_tmp;
	logic [`BANK_WIDTH:0]bank2_tmp;
	logic [`BANK_WIDTH:0]bank3_tmp;
	logic [`BANK_WIDTH:0]bank4_tmp;
	logic [`BANK_WIDTH:0]bank5_tmp;
	logic [`BANK_WIDTH:0]bank6_tmp;
	logic [`BANK_WIDTH:0]bank7_tmp;
	
	logic [`BANK_WIDTH:0]bank0_tmp_sub_61;
	logic [`BANK_WIDTH:0]bank1_tmp_sub_61;
	logic [`BANK_WIDTH:0]bank2_tmp_sub_61;
	logic [`BANK_WIDTH:0]bank3_tmp_sub_61;
	logic [`BANK_WIDTH:0]bank4_tmp_sub_61;
	logic [`BANK_WIDTH:0]bank5_tmp_sub_61;
	logic [`BANK_WIDTH:0]bank6_tmp_sub_61;
	logic [`BANK_WIDTH:0]bank7_tmp_sub_61;	
	logic m1_done;

	
    AGU_1 agu_1(       //deal with n0                                                                              
		.clk(clk),                                           
		.rst_n(rst_n), 
		.point(point),
		.point_2_mode(point_2_mode),		
		.M1(M1),
		.M2(M2),		
		.m1_out_0(m1_out_0),   
		.m1_out_1(m1_out_1),
		.m1_out_2(m1_out_2),
		.m1_out_3(m1_out_3),		
		.m2_out(m2_out),
		.m1_done(m1_done),		
		.AGU_1_done(AGU_1_done)

	);  


	logic sum_trigger_tmp, sum_trigger_delay1, sum_trigger_delay2;
	logic [`BANK_WIDTH-1:0]bank_sum_tmp;
	
	always@(*) begin	
		if((!rst_n) && (m1_out_0 == 'd0) && (m2_out == 'd0)) begin
			sum_trigger_tmp = 1'b1;
		end
		else begin
			sum_trigger_tmp = 1'b0;	
		end
	end
	
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			sum_trigger <= 'd0;
			sum_trigger_delay1 <= 'd0;
			sum_trigger_delay2 <= 'd0;			
			//bank_sum <= 'd99;
		end
		else begin
			sum_trigger <= sum_trigger_tmp;
			sum_trigger_delay1 <= sum_trigger;
			sum_trigger_delay2 <= sum_trigger_delay1;				
			//bank_sum <= bank_sum_tmp;
		end
	end

//assign sum_trigger = sum_trigger_tmp;
	
	//assign bank_sum_tmp = (sum_trigger)? n1_add_n2 : 'd99;
	assign bank_sum  = (sum_trigger_delay2)? n1_add_n2_delay1 : 6'd63;
	//assign bank_sum  = (sum_trigger_tmp)? n1_add_n2 : 6'd63;

	assign N0_sub_1 = N0 - 'd1;	
	always@(*) begin
		m2_out_M0M1 = m2_out*(M0M1);
		
		n0_precom_0_tmp = m1_out_0*(M0M2) + m2_out_M0M1;
		n0_precom_1_tmp = m1_out_1*(M0M2) + m2_out_M0M1;
		n0_precom_2_tmp = m1_out_2*(M0M2) + m2_out_M0M1;
		n0_precom_3_tmp = m1_out_3*(M0M2) + m2_out_M0M1;		

		n0_precom_0_tmp_sub_N0 = n0_precom_0_tmp - N0_sub_1 ;
		n0_precom_1_tmp_sub_N0 = n0_precom_1_tmp - N0_sub_1 ;
		n0_precom_2_tmp_sub_N0 = n0_precom_2_tmp - N0_sub_1 ;
		n0_precom_3_tmp_sub_N0 = n0_precom_3_tmp - N0_sub_1 ;		
		
		n0_precom_0 = (n0_precom_0_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_precom_0_tmp : n0_precom_0_tmp_sub_N0;		
		n0_precom_1 = (n0_precom_1_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_precom_1_tmp : n0_precom_1_tmp_sub_N0;		
		n0_precom_2 = (n0_precom_2_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_precom_2_tmp : n0_precom_2_tmp_sub_N0;
		n0_precom_3 = (n0_precom_3_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_precom_3_tmp : n0_precom_3_tmp_sub_N0;		
	end
	

	
	always@(*) begin  // deal with n0  // note that n0_precom_i is smaller than N0
		case(point)
			3'd2: begin
				if(case_41 == 2'd2) begin
					n0_0_tmp = n0_precom_0;
					n0_1_tmp = 'd5 + n0_precom_0;	
					n0_2_tmp = 'd10 + n0_precom_1;
					n0_3_tmp = 'd15 + n0_precom_1;
					n0_4_tmp = 'd20 + n0_precom_2;
					n0_5_tmp = 'd25 + n0_precom_2;
					n0_6_tmp = 'd30 + n0_precom_3;
					n0_7_tmp = 'd35 + n0_precom_3;					
				end		
				else begin
					n0_0_tmp = n0_precom_0;
					n0_1_tmp = M1M2 + n0_precom_0;	
					n0_2_tmp = n0_precom_1;
					n0_3_tmp = M1M2 + n0_precom_1;
					n0_4_tmp = n0_precom_2;
					n0_5_tmp = M1M2 + n0_precom_2;
					n0_6_tmp = n0_precom_3;
					n0_7_tmp = M1M2 + n0_precom_3;				
				end
			end
			3'd3: begin
				n0_0_tmp = n0_precom_0;
				n0_1_tmp = M1M2 + n0_precom_0;	
				n0_2_tmp = (M1M2 << 1) + n0_precom_0;
				n0_3_tmp = n0_precom_1;
				n0_4_tmp = M1M2 + n0_precom_1;
				n0_5_tmp = (M1M2 << 1) + n0_precom_1;
				n0_6_tmp = 'd0;
				n0_7_tmp = 'd0;				
			end		
			3'd4: begin
				if(case_41 == 2'd2) begin
					if(m1_out_0 == 0) begin
						n0_0_tmp = n0_precom_0;
						n0_1_tmp = 'd10 + n0_precom_0;	
						n0_2_tmp = 'd20 + n0_precom_0;
						n0_3_tmp = 'd30 + n0_precom_0;
						n0_4_tmp = 0;
						n0_5_tmp = 0;
						n0_6_tmp = 0;
						n0_7_tmp = 0;
					end
					else begin
						n0_0_tmp = 'd5  + n0_precom_0;
						n0_1_tmp = 'd15 + n0_precom_0;	
						n0_2_tmp = 'd25 + n0_precom_0;
						n0_3_tmp = 'd35 + n0_precom_0;
						n0_4_tmp = 'd0;
						n0_5_tmp = 'd0;
						n0_6_tmp = 'd0;
						n0_7_tmp = 'd0;					
					end
				end
				else begin
					n0_0_tmp = n0_precom_0;
					n0_1_tmp = M1M2 + n0_precom_0;	
					n0_2_tmp = (M1M2 << 1) + n0_precom_0;
					n0_3_tmp = (M1M2 << 1) + M1M2 + n0_precom_0;
					n0_4_tmp = 'd0;
					n0_5_tmp = 'd0;
					n0_6_tmp = 'd0;
					n0_7_tmp = 'd0;	
				end				
			end
			3'd5: begin
				n0_0_tmp = n0_precom_0;
				n0_1_tmp = M1M2 + n0_precom_0;	
				n0_2_tmp = (M1M2 << 1) + n0_precom_0;
				n0_3_tmp = (M1M2 << 1) + M1M2 + n0_precom_0;
				n0_4_tmp = (M1M2 << 2) + n0_precom_0;
				n0_5_tmp = 'd0;
				n0_6_tmp = 'd0;
				n0_7_tmp = 'd0;					
			end	
			3'd7: begin
				n0_0_tmp = n0_precom_0;
				n0_1_tmp = M1M2 + n0_precom_0;	
				n0_2_tmp = (M1M2 << 1) + n0_precom_0;
				n0_3_tmp = (M1M2 << 1) + M1M2 + n0_precom_0;
				n0_4_tmp = (M1M2 << 2) + n0_precom_0;
				n0_5_tmp = (M1M2 << 2) + M1M2 + n0_precom_0;
				n0_6_tmp = (M1M2 << 2) + (M1M2 << 1) + n0_precom_0;
				n0_7_tmp = 'd0;					
			end		
			default: begin
				n0_0_tmp = 'd0;
				n0_1_tmp = 'd0;
				n0_2_tmp = 'd0;
				n0_3_tmp = 'd0;
				n0_4_tmp = 'd0;
				n0_5_tmp = 'd0;
				n0_6_tmp = 'd0;
				n0_7_tmp = 'd0;					
			end				
		endcase	
		


		n0_1_tmp_sub_N0 = n0_1_tmp - N0_sub_1;
		n0_2_tmp_sub_N0 = n0_2_tmp - N0_sub_1;
		n0_3_tmp_sub_N0 = n0_3_tmp - N0_sub_1;
		n0_4_tmp_sub_N0 = n0_4_tmp - N0_sub_1;
		n0_5_tmp_sub_N0 = n0_5_tmp - N0_sub_1;
		n0_6_tmp_sub_N0 = n0_6_tmp - N0_sub_1;
		n0_7_tmp_sub_N0 = n0_7_tmp - N0_sub_1;		
		
		n0_0_sub_1 = n0_0_tmp;
		n0_1_sub_1 = (n0_1_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_1_tmp : n0_1_tmp_sub_N0;
		n0_2_sub_1 = (n0_2_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_2_tmp : n0_2_tmp_sub_N0;
		n0_3_sub_1 = (n0_3_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_3_tmp : n0_3_tmp_sub_N0;
		n0_4_sub_1 = (n0_4_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_4_tmp : n0_4_tmp_sub_N0;
		n0_5_sub_1 = (n0_5_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_5_tmp : n0_5_tmp_sub_N0;
		n0_6_sub_1 = (n0_6_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_6_tmp : n0_6_tmp_sub_N0;		
		n0_7_sub_1 = (n0_7_tmp_sub_N0[`INDEX_WIDTH_N] == 1'b1) ? n0_7_tmp : n0_7_tmp_sub_N0;
		
		//n0_0 = n0_0_tmp + 'd1;
		//n0_1   =  n0_1_sub_1 + 'd1 ;
		//n0_2   =  n0_2_sub_1 + 'd1 ;
		//n0_3   =  n0_3_sub_1 + 'd1 ;
		//n0_4   =  n0_4_sub_1 + 'd1 ;
		//n0_5   =  n0_5_sub_1 + 'd1 ;
		//n0_6   =  n0_6_sub_1 + 'd1 ;
		//n0_7   =  n0_7_sub_1 + 'd1 ;
	end	

	always@(posedge clk) begin
		rst_n_delay1 <= rst_n;
	end

	logic AGU_2_done_delay1;	
	//pip
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			//rst_n_delay1 <= 'd0;
			AGU_2_done_delay1 <= 'd0;
			n0_0   <=  'd0 ;			
			n0_1   <=  'd0 ;
			n0_2   <=  'd0 ;
			n0_3   <=  'd0 ;
			n0_4   <=  'd0 ;
			n0_5   <=  'd0 ;
			n0_6   <=  'd0 ;
			n0_7   <=  'd0 ;		
		end
		else begin
			//rst_n_delay1 <= rst_n;
			AGU_2_done_delay1 <= AGU_2_done;
			n0_0 <= n0_0_tmp + 'd1;
			n0_1   <=  n0_1_sub_1 + 'd1 ;
			n0_2   <=  n0_2_sub_1 + 'd1 ;
			n0_3   <=  n0_3_sub_1 + 'd1 ;
			n0_4   <=  n0_4_sub_1 + 'd1 ;
			n0_5   <=  n0_5_sub_1 + 'd1 ;
			n0_6   <=  n0_6_sub_1 + 'd1 ;
			n0_7   <=  n0_7_sub_1 + 'd1 ;		
		end
	end
	
 
	
    AGU_2 agu_2(       //deal with n1,n2   
		.m1_done(m1_done),	
		.AGU_1_done(AGU_1_done),    
		.clk(clk),                                           
		.rst_n(rst_n), 	
		.N1(N1),
		.N2(N2),		
		.n1_out(n1),   
		.n2_out(n2),
		.AGU_2_done(AGU_2_done),
		.case_41(case_41)
	); 
	

	

	logic read_done_flag;
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) read_done_flag <= 'd0;
		else begin
			if(AGU_2_done_delay1) read_done_flag <= 'd1;
		end
	end
	
	
	
	logic [`INDEX_WIDTH_N_ADD-1:0] n1_add_n2_tmp ;
	logic [`INDEX_WIDTH_N_ADD-1:0] n1_add_n2_tmp_sub_61;
	
	assign n1_add_n2_tmp = n1 + n2;
	assign n1_add_n2_tmp_sub_61 = n1_add_n2_tmp - 6'd61 ;
	assign n1_add_n2 = (n1_add_n2_tmp_sub_61[`INDEX_WIDTH_N] == 1'b1) ? n1_add_n2_tmp : n1_add_n2_tmp_sub_61;
	
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			n1_add_n2_delay1 <= 'd0;
			n1_delay1 <= 'd0;
			n2_delay1 <= 'd0;
		end
		else begin
			n1_add_n2_delay1 <= n1_add_n2;
			n1_delay1 <= n1;
			n2_delay1 <= n2;			
		end
	end	
	
	always@(*) begin  //bank N0 = 31; N1 = 41; N2 = 61
		bank0_tmp = n0_0 + n1_add_n2_delay1;
		bank1_tmp = n0_1 + n1_add_n2_delay1;
		bank2_tmp = n0_2 + n1_add_n2_delay1;
		bank3_tmp = n0_3 + n1_add_n2_delay1;
		bank4_tmp = n0_4 + n1_add_n2_delay1;
		bank5_tmp = n0_5 + n1_add_n2_delay1;
		bank6_tmp = n0_6 + n1_add_n2_delay1;
		bank7_tmp = n0_7 + n1_add_n2_delay1;
		
		bank0_tmp_sub_61 = bank0_tmp - 6'd61;		
		bank1_tmp_sub_61 = bank1_tmp - 6'd61;
		bank2_tmp_sub_61 = bank2_tmp - 6'd61;
		bank3_tmp_sub_61 = bank3_tmp - 6'd61;
		bank4_tmp_sub_61 = bank4_tmp - 6'd61;
		bank5_tmp_sub_61 = bank5_tmp - 6'd61;
		bank6_tmp_sub_61 = bank6_tmp - 6'd61;
		bank7_tmp_sub_61 = bank7_tmp - 6'd61;	
		
		bank0 = (bank0_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank0_tmp : bank0_tmp_sub_61;
		bank1 = (bank1_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank1_tmp : bank1_tmp_sub_61;
		bank2 = (bank2_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank2_tmp : bank2_tmp_sub_61;
		bank3 = (bank3_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank3_tmp : bank3_tmp_sub_61;
		bank4 = (bank4_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank4_tmp : bank4_tmp_sub_61;
		bank5 = (bank5_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank5_tmp : bank5_tmp_sub_61;		
		bank6 = (bank6_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank6_tmp : bank6_tmp_sub_61;	
		bank7 = (bank7_tmp_sub_61[`BANK_WIDTH] == 1'b1) ? bank7_tmp : bank7_tmp_sub_61;
	end	



	always@(*) begin  //addr n0*N1+ n1  !!! N1 = 41 = 32 + 8 + 1 here can not change
		mul_n1_41 = (n1_delay1 << 5) + (n1_delay1 << 3) + (n1_delay1); // compute n0*N1 for 'd1 case	
		case(factor_idx)
			'd0: begin  // n0 = 0~31
				addr0 = (n0_0 << 5) + (n0_0 << 3) + (n0_0) + n1_delay1;
				addr1 = (n0_1 << 5) + (n0_1 << 3) + (n0_1) + n1_delay1;
				addr2 = (n0_2 << 5) + (n0_2 << 3) + (n0_2) + n1_delay1;
				addr3 = (n0_3 << 5) + (n0_3 << 3) + (n0_3) + n1_delay1;
				addr4 = (n0_4 << 5) + (n0_4 << 3) + (n0_4) + n1_delay1;
				addr5 = (n0_5 << 5) + (n0_5 << 3) + (n0_5) + n1_delay1;
				addr6 = (n0_6 << 5) + (n0_6 << 3) + (n0_6) + n1_delay1;
				addr7 = (n0_7 << 5) + (n0_7 << 3) + (n0_7) + n1_delay1;	
				if(sum_trigger_delay2) addr_sum = n1_delay1 ;
				else addr_sum = 'd2047;
			end  // n0 = 0~41 here is actually n1; real n0 here is n1 ; real n2 here is n2 
			'd1: begin
				addr0 = mul_n1_41 + n0_0;
				addr1 = mul_n1_41 + n0_1;
				addr2 = mul_n1_41 + n0_2;
				addr3 = mul_n1_41 + n0_3;
				addr4 = mul_n1_41 + n0_4;
				addr5 = mul_n1_41 + n0_5;
				addr6 = mul_n1_41 + n0_6;
				addr7 = mul_n1_41 + n0_7;		
				if(sum_trigger_delay2) addr_sum = mul_n1_41 ;
				else addr_sum = 'd2047;				
			end
			'd2: begin // n0 = 0~61 here is actually n3; real n0 here is n1 ; real n1 here is n2
				addr0 = mul_n1_41 + n2_delay1;
				addr1 = mul_n1_41 + n2_delay1;
				addr2 = mul_n1_41 + n2_delay1;
				addr3 = mul_n1_41 + n2_delay1;
				addr4 = mul_n1_41 + n2_delay1;
				addr5 = mul_n1_41 + n2_delay1;
				addr6 = mul_n1_41 + n2_delay1;
				addr7 = mul_n1_41 + n2_delay1;	
				if(sum_trigger_delay2) addr_sum = mul_n1_41 + n2_delay1 ;
				else addr_sum = 'd2047;								
			end
			default: begin
				addr0 = 'd2047;
				addr1 = 'd2047;
				addr2 = 'd2047;
				addr3 = 'd2047;
				addr4 = 'd2047;
				addr5 = 'd2047;
				addr6 = 'd2047;
				addr7 = 'd2047;	
				addr_sum = 'd2047;
			end			
		endcase
	end		
/*
	always@(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			bank_sum_out = 'd63;
			addr_sum_out = 'd2047;
		end
		else begin
			if(read_done_flag == 'd0) begin
				bank_sum_out = bank_sum;
				addr_sum_out = addr_sum;
			end
			else begin
				bank_sum_out = 'd63;
				addr_sum_out = 'd2047;			
			end
		end

	end
*/		
	always@(*) begin
		if((read_done_flag == 'd0) && (rst_n_delay1 == 'd0)) begin
			bank_sum_out = bank_sum;
			addr_sum_out = addr_sum;
			case(point)
				'd2: begin
					if(point_2_mode) begin
						bank0_out =  bank0 ;
						bank1_out =  bank1 ;
						bank2_out =  bank2 ;
						bank3_out =  bank3 ;
						bank4_out =  bank4 ;
						bank5_out =  bank5 ;
						bank6_out =  bank6 ;
						bank7_out =  bank7 ;
						addr0_out =  addr0 ;
						addr1_out =  addr1 ;
						addr2_out =  addr2 ;
						addr3_out =  addr3 ;
						addr4_out =  addr4 ;
						addr5_out =  addr5 ;
						addr6_out =  addr6 ;
						addr7_out =  addr7 ;
					end
					else begin
						bank0_out =  bank0 ;
						bank1_out =  bank1 ;
						bank2_out =  bank2 ;
						bank3_out =  bank3 ;
						bank4_out =  bank4 ;
						bank5_out =  bank5 ;
						bank6_out =  'd63 ;
						bank7_out =  'd63 ;
						addr0_out =  addr0 ;
						addr1_out =  addr1 ;
						addr2_out =  addr2 ;
						addr3_out =  addr3 ;
						addr4_out =  addr4 ;
						addr5_out =  addr5 ;
						addr6_out =  'd2047 ;
						addr7_out =  'd2047 ;				
					end
				end
				'd3: begin
					bank0_out =  bank0 ;
					bank1_out =  bank1 ;
					bank2_out =  bank2 ;
					bank3_out =  bank3 ;
					bank4_out =  bank4 ;
					bank5_out =  bank5 ;
					bank6_out =  'd63 ;
					bank7_out =  'd63 ;
					addr0_out =  addr0 ;
					addr1_out =  addr1 ;
					addr2_out =  addr2 ;
					addr3_out =  addr3 ;
					addr4_out =  addr4 ;
					addr5_out =  addr5 ;
					addr6_out =  'd2047;
					addr7_out =  'd2047;		
				end
				'd4: begin
					bank0_out =  bank0 ;
					bank1_out =  bank1 ;
					bank2_out =  bank2 ;
					bank3_out =  bank3 ;
					bank4_out =  'd63 ;
					bank5_out =  'd63 ;
					bank6_out =  'd63 ;
					bank7_out =  'd63 ;
					addr0_out =  addr0 ;
					addr1_out =  addr1 ;
					addr2_out =  addr2 ;
					addr3_out =  addr3 ;
					addr4_out =  'd2047;
					addr5_out =  'd2047;
					addr6_out =  'd2047;
					addr7_out =  'd2047;			
				end
				'd5: begin
					bank0_out =  bank0 ;
					bank1_out =  bank1 ;
					bank2_out =  bank2 ;
					bank3_out =  bank3 ;
					bank4_out =  bank4 ;
					bank5_out =  'd63 ;
					bank6_out =  'd63 ;
					bank7_out =  'd63 ;
					addr0_out =  addr0 ;
					addr1_out =  addr1 ;
					addr2_out =  addr2 ;
					addr3_out =  addr3 ;
					addr4_out =  addr4 ;
					addr5_out =  'd2047;
					addr6_out =  'd2047;
					addr7_out =  'd2047;			
				end
				'd7: begin
					bank0_out =  bank0 ;
					bank1_out =  bank1 ;
					bank2_out =  bank2 ;
					bank3_out =  bank3 ;
					bank4_out =  bank4 ;
					bank5_out =  bank5 ;
					bank6_out =  bank6 ;
					bank7_out =  'd63 ;
					addr0_out =  addr0 ;
					addr1_out =  addr1 ;
					addr2_out =  addr2 ;
					addr3_out =  addr3 ;
					addr4_out =  addr4 ;
					addr5_out =  addr5 ; 
					addr6_out =  addr6 ;
					addr7_out =  'd2047;			
				end
				default: begin
					bank0_out =  'd63 ;
					bank1_out =  'd63 ;
					bank2_out =  'd63 ;
					bank3_out =  'd63 ;
					bank4_out =  'd63 ;
					bank5_out =  'd63 ;
					bank6_out =  'd63 ;
					bank7_out =  'd63 ;
					addr0_out =  'd2047;
					addr1_out =  'd2047;
					addr2_out =  'd2047;
					addr3_out =  'd2047;
					addr4_out =  'd2047;
					addr5_out =  'd2047;
					addr6_out =  'd2047;
					addr7_out =  'd2047;			
				end	
			endcase
		end	
		else begin
					bank0_out =  'd63 ;
					bank1_out =  'd63 ;
					bank2_out =  'd63 ;
					bank3_out =  'd63 ;
					bank4_out =  'd63 ;
					bank5_out =  'd63 ;
					bank6_out =  'd63 ;
					bank7_out =  'd63 ;
					addr0_out =  'd2047;
					addr1_out =  'd2047;
					addr2_out =  'd2047;
					addr3_out =  'd2047;
					addr4_out =  'd2047;
					addr5_out =  'd2047;
					addr6_out =  'd2047;
					addr7_out =  'd2047;
					bank_sum_out = 'd63;
					addr_sum_out = 'd2047;						
		end
	end
	
	
	// N = N0*N1*N2 (n0,n1,n2 are index from 0~Ni-1)
	// N0 can be decomposed using PFA again
	
 endmodule   