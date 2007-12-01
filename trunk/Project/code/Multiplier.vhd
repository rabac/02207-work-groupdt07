library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- two 4-bit inputs and one 8-bit outputs
entity multiplier is
port(	num1, num2:	in std_logic_vector(7 downto 0);
	product: 	out std_logic_vector(15 downto 0)
);
end multiplier;

architecture SCHEMATIC of multiplier is

   signal P0: std_logic_vector(15 downto 0);
   signal P1: std_logic_vector(15 downto 0);
   signal P2: std_logic_vector(15 downto 0);
   signal P3: std_logic_vector(15 downto 0);
   signal P4: std_logic_vector(15 downto 0);
   signal P5: std_logic_vector(15 downto 0);
   signal P6: std_logic_vector(15 downto 0);
   signal P7: std_logic_vector(15 downto 0);
   signal A1: std_logic_vector(15 downto 0);
   signal A2: std_logic_vector(15 downto 0);
   signal A3: std_logic_vector(15 downto 0);
   signal A4: std_logic_vector(15 downto 0);
   signal A5: std_logic_vector(15 downto 0);
   signal A6: std_logic_vector(15 downto 0);
   signal A7: std_logic_vector(15 downto 0);
   signal A8: std_logic_vector(15 downto 0);
   signal A9: std_logic_vector(15 downto 0);
   signal A0: std_logic_vector(15 downto 0);
   signal B1: std_logic_vector(15 downto 0);
   signal B2: std_logic_vector(15 downto 0);
   signal B3: std_logic_vector(15 downto 0);
   signal B4: std_logic_vector(15 downto 0);
   signal B5: std_logic_vector(15 downto 0);
   signal carry_ex1,carry_ex2,carry_ex3,carry_ex4,
   carry_ex5,carry_ex6,carry_ex7: std_logic;
   signal ca: std_logic;
   

   component csa8bit
        port (  A : In std_logic_vector (15 downto 0);
                B : In std_logic_vector (15 downto 0);
                C : In std_logic_vector (15 downto 0);
                Cin : In std_logic;
                Cout : Out std_logic;
                Z : Out std_logic_vector (15 downto 0);
                Y : Out std_logic_vector (15 downto 0) );
   end component;
   
   component parcial
        port (  M1: in std_logic_vector(7 downto 0);
                M2: in std_logic_vector(7 downto 0);
                O1: out std_logic_vector(15 downto 0);
                O2: out std_logic_vector(15 downto 0);
                O3: out std_logic_vector(15 downto 0);
                O4: out std_logic_vector(15 downto 0);
                O5: out std_logic_vector(15 downto 0);
                O6: out std_logic_vector(15 downto 0);
                O7: out std_logic_vector(15 downto 0);
                O8: out std_logic_vector(15 downto 0) );
   end component;



	
	
  begin	 
   
 

  I_PAR : parcial
     Port Map(  
                M1(7 downto 0)=>num1(7 downto 0),
                M2(7 downto 0)=>num2 (7 downto 0),
                O1(15 downto 0)=>P0(15 downto 0),
                O2(15 downto 0)=>P1(15 downto 0),
                O3(15 downto 0)=>P2(15 downto 0),
                O4(15 downto 0)=>P3(15 downto 0),
                O5(15 downto 0)=>P4(15 downto 0),
                O6(15 downto 0)=>P5(15 downto 0),
                O7(15 downto 0)=>P6(15 downto 0),
                O8(15 downto 0)=>P7(15 downto 0)
                );


  I_CSA1 : csa8bit
     Port Map (
               A(15 downto 0)=>P0(15 downto 0),
               B(15 downto 0)=>P1(15 downto 0),
               C(15 downto 0)=>P2(15 downto 0),
               Cin=>ca,
               Cout=>carry_ex1,
               Z(15 downto 0)=>A0(15 downto 0),
               Y(15 downto 0)=>A1(15 downto 0)
               );
               
  I_CSA2 : csa8bit
     Port Map ( 
               A(15 downto 0)=>P3(15 downto 0),
               B(15 downto 0)=>P4(15 downto 0),
               C(15 downto 0)=>P5(15 downto 0),
               Cin=>ca,
               Cout=>carry_ex2,
               Z(15 downto 0)=>A2(15 downto 0),
               Y(15 downto 0)=>A3(15 downto 0)
               );
  I_CSA3 : csa8bit
     Port Map ( 
               A(15 downto 0)=>A0(15 downto 0),
               B(15 downto 0)=>A1(15 downto 0),
               C(15 downto 0)=>A2(15 downto 0),
               Cin=>carry_ex1,
               Cout=>carry_ex3,
               Z(15 downto 0)=>A4(15 downto 0),
               Y(15 downto 0)=>A5(15 downto 0)
               );
  I_CSA4 : csa8bit
     Port Map (
               A(15 downto 0)=>A3(15 downto 0),
               B(15 downto 0)=>P6(15 downto 0),
               C(15 downto 0)=>P7(15 downto 0),
               Cin=>carry_ex2,
               Cout=>carry_ex4,
               Z(15 downto 0)=>A6(15 downto 0),
               Y(15 downto 0)=>A7(15 downto 0)
               );
  I_CSA5 : csa8bit
     Port Map (
               A(15 downto 0)=>A4(15 downto 0),
               B(15 downto 0)=>A5(15 downto 0),
               C(15 downto 0)=>A6(15 downto 0),
               Cin=>carry_ex3,
               Cout=>carry_ex5,
               Z(15 downto 0)=>A8(15 downto 0),
               Y(15 downto 0)=>A9(15 downto 0)
               );
   I_CSA6 : csa8bit
     Port Map (
               A(15 downto 0)=>A7(15 downto 0),
               B(15 downto 0)=>A8(15 downto 0),
               C(15 downto 0)=>A9(15 downto 0),
               Cin=>carry_ex4,
               Cout=>carry_ex6,
               Z(15 downto 0)=>B1(15 downto 0),
               Y(15 downto 0)=>B2(15 downto 0)
               );
   I_CSA7 : csa8bit
     Port Map (
               A(15 downto 0)=>B1(15 downto 0),
               B(15 downto 0)=>B2(15 downto 0),
               C(15 downto 0)=>B5(15 downto 0),
               Cin=>carry_ex5,
               Cout=>carry_ex7,
               Z(15 downto 0)=>B3(15 downto 0),
               Y(15 downto 0)=>B4(15 downto 0)
               );
                                  
               
   product(15 downto 0)<= P7(15 downto 0);
               
               
               

end SCHEMATIC;

configuration CFG_multiplier_SCHEMATIC of multiplier is

   for SCHEMATIC
      
      for I_CSA1,I_CSA2,I_CSA3,I_CSA4,I_CSA5,I_CSA6,I_CSA7: csa8bit
         use configuration WORK.CFG_csa8bit_BEHAVIORAL;
      end for;
      for I_PAR: parcial
         use configuration WORK.CFG_parcial_BEHAVIORAL;
      end for;
   end for;

end CFG_multiplier_SCHEMATIC;

















 -- num1_reg := '0' & num1;
 -- product_reg := "0000000000" & num2;

  -- use variables doing computation
  -- algorithm is to repeat shifting/adding
--  for i in 1 to 15 loop
--   if product_reg(0)='1' then
--	  product_reg(5 downto 3) := product_reg(5 downto 3) 
--	  + num1_reg(2 downto 0);
--	end if;
--	product_reg(5 downto 0) := '0' & product_reg(5 downto 1);
 -- end loop;
  
  -- assign the result of computation back to output signal
 -- product <= product_reg(3 downto 0);