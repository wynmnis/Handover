root_dir := $(PWD)
bld_dir := ./build

all:main

$(bld_dir):
	mkdir -p $(bld_dir) 

main: $(bld_dir)
	#ncverilog top_tb.sv +access+r
	cd $(bld_dir); \
	ncverilog ../top_tb.sv \
	+incdir+$(root_dir) \
	+access+r -loadpli1 debpli:novas_pli_boot \
	+prog_path=$(root_dir)/../pattern \
	+output_path=$(root_dir)/../test_result_v	

FFT:
	ncverilog FFT_tb.sv +access+r -loadpli1 debpli:novas_pli_boot	

mem: $(bld_dir)
	cd $(bld_dir); \
	ncverilog ../mem_tb.sv \
	+incdir+$(root_dir) \
	+access+r -loadpli1 debpli:novas_pli_boot \
	+prog_path=$(root_dir)/../pattern	

AGU:
	ncverilog AGU_tb.sv +access+r -loadpli1 debpli:novas_pli_boot	
	

clean:
	rm -rf $(root_dir)/INCA_libs; 
	rm -rf $(root_dir)/ncverilog.history; 
	rm -rf $(root_dir)/novas.*; 
	rm -rf $(root_dir)/*.syn; 	
	rm -rf $(root_dir)/*.pvl; 
	rm -rf $(root_dir)/*.svf; 	
	rm -rf $(root_dir)/*.mr; 
	rm -rf $(root_dir)/*.log; 	
	rm -rf $(root_dir)/nWaveLog; 	
	rm -rf $(root_dir)/vfastLog; 	
	rm -rf $(root_dir)/*.vcd*; 		
	rm -rf $(root_dir)/*.fsdb*; 			
	rm -rf $(root_dir)/BSSLib.lib++;
	
	
