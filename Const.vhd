set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# Switches 
set_property PACKAGE_PIN V17 [get_ports {choice1[0]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choice1[0]}]
set_property PACKAGE_PIN V16 [get_ports {choice1[1]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choice1[1]}] 
set_property PACKAGE_PIN W16 [get_ports {choice2[0]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choice2[0]}] 
set_property PACKAGE_PIN W17 [get_ports {choice2[1]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choice2[1]}]
set_property PACKAGE_PIN W15 [get_ports {choice3}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choice3}] 
set_property PACKAGE_PIN R3 [get_ports {choiceT[0]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choiceT[0]}] 
set_property PACKAGE_PIN W2 [get_ports {choiceT[1]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choiceT[1]}] 
set_property PACKAGE_PIN U1 [get_ports {choiceT[2]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choiceT[2]}] 
set_property PACKAGE_PIN T1 [get_ports {choiceT[3]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choiceT[3]}] 
set_property PACKAGE_PIN R2 [get_ports {choiceT[4]}] 
   set_property IOSTANDARD LVCMOS33 [get_ports {choiceT[4]}] 

set_property PACKAGE_PIN U16 [get_ports {LED[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {LED[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {LED[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {LED[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN W18 [get_ports {LED[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
#set_property PACKAGE_PIN U15 [get_ports {LED[5]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
#set_property PACKAGE_PIN U14 [get_ports {LED[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
#set_property PACKAGE_PIN V14 [get_ports {LED[7]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]
#set_property PACKAGE_PIN V13 [get_ports {LED[8]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[8]}]
#set_property PACKAGE_PIN V3 [get_ports {LED[9]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[9]}]
#set_property PACKAGE_PIN W3 [get_ports {LED[10]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[10]}]
set_property PACKAGE_PIN U3 [get_ports {LED[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property PACKAGE_PIN P3 [get_ports {LED[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property PACKAGE_PIN N3 [get_ports {LED[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]
set_property PACKAGE_PIN P1 [get_ports {LED[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[8]}]
set_property PACKAGE_PIN L1 [get_ports {LED[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[9]}]

#Pmod Header JB
#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {efout[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[0]}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {efout[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[1]}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {efout[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[2]}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {efout[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[3]}]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {efout[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[4]}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {efout[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[5]}]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {efout[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[6]}]
#Sch name = JB10
set_property PACKAGE_PIN C16 [get_ports {efout[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {efout[7]}]

##Sch name = JC1 
set_property PACKAGE_PIN K17 [get_ports {test[0]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[0]}] 
##Sch name = JC2 
set_property PACKAGE_PIN M18 [get_ports {test[1]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[1]}] 
##Sch name = JC3 
set_property PACKAGE_PIN N17 [get_ports {test[2]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[2]}] 
##Sch name = JC4 
set_property PACKAGE_PIN P18 [get_ports {test[3]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[3]}] 
##Sch name = JC7 
set_property PACKAGE_PIN L17 [get_ports {test[4]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[4]}] 
##Sch name = JC8 
set_property PACKAGE_PIN M19 [get_ports {test[5]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[5]}] 
##Sch name = JC9 
set_property PACKAGE_PIN P17 [get_ports {test[6]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[6]}] 
##Sch name = JC10 
set_property PACKAGE_PIN R18 [get_ports {test[7]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {test[7]}]

##Pmod Header JXADC
##Sch name = XA1_P
set_property PACKAGE_PIN J3 [get_ports {JXADC[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[0]}]
#Sch name = XA2_P
#set_property PACKAGE_PIN L3 [get_ports {JXADC[1]}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[1]}]
##Sch name = XA3_P
#set_property PACKAGE_PIN M2 [get_ports {JXADC[2]}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[2]}]
##Sch name = XA4_P
#set_property PACKAGE_PIN N2 [get_ports {JXADC[3]}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[3]}]
##Sch name = XA1_N
set_property PACKAGE_PIN K3 [get_ports {JXADC[4]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[4]}]
##Sch name = XA2_N
#set_property PACKAGE_PIN M3 [get_ports {JXADC[5]}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[5]}]
##Sch name = XA3_N
#set_property PACKAGE_PIN M1 [get_ports {JXADC[6]}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[6]}]
##Sch name = XA4_N
#set_property PACKAGE_PIN N1 [get_ports {JXADC[7]}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[7]}]
###Sch name = XA1_N
