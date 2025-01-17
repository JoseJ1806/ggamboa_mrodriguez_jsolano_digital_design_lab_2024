transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_2/Sumadorcompleto_4bits.vhd}
vcom -93 -work work {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_2/Sumador_1bit.vhd}
vcom -93 -work work {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_2/sumador_fpga.vhd}

vcom -93 -work work {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Problema_2/Sumadorcompleto_4bits_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Sumadorcompleto_4bits_tb

add wave *
view structure
view signals
run -all
