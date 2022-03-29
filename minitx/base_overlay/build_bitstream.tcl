set overlay_name "minitx_base_overlay"
set design_name "minitx_base_overlay"

# open block design
open_project ./${overlay_name}/${overlay_name}.xpr
open_bd_design ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd


# Create PFM attributes
set_property PFM_NAME {xilinx.com:xd:${overlay_name}:1.0} [get_files [current_bd_design].bd]
#set_property PFM.AXI_PORT {  S_AXI_ACP {memport "S_AXI_ACP"}  S_AXI_HP1 {memport "S_AXI_HP"}  S_AXI_HP3 {memport "S_AXI_HP"}  } [get_bd_cells /processing_system7_0]
set_property PFM.CLOCK {  FCLK_CLK0 {id "0" is_default "true"  proc_sys_reset "rst_ps7_0_100M" status "fixed"}  } [get_bd_cells /processing_system7_0]
#set_property PFM.IRQ {In0 {} In1 {} In2 {} In3 {} In4 {} In5 {} In6 {} In7 {}} [get_bd_cells /xlconcat_0]

# Add top wrapper and xdc files
make_wrapper -files [get_files ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
add_files -norecurse ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.vhd
set_property top ${design_name}_wrapper [current_fileset]
import_files -fileset constrs_1 -norecurse ./vivado/constraints/${overlay_name}.xdc
update_compile_order -fileset sources_1

# set platform properties
set_property platform.default_output_type "sd_card" [current_project]
set_property platform.design_intent.embedded "true" [current_project]
set_property platform.design_intent.server_managed "false" [current_project]
set_property platform.design_intent.external_host "false" [current_project]
set_property platform.design_intent.datacenter "false" [current_project]

# call implement
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# generate xsa
write_hw_platform -include_bit -force ./${overlay_name}.xsa
validate_hw_platform ./${overlay_name}.xsa

# move and rename bitstream to final location
file copy -force ./${overlay_name}/${overlay_name}.runs/impl_1/${design_name}_wrapper.bit ${overlay_name}.bit

# copy hwh files
file copy -force ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/hw_handoff/${design_name}.hwh ${overlay_name}.hwh
