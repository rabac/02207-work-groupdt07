library IEEE;
   use IEEE.std_logic_1164.all;

entity gl_dualreg_ld is
     GENERIC(n : integer);
      Port (      AS : In    std_logic_vector (n downto 0);
                  AC : In    std_logic_vector (n downto 0);
               RESET : In    std_logic;
               CLOCK : In    std_logic;
                LOAD : In    std_logic;
                  ZS : Out   std_logic_vector (n downto 0);
                  ZC : Out   std_logic_vector (n downto 0) );
end gl_dualreg_ld;

architecture BEHAVIORAL of gl_dualreg_ld is

begin

  process(reset,clock)
      begin

      if ( reset = '0' ) then
	ZS <= (others => '0');
	ZC <= (others => '0');

      elsif (( clock = '1' ) and (clock'EVENT)) then
           if ( load = '1' ) then
              ZS <= AS ;
              ZC <= AC ;
           end if;
      end if;

  end process;

end BEHAVIORAL;

configuration CFG_gl_dualreg_ld_BEHAVIORAL of gl_dualreg_ld is
   for BEHAVIORAL
   end for;
end CFG_gl_dualreg_ld_BEHAVIORAL;
