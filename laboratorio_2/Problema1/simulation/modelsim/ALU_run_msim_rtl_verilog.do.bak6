transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/display_converter.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/mux_10to1.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/xor_module.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/or_module.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/not_module.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/and_module.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/deco_2_4.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/adder_nbits.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/ALU.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/full_adder.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/full_substractor.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/substractor_nbits.sv}
vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/shifter_nbits.sv}

vlog -sv -work work +incdir+D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema\ 1 {D:/Quartus_proyectos/GIT/Lab2/drichmond_digital_design_lab_2023/lab3/Problema 1/ALU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
