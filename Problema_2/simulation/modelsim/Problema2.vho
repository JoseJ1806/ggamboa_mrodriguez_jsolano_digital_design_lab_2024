-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "08/08/2024 00:55:57"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sumador_fpga IS
    PORT (
	SW : IN std_logic_vector(7 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END sumador_fpga;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sumador_fpga IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \UUT|sumador1|S~combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \UUT|sumador2|S~combout\ : std_logic;
SIGNAL \UUT|sumador1|Cout~combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \UUT|sumador3|S~combout\ : std_logic;
SIGNAL \UUT|sumador0|S~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \UUT|sumador3|ALT_INV_S~combout\ : std_logic;
SIGNAL \UUT|sumador1|ALT_INV_Cout~combout\ : std_logic;
SIGNAL \UUT|sumador2|ALT_INV_S~combout\ : std_logic;
SIGNAL \UUT|sumador1|ALT_INV_S~combout\ : std_logic;
SIGNAL \UUT|sumador0|ALT_INV_S~0_combout\ : std_logic;

BEGIN

ww_SW <= SW;
HEX0 <= ww_HEX0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;
\ALT_INV_Mux4~0_combout\ <= NOT \Mux4~0_combout\;
\ALT_INV_Mux5~0_combout\ <= NOT \Mux5~0_combout\;
\UUT|sumador3|ALT_INV_S~combout\ <= NOT \UUT|sumador3|S~combout\;
\UUT|sumador1|ALT_INV_Cout~combout\ <= NOT \UUT|sumador1|Cout~combout\;
\UUT|sumador2|ALT_INV_S~combout\ <= NOT \UUT|sumador2|S~combout\;
\UUT|sumador1|ALT_INV_S~combout\ <= NOT \UUT|sumador1|S~combout\;
\UUT|sumador0|ALT_INV_S~0_combout\ <= NOT \UUT|sumador0|S~0_combout\;

-- Location: IOOBUF_X60_Y0_N19
\HEX0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(0));

-- Location: IOOBUF_X80_Y0_N2
\HEX0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(1));

-- Location: IOOBUF_X50_Y0_N93
\HEX0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(2));

-- Location: IOOBUF_X50_Y0_N76
\HEX0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(3));

-- Location: IOOBUF_X56_Y0_N36
\HEX0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(4));

-- Location: IOOBUF_X58_Y0_N76
\HEX0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(5));

-- Location: IOOBUF_X56_Y0_N53
\HEX0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

-- Location: IOIBUF_X89_Y20_N44
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X89_Y20_N61
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X89_Y21_N4
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LABCELL_X83_Y16_N39
\UUT|sumador1|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \UUT|sumador1|S~combout\ = ( \SW[0]~input_o\ & ( \SW[1]~input_o\ & ( !\SW[4]~input_o\ $ (\SW[5]~input_o\) ) ) ) # ( !\SW[0]~input_o\ & ( \SW[1]~input_o\ & ( !\SW[5]~input_o\ ) ) ) # ( \SW[0]~input_o\ & ( !\SW[1]~input_o\ & ( !\SW[4]~input_o\ $ 
-- (!\SW[5]~input_o\) ) ) ) # ( !\SW[0]~input_o\ & ( !\SW[1]~input_o\ & ( \SW[5]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101011010101011111111000000001010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[4]~input_o\,
	datad => \ALT_INV_SW[5]~input_o\,
	datae => \ALT_INV_SW[0]~input_o\,
	dataf => \ALT_INV_SW[1]~input_o\,
	combout => \UUT|sumador1|S~combout\);

