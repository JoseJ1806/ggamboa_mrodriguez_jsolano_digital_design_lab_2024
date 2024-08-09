transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Marco\ Rodriguez/Desktop/Quartus\ projects/Problema_3 {C:/Users/Marco Rodriguez/Desktop/Quartus projects/Problema_3/binary_to_seven_segment.v}
vlog -sv -work work +incdir+C:/Users/Marco\ Rodriguez/Desktop/Quartus\ projects/Problema_3 {C:/Users/Marco Rodriguez/Desktop/Quartus projects/Problema_3/substractor.sv}
vlog -sv -work work +incdir+C:/Users/Marco\ Rodriguez/Desktop/Quartus\ projects/Problema_3 {C:/Users/Marco Rodriguez/Desktop/Quartus projects/Problema_3/Problema_3.sv}

vlog -sv -work work +incdir+C:/Users/Marco\ Rodriguez/Desktop/Quartus\ projects/Problema_3 {C:/Users/Marco Rodriguez/Desktop/Quartus projects/Problema_3/Problema_3_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Problema_3_tb

add wave *
view structure
view signals
run -all
