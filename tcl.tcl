set_db / .init_lib_search_path {/home/install/FOUNDRY/digital/90nm/dig/lib}
#Read Lib, RTL and SDC files
set_db / .library "slow.lib"
set DESIGN project
read_hdl "project.v"
elaborate $DESIGN
check_design -unresolved
read_sdc sdc.sdc

# Setting effort medium
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt

write_hdl > new_netlist.v
write_sdc > project_sdc.sdc
# PPA Reports
report_power > project_power.rpt
report_gates > project_gatecount.rpt
report_timing > project_timing.rpt
report_area > project_area.rpt
gui_show
