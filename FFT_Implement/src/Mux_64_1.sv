`include "define.sv"
 //==============================================                                                
 //Writer:Ryan Huang                                                                            
 //                                                                                              
 //Note:64-1 Mux                                                                                                
 //============================================== 
 `timescale 1ns/1ps    
 
module Mux_64_1 (
	input [`DATA_WIDTH-1:0] Q_0  ,
	input [`DATA_WIDTH-1:0] Q_1  ,
	input [`DATA_WIDTH-1:0] Q_2  ,
	input [`DATA_WIDTH-1:0] Q_3  ,
	input [`DATA_WIDTH-1:0] Q_4  ,
	input [`DATA_WIDTH-1:0] Q_5  ,
	input [`DATA_WIDTH-1:0] Q_6  ,
	input [`DATA_WIDTH-1:0] Q_7  ,
	input [`DATA_WIDTH-1:0] Q_8  ,
	input [`DATA_WIDTH-1:0] Q_9  ,
	input [`DATA_WIDTH-1:0] Q_10 ,
	input [`DATA_WIDTH-1:0] Q_11 ,
	input [`DATA_WIDTH-1:0] Q_12 ,
	input [`DATA_WIDTH-1:0] Q_13 ,
	input [`DATA_WIDTH-1:0] Q_14 ,
	input [`DATA_WIDTH-1:0] Q_15 ,
	input [`DATA_WIDTH-1:0] Q_16 ,
	input [`DATA_WIDTH-1:0] Q_17 ,
	input [`DATA_WIDTH-1:0] Q_18 ,
	input [`DATA_WIDTH-1:0] Q_19 ,
	input [`DATA_WIDTH-1:0] Q_20 ,
	input [`DATA_WIDTH-1:0] Q_21 ,
	input [`DATA_WIDTH-1:0] Q_22 ,
	input [`DATA_WIDTH-1:0] Q_23 ,
	input [`DATA_WIDTH-1:0] Q_24 ,
	input [`DATA_WIDTH-1:0] Q_25 ,
	input [`DATA_WIDTH-1:0] Q_26 ,
	input [`DATA_WIDTH-1:0] Q_27 ,
	input [`DATA_WIDTH-1:0] Q_28 ,
	input [`DATA_WIDTH-1:0] Q_29 ,
	input [`DATA_WIDTH-1:0] Q_30 ,
	input [`DATA_WIDTH-1:0] Q_31 ,
	input [`DATA_WIDTH-1:0] Q_32 ,
	input [`DATA_WIDTH-1:0] Q_33 ,
	input [`DATA_WIDTH-1:0] Q_34 ,
	input [`DATA_WIDTH-1:0] Q_35 ,
	input [`DATA_WIDTH-1:0] Q_36 ,
	input [`DATA_WIDTH-1:0] Q_37 ,
	input [`DATA_WIDTH-1:0] Q_38 ,
	input [`DATA_WIDTH-1:0] Q_39 ,
	input [`DATA_WIDTH-1:0] Q_40 ,
	input [`DATA_WIDTH-1:0] Q_41 ,
	input [`DATA_WIDTH-1:0] Q_42 ,
	input [`DATA_WIDTH-1:0] Q_43 ,
	input [`DATA_WIDTH-1:0] Q_44 ,
	input [`DATA_WIDTH-1:0] Q_45 ,
	input [`DATA_WIDTH-1:0] Q_46 ,
	input [`DATA_WIDTH-1:0] Q_47 ,
	input [`DATA_WIDTH-1:0] Q_48 ,
	input [`DATA_WIDTH-1:0] Q_49 ,
	input [`DATA_WIDTH-1:0] Q_50 ,
	input [`DATA_WIDTH-1:0] Q_51 ,
	input [`DATA_WIDTH-1:0] Q_52 ,
	input [`DATA_WIDTH-1:0] Q_53 ,
	input [`DATA_WIDTH-1:0] Q_54 ,
	input [`DATA_WIDTH-1:0] Q_55 ,
	input [`DATA_WIDTH-1:0] Q_56 ,
	input [`DATA_WIDTH-1:0] Q_57 ,
	input [`DATA_WIDTH-1:0] Q_58 ,
	input [`DATA_WIDTH-1:0] Q_59 ,
	input [`DATA_WIDTH-1:0] Q_60 ,
	input [`DATA_WIDTH-1:0] Q_61 ,
	input [`DATA_WIDTH-1:0] Q_62 ,
	input [`DATA_WIDTH-1:0] Q_63 ,	
	input [`BANK_WIDTH-1:0]sel,                                                                                                                                                                     
	output reg[`DATA_WIDTH-1:0] Q_out   		
); 
	always@(*) begin
		case(sel)
			'd0: Q_out = Q_0   ;
			'd1: Q_out = Q_1   ;
			'd2: Q_out = Q_2   ;
			'd3: Q_out = Q_3   ;
			'd4: Q_out = Q_4   ;
			'd5: Q_out = Q_5   ;
			'd6: Q_out = Q_6   ;
			'd7: Q_out = Q_7   ;
			'd8: Q_out = Q_8   ;
			'd9: Q_out = Q_9   ;
			'd10: Q_out = Q_10 ;
			'd11: Q_out = Q_11 ;
			'd12: Q_out = Q_12 ;
			'd13: Q_out = Q_13 ;
			'd14: Q_out = Q_14 ;
			'd15: Q_out = Q_15 ;
			'd16: Q_out = Q_16 ;
			'd17: Q_out = Q_17 ;
			'd18: Q_out = Q_18 ;
			'd19: Q_out = Q_19 ;
			'd20: Q_out = Q_20 ;
			'd21: Q_out = Q_21 ;
			'd22: Q_out = Q_22 ;
			'd23: Q_out = Q_23 ;
			'd24: Q_out = Q_24 ;
			'd25: Q_out = Q_25 ;
			'd26: Q_out = Q_26 ;
			'd27: Q_out = Q_27 ;
			'd28: Q_out = Q_28 ;
			'd29: Q_out = Q_29 ;
			'd30: Q_out = Q_30 ;
			'd31: Q_out = Q_31 ;
			'd32: Q_out = Q_32 ;
			'd33: Q_out = Q_33 ;
			'd34: Q_out = Q_34 ;
			'd35: Q_out = Q_35 ;
			'd36: Q_out = Q_36 ;
			'd37: Q_out = Q_37 ;
			'd38: Q_out = Q_38 ;
			'd39: Q_out = Q_39 ;
			'd40: Q_out = Q_40 ;
			'd41: Q_out = Q_41 ;
			'd42: Q_out = Q_42 ;
			'd43: Q_out = Q_43 ;
			'd44: Q_out = Q_44 ;
			'd45: Q_out = Q_45 ;
			'd46: Q_out = Q_46 ;
			'd47: Q_out = Q_47 ;
			'd48: Q_out = Q_48 ;
			'd49: Q_out = Q_49 ;
			'd50: Q_out = Q_50 ;
			'd51: Q_out = Q_51 ;
			'd52: Q_out = Q_52 ;
			'd53: Q_out = Q_53 ;
			'd54: Q_out = Q_54 ;
			'd55: Q_out = Q_55 ;
			'd56: Q_out = Q_56 ;
			'd57: Q_out = Q_57 ;
			'd58: Q_out = Q_58 ;
			'd59: Q_out = Q_59 ;
			'd60: Q_out = Q_60 ;
			'd61: Q_out = Q_61 ;
			'd62: Q_out = Q_62 ;
			'd63: Q_out = Q_63 ;
			default : Q_out = 'd0;
		endcase
	end	
	
endmodule