transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/contadorXY.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/controladorVGA.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/rectgen.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/vga.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/divisorClk.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/lineas.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/muxSeleccionador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/regfile1x24b.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/controlTOP.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/mux_9a1.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/spriteCircle.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/ROM_Circle.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/spritePosition.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/ROM_X.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/sprite_X.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/Turnos.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/buttonBouncer.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/Mover.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/lineaGanadoraGen.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/muxSeleccionadorGanador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/sprite_X_Ganador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/spritePosition_Ganador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/ROM_X_Ganador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/sprite_Circle_Ganador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/ROM_Circle_Ganador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/temporizador.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/LFSR.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/sprite_Empate.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/ROM_Empate.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/spritePosition_Empate.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/Ganador2.sv}
vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/always_ganador.sv}

vlog -sv -work work +incdir+C:/Users/jjsol.J1806/Desktop/Copia {C:/Users/jjsol.J1806/Desktop/Copia/TestGato.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TestGato

add wave *
view structure
view signals
run -all
