set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CP }];    #时钟                                           
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { nCR }];   #清零
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { En }];    #使能

set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { AM }];    #调节分
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { AH }];    #调节时

set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { ledr }];   #灯
set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { ledb }];   #灯
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { ledg }];   #灯

set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { Ctl }];   #转换

set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]; #ca
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]; #cb
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]; #cc
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]; #cd
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]; #ce
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]; #cf
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]; #cg
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { seg[7] }]; #dp


set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { sel[0] }]; #an[0]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { sel[1] }]; #an[1]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { sel[2] }]; #an[2]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { sel[3] }]; #an[3]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { sel[4] }]; #an[4]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { sel[5] }]; #an[5]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { sel[6] }]; #an[6]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { sel[7] }]; #an[7]
