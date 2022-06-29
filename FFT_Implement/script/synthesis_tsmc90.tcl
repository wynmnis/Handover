set search_path      ". /usr/cad/synopsys/CBDK_TSMC90GUTM_Arm_f1.0/CIC/SynopsysDC/db ../Mem_lib ../mem $search_path"
set target_library   "SRAM_SP_2048.db"
set target_library  "slow.db fast.db typical.db"
set link_library     "* $target_library dw_foundation.sldb"
set symbol_library   "tsmc090.sdb generic.sdb"
set synthetic_library "dw_foundation.sldb"

set case_analysis_with_logic_constants true

set hdlin_translate_off_skip_text "TRUE"
#set hdlin_enable_presto_for_vhdl "TRUE"
set edifout_netlist_only "TRUE"
set verilogout_no_tri true
set plot_command {lpr -Plp}
set hdlin_auto_save_templates "TRUE"


#define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
#define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
#define_name_rules name_rule -map {{"\*cell\*" "cell"}}
#define_name_rules name_rule -case_insensitive
                                                                                 
set verilogout_no_tri true
set hdlin_enable_presto_for_vhdl "TRUE"
set sh_enable_line_editing true
history keep 100
alias h history



read_file -autoread -top top {../src ../include ../src}
current_design top
link
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

create_clock -name clk -period 5.0 [get_ports clk]
set_dont_touch_network      [all_clocks]
set_fix_hold                [all_clocks]
set_clock_uncertainty  0.1  [all_clocks]
set_clock_latency      1.0  [all_clocks]
set_ideal_network           [get_ports clk]

set_input_delay  -max 0.2   -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_input_delay  -min 0.0   -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay  -max 0.2   -clock clk [all_outputs]
set_output_delay  -min 0.0   -clock clk [all_outputs]

#set_driving_cell -library fsa0m_a_t33_generic_io_ss1p62v125c -lib_cell XMD -pin {O} [all_inputs]
#set_drive        0.1   [all_inputs]
set_load         0.05  [all_outputs]

#set_operating_conditions -max typical -max_library typical -min typical -min_library typical 
set_operating_conditions -max slow -max_library slow -min fast -min_library fast  
set_wire_load_mode segmented                                                                    
set_wire_load_model -name tsmc090_wl10 -library typical 

set_max_fanout 6 [all_inputs]

compile
remove_unconnected_ports -blast_buses [get_cells * -hier]
write_file -format verilog -hier -output ../syn/top_syn.v
write_sdf -version 2.1 -context verilog -load_delay net ../syn/top_syn.sdf
uplevel #0 { report_timing -path full -delay min -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }
report_timing > ../syn/timing.log 
report_area > ../syn/area.log