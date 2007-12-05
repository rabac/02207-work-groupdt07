library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity FSM_out_3 is

port (
   clock:		in std_logic;
	reset:		in std_logic;
	read_address:		out std_logic_vector(15 downto 0);
	write_address:		out std_logic_vector(15 downto 0);
	can_read:   out std_logic;
	can_write:  out std_logic;
	sel: out std_logic_vector(1 downto 0)
);
end FSM_out_3;

architecture BEH_FSM_out_3 of FSM_out_3 is
    
    type state_type is (init, h_init_1, h_init_2, h_read_1, h_read_write_1, h_read_write_2, h_write_1, h_wait_1, h_wait_2,
     v_init_1, v_init_2, v_read_1, v_write_1, v_wait_1, v_wait_2, exit_in);
    signal next_state, current_state: state_type;

begin    
state_reg: process(clock, reset) 
begin
	          if (reset='1') then
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
    variable rwcount: INTEGER;
    variable sel_num: INTEGER;
   
begin

		case current_state is

       when init =>
           x := 257;
           counter := 1;
           rwcount := 1;
           sel_num := 0;
           
           next_state <= h_init_1;
           
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');
           
       when h_init_1 =>
            
           if(counter = 27) then
               
               counter := 1;
               next_state <= h_read_1;
               addr_h := x;
               
           else
               next_state <= h_init_2;
           end if;
 
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');
           counter := counter + 1;
                    
       when h_init_2 =>
           
           counter := counter + 1;
           next_state <= h_init_1;
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');
          
	    when h_read_1 =>	

            next_state <= h_read_write_1;
           
            can_read <= '1';
            can_write <= '0';
            read_address <= conv_std_logic_vector(addr_h,16);
            write_address <= (others => '0');
            sel <= conv_std_logic_vector(sel_num,2);
            sel_num := sel_num + 1;
            
       when h_read_write_1 =>
           
           next_state <= h_write_1;

            can_read <= '0';
            can_write <= '0';
            read_address <= (others => '0');
            write_address <= (others => '0');
            
       when h_read_write_2 =>
           
           next_state <= h_write_1;

            can_read <= '0';
            can_write <= '0';
            read_address <= (others => '0');
            write_address <= (others => '0');

	    when h_write_1 =>	
            
            rwcount := rwcount + 1;
            if(rwcount > 3) then
               next_state <= h_wait_1;
               rwcount := 1;
               sel_num := 0;
            else
               next_state <= h_read_1;
            end if;
           
            can_read <= '0';
            can_write <= '1';
            read_address <= (others => '0');
            write_address <= conv_std_logic_vector(addr_h,16);

            addr_h := addr_h + 1 ;
           
       -- wait for 3 clock cycles - till FSM1 reads the next 3 pixels 
	    when h_wait_1 =>	
   
            counter := counter + 1;
            if(counter > 3) then
               
               counter := 1;
               if(x > 65277) then
                   x := 2;
                   next_state <= v_init_1;
                   rwcount := 1;
                   sel_num := 0;
                  
               else
                   if((addr_h mod 256) = 1) then
                        x := addr_h;
                   else
                        x := x + 1; 
                        addr_h := x;
                   end if;
               
                   next_state <= h_read_1;
               end if;

            else
               next_state <= h_wait_2;
            end if;

           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');

       when h_wait_2 =>
           
           counter := counter + 1;
           next_state <= h_wait_1;
           
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');

---------------------------------------------
--- States defining the Vertical Movement ---
---------------------------------------------

       when v_init_1 =>
            
           counter := counter + 1;
           
           next_state <= v_init_2;
           
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');
            
       when v_init_2 =>
           
           counter := counter + 1;
           if(counter > 20) then
               
               counter := 1;
               next_state <= v_read_1;
               addr_v := x;
                             
           else
               next_state <= v_init_1;
           end if;
            
	    when v_read_1 =>	

            next_state <= v_write_1;
               
            can_read <= '1';
            can_write <= '0';
            read_address <= conv_std_logic_vector(addr_v,16);
            write_address <= (others => '0');
            sel <= conv_std_logic_vector(sel_num,2);
            sel_num := sel_num + 1;
	    
	    when v_write_1 =>	
            
            rwcount := rwcount + 1;
            if(rwcount > 3) then
               next_state <= v_wait_1;
               rwcount := 1;
               sel_num := 0;
            else
               next_state <= v_read_1;
            end if;
           
            can_read <= '0';
            can_write <= '1';
            read_address <= (others => '0');
            write_address <= conv_std_logic_vector(addr_v,16);

            addr_v := addr_v + 256;
           
       -- wait for 3 clock cycles - till FSM1 reads the next 3 pixels 
	    when v_wait_1 =>	
   
            counter := counter + 1;
            if(counter > 3) then
               
               counter := 1;
               if(addr_v > 65536) then
                   x := x + 1;
                   if(x = 256) then
                      next_state <= exit_in;
                   else                 
                      addr_v := x;
                      next_state <= v_read_1;
                   end if;
               else
                   addr_v := addr_v - 512;
                   next_state <= v_read_1;
               end if;

            else
               next_state <= v_wait_2;
            end if;

           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');

       when v_wait_2 =>
           
           counter := counter + 1;
           next_state <= v_wait_1;
           
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');

       when exit_in =>
           
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');
           
           next_state <= exit_in;
           
	    when others =>
           
           can_read <= '0';
           can_write <= '0';
           read_address <= (others => '0');
           write_address <= (others => '0');

  			  next_state <= init;
         
	end case;

end process;   
  
end architecture BEH_FSM_out_3;