-- Location: IOIBUF_X89_Y20_N78
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LABCELL_X83_Y16_N42
\UUT|sumador2|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \UUT|sumador2|S~combout\ = ( \SW[0]~input_o\ & ( \SW[1]~input_o\ & ( !\SW[6]~input_o\ $ (!\SW[2]~input_o\ $ (((\SW[4]~input_o\) # (\SW[5]~input_o\)))) ) ) ) # ( !\SW[0]~input_o\ & ( \SW[1]~input_o\ & ( !\SW[5]~input_o\ $ (!\SW[6]~input_o\ $ 
-- (\SW[2]~input_o\)) ) ) ) # ( \SW[0]~input_o\ & ( !\SW[1]~input_o\ & ( !\SW[6]~input_o\ $ (!\SW[2]~input_o\ $ (((\SW[5]~input_o\ & \SW[4]~input_o\)))) ) ) ) # ( !\SW[0]~input_o\ & ( !\SW[1]~input_o\ & ( !\SW[6]~input_o\ $ (!\SW[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100001101101100100101100110100110010110110010010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[5]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	datad => \ALT_INV_SW[2]~input_o\,
	datae => \ALT_INV_SW[0]~input_o\,
	dataf => \ALT_INV_SW[1]~input_o\,
	combout => \UUT|sumador2|S~combout\);

-- Location: LABCELL_X83_Y16_N48
\UUT|sumador1|Cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \UUT|sumador1|Cout~combout\ = ( \SW[0]~input_o\ & ( \SW[1]~input_o\ & ( (\SW[4]~input_o\) # (\SW[5]~input_o\) ) ) ) # ( !\SW[0]~input_o\ & ( \SW[1]~input_o\ & ( \SW[5]~input_o\ ) ) ) # ( \SW[0]~input_o\ & ( !\SW[1]~input_o\ & ( (\SW[5]~input_o\ & 
-- \SW[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010101010101010101010101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[5]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	datae => \ALT_INV_SW[0]~input_o\,
	dataf => \ALT_INV_SW[1]~input_o\,
	combout => \UUT|sumador1|Cout~combout\);

-- Location: IOIBUF_X89_Y25_N38
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: LABCELL_X83_Y16_N54
\UUT|sumador3|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \UUT|sumador3|S~combout\ = ( \SW[2]~input_o\ & ( \SW[3]~input_o\ & ( !\SW[7]~input_o\ $ (((\UUT|sumador1|Cout~combout\) # (\SW[6]~input_o\))) ) ) ) # ( !\SW[2]~input_o\ & ( \SW[3]~input_o\ & ( !\SW[7]~input_o\ $ (((\SW[6]~input_o\ & 
-- \UUT|sumador1|Cout~combout\))) ) ) ) # ( \SW[2]~input_o\ & ( !\SW[3]~input_o\ & ( !\SW[7]~input_o\ $ (((!\SW[6]~input_o\ & !\UUT|sumador1|Cout~combout\))) ) ) ) # ( !\SW[2]~input_o\ & ( !\SW[3]~input_o\ & ( !\SW[7]~input_o\ $ (((!\SW[6]~input_o\) # 
-- (!\UUT|sumador1|Cout~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111100001111111100000011111100000000111100000000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \UUT|sumador1|ALT_INV_Cout~combout\,
	datad => \ALT_INV_SW[7]~input_o\,
	datae => \ALT_INV_SW[2]~input_o\,
	dataf => \ALT_INV_SW[3]~input_o\,
	combout => \UUT|sumador3|S~combout\);

-- Location: LABCELL_X83_Y16_N30
\UUT|sumador0|S~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UUT|sumador0|S~0_combout\ = ( \SW[0]~input_o\ & ( !\SW[4]~input_o\ ) ) # ( !\SW[0]~input_o\ & ( \SW[4]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000000001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[4]~input_o\,
	datae => \ALT_INV_SW[0]~input_o\,
	combout => \UUT|sumador0|S~0_combout\);

-- Location: LABCELL_X83_Y16_N3
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \UUT|sumador3|S~combout\ & ( \UUT|sumador0|S~0_combout\ ) ) # ( !\UUT|sumador3|S~combout\ & ( \UUT|sumador0|S~0_combout\ & ( !\UUT|sumador1|S~combout\ $ (!\UUT|sumador2|S~combout\) ) ) ) # ( \UUT|sumador3|S~combout\ & ( 
-- !\UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador2|S~combout\) # (\UUT|sumador1|S~combout\) ) ) ) # ( !\UUT|sumador3|S~combout\ & ( !\UUT|sumador0|S~0_combout\ & ( (\UUT|sumador2|S~combout\) # (\UUT|sumador1|S~combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111111100111111001100111100001111001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UUT|sumador1|ALT_INV_S~combout\,
	datac => \UUT|sumador2|ALT_INV_S~combout\,
	datae => \UUT|sumador3|ALT_INV_S~combout\,
	dataf => \UUT|sumador0|ALT_INV_S~0_combout\,
	combout => \Mux6~0_combout\);

-- Location: LABCELL_X83_Y16_N9
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \UUT|sumador3|S~combout\ & ( \UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador1|S~combout\ & \UUT|sumador2|S~combout\) ) ) ) # ( !\UUT|sumador3|S~combout\ & ( \UUT|sumador0|S~0_combout\ & ( !\UUT|sumador1|S~combout\ $ 
-- (\UUT|sumador2|S~combout\) ) ) ) # ( !\UUT|sumador3|S~combout\ & ( !\UUT|sumador0|S~0_combout\ & ( (\UUT|sumador1|S~combout\ & !\UUT|sumador2|S~combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000000000000011000011110000110000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UUT|sumador1|ALT_INV_S~combout\,
	datac => \UUT|sumador2|ALT_INV_S~combout\,
	datae => \UUT|sumador3|ALT_INV_S~combout\,
	dataf => \UUT|sumador0|ALT_INV_S~0_combout\,
	combout => \Mux5~0_combout\);

