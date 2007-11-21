-- VHDL Model Created from SGE Schematic qdsel.sch -- Apr 21 16:58:17 1995

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity QDSEL is
      Port (      A1 : In    std_logic_vector (6 downto 0);
                  A2 : In    std_logic_vector (6 downto 0);
                   D : In    std_logic_vector (2 downto 0);
                  M1 : Out   std_logic;
                  M2 : Out   std_logic;
                  P1 : Out   std_logic;
                  P2 : Out   std_logic );
end QDSEL;

architecture SCHEMATIC of QDSEL is

   signal        Y : std_logic_vector(6 downto 0);

   component QDS_TABLE
      Port (       D : In    std_logic_vector (2 downto 0);
                   Y : In    std_logic_vector (6 downto 0);
                  M1 : Out   std_logic;
                  M2 : Out   std_logic;
                  P1 : Out   std_logic;
                  P2 : Out   std_logic );
   end component;

   component QDS_ADDER
      Port (      A1 : In    std_logic_vector (6 downto 0);
                  A2 : In    std_logic_vector (6 downto 0);
                   Y : Out   std_logic_vector (6 downto 0) );
   end component;

begin

   I_1 : QDS_TABLE
      Port Map ( D(2 downto 0)=>D(2 downto 0),
                 Y(6 downto 0)=>Y(6 downto 0), M1=>M1, M2=>M2, P1=>P1,
                 P2=>P2 );
   I_2 : QDS_ADDER
      Port Map ( A1(6 downto 0)=>A1(6 downto 0),
                 A2(6 downto 0)=>A2(6 downto 0),
                 Y(6 downto 0)=>Y(6 downto 0) );

end SCHEMATIC;

configuration CFG_QDSEL_SCHEMATIC of QDSEL is

   for SCHEMATIC
      for I_1: QDS_TABLE
         use configuration WORK.CFG_QDS_TABLE_BEHAVIORAL;
      end for;
      for I_2: QDS_ADDER
         use configuration WORK.CFG_QDS_ADDER_BEHAVIORAL;
      end for;
   end for;

end CFG_QDSEL_SCHEMATIC;
