library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_signed.all;
   use IEEE.std_logic_arith.all;
   
entity Counter is
	port (
		CLOCK : in std_logic;
      en3 : inout std_logic;
      en2 : inout std_logic;
      en1 : inout std_logic;
      en0 : inout std_logic
   		);
end entity Counter;

architecture BEH_Counter of Counter is

begin
       process (CLOCK)
       -- variable ; 
       begin
           if rising_edge(Clock) then
              
               if(en3 = '1') then
                   en3 <= '0';
                   en2 <= '1';
                   en1 <= '0';
                   en0 <= '0';
               elsif (en2 = '1') then
                   en3 <= '0';
                   en2 <= '0';
                   en1 <= '1';
                   en0 <= '0';
               elsif (en1 = '1') then
                   en3 <= '0';
                   en2 <= '0';
                   en1 <= '0';
                   en0 <= '1';
               elsif (en0 = '1') then
                   en3 <= '1';
                   en2 <= '0';
                   en1 <= '0';
                   en0 <= '0';
               else
                   en3 <= '1';
                   en2 <= '0';
                   en1 <= '0';
                   en0 <= '0';
                  
               end if;
           end if;
       end process;
end architecture BEH_Counter;