-- Location: LABCELL_X83_Y16_N12
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador3|S~combout\) # ((!\UUT|sumador1|S~combout\ & !\UUT|sumador2|S~combout\)) ) ) # ( !\UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador3|S~combout\ & (!\UUT|sumador1|S~combout\ & 
-- \UUT|sumador2|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001000000000001000100011101110101010101110111010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UUT|sumador3|ALT_INV_S~combout\,
	datab => \UUT|sumador1|ALT_INV_S~combout\,
	datad => \UUT|sumador2|ALT_INV_S~combout\,
	dataf => \UUT|sumador0|ALT_INV_S~0_combout\,
	combout => \Mux4~0_combout\);

-- Location: LABCELL_X83_Y16_N15
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \UUT|sumador0|S~0_combout\ & ( !\UUT|sumador1|S~combout\ $ (\UUT|sumador2|S~combout\) ) ) # ( !\UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador3|S~combout\ & (!\UUT|sumador1|S~combout\ & \UUT|sumador2|S~combout\)) # 
-- (\UUT|sumador3|S~combout\ & (\UUT|sumador1|S~combout\ & !\UUT|sumador2|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100000011000000110000001100011000011110000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UUT|sumador3|ALT_INV_S~combout\,
	datab => \UUT|sumador1|ALT_INV_S~combout\,
	datac => \UUT|sumador2|ALT_INV_S~combout\,
	dataf => \UUT|sumador0|ALT_INV_S~0_combout\,
	combout => \Mux3~0_combout\);

-- Location: LABCELL_X83_Y16_N18
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \UUT|sumador0|S~0_combout\ & ( (\UUT|sumador3|S~combout\ & (\UUT|sumador1|S~combout\ & \UUT|sumador2|S~combout\)) ) ) # ( !\UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador3|S~combout\ & (\UUT|sumador1|S~combout\ & 
-- !\UUT|sumador2|S~combout\)) # (\UUT|sumador3|S~combout\ & ((\UUT|sumador2|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001010101001000100101010100000000000100010000000000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UUT|sumador3|ALT_INV_S~combout\,
	datab => \UUT|sumador1|ALT_INV_S~combout\,
	datad => \UUT|sumador2|ALT_INV_S~combout\,
	dataf => \UUT|sumador0|ALT_INV_S~0_combout\,
	combout => \Mux2~0_combout\);

-- Location: LABCELL_X83_Y16_N21
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador3|S~combout\ & (!\UUT|sumador1|S~combout\ & \UUT|sumador2|S~combout\)) # (\UUT|sumador3|S~combout\ & (\UUT|sumador1|S~combout\)) ) ) # ( !\UUT|sumador0|S~0_combout\ & ( 
-- (\UUT|sumador2|S~combout\ & ((\UUT|sumador1|S~combout\) # (\UUT|sumador3|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001110000011100011001000110010001100100011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UUT|sumador3|ALT_INV_S~combout\,
	datab => \UUT|sumador1|ALT_INV_S~combout\,
	datac => \UUT|sumador2|ALT_INV_S~combout\,
	dataf => \UUT|sumador0|ALT_INV_S~0_combout\,
	combout => \Mux1~0_combout\);

-- Location: LABCELL_X83_Y16_N24
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \UUT|sumador3|S~combout\ & ( \UUT|sumador0|S~0_combout\ & ( !\UUT|sumador2|S~combout\ $ (!\UUT|sumador1|S~combout\) ) ) ) # ( !\UUT|sumador3|S~combout\ & ( \UUT|sumador0|S~0_combout\ & ( (!\UUT|sumador2|S~combout\ & 
-- !\UUT|sumador1|S~combout\) ) ) ) # ( !\UUT|sumador3|S~combout\ & ( !\UUT|sumador0|S~0_combout\ & ( (\UUT|sumador2|S~combout\ & !\UUT|sumador1|S~combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000000000000000000011001100000000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UUT|sumador2|ALT_INV_S~combout\,
	datad => \UUT|sumador1|ALT_INV_S~combout\,
	datae => \UUT|sumador3|ALT_INV_S~combout\,
	dataf => \UUT|sumador0|ALT_INV_S~0_combout\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X36_Y75_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


