transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/display_converter.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/mux_10to1.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/xor_module.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/or_module.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/and_module.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/deco_2_4.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/adder_nbits.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/ALU.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/full_substractor.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/substractor_nbits.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/shifter_nbits.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/multiplicator_nbits.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/divider_nbits.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/moduler_nbits.sv}

vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1 {C:/Users/jjsol.J1806/Desktop/Documents/TEC/IIS-2024/TDD/Repositorios/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema1/ALU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
