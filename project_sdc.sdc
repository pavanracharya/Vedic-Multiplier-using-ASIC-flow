# ####################################################################

#  Created by Genus(TM) Synthesis Solution 17.22-s017_1 on Mon May 19 19:13:22 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design project

create_clock -name "clk" -period 2.0 -waveform {0.0 1.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[7]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[6]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[5]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[4]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {a[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[7]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[6]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[5]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[4]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {b[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {p[0]}]
set_wire_load_mode "enclosed"
set_dont_use [get_lib_cells slow/HOLDX1]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
