library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity parcial is 
   port(   M1: in std_logic_vector(7 downto 0);
           M2: in std_logic_vector(7 downto 0);
           O1: out std_logic_vector(15 downto 0);
           O2: out std_logic_vector(15 downto 0);
           O3: out std_logic_vector(15 downto 0);
           O4: out std_logic_vector(15 downto 0);
           O5: out std_logic_vector(15 downto 0);
           O6: out std_logic_vector(15 downto 0);
           O7: out std_logic_vector(15 downto 0);
           O8: out std_logic_vector(15 downto 0) );
end parcial;

architecture BEHAVIORAL of parcial is
    signal aux: std_logic;
    signal Pa: std_logic_vector(15 downto 0);
    signal P: std_logic_vector(127 downto 0);
    begin
        
    process(M1,M2)
        variable i,j,x,y: integer;
        
    begin
        
        x:=15;
        y:=0;
        for i in 0 to 7 loop
        
           for j in 0 to 7 loop
           Pa(j+i)<= M1(j) AND M2(i);
           end loop;
           P(x downto y)<=Pa(15 downto 0);
           x:=x+16;
           y:=y+16;
        end loop;
        
        O1(15 downto 0)<= P(15 downto 0);
        O2(15 downto 0)<= P(31 downto 16);
        O3(15 downto 0)<= P(47 downto 32);
        O4(15 downto 0)<= P(63 downto 48);
        O5(15 downto 0)<= P(79 downto 64);
        O6(15 downto 0)<= P(95 downto 80);
        O7(15 downto 0)<= P(111 downto 96);
        O8(15 downto 0)<= P(127 downto 112);
        
        
        
end process;

end BEHAVIORAL;

configuration CFG_parcial_BEHAVIORAL of parcial is
	 for BEHAVIORAL
	 end for;
end CFG_parcial_BEHAVIORAL;