LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY toplevel_shiftreg IS
	PORT (
		CLK		: IN	STD_LOGIC;
		RSTx		: IN	STD_LOGIC;
		data_in	: IN	STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_out	: OUT	STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END toplevel_shiftreg;


ARCHITECTURE struct OF toplevel_shiftreg IS

	-- Signals AKA internal wiring
	SIGNAL s_R1_to_R2	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_R2_to_R3	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_R3_to_R4	: STD_LOGIC_VECTOR(7 DOWNTO 0);

	COMPONENT REG
	PORT (
		Clock	: IN	STD_LOGIC;
		Reset	: IN	STD_LOGIC;
		D	: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		Q	: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

	R1 : REG
		PORT MAP (
			Clock	=> CLK,
			Reset	=> RSTx,
			D	=> data_in,
			Q	=> s_R1_to_R2
		);

	R2 : REG
		PORT MAP (
			Clock	=> CLK,
			Reset	=> RSTx,
			D	=> s_R1_to_R2,
			Q	=> s_R2_to_R3
		);

	R3 : REG
		PORT MAP (
			Clock	=> CLK,
			Reset	=> RSTx,
			D	=> s_R2_to_R3,
			Q	=> s_R3_to_R4
		);

	R4 : REG
		PORT MAP (
			Clock	=> CLK,
			Reset	=> RSTx,
			D	=> s_R3_to_R4,
			Q	=> data_out(31 DOWNTO 24)
		);
		
		data_out(23 DOWNTO 16) <= s_R3_R4;

END struct;
