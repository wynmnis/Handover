 `include "define.sv"
 //==============================================  
 //Writer: Ryan Huang                              
 //                                                
 //Note:multiplier                                 
 //==============================================  
 `timescale 1ns/1ps                                
 module PRE_COMPUTED_DATA( 
	inverse       ,
	Pre_computing ,
	C70           ,
	C71           ,
	C72           ,
	C73           ,
	C74           ,
	C75           ,
	C76           ,
	C77	          ,
	C50           ,
	C51           ,
	C52           ,
	C53           ,
	C54           ,
	C40           ,
	C30           ,
	C31           ,
	inv_2         ,
	inv_3	      ,
	inv_4	      ,
	inv_5	      ,
	inv_7		
 );     
	input inverse;
	output [`BR_PRECOMPUTE_WIDTH-1:0] Pre_computing;	
	output [`DATA_WIDTH-1:0] C70 ;
	output [`DATA_WIDTH-1:0] C71 ;
	output [`DATA_WIDTH-1:0] C72 ;
	output [`DATA_WIDTH-1:0] C73 ;
	output [`DATA_WIDTH-1:0] C74 ;
	output [`DATA_WIDTH-1:0] C75 ;
	output [`DATA_WIDTH-1:0] C76 ;
	output [`DATA_WIDTH-1:0] C77 ;
	output [`DATA_WIDTH-1:0] C50 ;
	output [`DATA_WIDTH-1:0] C51 ;
	output [`DATA_WIDTH-1:0] C52 ;
	output [`DATA_WIDTH-1:0] C53 ;
	output [`DATA_WIDTH-1:0] C54 ;
	output [`DATA_WIDTH-1:0] C40 ;
	output [`DATA_WIDTH-1:0] C30 ;
	output [`DATA_WIDTH-1:0] C31 ;

	output [`DATA_WIDTH-1:0] inv_2;
	output [`DATA_WIDTH-1:0] inv_3;	
	output [`DATA_WIDTH-1:0] inv_4;
	output [`DATA_WIDTH-1:0] inv_5;	
	output [`DATA_WIDTH-1:0] inv_7;


	assign Pre_computing = 53'd161354796;
	assign C70 = (inverse) ? 50'd0 : 50'd0;
	assign C71 = (inverse) ? 50'd0 : 50'd0;
	assign C72 = (inverse) ? 50'd0 : 50'd0;
	assign C73 = (inverse) ? 50'd0 : 50'd0;
	assign C74 = (inverse) ? 50'd0 : 50'd0;
	assign C75 = (inverse) ? 50'd0 : 50'd0;
	assign C76 = (inverse) ? 50'd0 : 50'd0;	
	assign C77 = (inverse) ? 50'd5694585260272 : 50'd513824658863889;		
	assign C50 = (inverse) ? 50'd13955579 : 50'd13955579 ;
	assign C51 = (inverse) ? 50'd30227027 : 50'd30227027 ;
	assign C52 = (inverse) ? 50'd34806069 : 50'd21016252 ;				// -C52 = modular - C52 
	assign C53 = (inverse) ? 50'd46568736 : 50'd9253585  ;
	assign C54 = (inverse) ? 50'd43046079 : 50'd12776242 ;
	assign C40 = (inverse) ? 50'd45346569 : 50'd10475752 ;
	assign C30 = (inverse) ? 50'd27911159 : 50'd27911159 ;
	assign C31 = (inverse) ? 50'd5936315  : 50'd49886006 ;

	assign inv_2 = 50'd27911161;
	assign inv_3 = 50'd37214881;
	assign inv_4 = 50'd41866741;
	assign inv_5 = 50'd44657857;
	assign inv_7 = 50'd0;
/*
	assign Pre_computing = 53'd4880091024790877;
	assign C70 = (inverse) ? 50'd86586540687359 : 50'd86586540687359;
	assign C71 = (inverse) ? 50'd26316147536311 : 50'd26316147536311;
	assign C72 = (inverse) ? 50'd218925214139177 : 50'd218925214139177;
	assign C73 = (inverse) ? 50'd326910177521295 : 50'd326910177521295;
	assign C74 = (inverse) ? 50'd221879350701222 : 50'd297639893422939;
	assign C75 = (inverse) ? 50'd116998031594431 : 50'd402521212529730;
	assign C76 = (inverse) ? 50'd111303446334159 : 50'd408215797790002;	
	assign C77 = (inverse) ? 50'd5694585260272 : 50'd513824658863889;	
	assign C50 = (inverse) ? 50'd129879811031039 : 50'd129879811031039;
	assign C51 = (inverse) ? 50'd239440226394950 : 50'd239440226394950;
	assign C52 = (inverse) ? 50'd454889631468327 : 50'd64629612655834;  				// -C52 = modular - C52 
	assign C53 = (inverse) ? 50'd463495830213692 : 50'd56023413910469;
	assign C54 = (inverse) ? 50'd320086135345232 : 50'd199433108778929;
	assign C40 = (inverse) ? 50'd467481408805155 : 50'd52037835319006;
	assign C30 = (inverse) ? 50'd259759622062079 : 50'd259759622062079;
	assign C31 = (inverse) ? 50'd272989906830922 : 50'd246529337293239;

	assign inv_2 = 50'd259759622062081;
	assign inv_3 = 50'd346346162749441;
	assign inv_4 = 50'd389639433093121;
	assign inv_5 = 50'd415615395299329;
	assign inv_7 = 50'd445302209249281;
*/

/*
 	assign Pre_computing = 20452213; //(2^(n+alpha)) / modulus
	assign C70 = (inverse) ? 22'd286719  : 22'd286719 ;
	assign C71 = (inverse) ? 22'd152053  : 22'd152053 ;
	assign C72 = (inverse) ? 22'd762204  : 22'd762204 ;
	assign C73 = (inverse) ? 22'd1110170 : 22'd1110170;
	assign C74 = (inverse) ? 22'd69187   : 22'd1651134;
	assign C75 = (inverse) ? 22'd1318307 : 22'd402014 ;
	assign C76 = (inverse) ? 22'd133312  : 22'd1587009;	
	assign C77 = (inverse) ? 22'd1184995 : 22'd535326 ;	
	assign C50 = (inverse) ? 22'd430079  : 22'd430079 ;
	assign C51 = (inverse) ? 22'd1563318 : 22'd1563318;
	assign C52 = (inverse) ? 22'd168359  : 22'd1551962;  				// -C52 = modular - C52 
	assign C53 = (inverse) ? 22'd880366  : 22'd839955 ;
	assign C54 = (inverse) ? 22'd335798  : 22'd1384523;
	assign C40 = (inverse) ? 22'd1333216 : 22'd387105 ;
	assign C30 = (inverse) ? 22'd860159  : 22'd860159 ;
	assign C31 = (inverse) ? 22'd681989  : 22'd1038332;
	
	assign inv_2 = 22'd860161;
	assign inv_3 = 22'd1146881;
	assign inv_4 = 22'd1290241;
	assign inv_5 = 22'd1376257;
	assign inv_7 = 22'd1474561;
*/
endmodule	