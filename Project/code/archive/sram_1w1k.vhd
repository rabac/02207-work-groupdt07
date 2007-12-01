-- -----------------------------------------------------------------
-- Model for SRAM
-- use at your own risk
-- do not complain if it does not work properly
-- AN
--
-- ----------------------------------------------------------------
library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;
   use IEEE.std_logic_signed.all;

-- 
-- cache direct-mapped 1 word block (1 Kbyte): index 8, byte offset 2
-- see Patterson&Hennessy for cache specifications
-- work is 32 bits
-- 
-- This model uses two data busses: D_BUS is from Main Memory to the Cache
--                                  DB is from Cache to CPU

entity SRAM_1W1K is
      Port (  ENABLE : In    std_logic;
               INDEX : In    std_logic_vector (9 downto 2); -- 1 and 0: byte offset
                  RW : In    std_logic;
               D_BUS : In    std_logic_vector (0 to 31); -- bit 0 is msb
                  DB : Out   std_logic_vector (0 to 31); -- bit 0 is msb
               READY : Out   std_logic );
end SRAM_1W1K;

architecture BEHAVIORAL of SRAM_1W1K is

   begin

  memory : process(index,enable) 
  -- delays for simulation
   constant c_tpd : time := 3 ns;
   constant c_tac : time := 7 ns;

   constant low_adr  : integer := 0;
   constant high_adr : integer := 256 - 1; -- 2^8
   type memory_array is array (low_adr to high_adr) of std_logic_vector(0 to 31);
   variable mem : memory_array;
   variable address : integer;

  begin
    --
    -- initialize outputs
    --
    db <= (others => 'Z') after c_tpd;
    ready <= '0' after c_tpd;
      -- 
      -- wait until ram is enabled
      --
  if (enable = '1') then
	ready <= '0' after c_tpd;
      --
      -- decode address and perform command if selected
      --
      address := CONV_INTEGER(index);
      if address >= low_adr and address <= high_adr then
        if (rw = '0') then 				-- write cycle
          mem(address)  := d_bus(0 to 31);
          -- wait for c_tac;  				-- write access time
          ready <= '1' after 10 ns; -- c_tpd + c_tac;
        elsif (rw = '1') then				-- read cycle
          -- wait for c_tac;  				-- read access time
          db <= mem(address) after c_tac;
          ready <= '1' after (c_tpd + c_tac);
        else
          assert FALSE
          report "cache SRAM: RW line undefined"
          severity warning;
        end if;
      else
        assert FALSE
          report "cache SRAM: memory access to undefined memory region"
          severity warning;
      end if;
  end if;
   
  end process;

end BEHAVIORAL;

configuration CFG_SRAM_1W1K_BEHAVIORAL of SRAM_1W1K is
   for BEHAVIORAL
   end for;
end CFG_SRAM_1W1K_BEHAVIORAL;
