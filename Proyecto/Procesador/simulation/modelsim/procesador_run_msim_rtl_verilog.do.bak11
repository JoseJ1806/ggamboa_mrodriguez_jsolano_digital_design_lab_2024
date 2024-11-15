transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/ram1.v}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/controller.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/decoder.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/condlogic.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/datapath.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/regfile.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/extend.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/flopr.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/mux2.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/adder.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/Alu.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/full_subtractor.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/n_bit_adder.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/n_bit_subtractor.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/condcheck.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/CPU.sv}

vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/CPU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  CPU_tb

add wave *
view structure
view signals
run -all
