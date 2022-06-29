
set company "CIC"
set designer "Student"

set CoreSearchPath /usr/cad/CBDK/CBDK018_UMC_Faraday_v1.0/orig_lib/fsa0m_a/2009Q2v2.0/GENERIC_CORE/FrontEnd/synopsys/
set IOSearchPath /usr/cad/CBDK/CBDK018_UMC_Faraday_v1.0/orig_lib/fsa0m_a/2008Q3v1.2/T33_GENERIC_IO/FrontEnd/synopsys/
set MemoryPath ../sim/SRAM
set DefintionPath ../include

set search_path    "$CoreSearchPath $IOSearchPath $MemoryPath $DefintionPath $search_path"
set target_library " fsa0m_a_generic_core_ss1p62v125c.db fsa0m_a_generic_core_ff1p98vm40c.db fsa0m_a_t33_generic_io_ss1p62v125c.db fsa0m_a_t33_generic_io_ff1p98vm40c.db"
set synthetic_library "dw_foundation.sldb"
set link_library   "* $target_library $synthetic_library"
set symbol_library "fsa0m_a_generic_core.sdb fsa0m_a_t33_generic_io.sdb"

set_min_lib "fsa0m_a_generic_core_ss1p62v125c.db" \
       -min "fsa0m_a_generic_core_ff1p98vm40c.db"     ; # for core lib
set_min_lib "fsa0m_a_t33_generic_io_ss1p62v125c.db" \
       -min "fsa0m_a_t33_generic_io_ff1p98vm40c.db"   ; # for IO lib



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

source ../script/DC.sdc

compile
remove_unconnected_ports -blast_buses [get_cells * -hier]
write_file -format verilog -hier -output ../syn/top_syn.v
write_sdf -version 2.1 -context verilog -load_delay net ../syn/top_syn.sdf
uplevel #0 { report_timing -path full -delay min -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }
report_timing > ../syn/timing.log 
report_area > ../syn/area.log
exit