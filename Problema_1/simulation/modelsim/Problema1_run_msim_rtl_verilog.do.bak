transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_1/Problema1.sv}

vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_1/Problema1_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Problema1_tb

add wave *
view structure
view signals
run -all
