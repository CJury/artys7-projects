# Clock pin
set_property PACKAGE_PIN F14 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# LEDs
set_property PACKAGE_PIN E18  [get_ports {led[0]}]
set_property PACKAGE_PIN F13  [get_ports {led[1]}]
set_property PACKAGE_PIN E13  [get_ports {led[2]}]
set_property PACKAGE_PIN H15 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

# Clock constraints
create_clock -period 10.0 [get_ports {clk}]
