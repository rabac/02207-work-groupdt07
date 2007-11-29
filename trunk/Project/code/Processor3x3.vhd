library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity Processor3x3 is
      Port (   CLOCK : In    std_logic;
                   D : In    std_logic_vector (7 downto 0);
               RESET : In    std_logic;
                  Qj : Out   std_logic_vector (7 downto 0) );
end Processor;

architecture SCHEMATIC of Processor3x3 is

   signal       Y : std_logic_vector(71 downto 0);
   signal       F : std_logic_vector(71 downto 0);
   signal       D3 : std_logic_vector(7 downto 0);
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
                Sum : Out std_logic_vector (7 downto 0)
                 );
   end component;

   component REG
      Port (       D : In    std_logic_vector (7 downto 0);
               Reset : In    std_logic;
               Clock : In    std_logic;
                   Q : Out   std_logic_vector (7 downto 0)
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

 Reg_IN1: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(7 downto 0));

	--Y1 the first row

 Reg_IN2: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(15 downto 8));

	--Y2 the second row

 Reg_IN3: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(23 downto 16));

	--Y3 the third row
 Reg_IN4: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(31 downto 24));

 Reg_IN5: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(39 downto 32));

 Reg_IN6: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(47 downto 40));

 Reg_IN7: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(55 downto 48));

 Reg_IN8: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(63 downto 56));

 Reg_IN9: REG
	Port Map(D=>, Reset=>RESET,Clock=>CLOCK, Q=>Y(71 downto 64));



 Reg_MASK1: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(7 downto 0));

 Reg_MASK2: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(15 downto 8));

 Reg_MASK3: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(23 downto 16));

 Reg_MASK4: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(31 downto 24));

 Reg_MASK5: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(39 downto 32));

 Reg_MASK6: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(47 downto 40));

 Reg_MASK7: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(55 downto 48));

 Reg_MASK8: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F)(63 downto 56);

 Reg_MASK9: REG
	Port Map (D=>, Reset=>RESET,Clock=>CLOCK, Q=>F(71 downto 64));



 --A is the pixel value of the image and B is the filter value.


 Mult1: Multiplier
	Port Map (A=>Y(7 downto 0), B=>F(7 downto 0),Z=>M1 );

 Mult2: Multiplier
	Port Map (A=>Y(15 downto 8), B=>F(15 downto 8),Z=>M2 );

 Mult3: Multiplier
	Port Map (A=>Y(23 downto 16), B=>F(23 downto 16),Z=>M3 );


 Mult4: Multiplier
	Port Map (A=>Y(31 downto 24), B=>F(31 downto 24),Z=>M4 );

 Mult5: Multiplier
	Port Map (A=>Y(39 downto 32), B=>F(39 downto 32),Z=>M5 );

 Mult6: Multiplier
	Port Map (A=>Y(47 downto 40), B=>F(47 downto 40),Z=>M6 );


 Mult7: Multiplier
	Port Map (A=>Y(55 downto 48), B=>F(55 downto 48),Z=>M7 );

 Mult8: Multiplier
	Port Map (A=>Y(63 downto 56), B=>F(63 downto 56),Z=>M8 );

 Mult9: Multiplier
	Port Map (A=>Y(71 downto 64), B=>F(71 downto 64),Z=>M9 );

   --The adders, adding the previous values multiplieds


 Add1: ADDER
	Port Map (A=>M1,B=>M2,C=>M3,Sum=>A1);

 Add2: ADDER
	Port Map (A=>M4,B=>M5,C=>M6,Sum=>A2);

 Add3: ADDER
	Port Map (A=>M7,B=>M8,C=>M9,Sum=>A3);


  --Update the old image value, only on the vertical pass.
  --maybe we have to add a signal to enable it on vertical.


 Add_update1: ADDER 
	Port Map (A=>A1,B=>image_pos_out,C=>0,Sum=>E1);

 Add_update2: ADDER
	Port Map (A=>A2,B=>image_pos_out,C=>0,Sum=>E2);

 Add_update3: ADDER
	Port Map (A=>A3,B=>image_pos_out,C=>0,Sum=>E3);



 -- On the first pass, initialized 0, on the second we take the values
 -- from de memory and store the updates from Add_update1,2,3
 -- A1,A2,A3 if horizontal or E1,E2,E3 if vertical



 

end SCHEMATIC;

configuration CFG_Processor3x3_SCHEMATIC of divr4_rec is

   for SCHEMATIC

      for Reg_IN1, Reg_IN2, Reg_IN3,Reg_IN4,Reg_IN5,Reg_IN6,Reg_IN7,Reg_IN8,Reg_IN9, Reg_MASK1,Reg_MASK2,Reg_MASK3,Reg_MASK4,Reg_MASK5,Reg_MASK6,Reg_MASK7,Reg_MASK8,Reg_MASK9, : REG
         use configuration WORK.CFG_REG_BEHAVIORAL;
      end for;

      for Add1, Add2, Add3, Add_update1, Add_update2, Add_Update3: ADDER
         use configuration WORK.CFG_ADDER_BEHAVIORAL;
      end for;

      for Mult1, Mult2, Mult3, Mult4, Mult5, Mult6, Mult7,Mult8,  Mult9, : Multiplier
         use configuration WORK.CFG_Multiplier_BEHAVIORAL;
      end for;

   end for;

end CFG_Processor3x3_SCHEMATIC;
