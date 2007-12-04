library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- two 4-bit inputs and one 8-bit outputs
entity multiplier is
port(	num1, num2:	in std_logic_vector(7 downto 0);
	product: 	out std_logic_vector(7 downto 0)
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
   

   component csa15bit
        port (  A : In std_logic_vector (15 downto 0);
                B : In std_logic_vector (15 downto 0);
                C : In std_logic_vector (15 downto 0);
                Cin : In std_logic;
                Cout : Out std_logic;
                Z : Out std_logic_vector (15 downto 0);
                Y : Out std_logic_vector (15 downto 0) );
   end component;
   
   component ADDER_M
       port (  A : In std_logic_vector (15 downto 0);
              B : In std_logic_vector (15 downto 0);
              C: In std_logic_vector(15 downto 0);
               Z: In std_logic_vector(15 downto 0));
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
   component CRA_15 is
        port(		A : In std_logic_vector (15 downto 0);
		         B : In std_logic_vector (15 downto 0);
		         Cin : In std_logic;
		         Cout : Out std_logic;
		         Y : Out std_logic_vector (15 downto 0) );
   end component;



	
	
  begin	 
   
    ca<='0';

  I_PAR : parcial
     Port Map(  
                M1=>num1,
                M2=>num2 ,
                O1(15 downto 0)=>P0(15 downto 0),
                O2(15 downto 0)=>P1(15 downto 0),
                O3(15 downto 0)=>P2(15 downto 0),
                O4(15 downto 0)=>P3(15 downto 0),
                O5(15 downto 0)=>P4(15 downto 0),
                O6(15 downto 0)=>P5(15 downto 0),
                O7(15 downto 0)=>P6(15 downto 0),
                O8(15 downto 0)=>P7(15 downto 0)
                );


  I_CSA1 : csa15bit
     Port Map (
               A(15 downto 0)=>P0(15 downto 0),
               B(15 downto 0)=>P1(15 downto 0),
               C(15 downto 0)=>P2(15 downto 0),
               Cin=>ca,
               Cout=>carry_ex1,
               Z(15 downto 0)=>A0(15 downto 0),
               Y(15 downto 0)=>A1(15 downto 0)
               );
               
  I_CSA2 : csa15bit
     Port Map ( 
               A(15 downto 0)=>P3(15 downto 0),
               B(15 downto 0)=>P4(15 downto 0),
               C(15 downto 0)=>P5(15 downto 0),
               Cin=>ca,
               Cout=>carry_ex2,
               Z(15 downto 0)=>A2(15 downto 0),
               Y(15 downto 0)=>A3(15 downto 0)
               );
  I_CSA3 : csa15bit
     Port Map ( 
               A(15 downto 0)=>A0(15 downto 0),
               B(15 downto 0)=>A1(15 downto 0),
               C(15 downto 0)=>A2(15 downto 0),
               Cin=>carry_ex1,
               Cout=>carry_ex3,
               Z(15 downto 0)=>A4(15 downto 0),
               Y(15 downto 0)=>A5(15 downto 0)
               );
  I_CSA4 : csa15bit
     Port Map (
               A(15 downto 0)=>A3(15 downto 0),
               B(15 downto 0)=>P6(15 downto 0),
               C(15 downto 0)=>P7(15 downto 0),
               Cin=>carry_ex2,
               Cout=>carry_ex4,
               Z(15 downto 0)=>A6(15 downto 0),
               Y(15 downto 0)=>A7(15 downto 0)
               );
  I_CSA5 : csa15bit
     Port Map (
               A(15 downto 0)=>A4(15 downto 0),
               B(15 downto 0)=>A5(15 downto 0),
               C(15 downto 0)=>A6(15 downto 0),
               Cin=>carry_ex3,
               Cout=>carry_ex5,
               Z(15 downto 0)=>A8(15 downto 0),
               Y(15 downto 0)=>A9(15 downto 0)
               );
   I_CSA6 : csa15bit
     Port Map (
               A(15 downto 0)=>A7(15 downto 0),
               B(15 downto 0)=>A8(15 downto 0),
               C(15 downto 0)=>A9(15 downto 0),
               Cin=>carry_ex4,
               Cout=>carry_ex6,
               Z(15 downto 0)=>B1(15 downto 0),
               Y(15 downto 0)=>B2(15 downto 0)
               );
   I_CRA : CRA_15
     Port Map (
               A(15 downto 0)=>B1(15 downto 0),
               B(15 downto 0)=>B2(15 downto 0),
               Cin=>carry_ex5,
               Cout=>carry_ex7,
               Y(15 downto 0)=>B3(15 downto 0)
               );
                                  
           
     product(7 downto 0)<= B3(7 downto 0);
               
               
               

end SCHEMATIC;
