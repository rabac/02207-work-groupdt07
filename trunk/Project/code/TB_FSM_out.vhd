library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity fsm_out_tb is	
end fsm_out_tb;

architecture FSM_TB of fsm_out_tb is

signal T_clock: std_logic; 
signal T_reset:	std_logic;  
signal T_can_read: std_logic;
signal T_can_write: std_logic;
signal T_read_address: std_logic_vector(15 downto 0);
signal T_write_address: std_logic_vector(15 downto 0);
signal T_sel: std_logic_vector(1 downto 0);
signal t_read_addr: NATURAL;
signal t_write_addr: NATURAL;
signal t_sel_num: NATURAL;

component FSM_out_3 is
port (
   clock:		in std_logic;
	reset:		in std_logic;
	read_address:		out std_logic_vector(15 downto 0);
	write_address:		out std_logic_vector(15 downto 0);
	can_read:   out std_logic;
	can_write:  out std_logic;
	sel: out std_logic_vector(1 downto 0)
);
end component FSM_out_3;

begin
	
    U_fsm: fsm_out_3 port map(T_clock, T_reset, T_read_address, T_write_address, T_can_read, T_can_write, T_sel);
	
    process
    begin
	   T_clock <= '1';			
	   wait for 1 ns;
	   T_clock <= '0';
	   wait for 1 ns;
    end process;
	
    process		
       variable counter: integer;	
    begin
	
	   T_reset <= '0';
	   wait for 2 ns;		
      -- can put assert statements to assure something holds
      T_reset <= '1';
      
      loop
         
         T_read_addr <= conv_integer(T_read_address);
         T_write_addr <= conv_integer(T_write_address);
         T_sel_num <= conv_integer(T_sel);
         wait for 2 ns;
         
      end loop;		
   end process;	 
	
end FSM_TB;

----------------------------------------------------------------------
configuration CFG_TB_FSM_out_3 of FSM_out_TB is
	for FSM_TB
	end for;
end CFG_TB_FSM_out_3;
-----------------------------------------------------------------------




