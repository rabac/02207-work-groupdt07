library	ieee;
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;

entity fsm_in_tb is	
end fsm_in_tb;

architecture FSM_TB of fsm_in_tb is

signal T_clock: std_logic; 
signal T_reset:	std_logic;  
signal T_can_read: std_logic;
signal T_address: std_logic_vector(15 downto 0);

component FSM_in_3 is
port (
   clock:		in std_logic;
	reset:		in std_logic;
	address:		out std_logic_vector(15 downto 0);
	can_read:   out std_logic
);
end component FSM_in_3;

begin
	
    U_fsm: fsm_in_3 port map(T_clock, T_reset, T_address, T_can_read);
	
    process
    begin
	   T_clock <= '1';			
	   wait for 5 ns;
	   T_clock <= '0';
	   wait for 5 ns;
    end process;
	
    process		
       variable counter: integer;	   
	 begin
	
	   T_reset <= '1';
	   wait for 20 ns;		
      -- can put assert statements to assure something holds
      T_reset <= '0';
      counter := 0;
      loop
         wait for 10 ns;
         counter := counter + 1;
         if(counter = 32) then
                exit;
         end if;
      end loop;		
   end process;	 
	
end FSM_TB;

----------------------------------------------------------------------
configuration CFG_TB_FSM_IN_3 of FSM_in_TB is
	for FSM_TB
	end for;
end CFG_TB_FSM_IN_3;
-----------------------------------------------------------------------


