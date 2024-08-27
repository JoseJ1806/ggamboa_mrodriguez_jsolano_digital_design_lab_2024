transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/FlipFlop_in.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/Alu.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/n_bit_adder.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/n_bit_multiplier.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/n_bit_subtractor.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/n_bit_divider.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/n_bit_modulus.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/FlipFlop_out.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/Main.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2 {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/laboratorio_2/Problema2/full_subtractor.sv}

