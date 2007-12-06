library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity FSM_in_3 is

port (
   clock:		in std_logic;
	reset:		in std_logic;
	address:		out std_logic_vector(15 downto 0);
	can_read:   out std_logic;
	can_write:  out std_logic;
	disable_cache: out std_logic
);
end FSM_in_3;

architecture BEH_FSM_in_3 of FSM_in_3 is
    
    type state_type is (init, init_in_memory_1, init_in_memory_2, h_read_1, h_read_2, h_read_3, h_cache_1, h_cache_2, h_wait, h_temp,
     v_read_1, v_read_2, v_read_3, v_wait, v_temp, exit_in);
    signal next_state, current_state: state_type;

begin    
state_reg: process(clock, reset) 
begin
	          if (reset='0') then
                current_state <= init;
	          elsif (clock'event and clock='1') then
	             current_state <= next_state;
	          end if;
end process;	

comb_logic: process(current_state) 

    variable addr_h: INTEGER;
    variable addr_v: INTEGER;
    variable x: INTEGER;
    variable y: INTEGER;
    variable temp_address: INTEGER;
    variable counter: INTEGER;

begin

		case current_state is

       when init =>
           
           x := 1;
           y := 1;
           counter := 1;
           disable_cache <= '1';
           next_state <= init_in_memory_1;
           can_read <= '0';
           can_write <= '0';
           address <= (others => '0');

       when init_in_memory_1 =>
       
           next_state <= init_in_memory_2;
           can_write <= '1';
           address <= conv_std_logic_vector(counter,16);
           counter := counter + 1;
           
       when init_in_memory_2 =>
       
          can_write <= '1';
          address <= conv_std_logic_vector(counter,16);
           
           if(counter = 65536) then
              next_state <= h_read_1;
              counter := 1;
              can_write <= '0';
              address <= (others => '0');
           else 
              next_state <= init_in_memory_1;
              counter := counter + 1;
           end if;
          
 
           
	    when h_read_1 =>	

            next_state <= h_read_2;
            can_read <= '1';
	         addr_h := x;
            address <= conv_std_logic_vector(addr_h,16);
            disable_cache <= '1';
	    
	    when h_read_2 =>	

	         next_state <= h_read_3;
            can_read <= '1';
	         addr_h := addr_h + 256;
            address <= conv_std_logic_vector(addr_h,16);
            disable_cache <= '0';
            
	    when h_read_3 =>	
	    
	         next_state <= h_cache_1;
            can_read <= '1';
	         addr_h := addr_h + 256;
	         x := x + 1;
            address <= conv_std_logic_vector(addr_h,16);
            disable_cache <= '0';
      
      when h_cache_1 =>
             disable_cache <= '0';
             can_read <= '0';
             
             next_state <= h_wait;
             
	    when h_wait =>	
  
            counter := counter + 1;
   
            can_read <= '0';
            address <= (others => '0');
            next_state <= h_temp;
            disable_cache <= '1';

       when h_temp =>

            counter := counter + 1;
            can_read <= '0';
            address <= (others => '0');
            disable_cache <= '1';

            if(counter > 8) then
               
               counter := 1;
               if(x > 65024) then
                   x := 1;
                   next_state <= v_read_1;
               else
                   next_state <= h_read_1;
               end if;

            else
               next_state <= h_wait;
            end if;
            
           
	    when v_read_1 =>	
	        
            disable_cache <= '0';
            next_state <= v_read_2;
            can_read <= '1';
	         addr_v := x;
            address <= conv_std_logic_vector(addr_v,16);
	    
	    when v_read_2 =>	

	         next_state <= v_read_3;
            can_read <= '1';
	         addr_v := addr_v + 1;
            address <= conv_std_logic_vector(addr_v,16);

	    when v_read_3 =>	
	    
	         next_state <= v_wait;
            can_read <= '1';
	         addr_v := addr_v + 1;
	         x := x + 256;
            address <= conv_std_logic_vector(addr_v,16);

       when v_wait =>
            
            counter := counter + 1;
            next_state <= v_temp;
            
            can_read <= '0';
            address <= (others => '0');
           
            disable_cache <= '1';
            
	    when v_temp =>	

            counter := counter + 1;
            if(counter > 6) then
               
               counter := 1;
               if(x > 65536) then
                     y := y + 1;
                     x := y;
               end if;
            
               if(y = 255) then
                     next_state <= exit_in;
               else 
                     next_state <= v_read_1;
               end if;
            else
               next_state <= v_wait;
            end if;
            
            can_read <= '0';
            address <= (others => '0');

       when exit_in =>
           
            can_read <= '0';
            address <= (others => '0');
            next_state <= exit_in;
            disable_cache <= '1';
           
	    when others =>
	         disable_cache <= '1';
         			next_state <= init;
            can_read <= '0';
            address <= (others => '0');
         
	end case;

end process;   
  
end BEH_FSM_in_3;

configuration CFG_FSM_in_3_BEHAVIORAL of FSM_in_3 is
	 for BEH_FSM_in_3
	 end for;
end CFG_FSM_in_3_BEHAVIORAL;