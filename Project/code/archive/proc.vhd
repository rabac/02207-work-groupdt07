library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity Processor is
      Port (   CLOCK : In    std_logic;
                   D : In    std_logic_vector (2047 downto 0);
               RESET : In    std_logic;
                  Qj : Out   std_logic_vector (2047 downto 0) );
end Processor;

architecture SCHEMATIC of Processor is

   signal       Y1 : std_logic_vector(2047 downto 0);
   signal       Y2 : std_logic_vector(2047 downto 0);
   signal       Y3 : std_logic_vector(2047 downto 0);
   signal       D3 : std_logic_vector(2047 downto 0);
   signal       F : std_logic_vector(71 downto 0);
   signal       M1 : std_logic_vector(7 downto 0);
   signal       M2 : std_logic_vector(7 downto 0);
   signal       M3 : std_logic_vector(7 downto 0);
   signal       M4 : std_logic_vector(7 downto 0);
   signal       M5 : std_logic_vector(7 downto 0);
   signal       M6 : std_logic_vector(7 downto 0);
   signal       M7 : std_logic_vector(7 downto 0);
   signal       M8 : std_logic_vector(7 downto 0);
   signal       M9 : std_logic_vector(7 downto 0);
   signal       A1 : std_logic_vector(7 downto 0);
   signal       A2 : std_logic_vector(7 downto 0);
   signal       A3 : std_logic_vector(7 downto 0);
   signal       E1 : std_logic_vector(7 downto 0);
   signal       E2 : std_logic_vector(7 downto 0);
   signal       E3 : std_logic_vector(7 downto 0);
   signal     CLR : std_logic;
   signal     LOAD : std_logic;
   signal     SIGN : std_logic;
   signal     GND : std_logic;
   variable     n : integer;-- it has to be iniciate to 0.
   



   component  ADDER 
        Port (  A : In std_logic_vector (7 downto 0);
                B : In std_logic_vector (7 downto 0);
                C : In std_logic_vector (7 downto 0);
                Cin : In std_logic;
                Cout : Out std_logic;
                Z : Out std_logic_vector (7 downto 0)
                 );
   end component;

   component reg_ld 
     GENERIC(n : integer);
      Port (      AS : In    std_logic_vector (n downto 0);   
               RESET : In    std_logic;
               CLOCK : In    std_logic;
                LOAD : In    std_logic;
                  ZS : Out   std_logic_vector (n downto 0)
                  );

   end component;


   component Multiplier
      Port (       A : In    std_logic_vector (7 downto 0);
			 B : In    std_logic_vector (7 downto 0);
                   Z : Out   std_logic_vector (7 downto 0) );
   end component;

begin

GND <= '0';

 
	--The three rows of the image are stored on the registers

 Reg_IN1: reg_ld Generic Map (n=>2047)
	Port Map(in(here the row from the memory but l don't know how), RESET=>RESET,CLOCK=>CLOCK,LOAD=>LOAD, ZS=>Y1);

	--Y1 the first row

 Reg_IN2: reg_ld Generic Map (n=>2047)
	Port Map(in(the same), RESET=>RESET,CLOCK=>CLOCK,LOAD=>LOAD, ZS=>Y2);

	--Y2 the second row

 Reg_IN3: reg_ld Generic Map (n=>2047)
	Port Map(in(the same), RESET=>RESET,CLOCK=>CLOCK,LOAD=>LOAD, ZS=>Y3);

	--Y3 the third row


 Reg_MASK: reg_ld Generic Map (n=>71)
	Port Map (in(the filter imput can be a vector with the values), RESET=>RESET,CLOCK=>CLOCK,LOAD=>LOAD, ZS=>F);


 --A is the pixel value of the image and B is the filter value.


 Mult1: Multiplier
	Port Map (A=>Y1(n+7 downto n), B=>M(7 downto 0),Z=>M1 );  
 
 Mult2: Multiplier
	Port Map (A=>Y2(n+7 downto n), B=>M(31 downto 24),Z=>M2 );
 
 Mult3: Multiplier
	Port Map (A=>Y3(n+7 downto n), B=>M(55 downto 48),Z=>M3 );

	n=>n+8;


 Mult4: Multiplier
	Port Map (A=>Y1(n+7 downto n), B=>M(15 downto 8),Z=>M4 );

 Mult5: Multiplier
	Port Map (A=>Y2(n+7 downto n), B=>M(39 downto 32),Z=>M5 );

 Mult6: Multiplier
	Port Map (A=>Y3(n+7 downto n), B=>M(63 downto 56),Z=>M6 );

	n=>n+8;

 Mult7: Multiplier
	Port Map (A=>Y1(n+7 downto n), B=>M(23 downto 16),Z=>M7 );

 Mult8: Multiplier
	Port Map (A=>Y2(n+7 downto n), B=>M(47 downto 40),Z=>M8 );

 Mult9: Multiplier
	Port Map (A=>Y3(n+7 downto n), B=>M(71 downto 64),Z=>M9 );

	n=>n+8;

   --The adders, adding the previous values multiplieds


 Add1: ADDER 
	Port Map (A=>M1,B=>M2,C=>M3,Z=>A1);
 
 Add2: ADDER 
	Port Map (A=>M4,B=>M5,C=>M6,Z=>A2);

 Add3: ADDER 
	Port Map (A=>M7,B=>M8,C=>M9,Z=>A3);


  --Update the old image value, only on the vertical pass.
  --maybe we have to add a signal to enable it on vertical.


 Add_update1: ADDER 
	Port Map (A=>A1,B=>image_pos_out,C=>0,Z=>E1);

 Add_update2: ADDER  
	Port Map (A=>A2,B=>image_pos_out,C=>0,Z=>E2);

 Add_update3: ADDER  
	Port Map (A=>A3,B=>image_pos_out,C=>0,Z=>E3);



 -- On the first pass, initialized 0, on the second we take the values
 -- from de memory and store the updates from Add_update1,2,3
 -- A1,A2,A3 if horizontal or E1,E2,E3 if vertical


 Reg_OUT: reg_ld Generic Map (n=>2047)
	Port Map(in, RESET=>RESET,CLOCK=>CLOCK,LOAD=>LOAD, out);

 

end SCHEMATIC;

configuration CFG_proc_SCHEMATIC of divr4_rec is

   for SCHEMATIC

      for Reg_IN1, Reg_IN2, Reg_IN3, Reg_MASK, Reg_OUT : reg_ld
         use configuration WORK.CFG_reg_ld_BEHAVIORAL;
      end for;

      for Add1, Add2, Add3, Add_update1, Add_update2, Add_Update3: csa32LSBs
         use configuration WORK.CFG_ADDER_BEHAVIORAL;
      end for;

      for Mult1, Mult2, Mult3, Mult4, Mult5, Mult6, Mult7,Mult8,  Mult9, : MULT
         use configuration WORK.CFG_Multiplier_BEHAVIORAL;
      end for;

   end for;

end CFG_proc_SCHEMATIC;
