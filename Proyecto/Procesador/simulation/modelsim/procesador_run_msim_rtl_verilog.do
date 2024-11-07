transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/ram_rgb.v}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/image_loader.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/vgaController.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/pll.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/generate_graphic.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/generate_rectangle.sv}
vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/vga_prueba.sv}

vlog -sv -work work +incdir+C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador {C:/Users/User/Documents/GitHub/ggamboa_mrodriguez_jsolano_digital_design_lab_2024/Proyecto/Procesador/tb_vga_prueba.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_vga_prueba

add wave *
view structure
view signals
run -all
