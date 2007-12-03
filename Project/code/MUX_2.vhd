library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_arith.all;
 
entity MUX_2 is 
 
port (
      SEL: in STD_LOGIC; 
      A,B: in STD_LOGIC_VECTOR(15 downto 0);  
      SIG: out STD_LOGIC_VECTOR(15 downto 0)); 
end MUX_2; 
 
architecture BEH_MUX_2 of MUX_2 is 
begin 
    SEL_PROCESS: process (SEL,A,B) 
    begin 
      case SEL is  
        when '0'  => SIG <= A;  
        when '1'  => SIG <= B;  
        when others => SIG <= (others => '0');  
      end case;  
    end process SEL_PROCESS; 
end BEH_MUX_2; 
