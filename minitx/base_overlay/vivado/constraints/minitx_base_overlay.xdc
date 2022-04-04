#############################
#            Cherif Chibane
#            AurseTech Inc.
#            Mini-TX-PYNQ
#            7 Reimhart Way
#            Bridgewater, NJ 08807
#            (c) AurseTech Inc.
##############################
# Rev.
# Rev 1.0  - Added the conenction to the RF front end
#
#
#
#######################
### Frontend control
set_property PACKAGE_PIN AB22 [get_ports {PA_ENA}]
set_property IOSTANDARD LVCMOS33 [get_ports {PA_ENA}]
########
###     REF_ENA_A   REF_ENA_B         Output
###        0          1                Switch Power divide
###        1          0                1W output
###
set_property PACKAGE_PIN AB20 [get_ports {RF_ENA}]
set_property IOSTANDARD LVCMOS33 [get_ports {RF_ENA}]
set_property PACKAGE_PIN W21 [get_ports {RF_ENB}]
set_property IOSTANDARD LVCMOS33 [get_ports {RF_ENB}]

set_property PACKAGE_PIN AB18 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
#########################
set_property PACKAGE_PIN AB19 [get_ports {LED1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED1[0]}]

 
#set_property PACKAGE_PIN T21 [get_ports UART1_TX]
#set_property PACKAGE_PIN U22 [get_ports UART1_RX]
#set_property IOSTANDARD LVCMOS33 [get_ports UART1_RX]
#set_property IOSTANDARD LVCMOS33 [get_ports UART1_TX]

set_property PACKAGE_PIN N20 [get_ports SPI0_SCLK_O_0]
set_property PACKAGE_PIN N18 [get_ports SPI0_MISO_I_0]
set_property PACKAGE_PIN P20 [get_ports SPI0_MOSI_O_0]
set_property PACKAGE_PIN N17 [get_ports SPI0_SS_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MISO_I_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MOSI_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SCLK_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SS_O_0]

set_property PACKAGE_PIN P19 [get_ports SPI1_MOSI_O_0]
set_property PACKAGE_PIN V18 [get_ports SPI1_MISO_I_0]
set_property PACKAGE_PIN P18 [get_ports SPI1_SCLK_O_0]
set_property PACKAGE_PIN U18 [get_ports SPI1_SS_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI1_MISO_I_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI1_MOSI_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI1_SCLK_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI1_SS_O_0]

#CH1 Transmitter
set_property PACKAGE_PIN N7 [get_ports {txd_p_0[0]}]
set_property PACKAGE_PIN K7 [get_ports txclk_p_0]

set_property IOSTANDARD LVDS [get_ports txclk_p_0]
set_property IOSTANDARD LVDS [get_ports {txd_p_0[0]}]

#CH1 Receievr
set_property PACKAGE_PIN M5 [get_ports rxclk_p_0]
set_property PACKAGE_PIN N5 [get_ports {rxd_p_0[0]}]
set_property PACKAGE_PIN L4 [get_ports {rxd24_p_0[0]}]

set_property IOSTANDARD LVDS [get_ports rxclk_p_0]
set_property IOSTANDARD LVDS [get_ports {rxd_p_0[0]}]
set_property IOSTANDARD LVDS [get_ports {rxd24_p_0[0]}]



#CH2 Transmitter
set_property PACKAGE_PIN H7 [get_ports txclk_p_1]
set_property PACKAGE_PIN F7 [get_ports {txd_p_1[0]}]

set_property IOSTANDARD LVDS [get_ports txclk_p_1]
set_property IOSTANDARD LVDS [get_ports {txd_p_1[0]}]

#CH2 Receiver
set_property PACKAGE_PIN J5 [get_ports rxclk_p_1]
set_property PACKAGE_PIN F5 [get_ports {rxd_p_1[0]}]
set_property PACKAGE_PIN H5 [get_ports {rxd24_p_1[0]}]

set_property IOSTANDARD LVDS [get_ports rxclk_p_1]
set_property IOSTANDARD LVDS [get_ports {rxd_p_1[0]}]
set_property IOSTANDARD LVDS [get_ports {rxd24_p_1[0]}]


#set_property LOC IDELAYCTRL_X0Y0 [get_cells design_1_i/TRX_CH2/LVDS_IO_TRX_0/inst/delayctrl]
#set_property LOC IDELAYCTRL_X0Y0 [get_cells design_1_i/TRX_CH1/LVDS_IO_TRX_0/inst/delayctrl]

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
