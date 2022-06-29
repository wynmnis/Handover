`ifndef DEFINE_SV
`define DEFINE_SV


`define DATA_WIDTH  	8'd50
`define DATA_WIDTH_ADD  8'd51   
`define MODULUS_WIDTH	8'd26
`define BR_PRECOMPUTE_WIDTH 8'd28 
`define ROM_length 5'd8     

`define INDEX_WIDTH_M		5'd5    
`define INDEX_WIDTH_M_ADD   5'd6 
`define INDEX_WIDTH_N		5'd9   // <=1023
`define INDEX_WIDTH_N_ADD	5'd10
`define BANK_WIDTH			5'd7   // <=127
`define ADDR_WIDTH			5'd11   // <=2048

`endif