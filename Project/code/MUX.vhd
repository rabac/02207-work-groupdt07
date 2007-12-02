library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_arith.all; 
 
entity MUX is 
 
port (
      SEL: in STD_LOGIC_VECTOR (1 downto 0); 
      A,B,C: in STD_LOGIC_VECTOR(7 downto 0);  
      SIG: out STD_LOGIC_VECTOR(7 downto 0)); 
end MUX; 
 
architecture BEH_MUX of MUX is 
begin 
    SEL_PROCESS: process (SEL,A,B,C) 
    begin 
      case SEL is  
        when "01"  => SIG <= A;  
        when "10"  => SIG <= B;  
        when "11"  => SIG <= C;  
        when others => SIG <= (others => '0');  
      end case;  
    end process SEL_PROCESS; 
end BEH_MUX; 