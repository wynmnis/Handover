root_dir := $(PWD)
src_dir := ./src
syn_dir := ./syn
inc_dir := ./include
sim_dir := ./sim
bld_dir := ./build
FSDB_DEF :=
ifeq ($(FSDB),1) 
FSDB_DEF := +FSDB
else ifeq ($(FSDB),2)
FSDB_DEF := +FSDB_ALL
endif
CYCLE=`grep -v '^$$' $(root_dir)/sim/CYCLE`
MAX=`grep -v '^$$' $(root_dir)/sim/MAX`

all:RTL

$(bld_dir):
	mkdir -p $(bld_dir)

$(syn_dir):
	mkdir -p $(syn_dir)

RTL: $(bld_dir)
	cd $(bld_dir); \
	ncverilog ../src/top_tb.sv \
	+incdir+$(root_dir)/$(src_dir) \
	+access+r -loadpli1 debpli:novas_pli_boot \
	+prog_path=$(root_dir)/pattern \
	+output_path=$(root_dir)/test_result_v 
	
SYN: $(bld_dir)	
	cd $(bld_dir); \
	ncverilog ../syn/top_tb.sv \
	-sdf_file ../syn/top_syn.sdf \
	+define+SYN \
	+incdir+$(root_dir)/$(syn_dir) \
	+access+r -loadpli1 debpli:novas_pli_boot \
	+prog_path=$(root_dir)/pattern \
	+output_path=$(root_dir)/test_result_syn 	

synthesize: | $(bld_dir) $(syn_dir)
	#cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; \
	cd $(bld_dir); \
	dc_shell -no_home_init -f ../script/synthesis.tcl

superlint: | $(bld_dir)
	cd $(bld_dir); \
	jg -superlint ../script/superlint.tcl &


clean:
	rm -rf $(bld_dir); \
	rm -rf test_result_v/*.txt

