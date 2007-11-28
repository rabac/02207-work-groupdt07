library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity FSM_in_3 is

port (
   clock:		in std_logic;
	reset:		in std_logic;
	address:		out std_logic_vector(15 downto 0);
	can_read:   out std_logic
);
end FSM_in_3;

architecture BEH_FSM_in_3 of FSM_in_3 is
    
    type state_type is (S0, S1, S2, S3, S4);
    signal next_state, current_state: state_type;

begin    
state_reg: process(clock, reset) 
begin

	          if (reset='1') then
                current_state <= S0;
	          elsif (clock'event and clock='1') then
	             current_state <= next_state;
	          end if;

end process;	

comb_logic: process(current_state) 
    variable addr: INTEGER;
    variable x, y: INTEGER;

begin

		case current_state is

	    when S0 =>	
	      
	      if(y = 255) then
	         x := x + 1;
	      end if;
	      
	      addr := (x*256) + y;
         next_state <= S1;
         can_read <= '1';
         address <= conv_std_logic_vector(addr,16);
     
	    when S1 =>	

  	      addr := addr + 256;
         next_state <= S2;
         can_read <= '1';
         address <= conv_std_logic_vector(addr,16);
         
	    when S2 =>	

  	      addr := addr + 256;
         next_state <= S3;
         can_read <= '1';
         address <= conv_std_logic_vector(addr,16);
         
	    when S3 =>	

  	      next_state <= S4;
         can_read <= '0';
         address <= conv_std_logic_vector(addr,16);
                  
	    when S4 =>	

         y := y + 1;
         next_state <= S0;
         can_read <= '0';
         address <= (others => '0');
                  
	    when others =>
			next_state <= S0;
         can_read <= '0';

	end case;

end process;   
  
end architecture BEH_FSM_in_3;