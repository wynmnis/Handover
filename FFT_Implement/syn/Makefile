root_dir := $(PWD)
bld_dir := ./build

all:SYN 

$(bld_dir):
	mkdir -p $(bld_dir)


SYN: $(bld_dir)	
	cd $(bld_dir); \
	ncverilog $(root_dir)/top_tb.sv \
	-sdf_file $(root_dir)/top_syn.sdf \
	+incdir+$(root_dir) \
	+define+SYN \
	+access+r -loadpli1 debpli:novas_pli_boot \
	+ncnontcglitch \
	+prog_path=$(root_dir)/../pattern \
	+output_path=$(root_dir)/../test_result_syn 


clean:
	rm -rf $(root_dir)/INCA_libs; 
	rm -rf $(root_dir)/ncverilog.*; 
	rm -rf $(root_dir)/novas.*; 
	rm -rf $(root_dir)/nWaveLog; 	
	rm -rf $(root_dir)/vfastLog; 	
	rm -rf $(root_dir)/*.vcd; 		
	rm -rf $(root_dir)/*.vcd.fsdb; 			
	rm -rf $(root_dir)/*.sdf; 
	rm -rf $(root_dir)/*.sdf.X; 	
clean_syn:
	rm -rf $(root_dir)/*.log; 
	rm -rf $(root_dir)/top_syn.*; 	
	rm -rf $(root_dir)/INCA_libs; 
	rm -rf $(root_dir)/ncverilog.*; 
	rm -rf $(root_dir)/novas.*; 
	rm -rf $(root_dir)/nWaveLog; 	
	rm -rf $(root_dir)/vfastLog; 	
	rm -rf $(root_dir)/*.vcd; 		
	rm -rf $(root_dir)/*.vcd.fsdb; 			
	rm -rf $(root_dir)/BSSLib.lib++;	
	rm -rf $(root_dir)/*.sdf; 
	rm -rf $(root_dir)/*.sdf.X; 
