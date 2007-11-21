
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_divr4_rec is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_divr4_rec;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity CONTROL_DW01_inc_0 is

   port( A : in std_logic_vector (4 downto 0);  SUM : out std_logic_vector (4 
         downto 0));

end CONTROL_DW01_inc_0;

architecture SYN_rpl of CONTROL_DW01_inc_0 is

   component EOHVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component HA1SVTX8
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_4_port, carry_3_port, carry_2_port : std_logic;

begin
   
   U5 : EOHVTX1 port map( A => carry_4_port, B => A(4), Z => SUM(4));
   U6 : IVHVTX0H port map( A => A(0), Z => SUM(0));
   U1_1_1 : HA1SVTX8 port map( A => A(1), B => A(0), CO => carry_2_port, S => 
                           SUM(1));
   U1_1_2 : HA1SVTX8 port map( A => A(2), B => carry_2_port, CO => carry_3_port
                           , S => SUM(2));
   U1_1_3 : HA1SVTX8 port map( A => A(3), B => carry_3_port, CO => carry_4_port
                           , S => SUM(3));

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity CONTROL is

   port( CLOCK, RESET : in std_logic;  CL1, DIGIT, LD1, MX1, ROUND : out 
         std_logic);

end CONTROL;

architecture SYN_BEHAVIORAL of CONTROL is

   component NR2AHVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO6HVTX1
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2AHVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO17HVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO20NHVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2HVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ENHVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO6NHVTX1
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7AHVTX1
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component ND4HVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component OR2HVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NHVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component EOHVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component FD2QSVTX2
      port( CD, CP, D : in std_logic;  Q : out std_logic);
   end component;
   
   component FD4QSVTX1
      port( CP, D : in std_logic;  Q : out std_logic;  SD : in std_logic);
   end component;
   
   component FD2QNSVTX1
      port( CD, CP, D : in std_logic;  QN : out std_logic);
   end component;
   
   component BFSVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component CONTROL_DW01_inc_0
      port( A : in std_logic_vector (4 downto 0);  SUM : out std_logic_vector 
            (4 downto 0));
   end component;
   
   component FD4QNSVTX2
      port( CP, D : in std_logic;  QN : out std_logic;  SD : in std_logic);
   end component;
   
   component IVSVTX6
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AN2BSVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component NR3SVTX1
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   signal n418, DIGIT_port, n419, ROUND_port, state_4_port, state_2_port, 
      state_1_port, state_0_port, ROUND135, state162_4_port, state162_3_port, 
      state162_2_port, state162_1_port, state162_0_port, sum366_4_port, 
      sum366_3_port, sum366_2_port, sum366_1_port, sum366_0_port, n398, n399, 
      n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, 
      n412, n413, n414, n415, CL1_port, n420, MX1_port : std_logic;

begin
   CL1 <= CL1_port;
   DIGIT <= DIGIT_port;
   MX1 <= MX1_port;
   ROUND <= ROUND_port;
   
   U157 : NR2AHVTX1 port map( A => sum366_4_port, B => n398, Z => 
                           state162_4_port);
   U158 : NR2AHVTX1 port map( A => sum366_3_port, B => n398, Z => 
                           state162_3_port);
   U159 : NR2AHVTX1 port map( A => sum366_2_port, B => n398, Z => 
                           state162_2_port);
   U160 : AO6HVTX1 port map( A => n415, B => n399, C => n400, Z => n398);
   U161 : ND2AHVTX1 port map( A => n401, B => n402, Z => state162_1_port);
   U162 : AO17HVTX1 port map( A => n403, B => n415, C => n400, D => 
                           sum366_1_port, Z => n402);
   U163 : AO20NHVTX1 port map( A => n400, B => n415, C => sum366_0_port, D => 
                           n404, Z => state162_0_port);
   U164 : ND2HVTX1 port map( A => n405, B => n414, Z => n400);
   U165 : ENHVTX1 port map( A => n403, B => n399, Z => n405);
   U166 : AO6NHVTX1 port map( A => DIGIT_port, B => n406, C => n401, Z => n409)
                           ;
   U167 : AO7AHVTX1 port map( A => MX1_port, B => n401, C => n406, Z => n410);
   U168 : NR2AHVTX1 port map( A => n407, B => n415, Z => n401);
   U169 : AO7AHVTX1 port map( A => ROUND_port, B => n404, C => n406, Z => n411)
                           ;
   U170 : AO6NHVTX1 port map( A => n419, B => n406, C => n404, Z => n412);
   U171 : ND4HVTX1 port map( A => n399, B => n403, C => n414, D => state_0_port
                           , Z => n406);
   U172 : OR2HVTX1 port map( A => n404, B => CL1_port, Z => n413);
   U174 : IVHVTX0H port map( A => n415, Z => state_0_port);
   U176 : AO2NHVTX1 port map( A => state_2_port, B => ROUND135, C => n408, D =>
                           state_4_port, Z => n403);
   U177 : IVHVTX0H port map( A => n414, Z => state_1_port);
   U178 : EOHVTX1 port map( A => n408, B => state_4_port, Z => n399);
   DIGIT_reg : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n409, Q => 
                           DIGIT_port);
   ROUND_reg : FD4QSVTX1 port map( CP => CLOCK, D => n411, Q => ROUND_port, SD 
                           => RESET);
   LD1_reg : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n412, Q => n419
                           );
   CL1_reg : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n413, Q => n418
                           );
   state_reg_4_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => 
                           state162_4_port, Q => state_4_port);
   state_reg_3_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => 
                           state162_3_port, Q => ROUND135);
   state_reg_2_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => 
                           state162_2_port, Q => state_2_port);
   state_reg_1_inst : FD2QNSVTX1 port map( CD => RESET, CP => CLOCK, D => 
                           state162_1_port, QN => n414);
   state_reg_0_inst : FD2QNSVTX1 port map( CD => RESET, CP => CLOCK, D => 
                           state162_0_port, QN => n415);
   U181 : BFSVTX8 port map( A => n418, Z => CL1_port);
   add_54 : CONTROL_DW01_inc_0 port map( A(4) => state_4_port, A(3) => ROUND135
                           , A(2) => state_2_port, A(1) => state_1_port, A(0) 
                           => state_0_port, SUM(4) => sum366_4_port, SUM(3) => 
                           sum366_3_port, SUM(2) => sum366_2_port, SUM(1) => 
                           sum366_1_port, SUM(0) => sum366_0_port);
   U182 : BFSVTX8 port map( A => n419, Z => LD1);
   MX1_reg : FD4QNSVTX2 port map( CP => CLOCK, D => n410, QN => n420, SD => 
                           RESET);
   U183 : IVSVTX6 port map( A => n420, Z => MX1_port);
   U184 : EOSVTX1 port map( A => state_2_port, B => ROUND135, Z => n408);
   U185 : AN2BSVTX1 port map( A => n407, B => state_0_port, Z => n404);
   U186 : NR3SVTX1 port map( A => n399, B => state_1_port, C => n403, Z => n407
                           );

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity MUX is

   port( A, B : in std_logic_vector (56 downto 0);  SEL : in std_logic;  Z : 
         out std_logic_vector (56 downto 0));

end MUX;

architecture SYN_BEHAVIORAL of MUX is

   component AO2NHVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   signal n5 : std_logic;

begin
   
   U10 : AO2NHVTX1 port map( A => B(9), B => n5, C => SEL, D => A(9), Z => Z(9)
                           );
   U11 : AO2NHVTX1 port map( A => B(8), B => n5, C => A(8), D => SEL, Z => Z(8)
                           );
   U12 : AO2NHVTX1 port map( A => B(7), B => n5, C => A(7), D => SEL, Z => Z(7)
                           );
   U13 : AO2NHVTX1 port map( A => B(6), B => n5, C => A(6), D => SEL, Z => Z(6)
                           );
   U14 : AO2NHVTX1 port map( A => B(5), B => n5, C => A(5), D => SEL, Z => Z(5)
                           );
   U15 : AO2NHVTX1 port map( A => B(56), B => n5, C => A(56), D => SEL, Z => 
                           Z(56));
   U16 : AO2NHVTX1 port map( A => B(55), B => n5, C => A(55), D => SEL, Z => 
                           Z(55));
   U17 : AO2NHVTX1 port map( A => B(54), B => n5, C => A(54), D => SEL, Z => 
                           Z(54));
   U18 : AO2NHVTX1 port map( A => B(53), B => n5, C => A(53), D => SEL, Z => 
                           Z(53));
   U19 : AO2NHVTX1 port map( A => B(52), B => n5, C => A(52), D => SEL, Z => 
                           Z(52));
   U20 : AO2NHVTX1 port map( A => B(51), B => n5, C => A(51), D => SEL, Z => 
                           Z(51));
   U21 : AO2NHVTX1 port map( A => B(50), B => n5, C => A(50), D => SEL, Z => 
                           Z(50));
   U22 : AO2NHVTX1 port map( A => B(4), B => n5, C => A(4), D => SEL, Z => Z(4)
                           );
   U23 : AO2NHVTX1 port map( A => B(49), B => n5, C => A(49), D => SEL, Z => 
                           Z(49));
   U24 : AO2NHVTX1 port map( A => B(48), B => n5, C => A(48), D => SEL, Z => 
                           Z(48));
   U25 : AO2NHVTX1 port map( A => B(47), B => n5, C => A(47), D => SEL, Z => 
                           Z(47));
   U26 : AO2NHVTX1 port map( A => B(46), B => n5, C => A(46), D => SEL, Z => 
                           Z(46));
   U27 : AO2NHVTX1 port map( A => B(45), B => n5, C => A(45), D => SEL, Z => 
                           Z(45));
   U28 : AO2NHVTX1 port map( A => B(44), B => n5, C => A(44), D => SEL, Z => 
                           Z(44));
   U29 : AO2NHVTX1 port map( A => B(43), B => n5, C => A(43), D => SEL, Z => 
                           Z(43));
   U30 : AO2NHVTX1 port map( A => B(42), B => n5, C => A(42), D => SEL, Z => 
                           Z(42));
   U31 : AO2NHVTX1 port map( A => B(41), B => n5, C => A(41), D => SEL, Z => 
                           Z(41));
   U32 : AO2NHVTX1 port map( A => B(40), B => n5, C => A(40), D => SEL, Z => 
                           Z(40));
   U33 : AO2NHVTX1 port map( A => B(3), B => n5, C => A(3), D => SEL, Z => Z(3)
                           );
   U34 : AO2NHVTX1 port map( A => B(39), B => n5, C => A(39), D => SEL, Z => 
                           Z(39));
   U35 : AO2NHVTX1 port map( A => B(38), B => n5, C => A(38), D => SEL, Z => 
                           Z(38));
   U36 : AO2NHVTX1 port map( A => B(37), B => n5, C => A(37), D => SEL, Z => 
                           Z(37));
   U37 : AO2NHVTX1 port map( A => B(36), B => n5, C => A(36), D => SEL, Z => 
                           Z(36));
   U38 : AO2NHVTX1 port map( A => B(35), B => n5, C => A(35), D => SEL, Z => 
                           Z(35));
   U39 : AO2NHVTX1 port map( A => B(34), B => n5, C => A(34), D => SEL, Z => 
                           Z(34));
   U40 : AO2NHVTX1 port map( A => B(33), B => n5, C => A(33), D => SEL, Z => 
                           Z(33));
   U41 : AO2NHVTX1 port map( A => B(32), B => n5, C => A(32), D => SEL, Z => 
                           Z(32));
   U42 : AO2NHVTX1 port map( A => B(31), B => n5, C => A(31), D => SEL, Z => 
                           Z(31));
   U43 : AO2NHVTX1 port map( A => B(30), B => n5, C => A(30), D => SEL, Z => 
                           Z(30));
   U44 : AO2NHVTX1 port map( A => B(2), B => n5, C => A(2), D => SEL, Z => Z(2)
                           );
   U45 : AO2NHVTX1 port map( A => B(29), B => n5, C => A(29), D => SEL, Z => 
                           Z(29));
   U46 : AO2NHVTX1 port map( A => B(28), B => n5, C => A(28), D => SEL, Z => 
                           Z(28));
   U47 : AO2NHVTX1 port map( A => B(27), B => n5, C => A(27), D => SEL, Z => 
                           Z(27));
   U48 : AO2NHVTX1 port map( A => B(26), B => n5, C => A(26), D => SEL, Z => 
                           Z(26));
   U49 : AO2NHVTX1 port map( A => B(25), B => n5, C => A(25), D => SEL, Z => 
                           Z(25));
   U50 : AO2NHVTX1 port map( A => B(24), B => n5, C => A(24), D => SEL, Z => 
                           Z(24));
   U51 : AO2NHVTX1 port map( A => B(23), B => n5, C => A(23), D => SEL, Z => 
                           Z(23));
   U52 : AO2NHVTX1 port map( A => B(22), B => n5, C => A(22), D => SEL, Z => 
                           Z(22));
   U53 : AO2NHVTX1 port map( A => B(21), B => n5, C => A(21), D => SEL, Z => 
                           Z(21));
   U54 : AO2NHVTX1 port map( A => B(20), B => n5, C => A(20), D => SEL, Z => 
                           Z(20));
   U55 : AO2NHVTX1 port map( A => B(1), B => n5, C => A(1), D => SEL, Z => Z(1)
                           );
   U56 : AO2NHVTX1 port map( A => B(19), B => n5, C => A(19), D => SEL, Z => 
                           Z(19));
   U57 : AO2NHVTX1 port map( A => B(18), B => n5, C => A(18), D => SEL, Z => 
                           Z(18));
   U58 : AO2NHVTX1 port map( A => B(17), B => n5, C => A(17), D => SEL, Z => 
                           Z(17));
   U59 : AO2NHVTX1 port map( A => B(16), B => n5, C => A(16), D => SEL, Z => 
                           Z(16));
   U60 : AO2NHVTX1 port map( A => B(15), B => n5, C => A(15), D => SEL, Z => 
                           Z(15));
   U61 : AO2NHVTX1 port map( A => B(14), B => n5, C => A(14), D => SEL, Z => 
                           Z(14));
   U62 : AO2NHVTX1 port map( A => B(13), B => n5, C => A(13), D => SEL, Z => 
                           Z(13));
   U63 : AO2NHVTX1 port map( A => B(12), B => n5, C => A(12), D => SEL, Z => 
                           Z(12));
   U64 : AO2NHVTX1 port map( A => B(11), B => n5, C => A(11), D => SEL, Z => 
                           Z(11));
   U65 : AO2NHVTX1 port map( A => B(10), B => n5, C => A(10), D => SEL, Z => 
                           Z(10));
   U66 : AO2NHVTX1 port map( A => B(0), B => n5, C => A(0), D => SEL, Z => Z(0)
                           );
   U69 : IVSVTX12 port map( A => SEL, Z => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity MULT is

   port( A : in std_logic_vector (54 downto 0);  M1, M2, P1, P2 : in std_logic;
         COUT : out std_logic;  Z : out std_logic_vector (56 downto 0));

end MULT;

architecture SYN_BEHAVIORAL of MULT is

   component IVHVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2HVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO23SVTX6
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component ND3SVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2ASVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX6
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component OR2SVTX6
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component OR2SVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AN2SVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AN2HVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component NR2SVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX10
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2HVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2SVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2SVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AN2SVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2HVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2ASVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2ASVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2SVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AN2HVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ASVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO10NSVTX8
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component ND3SVTX4
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component OR2SVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO23SVTX4
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ASVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO23SVTX8
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2SVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component OR2HVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component OR2SVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component BFSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AN2SVTX6
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2SVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2SVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2SVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO23SVTX2
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component OR2ABSVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   signal Z_56_port, Z_55_port, Z_54_port, Z_53_port, Z_52_port, Z_51_port, 
      Z_50_port, Z_49_port, Z_48_port, Z_47_port, Z_46_port, Z_45_port, 
      Z_44_port, Z_43_port, Z_42_port, Z_41_port, Z_40_port, Z_39_port, 
      Z_37_port, Z_36_port, Z_35_port, Z_34_port, Z_33_port, Z_32_port, 
      Z_31_port, Z_30_port, Z_29_port, Z_28_port, Z_27_port, Z_26_port, 
      Z_25_port, Z_24_port, Z_23_port, Z_22_port, Z_21_port, Z_20_port, 
      Z_19_port, Z_18_port, Z_17_port, Z_16_port, Z_15_port, Z_14_port, 
      Z_13_port, Z_12_port, Z_11_port, Z_10_port, Z_9_port, Z_8_port, Z_7_port,
      Z_6_port, Z_5_port, Z_4_port, Z_3_port, Z_2_port, Z_1_port, n12, n13, n14
      , n15, n16, n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, 
      n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44
      , n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, 
      n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73
      , n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, 
      n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, 
      n102, n103, n104, n105, n106, n107, n109, n110, n111, n112, n113, n114, 
      n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, 
      n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, 
      n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, Z_38_port, 
      n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, 
      n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, 
      n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, 
      n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, 
      n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208 : 
      std_logic;

begin
   COUT <= Z_1_port;
   Z <= ( Z_56_port, Z_55_port, Z_54_port, Z_53_port, Z_52_port, Z_51_port, 
      Z_50_port, Z_49_port, Z_48_port, Z_47_port, Z_46_port, Z_45_port, 
      Z_44_port, Z_43_port, Z_42_port, Z_41_port, Z_40_port, Z_39_port, 
      Z_38_port, Z_37_port, Z_36_port, Z_35_port, Z_34_port, Z_33_port, 
      Z_32_port, Z_31_port, Z_30_port, Z_29_port, Z_28_port, Z_27_port, 
      Z_26_port, Z_25_port, Z_24_port, Z_23_port, Z_22_port, Z_21_port, 
      Z_20_port, Z_19_port, Z_18_port, Z_17_port, Z_16_port, Z_15_port, 
      Z_14_port, Z_13_port, Z_12_port, Z_11_port, Z_10_port, Z_9_port, Z_8_port
      , Z_7_port, Z_6_port, Z_5_port, Z_4_port, Z_3_port, Z_2_port, Z_1_port, 
      Z_1_port );
   
   U11 : IVHVTX0H port map( A => A(6), Z => n16);
   U14 : IVHVTX0H port map( A => A(5), Z => n19);
   U17 : IVHVTX0H port map( A => A(4), Z => n22);
   U20 : IVHVTX0H port map( A => A(3), Z => n24);
   U24 : IVHVTX0H port map( A => A(53), Z => n27);
   U27 : IVHVTX0H port map( A => A(52), Z => n29);
   U30 : IVHVTX0H port map( A => A(51), Z => n31);
   U36 : IVHVTX0H port map( A => A(49), Z => n35);
   U39 : IVHVTX0H port map( A => A(48), Z => n37);
   U42 : IVHVTX0H port map( A => A(2), Z => n26);
   U48 : IVHVTX0H port map( A => A(46), Z => n43);
   U54 : IVHVTX0H port map( A => A(44), Z => n47);
   U57 : IVHVTX0H port map( A => A(43), Z => n49);
   U60 : IVHVTX0H port map( A => A(42), Z => n51);
   U63 : IVHVTX0H port map( A => A(41), Z => n53);
   U66 : IVHVTX0H port map( A => A(40), Z => n55);
   U81 : IVHVTX0H port map( A => A(36), Z => n65);
   U87 : IVHVTX0H port map( A => A(34), Z => n69);
   U90 : IVHVTX0H port map( A => A(33), Z => n71);
   U93 : IVHVTX0H port map( A => A(32), Z => n73);
   U96 : IVHVTX0H port map( A => A(31), Z => n75);
   U99 : IVHVTX0H port map( A => A(30), Z => n77);
   U102 : IVHVTX0H port map( A => A(29), Z => n79);
   U105 : IVHVTX0H port map( A => A(28), Z => n81);
   U107 : IVHVTX0H port map( A => A(0), Z => n63);
   U110 : IVHVTX0H port map( A => A(27), Z => n83);
   U113 : IVHVTX0H port map( A => A(26), Z => n85);
   U116 : IVHVTX0H port map( A => A(25), Z => n87);
   U119 : IVHVTX0H port map( A => A(24), Z => n89);
   U122 : IVHVTX0H port map( A => A(23), Z => n91);
   U125 : IVHVTX0H port map( A => A(22), Z => n93);
   U131 : IVHVTX0H port map( A => A(20), Z => n97);
   U134 : IVHVTX0H port map( A => A(19), Z => n99);
   U143 : IVHVTX0H port map( A => A(16), Z => n105);
   U146 : IVHVTX0H port map( A => A(15), Z => n107);
   U149 : IVHVTX0H port map( A => A(14), Z => n109);
   U155 : IVHVTX0H port map( A => A(12), Z => n113);
   U158 : IVHVTX0H port map( A => A(11), Z => n115);
   U161 : IVHVTX0H port map( A => A(10), Z => n117);
   U165 : IVHVTX0H port map( A => A(9), Z => n118);
   U168 : IVHVTX0H port map( A => A(7), Z => n13);
   U169 : IVHVTX0H port map( A => A(8), Z => n121);
   U176 : AO23SVTX6 port map( A => A(30), B => n187, C => n181, D => n77, E => 
                           n78, Z => Z_32_port);
   U177 : ND3SVTX8 port map( A => n166, B => n167, C => n32, Z => Z_53_port);
   U178 : AO2ASVTX4 port map( A => n133, B => n67, C => n171, D => A(35), Z => 
                           n66);
   U179 : IVSVTX6 port map( A => n192, Z => n193);
   U180 : OR2SVTX6 port map( A => n137, B => n41, Z => n124);
   U181 : AO23SVTX6 port map( A => A(49), B => n185, C => n137, D => n35, E => 
                           n36, Z => Z_51_port);
   U182 : OR2SVTX4 port map( A => A(1), B => n186, Z => n123);
   U183 : ND3SVTX8 port map( A => n123, B => n124, C => n62, Z => Z_3_port);
   U184 : AN2SVTX1 port map( A => M2, B => n63, Z => n125);
   U185 : AN2HVTX1 port map( A => A(0), B => P2, Z => n126);
   U186 : NR2SVTX2 port map( A => n125, B => n126, Z => n62);
   U187 : IVSVTX10 port map( A => n170, Z => n186);
   U188 : IVSVTX2 port map( A => A(1), Z => n41);
   U189 : ND2HVTX4 port map( A => M2, B => n39, Z => n145);
   U190 : AO23SVTX6 port map( A => A(4), B => n187, C => n181, D => n22, E => 
                           n23, Z => Z_6_port);
   U191 : ND2HVTX4 port map( A => n95, B => n175, Z => n194);
   U192 : ND2SVTX2 port map( A => M2, B => n111, Z => n127);
   U193 : ND2SVTX1 port map( A => P2, B => A(13), Z => n128);
   U194 : AN2SVTX4 port map( A => n127, B => n128, Z => n110);
   U195 : IVSVTX2 port map( A => A(13), Z => n111);
   U196 : AO23SVTX6 port map( A => A(14), B => n185, C => n181, D => n109, E =>
                           n110, Z => Z_16_port);
   U197 : AO2HVTX2 port map( A => M2, B => n79, C => P2, D => A(29), Z => n78);
   U198 : ND3SVTX8 port map( A => n154, B => n155, C => n58, Z => Z_41_port);
   U199 : AN2SVTX4 port map( A => n156, B => n157, Z => n58);
   U200 : IVSVTX8 port map( A => n203, Z => n17);
   U201 : AO2ASVTX6 port map( A => n133, B => n13, C => n208, D => A(7), Z => 
                           n122);
   U202 : AO23SVTX6 port map( A => A(13), B => n186, C => n138, D => n111, E =>
                           n112, Z => Z_15_port);
   U203 : AO2ASVTX2 port map( A => A(20), B => n175, C => n208, D => A(20), Z 
                           => n96);
   U204 : AO2ASVTX2 port map( A => A(23), B => n205, C => A(23), D => n171, Z 
                           => n90);
   U205 : AO2SVTX4 port map( A => n203, B => n87, C => n208, D => A(25), Z => 
                           n86);
   U206 : AN2HVTX2 port map( A => M2, B => n35, Z => n162);
   U207 : IVSVTX8 port map( A => M2, Z => n130);
   U208 : AO4ASVTX4 port map( A => P2, B => n131, C => n130, D => A(14), Z => 
                           n129);
   U209 : IVSVTX12 port map( A => A(14), Z => n131);
   U210 : AO10NSVTX8 port map( A => n132, B => n184, C => n136, D => A(15), E 
                           => n129, Z => Z_17_port);
   U211 : IVSVTX12 port map( A => A(15), Z => n132);
   U212 : AO23SVTX6 port map( A => A(5), B => n17, C => n204, D => n19, E => 
                           n20, Z => Z_8_port);
   U213 : IVSVTX4 port map( A => n134, Z => n20);
   U214 : AO2ASVTX6 port map( A => A(22), B => n203, C => A(22), D => n193, Z 
                           => n92);
   U215 : IVSVTX10 port map( A => M2, Z => n133);
   U216 : IVSVTX8 port map( A => n202, Z => n203);
   U217 : AO23SVTX6 port map( A => A(33), B => n187, C => n138, D => n71, E => 
                           n72, Z => Z_35_port);
   U218 : AO23SVTX6 port map( A => A(11), B => n186, C => n181, D => n115, E =>
                           n116, Z => Z_13_port);
   U219 : AO23SVTX6 port map( A => A(36), B => n185, C => n138, D => n65, E => 
                           n66, Z => Z_38_port);
   U220 : ND2HVTX1 port map( A => A(37), B => P2, Z => n140);
   U221 : ND3SVTX4 port map( A => n147, B => n148, C => n64, Z => Z_39_port);
   U222 : AO23SVTX6 port map( A => A(26), B => n186, C => n138, D => n85, E => 
                           n86, Z => Z_28_port);
   U223 : ND2HVTX1 port map( A => M2, B => n59, Z => n156);
   U224 : AO23SVTX6 port map( A => A(38), B => n187, C => n137, D => n59, E => 
                           n60, Z => Z_40_port);
   U225 : AN2SVTX4 port map( A => n168, B => n169, Z => n32);
   U226 : OR2SVTX2 port map( A => A(51), B => n187, Z => n166);
   U227 : AO23SVTX4 port map( A => n185, B => A(0), C => n174, D => n181, E => 
                           n17, Z => Z_2_port);
   U228 : IVSVTX12 port map( A => P1, Z => n181);
   U229 : AN2HVTX1 port map( A => A(49), B => P2, Z => n163);
   U230 : AN2HVTX1 port map( A => A(28), B => P2, Z => n144);
   U231 : OR2SVTX6 port map( A => n181, B => n61, Z => n148);
   U232 : AO23SVTX6 port map( A => A(20), B => n186, C => n138, D => n97, E => 
                           n98, Z => Z_22_port);
   U233 : AO2ASVTX6 port map( A => n202, B => n22, C => n171, D => A(4), Z => 
                           n21);
   U234 : AO23SVTX6 port map( A => A(31), B => n186, C => n138, D => n75, E => 
                           n76, Z => Z_33_port);
   U235 : AO23SVTX6 port map( A => A(2), B => n185, C => n138, D => n26, E => 
                           n40, Z => Z_4_port);
   U236 : AO23SVTX4 port map( A => A(25), B => n186, C => n137, D => n87, E => 
                           n88, Z => Z_27_port);
   U237 : ND2HVTX1 port map( A => A(38), B => n206, Z => n157);
   U238 : IVSVTX6 port map( A => M2, Z => n202);
   U239 : AO4ASVTX6 port map( A => n170, B => A(6), C => n135, D => n14, Z => 
                           n134);
   U240 : IVSVTX12 port map( A => A(6), Z => n135);
   U241 : IVSVTX8 port map( A => P1, Z => n14);
   U242 : AO23SVTX8 port map( A => A(23), B => n186, C => n138, D => n91, E => 
                           n92, Z => Z_25_port);
   U243 : IVSVTX12 port map( A => n14, Z => n136);
   U244 : IVSVTX12 port map( A => n136, Z => n137);
   U245 : IVSVTX12 port map( A => n136, Z => n138);
   U246 : AO2ASVTX4 port map( A => A(24), B => n205, C => A(24), D => n171, Z 
                           => n88);
   U247 : AO2SVTX2 port map( A => n205, B => n41, C => n208, D => A(1), Z => 
                           n40);
   U248 : AN2SVTX4 port map( A => n178, B => n179, Z => n28);
   U249 : AO23SVTX6 port map( A => A(24), B => n186, C => n138, D => n89, E => 
                           n90, Z => Z_26_port);
   U250 : ND2SVTX1 port map( A => A(21), B => n208, Z => n195);
   U251 : AO23SVTX4 port map( A => A(47), B => n185, C => n181, D => n39, E => 
                           n42, Z => Z_49_port);
   U252 : AO23SVTX4 port map( A => A(8), B => n187, C => n138, D => n121, E => 
                           n122, Z => Z_10_port);
   U253 : OR2HVTX4 port map( A => A(35), B => n187, Z => n158);
   U254 : OR2SVTX8 port map( A => A(37), B => n187, Z => n147);
   U255 : AO2SVTX4 port map( A => n205, B => n24, C => n208, D => A(3), Z => 
                           n23);
   U256 : BFSVTX12 port map( A => M2, Z => n205);
   U257 : ND2HVTX4 port map( A => A(17), B => n171, Z => n191);
   U258 : ND2SVTX2 port map( A => M2, B => n61, Z => n139);
   U259 : AN2SVTX4 port map( A => n139, B => n140, Z => n60);
   U260 : IVSVTX0H port map( A => A(37), Z => n61);
   U261 : AO23SVTX6 port map( A => A(3), B => n185, C => n181, D => n24, E => 
                           n25, Z => Z_5_port);
   U262 : IVSVTX12 port map( A => n12, Z => n170);
   U263 : OR2SVTX6 port map( A => A(29), B => n185, Z => n141);
   U264 : OR2SVTX4 port map( A => n181, B => n79, Z => n142);
   U265 : ND3SVTX8 port map( A => n141, B => n142, C => n80, Z => Z_31_port);
   U266 : AN2SVTX1 port map( A => M2, B => n81, Z => n143);
   U267 : NR2SVTX2 port map( A => n143, B => n144, Z => n80);
   U268 : IVSVTX12 port map( A => n133, Z => n175);
   U269 : ND3SVTX8 port map( A => n196, B => n197, C => n94, Z => Z_24_port);
   U270 : AN2SVTX4 port map( A => n194, B => n195, Z => n94);
   U271 : ND3SVTX8 port map( A => n172, B => n173, C => n52, Z => Z_44_port);
   U272 : AO2SVTX2 port map( A => n175, B => n53, C => A(41), D => n171, Z => 
                           n52);
   U273 : ND3SVTX8 port map( A => n200, B => n201, C => n54, Z => Z_43_port);
   U274 : AO23SVTX6 port map( A => A(9), B => n186, C => n181, D => n118, E => 
                           n120, Z => Z_11_port);
   U275 : OR2SVTX8 port map( A => A(41), B => n186, Z => n200);
   U276 : ND3SVTX8 port map( A => n176, B => n177, C => n28, Z => Z_55_port);
   U277 : IVSVTX12 port map( A => n207, Z => n208);
   U278 : ND2SVTX1 port map( A => A(47), B => P2, Z => n146);
   U279 : AN2SVTX4 port map( A => n145, B => n146, Z => n38);
   U280 : IVSVTX2 port map( A => A(47), Z => n39);
   U281 : AO2SVTX4 port map( A => n175, B => n57, C => A(39), D => n171, Z => 
                           n56);
   U282 : AO2SVTX2 port map( A => M2, B => n37, C => P2, D => A(48), Z => n36);
   U283 : AO23SVTX6 port map( A => A(5), B => n186, C => n137, D => n19, E => 
                           n21, Z => Z_7_port);
   U284 : AO2SVTX2 port map( A => n203, B => n65, C => n206, D => A(36), Z => 
                           n64);
   U285 : OR2SVTX4 port map( A => n181, B => n93, Z => n197);
   U286 : ND3SVTX8 port map( A => n182, B => n183, C => n104, Z => Z_19_port);
   U287 : AO2SVTX2 port map( A => M2, B => n105, C => n208, D => A(16), Z => 
                           n104);
   U288 : OR2SVTX6 port map( A => A(39), B => n186, Z => n154);
   U289 : IVSVTX6 port map( A => n12, Z => n184);
   U290 : AO23SVTX4 port map( A => A(46), B => n187, C => n181, D => n43, E => 
                           n44, Z => Z_48_port);
   U291 : OR2SVTX6 port map( A => A(17), B => n187, Z => n182);
   U292 : OR2SVTX4 port map( A => A(18), B => n185, Z => n150);
   U293 : OR2SVTX6 port map( A => n137, B => n101, Z => n151);
   U294 : ND3SVTX8 port map( A => n150, B => n151, C => n102, Z => Z_20_port);
   U295 : IVSVTX2 port map( A => A(18), Z => n101);
   U296 : AN2SVTX6 port map( A => n190, B => n191, Z => n102);
   U297 : AO2SVTX4 port map( A => n175, B => n121, C => n206, D => A(8), Z => 
                           n120);
   U298 : OR2SVTX6 port map( A => A(7), B => n185, Z => n152);
   U299 : OR2SVTX4 port map( A => n13, B => n181, Z => n153);
   U300 : ND3SVTX8 port map( A => n152, B => n153, C => n15, Z => Z_9_port);
   U301 : OR2SVTX6 port map( A => n137, B => n67, Z => n159);
   U302 : AO23SVTX6 port map( A => A(21), B => n185, C => n138, D => n95, E => 
                           n96, Z => Z_23_port);
   U303 : AN2SVTX4 port map( A => n198, B => n199, Z => n54);
   U304 : AO23SVTX4 port map( A => A(16), B => n186, C => n138, D => n105, E =>
                           n106, Z => Z_18_port);
   U305 : IVSVTX8 port map( A => M1, Z => n12);
   U306 : AO23SVTX4 port map( A => A(12), B => n185, C => n137, D => n113, E =>
                           n114, Z => Z_14_port);
   U307 : AO23SVTX4 port map( A => A(28), B => n187, C => n137, D => n81, E => 
                           n82, Z => Z_30_port);
   U308 : AO2SVTX2 port map( A => n175, B => n99, C => A(19), D => n193, Z => 
                           n98);
   U309 : OR2SVTX4 port map( A => n181, B => n51, Z => n173);
   U310 : OR2SVTX4 port map( A => n181, B => n33, Z => n161);
   U311 : OR2SVTX4 port map( A => A(50), B => n185, Z => n160);
   U312 : AO2SVTX4 port map( A => n205, B => n115, C => n206, D => A(11), Z => 
                           n114);
   U313 : AO23SVTX4 port map( A => A(43), B => n186, C => n138, D => n49, E => 
                           n50, Z => Z_45_port);
   U314 : AO2SVTX2 port map( A => n175, B => n101, C => A(18), D => n206, Z => 
                           n100);
   U315 : IVSVTX10 port map( A => n207, Z => n206);
   U316 : OR2SVTX4 port map( A => A(42), B => n187, Z => n172);
   U317 : OR2SVTX4 port map( A => A(45), B => n187, Z => n188);
   U318 : AO23SVTX4 port map( A => A(48), B => n187, C => n137, D => n37, E => 
                           n38, Z => Z_50_port);
   U319 : AO2SVTX4 port map( A => n175, B => n26, C => n171, D => A(2), Z => 
                           n25);
   U320 : OR2SVTX4 port map( A => n137, B => n57, Z => n155);
   U321 : IVSVTX2 port map( A => A(39), Z => n57);
   U322 : IVSVTX2 port map( A => A(38), Z => n59);
   U323 : ND2SVTX2 port map( A => n175, B => n29, Z => n178);
   U324 : AO2SVTX2 port map( A => n170, B => n117, C => P1, D => A(10), Z => 
                           n119);
   U325 : ND3SVTX8 port map( A => n158, B => n68, C => n159, Z => Z_37_port);
   U326 : IVSVTX2 port map( A => A(35), Z => n67);
   U327 : AO2SVTX2 port map( A => n205, B => n77, C => A(30), D => n206, Z => 
                           n76);
   U328 : AO2SVTX4 port map( A => n175, B => n73, C => n193, D => A(32), Z => 
                           n72);
   U329 : AO23SVTX6 port map( A => A(44), B => n186, C => n138, D => n47, E => 
                           n48, Z => Z_46_port);
   U330 : ND3SVTX8 port map( A => n160, B => n161, C => n34, Z => Z_52_port);
   U331 : NR2SVTX2 port map( A => n162, B => n163, Z => n34);
   U332 : IVSVTX0H port map( A => A(50), Z => n33);
   U333 : IVSVTX12 port map( A => n207, Z => n171);
   U334 : ND2SVTX8 port map( A => n17, B => n185, Z => Z_1_port);
   U335 : AO23SVTX4 port map( A => A(9), B => n17, C => n204, D => n118, E => 
                           n119, Z => Z_12_port);
   U336 : OR2SVTX4 port map( A => n181, B => n53, Z => n201);
   U337 : AO2ASVTX2 port map( A => n133, B => n69, C => A(34), D => n171, Z => 
                           n68);
   U338 : AO2SVTX2 port map( A => n203, B => n113, C => n208, D => A(12), Z => 
                           n112);
   U339 : AO23SVTX4 port map( A => A(52), B => n187, C => n138, D => n29, E => 
                           n30, Z => Z_54_port);
   U340 : IVSVTX4 port map( A => n164, Z => n82);
   U341 : AO2SVTX1 port map( A => M2, B => n107, C => A(15), D => P2, Z => n106
                           );
   U342 : AO23SVTX4 port map( A => A(19), B => n185, C => n138, D => n99, E => 
                           n100, Z => Z_21_port);
   U343 : AO2SVTX2 port map( A => n203, B => n51, C => n206, D => A(42), Z => 
                           n50);
   U344 : ND2SVTX2 port map( A => A(40), B => n171, Z => n199);
   U345 : OR2SVTX4 port map( A => A(22), B => n185, Z => n196);
   U346 : AO23SVTX4 port map( A => A(40), B => n187, C => n137, D => n55, E => 
                           n56, Z => Z_42_port);
   U347 : AO2SVTX1 port map( A => M2, B => n16, C => A(6), D => P2, Z => n15);
   U348 : AO2SVTX1 port map( A => M2, B => n117, C => P2, D => A(10), Z => n116
                           );
   U349 : AO4ASVTX4 port map( A => P2, B => n165, C => A(27), D => n133, Z => 
                           n164);
   U350 : IVSVTX12 port map( A => A(27), Z => n165);
   U351 : OR2SVTX2 port map( A => n181, B => n31, Z => n167);
   U352 : ND2SVTX2 port map( A => n175, B => n33, Z => n168);
   U353 : ND2HVTX1 port map( A => A(50), B => n208, Z => n169);
   U354 : IVSVTX2 port map( A => n206, Z => n204);
   U355 : ND2SVTX4 port map( A => n205, B => n103, Z => n190);
   U356 : AO23SVTX2 port map( A => n17, B => A(53), C => n204, D => n180, E => 
                           n186, Z => Z_56_port);
   U357 : IVSVTX12 port map( A => A(0), Z => n174);
   U358 : AO2SVTX2 port map( A => M2, B => n45, C => P2, D => A(45), Z => n44);
   U359 : AO2SVTX1 port map( A => M2, B => n85, C => A(26), D => P2, Z => n84);
   U360 : AO2SVTX2 port map( A => n175, B => n49, C => n193, D => A(43), Z => 
                           n48);
   U361 : AO23SVTX4 port map( A => A(34), B => n187, C => n138, D => n69, E => 
                           n70, Z => Z_36_port);
   U362 : OR2SVTX4 port map( A => A(53), B => n185, Z => n176);
   U363 : AO23SVTX4 port map( A => A(32), B => n185, C => n137, D => n73, E => 
                           n74, Z => Z_34_port);
   U364 : AO2SVTX2 port map( A => M2, B => n43, C => P2, D => A(46), Z => n42);
   U365 : AO2SVTX2 port map( A => n175, B => n47, C => A(44), D => n171, Z => 
                           n46);
   U366 : IVSVTX12 port map( A => n170, Z => n187);
   U367 : OR2SVTX2 port map( A => n181, B => n27, Z => n177);
   U368 : OR2ABSVTX2 port map( A => P2, B => A(52), Z => n179);
   U369 : IVSVTX12 port map( A => A(53), Z => n180);
   U370 : IVSVTX12 port map( A => n184, Z => n185);
   U371 : OR2SVTX4 port map( A => n181, B => n103, Z => n183);
   U372 : AO23SVTX2 port map( A => A(27), B => n187, C => n137, D => n83, E => 
                           n84, Z => Z_29_port);
   U373 : AO2SVTX1 port map( A => M2, B => n71, C => A(33), D => P2, Z => n70);
   U374 : OR2SVTX4 port map( A => n181, B => n45, Z => n189);
   U375 : ND3SVTX8 port map( A => n188, B => n189, C => n46, Z => Z_47_port);
   U376 : IVSVTX0H port map( A => A(45), Z => n45);
   U377 : IVSVTX2 port map( A => A(17), Z => n103);
   U378 : IVSVTX2 port map( A => P2, Z => n192);
   U379 : IVSVTX2 port map( A => A(21), Z => n95);
   U380 : ND2HVTX1 port map( A => M2, B => n55, Z => n198);
   U381 : AO2SVTX2 port map( A => n175, B => n31, C => n208, D => A(51), Z => 
                           n30);
   U382 : AO2SVTX1 port map( A => M2, B => n75, C => A(31), D => P2, Z => n74);
   U383 : IVSVTX12 port map( A => P2, Z => n207);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity gl_csa32_n8 is

   port( A, B, C : in std_logic_vector (8 downto 0);  Cin : in std_logic;  Z, Y
         : out std_logic_vector (8 downto 0));

end gl_csa32_n8;

architecture SYN_BEHAVIORAL of gl_csa32_n8 is

   component EOHVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX6
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component EOHVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component EO3SVTX4
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   signal Y_8_port, Y_7_port, Y_6_port, Y_5_port, Y_4_port, Y_3_port, Y_2_port,
      Y_1_port, n16, n17, n18, n19, n20, n21, n22, n23 : std_logic;

begin
   Y <= ( Y_8_port, Y_7_port, Y_6_port, Y_5_port, Y_4_port, Y_3_port, Y_2_port,
      Y_1_port, Cin );
   
   U17 : EOHVTX1 port map( A => B(7), B => A(7), Z => n16);
   U25 : EOHVTX1 port map( A => B(3), B => A(3), Z => n20);
   U27 : EOHVTX1 port map( A => B(2), B => A(2), Z => n21);
   U29 : EOHVTX1 port map( A => B(1), B => A(1), Z => n22);
   U31 : EOHVTX1 port map( A => B(0), B => A(0), Z => n23);
   U32 : EOSVTX4 port map( A => n18, B => C(5), Z => Z(5));
   U33 : AO2NSVTX4 port map( A => B(5), B => A(5), C => n18, D => C(5), Z => 
                           Y_6_port);
   U34 : EOSVTX6 port map( A => C(7), B => n16, Z => Z(7));
   U35 : EOHVTX2 port map( A => B(6), B => A(6), Z => n17);
   U36 : EOSVTX2 port map( A => n22, B => C(1), Z => Z(1));
   U37 : AO2NSVTX2 port map( A => B(1), B => A(1), C => C(1), D => n22, Z => 
                           Y_2_port);
   U38 : AO2NSVTX6 port map( A => B(2), B => A(2), C => C(2), D => n21, Z => 
                           Y_3_port);
   U39 : EOSVTX2 port map( A => n23, B => C(0), Z => Z(0));
   U40 : AO2NSVTX2 port map( A => B(0), B => A(0), C => n23, D => C(0), Z => 
                           Y_1_port);
   U41 : AO2NSVTX6 port map( A => B(4), B => A(4), C => C(4), D => n19, Z => 
                           Y_5_port);
   U42 : EOSVTX4 port map( A => n21, B => C(2), Z => Z(2));
   U43 : EOSVTX4 port map( A => n17, B => C(6), Z => Z(6));
   U44 : EOSVTX8 port map( A => n19, B => C(4), Z => Z(4));
   U45 : EOSVTX2 port map( A => n20, B => C(3), Z => Z(3));
   U46 : AO2NSVTX2 port map( A => B(3), B => A(3), C => C(3), D => n20, Z => 
                           Y_4_port);
   U47 : EOHVTX2 port map( A => B(4), B => A(4), Z => n19);
   U48 : AO2NSVTX4 port map( A => B(6), B => A(6), C => n17, D => C(6), Z => 
                           Y_7_port);
   U49 : AO2NSVTX4 port map( A => B(7), B => A(7), C => n16, D => C(7), Z => 
                           Y_8_port);
   U50 : EOHVTX2 port map( A => B(5), B => A(5), Z => n18);
   U51 : EO3SVTX4 port map( A => A(8), B => B(8), C => C(8), Z => Z(8));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity csa32LSBs_n47 is

   port( A, B, C : in std_logic_vector (47 downto 0);  Cin : in std_logic;  
         Cout : out std_logic;  Z, Y : out std_logic_vector (47 downto 0));

end csa32LSBs_n47;

architecture SYN_BEHAVIORAL of csa32LSBs_n47 is

   component EOHVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX6
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX8
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ABSVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2SVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2SVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2HVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ENSVTX4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ND2SVTX6
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   signal Y_47_port, Y_46_port, Y_45_port, Y_44_port, Y_43_port, Y_42_port, 
      Y_41_port, Y_40_port, Y_39_port, Y_38_port, Y_37_port, Y_36_port, 
      Y_35_port, Y_34_port, Y_33_port, Y_32_port, Y_31_port, Y_30_port, 
      Y_29_port, Y_28_port, Y_27_port, Y_26_port, Y_25_port, Y_24_port, 
      Y_23_port, Y_22_port, Y_21_port, Y_20_port, Y_19_port, Y_18_port, 
      Y_17_port, Y_16_port, Y_15_port, Y_14_port, Y_13_port, Y_12_port, 
      Y_11_port, Y_10_port, Y_9_port, Y_8_port, Y_7_port, Y_6_port, Y_5_port, 
      Y_4_port, Y_3_port, Y_2_port, Y_1_port, n17, n18, n19, n20, n21, n22, n23
      , n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, 
      n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52
      , n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, 
      n67, n68, n69, n70, n71, n72, n73, n74, n75, n76 : std_logic;

begin
   Y <= ( Y_47_port, Y_46_port, Y_45_port, Y_44_port, Y_43_port, Y_42_port, 
      Y_41_port, Y_40_port, Y_39_port, Y_38_port, Y_37_port, Y_36_port, 
      Y_35_port, Y_34_port, Y_33_port, Y_32_port, Y_31_port, Y_30_port, 
      Y_29_port, Y_28_port, Y_27_port, Y_26_port, Y_25_port, Y_24_port, 
      Y_23_port, Y_22_port, Y_21_port, Y_20_port, Y_19_port, Y_18_port, 
      Y_17_port, Y_16_port, Y_15_port, Y_14_port, Y_13_port, Y_12_port, 
      Y_11_port, Y_10_port, Y_9_port, Y_8_port, Y_7_port, Y_6_port, Y_5_port, 
      Y_4_port, Y_3_port, Y_2_port, Y_1_port, Cin );
   
   U56 : EOHVTX1 port map( A => B(8), B => A(8), Z => n18);
   U58 : EOHVTX1 port map( A => B(7), B => A(7), Z => n19);
   U60 : EOHVTX1 port map( A => B(6), B => A(6), Z => n20);
   U62 : EOHVTX1 port map( A => B(5), B => A(5), Z => n21);
   U64 : EOHVTX1 port map( A => B(4), B => A(4), Z => n22);
   U66 : EOHVTX1 port map( A => B(3), B => A(3), Z => n31);
   U68 : EOHVTX1 port map( A => B(46), B => A(46), Z => n24);
   U70 : EOHVTX1 port map( A => B(45), B => A(45), Z => n25);
   U72 : EOHVTX1 port map( A => B(44), B => A(44), Z => n26);
   U74 : EOHVTX1 port map( A => B(43), B => A(43), Z => n27);
   U76 : EOHVTX1 port map( A => B(42), B => A(42), Z => n28);
   U80 : EOHVTX1 port map( A => B(40), B => A(40), Z => n30);
   U82 : EOHVTX1 port map( A => B(39), B => A(39), Z => n32);
   U84 : EOHVTX1 port map( A => B(2), B => A(2), Z => n42);
   U86 : EOHVTX1 port map( A => B(38), B => A(38), Z => n33);
   U88 : EOHVTX1 port map( A => B(37), B => A(37), Z => n34);
   U90 : EOHVTX1 port map( A => B(36), B => A(36), Z => n35);
   U92 : EOHVTX1 port map( A => B(35), B => A(35), Z => n36);
   U94 : EOHVTX1 port map( A => B(34), B => A(34), Z => n37);
   U96 : EOHVTX1 port map( A => B(33), B => A(33), Z => n38);
   U98 : EOHVTX1 port map( A => B(32), B => A(32), Z => n39);
   U100 : EOHVTX1 port map( A => B(31), B => A(31), Z => n40);
   U102 : EOHVTX1 port map( A => B(30), B => A(30), Z => n41);
   U106 : EOHVTX1 port map( A => B(1), B => A(1), Z => n53);
   U108 : EOHVTX1 port map( A => B(28), B => A(28), Z => n44);
   U110 : EOHVTX1 port map( A => B(27), B => A(27), Z => n45);
   U112 : EOHVTX1 port map( A => B(26), B => A(26), Z => n46);
   U114 : EOHVTX1 port map( A => B(25), B => A(25), Z => n47);
   U116 : EOHVTX1 port map( A => B(24), B => A(24), Z => n48);
   U118 : EOHVTX1 port map( A => B(23), B => A(23), Z => n49);
   U120 : EOHVTX1 port map( A => B(22), B => A(22), Z => n50);
   U122 : EOHVTX1 port map( A => B(21), B => A(21), Z => n51);
   U124 : EOHVTX1 port map( A => B(20), B => A(20), Z => n52);
   U126 : EOHVTX1 port map( A => B(19), B => A(19), Z => n54);
   U128 : EOHVTX1 port map( A => B(0), B => A(0), Z => n64);
   U130 : EOHVTX1 port map( A => B(18), B => A(18), Z => n55);
   U132 : EOHVTX1 port map( A => B(17), B => A(17), Z => n56);
   U134 : EOHVTX1 port map( A => B(16), B => A(16), Z => n57);
   U136 : EOHVTX1 port map( A => B(15), B => A(15), Z => n58);
   U138 : EOHVTX1 port map( A => B(14), B => A(14), Z => n59);
   U140 : EOHVTX1 port map( A => B(13), B => A(13), Z => n60);
   U142 : EOHVTX1 port map( A => B(12), B => A(12), Z => n61);
   U144 : EOHVTX1 port map( A => B(11), B => A(11), Z => n62);
   U146 : EOHVTX1 port map( A => B(10), B => A(10), Z => n63);
   U148 : EOHVTX1 port map( A => B(9), B => A(9), Z => n17);
   U150 : EOHVTX1 port map( A => B(47), B => A(47), Z => n23);
   U151 : EOSVTX6 port map( A => C(28), B => n44, Z => Z(28));
   U152 : AO2NSVTX8 port map( A => B(34), B => A(34), C => C(34), D => n37, Z 
                           => Y_35_port);
   U153 : EOSVTX8 port map( A => C(3), B => n31, Z => Z(3));
   U154 : AO4ABSVTX6 port map( A => n31, B => C(3), C => n75, D => n76, Z => 
                           Y_4_port);
   U155 : EOSVTX6 port map( A => n25, B => C(45), Z => Z(45));
   U156 : EOSVTX8 port map( A => n22, B => C(4), Z => Z(4));
   U157 : AO2NSVTX6 port map( A => B(4), B => A(4), C => n22, D => C(4), Z => 
                           Y_5_port);
   U158 : ND2SVTX2 port map( A => B(7), B => A(7), Z => n65);
   U159 : ND2SVTX1 port map( A => n19, B => C(7), Z => n66);
   U160 : ND2SVTX2 port map( A => n65, B => n66, Z => Y_8_port);
   U161 : AO2NSVTX6 port map( A => B(22), B => A(22), C => C(22), D => n50, Z 
                           => Y_23_port);
   U162 : AO2NSVTX4 port map( A => B(32), B => A(32), C => C(32), D => n39, Z 
                           => Y_33_port);
   U163 : AO2NSVTX6 port map( A => B(5), B => A(5), C => C(5), D => n21, Z => 
                           Y_6_port);
   U164 : EOSVTX8 port map( A => C(7), B => n19, Z => Z(7));
   U165 : EOSVTX8 port map( A => C(26), B => n46, Z => Z(26));
   U166 : AO2NSVTX4 port map( A => B(38), B => A(38), C => n33, D => C(38), Z 
                           => Y_39_port);
   U167 : EOSVTX4 port map( A => C(38), B => n33, Z => Z(38));
   U168 : AO2NSVTX4 port map( A => B(24), B => A(24), C => n48, D => C(24), Z 
                           => Y_25_port);
   U169 : EOSVTX4 port map( A => n24, B => C(46), Z => Z(46));
   U170 : EOSVTX4 port map( A => C(21), B => n51, Z => Z(21));
   U171 : AO2NSVTX6 port map( A => B(40), B => A(40), C => C(40), D => n30, Z 
                           => Y_41_port);
   U172 : IVSVTX4 port map( A => C(41), Z => n72);
   U173 : ND2SVTX2 port map( A => n43, B => C(29), Z => n68);
   U174 : AO2NSVTX6 port map( A => B(8), B => A(8), C => n18, D => C(8), Z => 
                           Y_9_port);
   U175 : EOSVTX4 port map( A => n55, B => C(18), Z => Z(18));
   U176 : EOSVTX4 port map( A => C(24), B => n48, Z => Z(24));
   U177 : ND2HVTX4 port map( A => n71, B => C(41), Z => n74);
   U178 : EOSVTX4 port map( A => n43, B => C(29), Z => Z(29));
   U179 : AO2NSVTX4 port map( A => B(17), B => A(17), C => n56, D => C(17), Z 
                           => Y_18_port);
   U180 : EOSVTX6 port map( A => C(10), B => n63, Z => Z(10));
   U181 : EOSVTX4 port map( A => n35, B => C(36), Z => Z(36));
   U182 : AO2NSVTX8 port map( A => B(13), B => A(13), C => C(13), D => n60, Z 
                           => Y_14_port);
   U183 : AO2NSVTX8 port map( A => B(25), B => A(25), C => C(25), D => n47, Z 
                           => Y_26_port);
   U184 : AO2NSVTX8 port map( A => B(41), B => A(41), C => C(41), D => n29, Z 
                           => Y_42_port);
   U185 : ND2SVTX2 port map( A => B(29), B => A(29), Z => n67);
   U186 : ND2SVTX2 port map( A => n67, B => n68, Z => Y_30_port);
   U187 : EOSVTX1 port map( A => B(29), B => A(29), Z => n43);
   U188 : EOSVTX4 port map( A => n47, B => C(25), Z => Z(25));
   U189 : AO2NSVTX6 port map( A => B(45), B => A(45), C => C(45), D => n25, Z 
                           => Y_46_port);
   U190 : ENSVTX4 port map( A => n59, B => n69, Z => Z(14));
   U191 : AO2NSVTX6 port map( A => B(31), B => A(31), C => n40, D => C(31), Z 
                           => Y_32_port);
   U192 : AO2NSVTX4 port map( A => B(43), B => A(43), C => n27, D => C(43), Z 
                           => Y_44_port);
   U193 : EOSVTX4 port map( A => C(43), B => n27, Z => Z(43));
   U194 : AO2NSVTX6 port map( A => B(46), B => A(46), C => C(46), D => n24, Z 
                           => Y_47_port);
   U195 : AO2NSVTX4 port map( A => B(15), B => A(15), C => n58, D => C(15), Z 
                           => Y_16_port);
   U196 : EOSVTX4 port map( A => n52, B => C(20), Z => Z(20));
   U197 : AO2NSVTX8 port map( A => B(20), B => A(20), C => C(20), D => n52, Z 
                           => Y_21_port);
   U198 : AO2NSVTX8 port map( A => B(9), B => A(9), C => C(9), D => n17, Z => 
                           Y_10_port);
   U199 : EOSVTX4 port map( A => n17, B => C(9), Z => Z(9));
   U200 : EOSVTX4 port map( A => n34, B => C(37), Z => Z(37));
   U201 : IVSVTX4 port map( A => C(14), Z => n69);
   U202 : AO2NSVTX6 port map( A => B(35), B => A(35), C => C(35), D => n36, Z 
                           => Y_36_port);
   U203 : EOSVTX2 port map( A => n54, B => C(19), Z => Z(19));
   U204 : IVSVTX4 port map( A => n69, Z => n70);
   U205 : AO2NSVTX4 port map( A => B(10), B => A(10), C => n63, D => C(10), Z 
                           => Y_11_port);
   U206 : AO2NSVTX6 port map( A => B(6), B => A(6), C => C(6), D => n20, Z => 
                           Y_7_port);
   U207 : EOSVTX4 port map( A => C(11), B => n62, Z => Z(11));
   U208 : EOSVTX4 port map( A => n40, B => C(31), Z => Z(31));
   U209 : AO2NSVTX4 port map( A => B(16), B => A(16), C => C(16), D => n57, Z 
                           => Y_17_port);
   U210 : EOSVTX4 port map( A => C(16), B => n57, Z => Z(16));
   U211 : EOSVTX4 port map( A => n37, B => C(34), Z => Z(34));
   U212 : AO2NSVTX4 port map( A => B(11), B => A(11), C => n62, D => C(11), Z 
                           => Y_12_port);
   U213 : EOSVTX8 port map( A => C(39), B => n32, Z => Z(39));
   U214 : EOSVTX4 port map( A => n21, B => C(5), Z => Z(5));
   U215 : ND2SVTX6 port map( A => n29, B => n72, Z => n73);
   U216 : ND2SVTX6 port map( A => n73, B => n74, Z => Z(41));
   U217 : IVHVTX0H port map( A => n29, Z => n71);
   U218 : EOSVTX6 port map( A => B(41), B => A(41), Z => n29);
   U219 : AO2NSVTX4 port map( A => B(36), B => A(36), C => C(36), D => n35, Z 
                           => Y_37_port);
   U220 : AO2NSVTX4 port map( A => B(21), B => A(21), C => n51, D => C(21), Z 
                           => Y_22_port);
   U221 : EOSVTX4 port map( A => C(6), B => n20, Z => Z(6));
   U222 : AO2NSVTX4 port map( A => B(27), B => A(27), C => n45, D => C(27), Z 
                           => Y_28_port);
   U223 : EOSVTX4 port map( A => C(27), B => n45, Z => Z(27));
   U224 : AO2NSVTX2 port map( A => B(39), B => A(39), C => C(39), D => n32, Z 
                           => Y_40_port);
   U225 : AO2NSVTX6 port map( A => B(33), B => A(33), C => C(33), D => n38, Z 
                           => Y_34_port);
   U226 : EOSVTX4 port map( A => C(23), B => n49, Z => Z(23));
   U227 : AO2NSVTX6 port map( A => B(23), B => A(23), C => C(23), D => n49, Z 
                           => Y_24_port);
   U228 : AO2NSVTX6 port map( A => B(37), B => A(37), C => C(37), D => n34, Z 
                           => Y_38_port);
   U229 : IVSVTX0H port map( A => A(3), Z => n76);
   U230 : EOSVTX4 port map( A => n28, B => C(42), Z => Z(42));
   U231 : AO2NSVTX4 port map( A => B(42), B => A(42), C => n28, D => C(42), Z 
                           => Y_43_port);
   U232 : AO2NSVTX6 port map( A => B(14), B => A(14), C => n70, D => n59, Z => 
                           Y_15_port);
   U233 : EOSVTX4 port map( A => n18, B => C(8), Z => Z(8));
   U234 : EOSVTX2 port map( A => n30, B => C(40), Z => Z(40));
   U235 : EOSVTX4 port map( A => C(17), B => n56, Z => Z(17));
   U236 : EOSVTX4 port map( A => n38, B => C(33), Z => Z(33));
   U237 : AO2NSVTX4 port map( A => B(18), B => A(18), C => n55, D => C(18), Z 
                           => Y_19_port);
   U238 : EOSVTX4 port map( A => C(15), B => n58, Z => Z(15));
   U239 : EOSVTX4 port map( A => n50, B => C(22), Z => Z(22));
   U240 : AO2NSVTX4 port map( A => B(28), B => A(28), C => n44, D => C(28), Z 
                           => Y_29_port);
   U241 : EOSVTX4 port map( A => n60, B => C(13), Z => Z(13));
   U242 : EOSVTX4 port map( A => C(2), B => n42, Z => Z(2));
   U243 : AO2NSVTX2 port map( A => B(2), B => A(2), C => n42, D => C(2), Z => 
                           Y_3_port);
   U244 : IVSVTX12 port map( A => B(3), Z => n75);
   U245 : AO2NSVTX4 port map( A => B(12), B => A(12), C => n61, D => C(12), Z 
                           => Y_13_port);
   U246 : AO2NSVTX4 port map( A => B(30), B => A(30), C => n41, D => C(30), Z 
                           => Y_31_port);
   U247 : AO2NSVTX2 port map( A => B(47), B => A(47), C => C(47), D => n23, Z 
                           => Cout);
   U248 : EOSVTX4 port map( A => C(35), B => n36, Z => Z(35));
   U249 : AO2NSVTX4 port map( A => B(44), B => A(44), C => n26, D => C(44), Z 
                           => Y_45_port);
   U250 : EOSVTX4 port map( A => C(44), B => n26, Z => Z(44));
   U251 : EOSVTX4 port map( A => C(12), B => n61, Z => Z(12));
   U252 : AO2NSVTX4 port map( A => B(26), B => A(26), C => n46, D => C(26), Z 
                           => Y_27_port);
   U253 : AO2NSVTX4 port map( A => B(19), B => A(19), C => n54, D => C(19), Z 
                           => Y_20_port);
   U254 : EOSVTX4 port map( A => n23, B => C(47), Z => Z(47));
   U255 : AO2NSVTX4 port map( A => B(1), B => A(1), C => n53, D => C(1), Z => 
                           Y_2_port);
   U256 : AO2NSVTX4 port map( A => B(0), B => A(0), C => n64, D => C(0), Z => 
                           Y_1_port);
   U257 : EOSVTX2 port map( A => n39, B => C(32), Z => Z(32));
   U258 : EOSVTX2 port map( A => n41, B => C(30), Z => Z(30));
   U259 : EOSVTX2 port map( A => C(0), B => n64, Z => Z(0));
   U260 : EOSVTX2 port map( A => C(1), B => n53, Z => Z(1));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity gl_dualreg_ld_n10 is

   port( AS, AC : in std_logic_vector (10 downto 0);  RESET, CLOCK, LOAD : in 
         std_logic;  ZS, ZC : out std_logic_vector (10 downto 0));

end gl_dualreg_ld_n10;

architecture SYN_BEHAVIORAL of gl_dualreg_ld_n10 is

   component FD2QSVTX2
      port( CD, CP, D : in std_logic;  Q : out std_logic);
   end component;
   
   component IVSVTX2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ABSVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ABSVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component BFSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ASVTX8
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ABSVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX8
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component FD2QSVTX1
      port( CD, CP, D : in std_logic;  Q : out std_logic);
   end component;
   
   component BFHVTX1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component FD2QSVTX4
      port( CD, CP, D : in std_logic;  Q : out std_logic);
   end component;
   
   component AO4ASVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   signal ZS_10_port, ZS_9_port, ZS_8_port, ZS_7_port, ZS_6_port, ZS_5_port, 
      n175, ZS_3_port, ZS_2_port, ZS_1_port, ZS_0_port, ZC_10_port, ZC_9_port, 
      ZC_8_port, ZC_7_port, ZC_6_port, ZC_5_port, ZC_4_port, ZC_3_port, 
      ZC_2_port, ZC_1_port, ZC_0_port, n127, n128, n129, n130, n131, n132, n133
      , n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
      n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, 
      n158, ZS_4_port, n160, n161, n162, n163, n164, n165, n166, n167, n168, 
      n169, n170, n171, n172, n173, n174 : std_logic;

begin
   ZS <= ( ZS_10_port, ZS_9_port, ZS_8_port, ZS_7_port, ZS_6_port, ZS_5_port, 
      ZS_4_port, ZS_3_port, ZS_2_port, ZS_1_port, ZS_0_port );
   ZC <= ( ZC_10_port, ZC_9_port, ZC_8_port, ZC_7_port, ZC_6_port, ZC_5_port, 
      ZC_4_port, ZC_3_port, ZC_2_port, ZC_1_port, ZC_0_port );
   
   ZS_reg_10_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n128, Q 
                           => ZS_10_port);
   ZS_reg_9_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n129, Q 
                           => ZS_9_port);
   ZS_reg_8_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n130, Q 
                           => ZS_8_port);
   ZS_reg_7_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n131, Q 
                           => ZS_7_port);
   ZS_reg_6_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n132, Q 
                           => ZS_6_port);
   ZS_reg_3_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n135, Q 
                           => ZS_3_port);
   ZS_reg_2_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n136, Q 
                           => ZS_2_port);
   ZS_reg_1_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n137, Q 
                           => ZS_1_port);
   ZS_reg_0_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n138, Q 
                           => ZS_0_port);
   ZC_reg_10_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n139, Q 
                           => ZC_10_port);
   ZC_reg_9_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n140, Q 
                           => ZC_9_port);
   ZC_reg_8_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n141, Q 
                           => ZC_8_port);
   ZC_reg_3_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n146, Q 
                           => ZC_3_port);
   ZC_reg_2_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n147, Q 
                           => ZC_2_port);
   ZC_reg_1_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n148, Q 
                           => ZC_1_port);
   ZC_reg_0_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n149, Q 
                           => ZC_0_port);
   U93 : AO4ABSVTX2 port map( A => ZC_8_port, B => n127, C => n163, D => n164, 
                           Z => n141);
   U94 : IVSVTX2 port map( A => AC(8), Z => n163);
   U95 : AO4ABSVTX4 port map( A => ZC_10_port, B => n127, C => n167, D => n172,
                           Z => n139);
   U96 : IVSVTX4 port map( A => AC(10), Z => n167);
   U97 : IVSVTX2 port map( A => AC(9), Z => n165);
   U98 : IVSVTX4 port map( A => AS(9), Z => n162);
   U99 : IVHVTX4 port map( A => LOAD, Z => n127);
   U100 : BFSVTX4 port map( A => LOAD, Z => n150);
   U101 : AO4ABSVTX4 port map( A => ZC_1_port, B => n127, C => n155, D => n156,
                           Z => n148);
   U102 : IVSVTX4 port map( A => AC(1), Z => n155);
   U103 : AO2NSVTX4 port map( A => ZC_6_port, B => n127, C => AC(6), D => LOAD,
                           Z => n143);
   U104 : IVSVTX4 port map( A => n158, Z => ZS_4_port);
   U105 : AO2NSVTX2 port map( A => ZS_6_port, B => n127, C => AS(6), D => n150,
                           Z => n132);
   U106 : AO2NSVTX6 port map( A => ZS_10_port, B => n127, C => AS(10), D => 
                           n150, Z => n128);
   U107 : AO4ASVTX8 port map( A => AS(5), B => n153, C => n151, D => n152, Z =>
                           n133);
   U108 : IVSVTX12 port map( A => n161, Z => n151);
   U109 : IVSVTX12 port map( A => n127, Z => n152);
   U110 : IVSVTX12 port map( A => n150, Z => n153);
   U111 : AO4ABSVTX6 port map( A => ZC_0_port, B => n127, C => n154, D => n156,
                           Z => n149);
   U112 : IVSVTX12 port map( A => AC(0), Z => n154);
   U113 : IVSVTX8 port map( A => n150, Z => n156);
   U114 : AO2NSVTX6 port map( A => ZS_8_port, B => n127, C => AS(8), D => n150,
                           Z => n130);
   U115 : IVSVTX2 port map( A => n175, Z => n158);
   ZC_reg_4_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n145, Q 
                           => ZC_4_port);
   U116 : AO2NSVTX8 port map( A => n157, B => n127, C => AS(4), D => n150, Z =>
                           n134);
   ZS_reg_4_inst : FD2QSVTX1 port map( CD => RESET, CP => CLOCK, D => n134, Q 
                           => n175);
   U117 : BFHVTX1 port map( A => ZS_4_port, Z => n157);
   ZC_reg_5_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n144, Q 
                           => ZC_5_port);
   U118 : IVHVTX0H port map( A => ZS_5_port, Z => n160);
   U119 : IVSVTX0H port map( A => n160, Z => n161);
   ZS_reg_5_inst : FD2QSVTX1 port map( CD => RESET, CP => CLOCK, D => n133, Q 
                           => ZS_5_port);
   U120 : AO4ABSVTX6 port map( A => ZS_9_port, B => n127, C => n162, D => n164,
                           Z => n129);
   U121 : IVSVTX8 port map( A => n150, Z => n164);
   U122 : AO4ABSVTX6 port map( A => ZC_9_port, B => n127, C => n165, D => n166,
                           Z => n140);
   U123 : IVSVTX12 port map( A => n150, Z => n166);
   ZC_reg_6_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n143, Q 
                           => ZC_6_port);
   U124 : AO4ABSVTX6 port map( A => ZS_0_port, B => n127, C => n168, D => n172,
                           Z => n138);
   U125 : IVSVTX12 port map( A => AS(0), Z => n168);
   U126 : IVSVTX8 port map( A => n150, Z => n172);
   U127 : AO2NSVTX6 port map( A => ZS_2_port, B => n127, C => AS(2), D => n150,
                           Z => n136);
   U128 : AO2NSVTX6 port map( A => ZS_3_port, B => n127, C => AS(3), D => n150,
                           Z => n135);
   U129 : AO2NSVTX2 port map( A => n169, B => n127, C => AC(4), D => n150, Z =>
                           n145);
   U130 : BFHVTX1 port map( A => ZC_4_port, Z => n169);
   U131 : AO2NSVTX6 port map( A => ZS_1_port, B => n127, C => AS(1), D => n150,
                           Z => n137);
   U132 : AO2NSVTX6 port map( A => ZS_7_port, B => n127, C => AS(7), D => n150,
                           Z => n131);
   U133 : AO4ASVTX6 port map( A => AC(7), B => n172, C => n170, D => n171, Z =>
                           n142);
   U134 : IVSVTX12 port map( A => ZC_7_port, Z => n170);
   U135 : IVSVTX12 port map( A => n127, Z => n171);
   U136 : AO2NSVTX8 port map( A => n174, B => n127, C => AC(5), D => n150, Z =>
                           n144);
   ZC_reg_7_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n142, Q 
                           => ZC_7_port);
   U137 : AO2NSVTX6 port map( A => ZC_2_port, B => n127, C => AC(2), D => n150,
                           Z => n147);
   U138 : IVHVTX0H port map( A => ZC_5_port, Z => n173);
   U139 : IVSVTX0H port map( A => n173, Z => n174);
   U140 : AO2NSVTX2 port map( A => ZC_3_port, B => n127, C => AC(3), D => n150,
                           Z => n146);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity gl_dualreg_ld_n45 is

   port( AS, AC : in std_logic_vector (45 downto 0);  RESET, CLOCK, LOAD : in 
         std_logic;  ZS, ZC : out std_logic_vector (45 downto 0));

end gl_dualreg_ld_n45;

architecture SYN_BEHAVIORAL of gl_dualreg_ld_n45 is

   component AO2NHVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component FD2QSVTX2
      port( CD, CP, D : in std_logic;  Q : out std_logic);
   end component;
   
   component IVSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ABSVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ASVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ABSVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ABSVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX6
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ASVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2SVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component FD2QNSVTX1
      port( CD, CP, D : in std_logic;  QN : out std_logic);
   end component;
   
   component FD2QNSVTX2
      port( CD, CP, D : in std_logic;  QN : out std_logic);
   end component;
   
   component AO2NSVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO4ASVTX8
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component FD2QSVTX4
      port( CD, CP, D : in std_logic;  Q : out std_logic);
   end component;
   
   component AO2NSVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2ASVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO2NSVTX8
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   signal ZS_45_port, ZS_44_port, ZS_43_port, ZS_42_port, ZS_41_port, 
      ZS_40_port, ZS_39_port, ZS_37_port, ZS_36_port, ZS_35_port, ZS_34_port, 
      ZS_33_port, ZS_32_port, ZS_31_port, ZS_30_port, ZS_29_port, ZS_28_port, 
      ZS_27_port, ZS_25_port, ZS_24_port, ZS_23_port, ZS_21_port, ZS_20_port, 
      ZS_19_port, ZS_18_port, ZS_17_port, ZS_16_port, ZS_15_port, ZS_14_port, 
      ZS_13_port, ZS_12_port, ZS_11_port, ZS_10_port, ZS_9_port, ZS_8_port, 
      ZS_7_port, ZS_6_port, ZS_5_port, ZS_4_port, ZS_3_port, ZS_2_port, 
      ZS_1_port, ZS_0_port, ZC_45_port, ZC_44_port, ZC_43_port, ZC_42_port, 
      ZC_41_port, ZC_40_port, ZC_39_port, ZC_38_port, ZC_37_port, ZC_36_port, 
      ZC_35_port, ZC_34_port, ZC_33_port, ZC_32_port, ZC_31_port, ZC_30_port, 
      ZC_29_port, ZC_28_port, ZC_27_port, ZC_26_port, ZC_25_port, ZC_24_port, 
      ZC_23_port, ZC_22_port, ZC_21_port, ZC_20_port, ZC_19_port, ZC_18_port, 
      ZC_17_port, ZC_16_port, ZC_15_port, ZC_14_port, ZC_13_port, ZC_12_port, 
      ZC_11_port, ZC_10_port, ZC_9_port, ZC_8_port, ZC_7_port, ZC_6_port, 
      ZC_5_port, ZC_4_port, ZC_3_port, ZC_2_port, ZC_1_port, ZC_0_port, n337, 
      n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, 
      n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, 
      n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, 
      n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, 
      n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, 
      n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, 
      n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, 
      n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, 
      n434, ZS_26_port, n436, ZS_38_port, n438, n439, n440, n441, n442, n443, 
      n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, 
      n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, 
      n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, 
      n480, n481, n482, n483, n484, n485, n486, ZS_22_port, n488, n489, n490, 
      n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, 
      n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, 
      n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, 
      n527, n528, n529, n530, n531, n532 : std_logic;

begin
   ZS <= ( ZS_45_port, ZS_44_port, ZS_43_port, ZS_42_port, ZS_41_port, 
      ZS_40_port, ZS_39_port, ZS_38_port, ZS_37_port, ZS_36_port, ZS_35_port, 
      ZS_34_port, ZS_33_port, ZS_32_port, ZS_31_port, ZS_30_port, ZS_29_port, 
      ZS_28_port, ZS_27_port, ZS_26_port, ZS_25_port, ZS_24_port, ZS_23_port, 
      ZS_22_port, ZS_21_port, ZS_20_port, ZS_19_port, ZS_18_port, ZS_17_port, 
      ZS_16_port, ZS_15_port, ZS_14_port, ZS_13_port, ZS_12_port, ZS_11_port, 
      ZS_10_port, ZS_9_port, ZS_8_port, ZS_7_port, ZS_6_port, ZS_5_port, 
      ZS_4_port, ZS_3_port, ZS_2_port, ZS_1_port, ZS_0_port );
   ZC <= ( ZC_45_port, ZC_44_port, ZC_43_port, ZC_42_port, ZC_41_port, 
      ZC_40_port, ZC_39_port, ZC_38_port, ZC_37_port, ZC_36_port, ZC_35_port, 
      ZC_34_port, ZC_33_port, ZC_32_port, ZC_31_port, ZC_30_port, ZC_29_port, 
      ZC_28_port, ZC_27_port, ZC_26_port, ZC_25_port, ZC_24_port, ZC_23_port, 
      ZC_22_port, ZC_21_port, ZC_20_port, ZC_19_port, ZC_18_port, ZC_17_port, 
      ZC_16_port, ZC_15_port, ZC_14_port, ZC_13_port, ZC_12_port, ZC_11_port, 
      ZC_10_port, ZC_9_port, ZC_8_port, ZC_7_port, ZC_6_port, ZC_5_port, 
      ZC_4_port, ZC_3_port, ZC_2_port, ZC_1_port, ZC_0_port );
   
   U300 : AO2NHVTX1 port map( A => ZC_0_port, B => n337, C => AC(0), D => LOAD,
                           Z => n429);
   ZS_reg_45_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n338, Q 
                           => ZS_45_port);
   ZS_reg_44_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n339, Q 
                           => ZS_44_port);
   ZS_reg_43_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n340, Q 
                           => ZS_43_port);
   ZS_reg_42_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n341, Q 
                           => ZS_42_port);
   ZS_reg_41_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n342, Q 
                           => ZS_41_port);
   ZS_reg_40_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n343, Q 
                           => ZS_40_port);
   ZS_reg_39_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n344, Q 
                           => ZS_39_port);
   ZS_reg_37_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n346, Q 
                           => ZS_37_port);
   ZS_reg_36_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n347, Q 
                           => ZS_36_port);
   ZS_reg_35_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n348, Q 
                           => ZS_35_port);
   ZS_reg_34_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n349, Q 
                           => ZS_34_port);
   ZS_reg_33_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n350, Q 
                           => ZS_33_port);
   ZS_reg_32_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n351, Q 
                           => ZS_32_port);
   ZS_reg_31_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n352, Q 
                           => ZS_31_port);
   ZS_reg_30_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n353, Q 
                           => ZS_30_port);
   ZS_reg_29_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n354, Q 
                           => ZS_29_port);
   ZS_reg_28_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n355, Q 
                           => ZS_28_port);
   ZS_reg_27_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n356, Q 
                           => ZS_27_port);
   ZS_reg_25_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n358, Q 
                           => ZS_25_port);
   ZS_reg_23_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n360, Q 
                           => ZS_23_port);
   ZS_reg_21_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n362, Q 
                           => ZS_21_port);
   ZS_reg_20_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n363, Q 
                           => ZS_20_port);
   ZS_reg_19_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n364, Q 
                           => ZS_19_port);
   ZS_reg_18_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n365, Q 
                           => ZS_18_port);
   ZS_reg_17_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n366, Q 
                           => ZS_17_port);
   ZS_reg_16_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n367, Q 
                           => ZS_16_port);
   ZS_reg_15_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n368, Q 
                           => ZS_15_port);
   ZS_reg_14_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n369, Q 
                           => ZS_14_port);
   ZS_reg_13_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n370, Q 
                           => ZS_13_port);
   ZS_reg_12_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n371, Q 
                           => ZS_12_port);
   ZS_reg_11_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n372, Q 
                           => ZS_11_port);
   ZS_reg_10_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n373, Q 
                           => ZS_10_port);
   ZS_reg_9_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n374, Q 
                           => ZS_9_port);
   ZS_reg_8_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n375, Q 
                           => ZS_8_port);
   ZS_reg_7_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n376, Q 
                           => ZS_7_port);
   ZS_reg_6_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n377, Q 
                           => ZS_6_port);
   ZS_reg_5_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n378, Q 
                           => ZS_5_port);
   ZS_reg_4_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n379, Q 
                           => ZS_4_port);
   ZS_reg_3_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n380, Q 
                           => ZS_3_port);
   ZS_reg_2_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n381, Q 
                           => ZS_2_port);
   ZS_reg_1_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n382, Q 
                           => ZS_1_port);
   ZS_reg_0_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n383, Q 
                           => ZS_0_port);
   ZC_reg_45_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n384, Q 
                           => ZC_45_port);
   ZC_reg_41_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n388, Q 
                           => ZC_41_port);
   ZC_reg_39_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n390, Q 
                           => ZC_39_port);
   ZC_reg_37_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n392, Q 
                           => ZC_37_port);
   ZC_reg_36_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n393, Q 
                           => ZC_36_port);
   ZC_reg_34_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n395, Q 
                           => ZC_34_port);
   ZC_reg_32_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n397, Q 
                           => ZC_32_port);
   ZC_reg_29_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n400, Q 
                           => ZC_29_port);
   ZC_reg_27_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n402, Q 
                           => ZC_27_port);
   ZC_reg_26_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n403, Q 
                           => ZC_26_port);
   ZC_reg_21_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n408, Q 
                           => ZC_21_port);
   ZC_reg_20_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n409, Q 
                           => ZC_20_port);
   ZC_reg_19_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n410, Q 
                           => ZC_19_port);
   ZC_reg_18_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n411, Q 
                           => ZC_18_port);
   ZC_reg_17_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n412, Q 
                           => ZC_17_port);
   ZC_reg_15_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n414, Q 
                           => ZC_15_port);
   ZC_reg_14_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n415, Q 
                           => ZC_14_port);
   ZC_reg_13_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n416, Q 
                           => ZC_13_port);
   ZC_reg_11_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n418, Q 
                           => ZC_11_port);
   ZC_reg_10_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n419, Q 
                           => ZC_10_port);
   ZC_reg_8_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n421, Q 
                           => ZC_8_port);
   ZC_reg_2_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n427, Q 
                           => ZC_2_port);
   ZC_reg_1_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n428, Q 
                           => ZC_1_port);
   ZC_reg_0_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n429, Q 
                           => ZC_0_port);
   U303 : AO4ABSVTX2 port map( A => ZC_37_port, B => n337, C => n463, D => n464
                           , Z => n392);
   U304 : IVSVTX2 port map( A => AC(37), Z => n463);
   U305 : AO4ABSVTX2 port map( A => ZC_13_port, B => n337, C => n430, D => n460
                           , Z => n416);
   U306 : IVSVTX12 port map( A => AC(13), Z => n430);
   U307 : IVSVTX8 port map( A => n511, Z => n460);
   U308 : AO4ASVTX4 port map( A => AS(40), B => n467, C => n465, D => n480, Z 
                           => n343);
   U309 : AO4ABSVTX2 port map( A => ZS_11_port, B => n337, C => n431, D => n433
                           , Z => n372);
   U310 : IVSVTX12 port map( A => AS(11), Z => n431);
   U311 : AO4ABSVTX2 port map( A => ZS_22_port, B => n337, C => n503, D => n504
                           , Z => n361);
   U312 : AO4ABSVTX6 port map( A => ZC_15_port, B => n522, C => n438, D => n525
                           , Z => n414);
   U313 : AO4ABSVTX4 port map( A => ZC_38_port, B => n337, C => n492, D => n520
                           , Z => n391);
   U314 : IVSVTX4 port map( A => AC(38), Z => n492);
   U315 : AO4ABSVTX2 port map( A => ZS_34_port, B => n337, C => n440, D => n508
                           , Z => n349);
   U316 : IVSVTX2 port map( A => AS(34), Z => n440);
   U317 : AO2NSVTX6 port map( A => ZC_12_port, B => n337, C => AC(12), D => 
                           LOAD, Z => n417);
   U318 : AO4ABSVTX2 port map( A => ZC_16_port, B => n464, C => n452, D => n532
                           , Z => n413);
   U319 : IVSVTX2 port map( A => AC(16), Z => n452);
   U320 : AO4ABSVTX2 port map( A => ZC_42_port, B => n337, C => n521, D => n522
                           , Z => n387);
   U321 : IVSVTX4 port map( A => AC(42), Z => n521);
   U322 : AO4ABSVTX2 port map( A => ZC_19_port, B => n337, C => n462, D => n464
                           , Z => n410);
   U323 : IVSVTX2 port map( A => AC(19), Z => n462);
   U324 : AO2NSVTX6 port map( A => AS(23), B => LOAD, C => ZS_23_port, D => 
                           n337, Z => n360);
   U325 : IVSVTX6 port map( A => AS(10), Z => n449);
   U326 : AO4ABSVTX4 port map( A => ZC_11_port, B => n337, C => n450, D => n451
                           , Z => n418);
   U327 : IVSVTX4 port map( A => AC(11), Z => n450);
   U328 : AO4ASVTX6 port map( A => AC(9), B => n476, C => n472, D => n480, Z =>
                           n420);
   U329 : IVSVTX0H port map( A => LOAD, Z => n433);
   U330 : IVSVTX0H port map( A => LOAD, Z => n446);
   U331 : IVSVTX0H port map( A => LOAD, Z => n469);
   U332 : IVSVTX0H port map( A => LOAD, Z => n518);
   U333 : IVSVTX0H port map( A => LOAD, Z => n500);
   U334 : IVSVTX0H port map( A => LOAD, Z => n510);
   U335 : IVSVTX0H port map( A => LOAD, Z => n502);
   U336 : IVSVTX0H port map( A => LOAD, Z => n467);
   U337 : IVSVTX0H port map( A => LOAD, Z => n504);
   U338 : IVSVTX0H port map( A => LOAD, Z => n451);
   U339 : IVSVTX0H port map( A => LOAD, Z => n508);
   U340 : IVSVTX0H port map( A => LOAD, Z => n520);
   U341 : IVSVTX0H port map( A => LOAD, Z => n448);
   U342 : IVSVTX0H port map( A => LOAD, Z => n464);
   U343 : IVSVTX0H port map( A => LOAD, Z => n474);
   U344 : IVSVTX0H port map( A => LOAD, Z => n476);
   U345 : IVSVTX0H port map( A => LOAD, Z => n506);
   U346 : IVSVTX0H port map( A => LOAD, Z => n484);
   U347 : IVSVTX0H port map( A => LOAD, Z => n522);
   U348 : IVSVTX0H port map( A => LOAD, Z => n532);
   U349 : IVSVTX0H port map( A => LOAD, Z => n516);
   U350 : IVSVTX2 port map( A => LOAD, Z => n525);
   U351 : AO4ABSVTX4 port map( A => ZC_6_port, B => n337, C => n432, D => n433,
                           Z => n423);
   U352 : IVSVTX12 port map( A => AC(6), Z => n432);
   U353 : IVSVTX2 port map( A => n337, Z => n531);
   U354 : IVSVTX2 port map( A => n337, Z => n529);
   U355 : IVSVTX2 port map( A => n337, Z => n527);
   U356 : IVSVTX2 port map( A => n337, Z => n515);
   U357 : IVHVTX8 port map( A => LOAD, Z => n337);
   U358 : AO4ABSVTX2 port map( A => ZS_15_port, B => n337, C => n456, D => n504
                           , Z => n368);
   U359 : IVSVTX4 port map( A => AS(15), Z => n456);
   U360 : IVSVTX2 port map( A => n479, Z => n402);
   U361 : AO2SVTX4 port map( A => AC(27), B => n480, C => n481, D => n482, Z =>
                           n479);
   ZS_reg_26_inst : FD2QNSVTX1 port map( CD => RESET, CP => CLOCK, D => n357, 
                           QN => n434);
   U362 : IVSVTX0H port map( A => n434, Z => ZS_26_port);
   ZS_reg_38_inst : FD2QNSVTX2 port map( CD => RESET, CP => CLOCK, D => n345, 
                           QN => n436);
   U363 : IVSVTX0H port map( A => n436, Z => ZS_38_port);
   U364 : IVSVTX12 port map( A => AC(15), Z => n438);
   U365 : AO4ABSVTX4 port map( A => ZS_45_port, B => n337, C => n439, D => n451
                           , Z => n338);
   U366 : IVSVTX12 port map( A => AS(45), Z => n439);
   U367 : AO4ABSVTX2 port map( A => ZS_3_port, B => n337, C => n441, D => n448,
                           Z => n380);
   U368 : IVSVTX12 port map( A => AS(3), Z => n441);
   ZC_reg_12_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n417, Q 
                           => ZC_12_port);
   U369 : AO4ABSVTX2 port map( A => ZC_36_port, B => n337, C => n442, D => n469
                           , Z => n393);
   U370 : IVSVTX12 port map( A => AC(36), Z => n442);
   U371 : AO2NSVTX4 port map( A => ZS_42_port, B => n337, C => AS(42), D => 
                           LOAD, Z => n341);
   U372 : AO2NSVTX6 port map( A => ZC_8_port, B => n337, C => AC(8), D => LOAD,
                           Z => n421);
   ZC_reg_24_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n405, Q 
                           => ZC_24_port);
   ZC_reg_42_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n387, Q 
                           => ZC_42_port);
   U373 : AO2NSVTX4 port map( A => AS(32), B => n458, C => n443, D => n444, Z 
                           => n351);
   U374 : IVSVTX12 port map( A => n468, Z => n443);
   U375 : IVSVTX12 port map( A => n480, Z => n444);
   U376 : AO2NSVTX6 port map( A => ZS_4_port, B => n337, C => AS(4), D => LOAD,
                           Z => n379);
   U377 : IVSVTX4 port map( A => AS(35), Z => n466);
   U378 : IVSVTX4 port map( A => AS(41), Z => n501);
   U379 : AO4ABSVTX6 port map( A => ZC_5_port, B => n337, C => n445, D => n446,
                           Z => n424);
   U380 : IVSVTX12 port map( A => AC(5), Z => n445);
   ZC_reg_44_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n385, Q 
                           => ZC_44_port);
   U381 : AO2NSVTX4 port map( A => ZC_44_port, B => n337, C => AC(44), D => 
                           LOAD, Z => n385);
   U382 : AO2NSVTX6 port map( A => ZS_43_port, B => n337, C => AS(43), D => 
                           LOAD, Z => n340);
   U383 : AO4ASVTX8 port map( A => AC(4), B => n448, C => n447, D => n458, Z =>
                           n425);
   U384 : IVSVTX12 port map( A => ZC_4_port, Z => n447);
   U385 : IVSVTX8 port map( A => n516, Z => n458);
   U386 : AO4ABSVTX6 port map( A => ZS_10_port, B => n337, C => n449, D => n451
                           , Z => n373);
   ZC_reg_16_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n413, Q 
                           => ZC_16_port);
   U387 : AO2NSVTX6 port map( A => ZS_16_port, B => n337, C => AS(16), D => 
                           LOAD, Z => n367);
   ZC_reg_33_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n396, Q 
                           => ZC_33_port);
   U388 : AO4ASVTX4 port map( A => AC(30), B => n506, C => n490, D => n511, Z 
                           => n399);
   U389 : IVSVTX4 port map( A => AS(6), Z => n495);
   U390 : AO4ABSVTX6 port map( A => n454, B => n455, C => n453, D => n522, Z =>
                           n401);
   U391 : IVSVTX12 port map( A => AC(28), Z => n453);
   U392 : IVSVTX12 port map( A => n470, Z => n454);
   U393 : IVSVTX12 port map( A => n480, Z => n455);
   ZC_reg_28_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n401, Q 
                           => ZC_28_port);
   U394 : AO2NSVTX6 port map( A => ZS_7_port, B => n337, C => AS(7), D => LOAD,
                           Z => n376);
   U395 : AO4ABSVTX6 port map( A => ZC_43_port, B => n337, C => n457, D => n469
                           , Z => n386);
   U396 : IVSVTX12 port map( A => AC(43), Z => n457);
   U397 : AO2NSVTX4 port map( A => AS(29), B => n458, C => n459, D => n460, Z 
                           => n354);
   U398 : IVSVTX12 port map( A => n485, Z => n459);
   U399 : AO2NSVTX6 port map( A => ZS_37_port, B => n337, C => AS(37), D => 
                           LOAD, Z => n346);
   U400 : AO2NSVTX2 port map( A => ZS_1_port, B => n337, C => AS(1), D => LOAD,
                           Z => n382);
   U401 : IVSVTX4 port map( A => AS(27), Z => n488);
   U402 : AO4ABSVTX6 port map( A => ZC_35_port, B => n337, C => n461, D => n474
                           , Z => n394);
   U403 : IVSVTX12 port map( A => AC(35), Z => n461);
   ZC_reg_6_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n423, Q 
                           => ZC_6_port);
   U404 : IVSVTX6 port map( A => AS(38), Z => n505);
   ZC_reg_40_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n389, Q 
                           => ZC_40_port);
   U405 : AO2NSVTX6 port map( A => ZC_40_port, B => n337, C => AC(40), D => 
                           LOAD, Z => n389);
   U406 : IVSVTX12 port map( A => ZS_40_port, Z => n465);
   U407 : AO4ABSVTX6 port map( A => ZS_35_port, B => n337, C => n466, D => n467
                           , Z => n348);
   U408 : IVSVTX12 port map( A => ZS_32_port, Z => n468);
   U409 : IVSVTX12 port map( A => ZC_28_port, Z => n470);
   U410 : AO4ABSVTX6 port map( A => ZS_17_port, B => n337, C => n471, D => n484
                           , Z => n366);
   U411 : IVSVTX12 port map( A => AS(17), Z => n471);
   U412 : IVSVTX12 port map( A => ZC_9_port, Z => n472);
   U413 : AO4ASVTX8 port map( A => AC(18), B => n474, C => n473, D => n480, Z 
                           => n411);
   U414 : IVSVTX12 port map( A => ZC_18_port, Z => n473);
   U415 : AO4ABSVTX6 port map( A => ZS_8_port, B => n337, C => n475, D => n476,
                           Z => n375);
   U416 : IVSVTX12 port map( A => AS(8), Z => n475);
   U417 : AO2NSVTX4 port map( A => AS(18), B => n480, C => n477, D => n478, Z 
                           => n365);
   U418 : IVSVTX12 port map( A => n528, Z => n477);
   U419 : IVSVTX12 port map( A => n529, Z => n478);
   U420 : IVSVTX8 port map( A => n516, Z => n480);
   U421 : IVSVTX12 port map( A => n514, Z => n481);
   U422 : IVSVTX12 port map( A => n515, Z => n482);
   U423 : AO4ASVTX8 port map( A => AC(33), B => n484, C => n483, D => n511, Z 
                           => n396);
   U424 : IVSVTX12 port map( A => ZC_33_port, Z => n483);
   U425 : IVSVTX12 port map( A => ZS_29_port, Z => n485);
   ZS_reg_22_inst : FD2QNSVTX1 port map( CD => RESET, CP => CLOCK, D => n361, 
                           QN => n486);
   U426 : IVSVTX0H port map( A => n486, Z => ZS_22_port);
   U427 : AO4ABSVTX6 port map( A => ZS_27_port, B => n337, C => n488, D => n510
                           , Z => n356);
   U428 : AO4ABSVTX6 port map( A => ZS_13_port, B => n337, C => n489, D => n508
                           , Z => n370);
   U429 : IVSVTX12 port map( A => AS(13), Z => n489);
   U430 : AO2NSVTX6 port map( A => ZC_26_port, B => n337, C => AC(26), D => 
                           LOAD, Z => n403);
   U431 : IVSVTX12 port map( A => ZC_30_port, Z => n490);
   ZC_reg_5_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n424, Q 
                           => ZC_5_port);
   U432 : AO4ASVTX8 port map( A => AS(36), B => n500, C => n491, D => n511, Z 
                           => n347);
   U433 : IVSVTX12 port map( A => ZS_36_port, Z => n491);
   U434 : IVSVTX4 port map( A => AS(26), Z => n519);
   U435 : AO4ASVTX8 port map( A => AS(25), B => n502, C => n493, D => n511, Z 
                           => n358);
   U436 : IVSVTX12 port map( A => ZS_25_port, Z => n493);
   U437 : AO2ASVTX6 port map( A => n532, B => AC(22), C => n497, D => n498, Z 
                           => n496);
   ZS_reg_24_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n359, Q 
                           => ZS_24_port);
   U438 : AO2NSVTX6 port map( A => ZC_21_port, B => n337, C => AC(21), D => 
                           LOAD, Z => n408);
   U439 : AO4ABSVTX6 port map( A => ZC_23_port, B => n518, C => n494, D => n525
                           , Z => n406);
   U440 : IVSVTX12 port map( A => AC(23), Z => n494);
   U441 : IVSVTX4 port map( A => AS(22), Z => n503);
   U442 : AO2NSVTX6 port map( A => ZC_31_port, B => n337, C => AC(31), D => 
                           LOAD, Z => n398);
   U443 : AO4ABSVTX6 port map( A => ZS_6_port, B => n337, C => n495, D => n504,
                           Z => n377);
   U444 : IVSVTX6 port map( A => AS(21), Z => n517);
   U445 : IVSVTX4 port map( A => n496, Z => n407);
   ZC_reg_23_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n406, Q 
                           => ZC_23_port);
   U446 : IVSVTX12 port map( A => n530, Z => n497);
   U447 : IVSVTX12 port map( A => n531, Z => n498);
   U448 : AO2NSVTX6 port map( A => ZS_39_port, B => n337, C => AS(39), D => 
                           LOAD, Z => n344);
   U449 : AO4ABSVTX6 port map( A => ZC_39_port, B => n337, C => n499, D => n500
                           , Z => n390);
   U450 : IVSVTX12 port map( A => AC(39), Z => n499);
   ZC_reg_43_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n386, Q 
                           => ZC_43_port);
   U451 : AO4ABSVTX6 port map( A => ZS_41_port, B => n337, C => n501, D => n502
                           , Z => n342);
   U452 : AO2NSVTX6 port map( A => ZS_12_port, B => n337, C => AS(12), D => 
                           LOAD, Z => n371);
   ZC_reg_7_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n422, Q 
                           => ZC_7_port);
   U453 : AO2NSVTX8 port map( A => ZC_7_port, B => n337, C => AC(7), D => LOAD,
                           Z => n422);
   U454 : AO2NSVTX8 port map( A => ZC_32_port, B => n337, C => AC(32), D => 
                           LOAD, Z => n397);
   U455 : AO4ABSVTX6 port map( A => ZS_38_port, B => n337, C => n505, D => n506
                           , Z => n345);
   U456 : AO4ABSVTX6 port map( A => ZC_29_port, B => n337, C => n507, D => n508
                           , Z => n400);
   U457 : IVSVTX12 port map( A => AC(29), Z => n507);
   U458 : AO4ASVTX8 port map( A => AS(28), B => n510, C => n509, D => n511, Z 
                           => n355);
   U459 : IVSVTX12 port map( A => ZS_28_port, Z => n509);
   U460 : IVSVTX8 port map( A => n525, Z => n511);
   U461 : AO2NSVTX4 port map( A => AS(20), B => n511, C => n512, D => n513, Z 
                           => n363);
   U462 : IVSVTX12 port map( A => n523, Z => n512);
   U463 : IVSVTX12 port map( A => n527, Z => n513);
   U464 : AO2NSVTX6 port map( A => ZS_0_port, B => n337, C => AS(0), D => LOAD,
                           Z => n383);
   U465 : IVSVTX12 port map( A => ZC_27_port, Z => n514);
   U466 : AO4ABSVTX6 port map( A => ZS_21_port, B => n337, C => n517, D => n518
                           , Z => n362);
   U467 : AO4ABSVTX6 port map( A => ZS_26_port, B => n337, C => n519, D => n520
                           , Z => n357);
   U468 : IVSVTX12 port map( A => ZS_20_port, Z => n523);
   ZC_reg_22_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n407, Q 
                           => ZC_22_port);
   U469 : AO2NSVTX8 port map( A => ZC_14_port, B => n337, C => AC(14), D => 
                           LOAD, Z => n415);
   U470 : AO2NSVTX2 port map( A => ZS_31_port, B => n337, C => AS(31), D => 
                           LOAD, Z => n352);
   U471 : AO2NSVTX4 port map( A => ZC_45_port, B => n337, C => AC(45), D => 
                           LOAD, Z => n384);
   U472 : AO2NSVTX6 port map( A => ZS_14_port, B => n337, C => AS(14), D => 
                           LOAD, Z => n369);
   U473 : AO2NSVTX4 port map( A => ZS_44_port, B => n337, C => AS(44), D => 
                           LOAD, Z => n339);
   U474 : AO2NSVTX2 port map( A => ZS_19_port, B => n337, C => AS(19), D => 
                           LOAD, Z => n364);
   U475 : AO2NSVTX6 port map( A => ZS_24_port, B => n337, C => AS(24), D => 
                           LOAD, Z => n359);
   U476 : AO2NSVTX6 port map( A => ZC_24_port, B => n337, C => AC(24), D => 
                           LOAD, Z => n405);
   U477 : AO2NSVTX6 port map( A => ZS_33_port, B => n337, C => AS(33), D => 
                           LOAD, Z => n350);
   U478 : AO4ASVTX8 port map( A => AC(34), B => n525, C => n524, D => n529, Z 
                           => n395);
   U479 : IVSVTX12 port map( A => ZC_34_port, Z => n524);
   ZC_reg_25_inst : FD2QSVTX2 port map( CD => RESET, CP => CLOCK, D => n404, Q 
                           => ZC_25_port);
   U480 : AO2NSVTX6 port map( A => ZC_25_port, B => n337, C => AC(25), D => 
                           LOAD, Z => n404);
   ZC_reg_4_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n425, Q 
                           => ZC_4_port);
   U481 : AO4ASVTX8 port map( A => AS(30), B => n532, C => n526, D => n527, Z 
                           => n353);
   U482 : IVSVTX12 port map( A => ZS_30_port, Z => n526);
   ZC_reg_38_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n391, Q 
                           => ZC_38_port);
   U483 : AO2NSVTX6 port map( A => ZS_9_port, B => n337, C => AS(9), D => LOAD,
                           Z => n374);
   U484 : AO2NSVTX2 port map( A => ZS_2_port, B => n337, C => AS(2), D => LOAD,
                           Z => n381);
   U485 : AO2NSVTX2 port map( A => ZC_2_port, B => n337, C => AC(2), D => LOAD,
                           Z => n427);
   U486 : AO2NSVTX2 port map( A => ZC_10_port, B => n337, C => AC(10), D => 
                           LOAD, Z => n419);
   U487 : AO2NSVTX6 port map( A => ZS_5_port, B => n337, C => AS(5), D => LOAD,
                           Z => n378);
   ZC_reg_3_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n426, Q 
                           => ZC_3_port);
   U488 : AO2NSVTX6 port map( A => ZC_3_port, B => n337, C => AC(3), D => LOAD,
                           Z => n426);
   U489 : AO2NSVTX8 port map( A => ZC_1_port, B => n337, C => AC(1), D => LOAD,
                           Z => n428);
   U490 : IVSVTX12 port map( A => ZS_18_port, Z => n528);
   U491 : IVSVTX12 port map( A => ZC_22_port, Z => n530);
   U492 : AO2NSVTX2 port map( A => ZC_41_port, B => n337, C => AC(41), D => 
                           LOAD, Z => n388);
   ZC_reg_35_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n394, Q 
                           => ZC_35_port);
   ZC_reg_31_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n398, Q 
                           => ZC_31_port);
   ZC_reg_30_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n399, Q 
                           => ZC_30_port);
   U493 : AO2NSVTX2 port map( A => ZC_20_port, B => n337, C => AC(20), D => 
                           LOAD, Z => n409);
   U494 : AO2NSVTX2 port map( A => ZC_17_port, B => n337, C => AC(17), D => 
                           LOAD, Z => n412);
   ZC_reg_9_inst : FD2QSVTX4 port map( CD => RESET, CP => CLOCK, D => n420, Q 
                           => ZC_9_port);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity QDS_TABLE is

   port( D : in std_logic_vector (2 downto 0);  Y : in std_logic_vector (6 
         downto 0);  M1, M2, P1, P2 : out std_logic);

end QDS_TABLE;

architecture SYN_BEHAVIORAL of QDS_TABLE is

   component AO7HVTX1
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component NR2HVTX1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO8SVTX4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVHVTX2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component NR3ASVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7SVTX1
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX6
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7SVTX2
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO6SVTX2
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7SVTX4
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO20SVTX1
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO17SVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO35SVTX2
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component NR2ASVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component NR4SVTX8
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO9SVTX4
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component AO52SVTX2
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component AO17ASVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7SVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO52SVTX4
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component NR2SVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AN3ABCSVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO20SVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO1SVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO9NSVTX4
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component ENSVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component ND4SVTX2
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO8SVTX6
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component AO9SVTX2
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   signal n3717, n3718, n3719, n3720, n3721, n3722, n3723, n3724, n3725, n3726,
      n3727, n3728, n3729, n3730, n3731, n3732, n3733, n3734, n3735, n3736, 
      n3737, n3738, n3739, n3740, n3741, n3742, n3743, n3744, n3745, n3746, 
      n3747, n3748, n3749, n3750, n3751, n3752, n3753, n3754, n3755, n3756, 
      n3757, n3758, n3759, n3760, n3761, n3762, n3763, n3764 : std_logic;

begin
   
   U807 : AO7HVTX1 port map( A => n3760, B => n3749, C => D(2), Z => n3748);
   U825 : IVHVTX0H port map( A => n3739, Z => n3749);
   U826 : NR2HVTX1 port map( A => D(0), B => D(1), Z => n3739);
   U828 : IVHVTX0H port map( A => D(0), Z => n3744);
   U829 : IVHVTX0H port map( A => D(1), Z => n3725);
   U832 : IVHVTX2 port map( A => n3719, Z => n3762);
   U833 : IVSVTX4 port map( A => n3732, Z => n3761);
   U834 : IVSVTX2 port map( A => Y(4), Z => n3758);
   U835 : IVSVTX2 port map( A => Y(4), Z => n3722);
   U836 : NR3ASVTX8 port map( A => n3733, B => n3751, C => n3762, Z => M1);
   U837 : AO7SVTX1 port map( A => D(1), B => n3759, C => D(2), Z => n3754);
   U838 : IVSVTX4 port map( A => Y(1), Z => n3759);
   U839 : AO7SVTX1 port map( A => n3725, B => n3726, C => n3727, Z => n3724);
   U840 : IVSVTX6 port map( A => n3731, Z => n3726);
   U841 : AO7SVTX2 port map( A => D(0), B => n3742, C => D(1), Z => n3756);
   U842 : IVSVTX2 port map( A => n3761, Z => n3760);
   U843 : AO6SVTX2 port map( A => n3731, B => D(1), C => D(2), Z => n3743);
   U844 : AO7SVTX4 port map( A => Y(2), B => n3723, C => n3724, Z => n3721);
   U845 : AO20SVTX1 port map( A => D(0), B => n3742, C => D(1), D => n3759, Z 
                           => n3750);
   U846 : AO17SVTX2 port map( A => D(1), B => D(0), C => n3729, D => n3720, Z 
                           => n3747);
   U847 : IVSVTX4 port map( A => Y(3), Z => n3720);
   U848 : AO7SVTX2 port map( A => n3760, B => n3749, C => n3729, Z => n3757);
   U849 : IVSVTX4 port map( A => Y(2), Z => n3729);
   U850 : AO35SVTX2 port map( A => n3727, B => n3725, C => n3741, D => n3743, E
                           => n3729, Z => n3735);
   U851 : IVSVTX8 port map( A => Y(1), Z => n3732);
   U852 : NR2ASVTX8 port map( A => n3759, B => D(0), Z => n3741);
   U853 : NR4SVTX8 port map( A => D(2), B => D(1), C => Y(2), D => n3740, Z => 
                           n3737);
   U854 : IVSVTX2 port map( A => n3722, Z => n3764);
   U855 : AO9SVTX4 port map( A => n3752, B => D(2), C => n3764, D => n3758, E 
                           => n3753, Z => n3751);
   U856 : AO52SVTX2 port map( A => n3761, B => n3739, C => n3756, D => n3727, E
                           => Y(2), Z => n3755);
   U857 : AO17ASVTX2 port map( A => n3726, B => D(2), C => n3728, D => D(1), Z 
                           => n3763);
   U858 : IVSVTX2 port map( A => n3763, Z => n3723);
   U859 : AO7SVTX8 port map( A => n3741, B => n3742, C => n3726, Z => n3740);
   U860 : AO7SVTX4 port map( A => Y(3), B => n3737, C => n3738, Z => n3736);
   U861 : AO52SVTX4 port map( A => n3739, B => n3760, C => n3727, D => n3729, E
                           => Y(3), Z => n3738);
   U862 : AO52SVTX2 port map( A => n3750, B => n3739, C => Y(3), D => n3727, E 
                           => Y(2), Z => n3745);
   U863 : NR2SVTX8 port map( A => n3744, B => n3732, Z => n3731);
   U864 : AN3ABCSVTX8 port map( A => n3733, B => n3719, C => n3734, Z => P1);
   U865 : AO20SVTX2 port map( A => n3725, B => n3744, C => n3757, D => Y(3), Z 
                           => n3752);
   U866 : IVSVTX1 port map( A => D(2), Z => n3727);
   U867 : AO1SVTX2 port map( A => Y(0), B => n3728, C => D(1), D => n3731, Z =>
                           n3730);
   U868 : IVSVTX8 port map( A => Y(6), Z => n3719);
   U869 : AO9NSVTX4 port map( A => n3754, B => n3720, C => Y(2), D => n3755, E 
                           => Y(3), Z => n3753);
   U870 : ENSVTX8 port map( A => n3759, B => D(0), Z => n3728);
   U871 : AO8SVTX4 port map( A => n3745, B => n3733, C => n3746, D => Y(6), Z 
                           => M2);
   U872 : ND4SVTX2 port map( A => n3729, B => n3720, C => n3727, D => n3730, Z 
                           => n3717);
   U873 : IVSVTX4 port map( A => Y(5), Z => n3733);
   U874 : AO8SVTX6 port map( A => Y(5), B => n3717, C => n3718, D => n3719, Z 
                           => P2);
   U875 : AO7SVTX4 port map( A => n3720, B => n3721, C => n3758, Z => n3718);
   U876 : IVSVTX4 port map( A => Y(0), Z => n3742);
   U877 : AO7SVTX2 port map( A => n3747, B => n3748, C => Y(4), Z => n3746);
   U878 : AO9SVTX2 port map( A => n3722, B => Y(3), C => n3735, D => Y(4), E =>
                           n3736, Z => n3734);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity QDS_ADDER is

   port( A1, A2 : in std_logic_vector (6 downto 0);  Y : out std_logic_vector 
         (6 downto 0));

end QDS_ADDER;

architecture SYN_BEHAVIORAL of QDS_ADDER is

   component IVSVTX2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component NR2SVTX8
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component NR2SVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7CSVTX6
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component EO3SVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component EO3SVTX2
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AO5SVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component EO3SVTX4
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component EO3SVTX6
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7ABSVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component AO7SVTX8
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   component EOSVTX2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   signal n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, 
      n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, 
      n251, n252, n253 : std_logic;

begin
   
   U51 : IVSVTX2 port map( A => n246, Z => n244);
   U52 : NR2SVTX8 port map( A => n245, B => n246, Z => n238);
   U53 : NR2SVTX2 port map( A => n246, B => n245, Z => n237);
   U54 : AO7CSVTX6 port map( A => n239, B => n231, C => n240, Z => n232);
   U55 : IVSVTX12 port map( A => n241, Z => n239);
   U56 : IVSVTX12 port map( A => A2(4), Z => n240);
   U57 : IVSVTX12 port map( A => A1(4), Z => n241);
   U58 : EO3SVTX8 port map( A => n242, B => n243, C => n228, Z => Y(6));
   U59 : IVSVTX12 port map( A => A2(6), Z => n242);
   U60 : IVSVTX12 port map( A => A1(6), Z => n243);
   U61 : EO3SVTX2 port map( A => A2(4), B => A1(4), C => n231, Z => Y(4));
   U62 : IVSVTX8 port map( A => A1(0), Z => n245);
   U63 : IVSVTX4 port map( A => A2(0), Z => n246);
   U64 : AO5SVTX8 port map( A => A1(1), B => A2(1), C => n238, Z => n247);
   U65 : IVSVTX8 port map( A => n247, Z => n235);
   U66 : EO3SVTX8 port map( A => A2(1), B => A1(1), C => n237, Z => Y(1));
   U67 : EO3SVTX4 port map( A => A2(2), B => A1(2), C => n235, Z => Y(2));
   U68 : AO7CSVTX6 port map( A => n248, B => n233, C => n249, Z => n234);
   U69 : IVSVTX12 port map( A => n250, Z => n248);
   U70 : IVSVTX12 port map( A => A2(3), Z => n249);
   U71 : IVSVTX12 port map( A => A1(3), Z => n250);
   U72 : EO3SVTX6 port map( A => A2(3), B => A1(3), C => n233, Z => Y(3));
   U73 : AO7ABSVTX8 port map( A => A1(2), B => n235, C => n236, Z => n233);
   U74 : AO7SVTX8 port map( A => A1(2), B => n235, C => A2(2), Z => n236);
   U75 : AO7CSVTX6 port map( A => n251, B => n229, C => n252, Z => n230);
   U76 : IVSVTX12 port map( A => n253, Z => n251);
   U77 : IVSVTX12 port map( A => A2(5), Z => n252);
   U78 : IVSVTX12 port map( A => A1(5), Z => n253);
   U79 : AO7ABSVTX8 port map( A => A1(5), B => n229, C => n230, Z => n228);
   U80 : AO7ABSVTX8 port map( A => A1(4), B => n231, C => n232, Z => n229);
   U81 : EO3SVTX4 port map( A => A2(5), B => A1(5), C => n229, Z => Y(5));
   U82 : AO7ABSVTX8 port map( A => A1(3), B => n233, C => n234, Z => n231);
   U83 : EOSVTX2 port map( A => n244, B => A1(0), Z => Y(0));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity QDSEL is

   port( A1, A2 : in std_logic_vector (6 downto 0);  D : in std_logic_vector (2
         downto 0);  M1, M2, P1, P2 : out std_logic);

end QDSEL;

architecture SYN_SCHEMATIC of QDSEL is

   component QDS_TABLE
      port( D : in std_logic_vector (2 downto 0);  Y : in std_logic_vector (6 
            downto 0);  M1, M2, P1, P2 : out std_logic);
   end component;
   
   component QDS_ADDER
      port( A1, A2 : in std_logic_vector (6 downto 0);  Y : out 
            std_logic_vector (6 downto 0));
   end component;
   
   signal Y_6_port, Y_5_port, Y_4_port, Y_3_port, Y_2_port, Y_1_port, Y_0_port 
      : std_logic;

begin
   
   I_1 : QDS_TABLE port map( D(2) => D(2), D(1) => D(1), D(0) => D(0), Y(6) => 
                           Y_6_port, Y(5) => Y_5_port, Y(4) => Y_4_port, Y(3) 
                           => Y_3_port, Y(2) => Y_2_port, Y(1) => Y_1_port, 
                           Y(0) => Y_0_port, M1 => M1, M2 => M2, P1 => P1, P2 
                           => P2);
   I_2 : QDS_ADDER port map( A1(6) => A1(6), A1(5) => A1(5), A1(4) => A1(4), 
                           A1(3) => A1(3), A1(2) => A1(2), A1(1) => A1(1), 
                           A1(0) => A1(0), A2(6) => A2(6), A2(5) => A2(5), 
                           A2(4) => A2(4), A2(3) => A2(3), A2(2) => A2(2), 
                           A2(1) => A2(1), A2(0) => A2(0), Y(6) => Y_6_port, 
                           Y(5) => Y_5_port, Y(4) => Y_4_port, Y(3) => Y_3_port
                           , Y(2) => Y_2_port, Y(1) => Y_1_port, Y(0) => 
                           Y_0_port);

end SYN_SCHEMATIC;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_divr4_rec.all;

entity divr4_rec is

   port( CLOCK : in std_logic;  D : in std_logic_vector (52 downto 0);  RESET :
         in std_logic;  X : in std_logic_vector (53 downto 0);  Qj : out 
         std_logic_vector (3 downto 0));

end divr4_rec;

architecture SYN_SCHEMATIC of divr4_rec is

   component CONTROL
      port( CLOCK, RESET : in std_logic;  CL1, DIGIT, LD1, MX1, ROUND : out 
            std_logic);
   end component;
   
   component MUX
      port( A, B : in std_logic_vector (56 downto 0);  SEL : in std_logic;  Z :
            out std_logic_vector (56 downto 0));
   end component;
   
   component MULT
      port( A : in std_logic_vector (54 downto 0);  M1, M2, P1, P2 : in 
            std_logic;  COUT : out std_logic;  Z : out std_logic_vector (56 
            downto 0));
   end component;
   
   component gl_csa32_n8
      port( A, B, C : in std_logic_vector (8 downto 0);  Cin : in std_logic;  Z
            , Y : out std_logic_vector (8 downto 0));
   end component;
   
   component csa32LSBs_n47
      port( A, B, C : in std_logic_vector (47 downto 0);  Cin : in std_logic;  
            Cout : out std_logic;  Z, Y : out std_logic_vector (47 downto 0));
   end component;
   
   component gl_dualreg_ld_n10
      port( AS, AC : in std_logic_vector (10 downto 0);  RESET, CLOCK, LOAD : 
            in std_logic;  ZS, ZC : out std_logic_vector (10 downto 0));
   end component;
   
   component gl_dualreg_ld_n45
      port( AS, AC : in std_logic_vector (45 downto 0);  RESET, CLOCK, LOAD : 
            in std_logic;  ZS, ZC : out std_logic_vector (45 downto 0));
   end component;
   
   component QDSEL
      port( A1, A2 : in std_logic_vector (6 downto 0);  D : in std_logic_vector
            (2 downto 0);  M1, M2, P1, P2 : out std_logic);
   end component;
   
   component IVHVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX0H
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX4
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component BFHVTX1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX6
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component IVSVTX12
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   signal GND, W1_56_port, W1_55_port, W1_54_port, W1_53_port, W1_52_port, 
      W1_51_port, W1_50_port, W1_49_port, W1_48_port, W1_47_port, W1_46_port, 
      W1_45_port, W1_44_port, W1_43_port, W1_42_port, W1_41_port, W1_40_port, 
      W1_39_port, W1_38_port, W1_37_port, W1_36_port, W1_35_port, W1_34_port, 
      W1_33_port, W1_32_port, W1_31_port, W1_30_port, W1_29_port, W1_28_port, 
      W1_27_port, W1_26_port, W1_25_port, W1_24_port, W1_23_port, W1_22_port, 
      W1_21_port, W1_20_port, W1_19_port, W1_18_port, W1_17_port, W1_16_port, 
      W1_15_port, W1_14_port, W1_13_port, W1_12_port, W1_11_port, W1_10_port, 
      W1_9_port, W1_8_port, W1_7_port, W1_6_port, W1_5_port, W1_4_port, 
      W1_3_port, W1_2_port, W1_1_port, W1_0_port, W2_56_port, W2_55_port, 
      W2_54_port, W2_53_port, W2_52_port, W2_51_port, W2_50_port, W2_49_port, 
      W2_48_port, W2_47_port, W2_46_port, W2_45_port, W2_44_port, W2_43_port, 
      W2_42_port, W2_41_port, W2_40_port, W2_39_port, W2_38_port, W2_37_port, 
      W2_36_port, W2_35_port, W2_34_port, W2_33_port, W2_32_port, W2_31_port, 
      W2_30_port, W2_29_port, W2_28_port, W2_27_port, W2_26_port, W2_25_port, 
      W2_24_port, W2_23_port, W2_22_port, W2_21_port, W2_20_port, W2_19_port, 
      W2_18_port, W2_17_port, W2_16_port, W2_15_port, W2_14_port, W2_13_port, 
      W2_12_port, W2_11_port, W2_10_port, W2_9_port, W2_8_port, W2_7_port, 
      W2_6_port, W2_5_port, W2_4_port, W2_3_port, W2_2_port, W2_1_port, 
      W2_0_port, CLR, LOAD, muxW, n119, Qj_2_port, Qj_1_port, n120, 
      MXLA_56_port, MXLA_55_port, MXLA_54_port, MXLA_53_port, MXLA_52_port, 
      MXLA_51_port, MXLA_50_port, MXLA_49_port, MXLA_48_port, MXLA_47_port, 
      MXLA_46_port, MXLA_45_port, MXLA_44_port, MXLA_43_port, MXLA_42_port, 
      MXLA_41_port, MXLA_40_port, MXLA_39_port, MXLA_38_port, MXLA_37_port, 
      MXLA_36_port, MXLA_35_port, MXLA_34_port, MXLA_33_port, MXLA_32_port, 
      MXLA_31_port, MXLA_30_port, MXLA_29_port, MXLA_28_port, MXLA_27_port, 
      MXLA_26_port, MXLA_25_port, MXLA_24_port, MXLA_23_port, MXLA_22_port, 
      MXLA_21_port, MXLA_20_port, MXLA_19_port, MXLA_18_port, MXLA_17_port, 
      MXLA_16_port, MXLA_15_port, MXLA_14_port, MXLA_13_port, MXLA_12_port, 
      MXLA_11_port, MXLA_10_port, MXLA_9_port, MXLA_8_port, MXLA_7_port, 
      MXLA_6_port, MXLA_5_port, MXLA_4_port, MXLA_3_port, MXLA_2_port, 
      MXLA_1_port, MXLA_0_port, qjD_c2, qjD_56_port, qjD_55_port, qjD_54_port, 
      qjD_53_port, qjD_52_port, qjD_51_port, qjD_50_port, qjD_49_port, 
      qjD_48_port, qjD_47_port, qjD_46_port, qjD_45_port, qjD_44_port, 
      qjD_43_port, qjD_42_port, qjD_41_port, qjD_40_port, qjD_39_port, 
      qjD_38_port, qjD_37_port, qjD_36_port, qjD_35_port, qjD_34_port, 
      qjD_33_port, qjD_32_port, qjD_31_port, qjD_30_port, qjD_29_port, 
      qjD_28_port, qjD_27_port, qjD_26_port, qjD_25_port, qjD_24_port, 
      qjD_23_port, qjD_22_port, qjD_21_port, qjD_20_port, qjD_19_port, 
      qjD_18_port, qjD_17_port, qjD_16_port, qjD_15_port, qjD_14_port, 
      qjD_13_port, qjD_12_port, qjD_11_port, qjD_10_port, qjD_9_port, 
      qjD_8_port, qjD_7_port, qjD_6_port, qjD_5_port, qjD_4_port, qjD_3_port, 
      qjD_2_port, qjD_1_port, qjD_0_port, carry_ex, WC_56_port, WC_55_port, 
      WC_54_port, WC_53_port, WC_52_port, WC_51_port, WC_50_port, WC_49_port, 
      WC_48_port, WC_47_port, WC_46_port, WC_45_port, WC_44_port, WC_43_port, 
      WC_42_port, WC_41_port, WC_40_port, WC_39_port, WC_38_port, WC_37_port, 
      WC_36_port, WC_35_port, WC_34_port, WC_33_port, WC_32_port, WC_31_port, 
      WC_30_port, WC_29_port, WC_28_port, WC_27_port, WC_26_port, WC_25_port, 
      WC_24_port, WC_23_port, WC_22_port, WC_21_port, WC_20_port, WC_19_port, 
      WC_18_port, WC_17_port, WC_16_port, WC_15_port, WC_14_port, WC_13_port, 
      WC_12_port, WC_11_port, WC_10_port, WC_9_port, WC_8_port, WC_7_port, 
      WC_6_port, WC_5_port, WC_4_port, WC_3_port, WC_2_port, WC_1_port, 
      WC_0_port, WS_56_port, WS_55_port, WS_54_port, WS_53_port, WS_52_port, 
      WS_51_port, WS_50_port, WS_49_port, WS_48_port, WS_47_port, WS_46_port, 
      WS_45_port, WS_44_port, WS_43_port, WS_42_port, WS_41_port, WS_40_port, 
      WS_39_port, WS_38_port, WS_37_port, WS_36_port, WS_35_port, WS_34_port, 
      WS_33_port, WS_32_port, WS_31_port, WS_30_port, WS_29_port, WS_28_port, 
      WS_27_port, WS_26_port, WS_25_port, WS_24_port, WS_23_port, WS_22_port, 
      WS_21_port, WS_20_port, WS_19_port, WS_18_port, WS_17_port, WS_16_port, 
      WS_15_port, WS_14_port, WS_13_port, WS_12_port, WS_11_port, WS_10_port, 
      WS_9_port, WS_8_port, WS_7_port, WS_6_port, WS_5_port, WS_4_port, 
      WS_3_port, WS_2_port, WS_1_port, WS_0_port, n104, n105, n106, n107, n108,
      n109, n110, n111, n112, n113, n114, n115, Qj_3_port, n117, Qj_0_port, 
      n_1001, n_1002 : std_logic;

begin
   Qj <= ( Qj_3_port, Qj_2_port, Qj_1_port, Qj_0_port );
   
   GND <= '0';
   I_CTRL : CONTROL port map( CLOCK => CLOCK, RESET => RESET, CL1 => CLR, DIGIT
                           => n_1001, LD1 => LOAD, MX1 => muxW, ROUND => n_1002
                           );
   I_MUX : MUX port map( A(56) => GND, A(55) => GND, A(54) => GND, A(53) => 
                           X(53), A(52) => X(52), A(51) => X(51), A(50) => 
                           X(50), A(49) => X(49), A(48) => X(48), A(47) => 
                           X(47), A(46) => X(46), A(45) => X(45), A(44) => 
                           X(44), A(43) => X(43), A(42) => X(42), A(41) => 
                           X(41), A(40) => X(40), A(39) => X(39), A(38) => 
                           X(38), A(37) => X(37), A(36) => X(36), A(35) => 
                           X(35), A(34) => X(34), A(33) => X(33), A(32) => 
                           X(32), A(31) => X(31), A(30) => X(30), A(29) => 
                           X(29), A(28) => X(28), A(27) => X(27), A(26) => 
                           X(26), A(25) => X(25), A(24) => X(24), A(23) => 
                           X(23), A(22) => X(22), A(21) => X(21), A(20) => 
                           X(20), A(19) => X(19), A(18) => X(18), A(17) => 
                           X(17), A(16) => X(16), A(15) => X(15), A(14) => 
                           X(14), A(13) => X(13), A(12) => X(12), A(11) => 
                           X(11), A(10) => X(10), A(9) => X(9), A(8) => X(8), 
                           A(7) => X(7), A(6) => X(6), A(5) => X(5), A(4) => 
                           X(4), A(3) => X(3), A(2) => X(2), A(1) => X(1), A(0)
                           => X(0), B(56) => W1_54_port, B(55) => W1_53_port, 
                           B(54) => W1_52_port, B(53) => n114, B(52) => n109, 
                           B(51) => W1_49_port, B(50) => W1_48_port, B(49) => 
                           W1_47_port, B(48) => W1_46_port, B(47) => W1_45_port
                           , B(46) => W1_44_port, B(45) => W1_43_port, B(44) =>
                           W1_42_port, B(43) => W1_41_port, B(42) => W1_40_port
                           , B(41) => W1_39_port, B(40) => W1_38_port, B(39) =>
                           W1_37_port, B(38) => W1_36_port, B(37) => W1_35_port
                           , B(36) => W1_34_port, B(35) => W1_33_port, B(34) =>
                           W1_32_port, B(33) => W1_31_port, B(32) => W1_30_port
                           , B(31) => W1_29_port, B(30) => W1_28_port, B(29) =>
                           W1_27_port, B(28) => W1_26_port, B(27) => W1_25_port
                           , B(26) => W1_24_port, B(25) => W1_23_port, B(24) =>
                           W1_22_port, B(23) => W1_21_port, B(22) => W1_20_port
                           , B(21) => W1_19_port, B(20) => W1_18_port, B(19) =>
                           W1_17_port, B(18) => W1_16_port, B(17) => W1_15_port
                           , B(16) => W1_14_port, B(15) => W1_13_port, B(14) =>
                           W1_12_port, B(13) => W1_11_port, B(12) => W1_10_port
                           , B(11) => W1_9_port, B(10) => W1_8_port, B(9) => 
                           W1_7_port, B(8) => W1_6_port, B(7) => W1_5_port, 
                           B(6) => W1_4_port, B(5) => W1_3_port, B(4) => 
                           W1_2_port, B(3) => W1_1_port, B(2) => W1_0_port, 
                           B(1) => GND, B(0) => GND, SEL => muxW, Z(56) => 
                           MXLA_56_port, Z(55) => MXLA_55_port, Z(54) => 
                           MXLA_54_port, Z(53) => MXLA_53_port, Z(52) => 
                           MXLA_52_port, Z(51) => MXLA_51_port, Z(50) => 
                           MXLA_50_port, Z(49) => MXLA_49_port, Z(48) => 
                           MXLA_48_port, Z(47) => MXLA_47_port, Z(46) => 
                           MXLA_46_port, Z(45) => MXLA_45_port, Z(44) => 
                           MXLA_44_port, Z(43) => MXLA_43_port, Z(42) => 
                           MXLA_42_port, Z(41) => MXLA_41_port, Z(40) => 
                           MXLA_40_port, Z(39) => MXLA_39_port, Z(38) => 
                           MXLA_38_port, Z(37) => MXLA_37_port, Z(36) => 
                           MXLA_36_port, Z(35) => MXLA_35_port, Z(34) => 
                           MXLA_34_port, Z(33) => MXLA_33_port, Z(32) => 
                           MXLA_32_port, Z(31) => MXLA_31_port, Z(30) => 
                           MXLA_30_port, Z(29) => MXLA_29_port, Z(28) => 
                           MXLA_28_port, Z(27) => MXLA_27_port, Z(26) => 
                           MXLA_26_port, Z(25) => MXLA_25_port, Z(24) => 
                           MXLA_24_port, Z(23) => MXLA_23_port, Z(22) => 
                           MXLA_22_port, Z(21) => MXLA_21_port, Z(20) => 
                           MXLA_20_port, Z(19) => MXLA_19_port, Z(18) => 
                           MXLA_18_port, Z(17) => MXLA_17_port, Z(16) => 
                           MXLA_16_port, Z(15) => MXLA_15_port, Z(14) => 
                           MXLA_14_port, Z(13) => MXLA_13_port, Z(12) => 
                           MXLA_12_port, Z(11) => MXLA_11_port, Z(10) => 
                           MXLA_10_port, Z(9) => MXLA_9_port, Z(8) => 
                           MXLA_8_port, Z(7) => MXLA_7_port, Z(6) => 
                           MXLA_6_port, Z(5) => MXLA_5_port, Z(4) => 
                           MXLA_4_port, Z(3) => MXLA_3_port, Z(2) => 
                           MXLA_2_port, Z(1) => MXLA_1_port, Z(0) => 
                           MXLA_0_port);
   I_MULT : MULT port map( A(54) => GND, A(53) => D(52), A(52) => D(51), A(51) 
                           => D(50), A(50) => D(49), A(49) => D(48), A(48) => 
                           D(47), A(47) => D(46), A(46) => D(45), A(45) => 
                           D(44), A(44) => D(43), A(43) => D(42), A(42) => 
                           D(41), A(41) => D(40), A(40) => D(39), A(39) => 
                           D(38), A(38) => D(37), A(37) => D(36), A(36) => 
                           D(35), A(35) => D(34), A(34) => D(33), A(33) => 
                           D(32), A(32) => D(31), A(31) => D(30), A(30) => 
                           D(29), A(29) => D(28), A(28) => D(27), A(27) => 
                           D(26), A(26) => D(25), A(25) => D(24), A(24) => 
                           D(23), A(23) => D(22), A(22) => D(21), A(21) => 
                           D(20), A(20) => D(19), A(19) => D(18), A(18) => 
                           D(17), A(17) => D(16), A(16) => D(15), A(15) => 
                           D(14), A(14) => D(13), A(13) => D(12), A(12) => 
                           D(11), A(11) => D(10), A(10) => D(9), A(9) => D(8), 
                           A(8) => D(7), A(7) => D(6), A(6) => D(5), A(5) => 
                           D(4), A(4) => D(3), A(3) => D(2), A(2) => D(1), A(1)
                           => D(0), A(0) => GND, M1 => Qj_2_port, M2 => 
                           Qj_3_port, P1 => Qj_1_port, P2 => Qj_0_port, COUT =>
                           qjD_c2, Z(56) => qjD_56_port, Z(55) => qjD_55_port, 
                           Z(54) => qjD_54_port, Z(53) => qjD_53_port, Z(52) =>
                           qjD_52_port, Z(51) => qjD_51_port, Z(50) => 
                           qjD_50_port, Z(49) => qjD_49_port, Z(48) => 
                           qjD_48_port, Z(47) => qjD_47_port, Z(46) => 
                           qjD_46_port, Z(45) => qjD_45_port, Z(44) => 
                           qjD_44_port, Z(43) => qjD_43_port, Z(42) => 
                           qjD_42_port, Z(41) => qjD_41_port, Z(40) => 
                           qjD_40_port, Z(39) => qjD_39_port, Z(38) => 
                           qjD_38_port, Z(37) => qjD_37_port, Z(36) => 
                           qjD_36_port, Z(35) => qjD_35_port, Z(34) => 
                           qjD_34_port, Z(33) => qjD_33_port, Z(32) => 
                           qjD_32_port, Z(31) => qjD_31_port, Z(30) => 
                           qjD_30_port, Z(29) => qjD_29_port, Z(28) => 
                           qjD_28_port, Z(27) => qjD_27_port, Z(26) => 
                           qjD_26_port, Z(25) => qjD_25_port, Z(24) => 
                           qjD_24_port, Z(23) => qjD_23_port, Z(22) => 
                           qjD_22_port, Z(21) => qjD_21_port, Z(20) => 
                           qjD_20_port, Z(19) => qjD_19_port, Z(18) => 
                           qjD_18_port, Z(17) => qjD_17_port, Z(16) => 
                           qjD_16_port, Z(15) => qjD_15_port, Z(14) => 
                           qjD_14_port, Z(13) => qjD_13_port, Z(12) => 
                           qjD_12_port, Z(11) => qjD_11_port, Z(10) => 
                           qjD_10_port, Z(9) => qjD_9_port, Z(8) => qjD_8_port,
                           Z(7) => qjD_7_port, Z(6) => qjD_6_port, Z(5) => 
                           qjD_5_port, Z(4) => qjD_4_port, Z(3) => qjD_3_port, 
                           Z(2) => qjD_2_port, Z(1) => qjD_1_port, Z(0) => 
                           qjD_0_port);
   I_CSA1 : gl_csa32_n8 port map( A(8) => MXLA_56_port, A(7) => MXLA_55_port, 
                           A(6) => MXLA_54_port, A(5) => MXLA_53_port, A(4) => 
                           MXLA_52_port, A(3) => MXLA_51_port, A(2) => 
                           MXLA_50_port, A(1) => MXLA_49_port, A(0) => 
                           MXLA_48_port, B(8) => W2_54_port, B(7) => W2_53_port
                           , B(6) => W2_52_port, B(5) => n112, B(4) => n110, 
                           B(3) => W2_49_port, B(2) => W2_48_port, B(1) => 
                           W2_47_port, B(0) => W2_46_port, C(8) => qjD_56_port,
                           C(7) => qjD_55_port, C(6) => qjD_54_port, C(5) => 
                           qjD_53_port, C(4) => qjD_52_port, C(3) => 
                           qjD_51_port, C(2) => qjD_50_port, C(1) => 
                           qjD_49_port, C(0) => qjD_48_port, Cin => carry_ex, 
                           Z(8) => WS_56_port, Z(7) => WS_55_port, Z(6) => 
                           WS_54_port, Z(5) => WS_53_port, Z(4) => WS_52_port, 
                           Z(3) => WS_51_port, Z(2) => WS_50_port, Z(1) => 
                           WS_49_port, Z(0) => WS_48_port, Y(8) => WC_56_port, 
                           Y(7) => WC_55_port, Y(6) => WC_54_port, Y(5) => 
                           WC_53_port, Y(4) => WC_52_port, Y(3) => WC_51_port, 
                           Y(2) => WC_50_port, Y(1) => WC_49_port, Y(0) => 
                           WC_48_port);
   I_CSA2 : csa32LSBs_n47 port map( A(47) => MXLA_47_port, A(46) => 
                           MXLA_46_port, A(45) => MXLA_45_port, A(44) => 
                           MXLA_44_port, A(43) => MXLA_43_port, A(42) => 
                           MXLA_42_port, A(41) => MXLA_41_port, A(40) => 
                           MXLA_40_port, A(39) => MXLA_39_port, A(38) => 
                           MXLA_38_port, A(37) => MXLA_37_port, A(36) => 
                           MXLA_36_port, A(35) => MXLA_35_port, A(34) => 
                           MXLA_34_port, A(33) => MXLA_33_port, A(32) => 
                           MXLA_32_port, A(31) => MXLA_31_port, A(30) => 
                           MXLA_30_port, A(29) => MXLA_29_port, A(28) => 
                           MXLA_28_port, A(27) => MXLA_27_port, A(26) => 
                           MXLA_26_port, A(25) => MXLA_25_port, A(24) => 
                           MXLA_24_port, A(23) => MXLA_23_port, A(22) => 
                           MXLA_22_port, A(21) => MXLA_21_port, A(20) => 
                           MXLA_20_port, A(19) => MXLA_19_port, A(18) => 
                           MXLA_18_port, A(17) => MXLA_17_port, A(16) => 
                           MXLA_16_port, A(15) => MXLA_15_port, A(14) => 
                           MXLA_14_port, A(13) => MXLA_13_port, A(12) => 
                           MXLA_12_port, A(11) => MXLA_11_port, A(10) => 
                           MXLA_10_port, A(9) => MXLA_9_port, A(8) => 
                           MXLA_8_port, A(7) => MXLA_7_port, A(6) => 
                           MXLA_6_port, A(5) => MXLA_5_port, A(4) => 
                           MXLA_4_port, A(3) => MXLA_3_port, A(2) => 
                           MXLA_2_port, A(1) => MXLA_1_port, A(0) => 
                           MXLA_0_port, B(47) => W2_45_port, B(46) => 
                           W2_44_port, B(45) => W2_43_port, B(44) => W2_42_port
                           , B(43) => W2_41_port, B(42) => W2_40_port, B(41) =>
                           W2_39_port, B(40) => W2_38_port, B(39) => W2_37_port
                           , B(38) => W2_36_port, B(37) => W2_35_port, B(36) =>
                           W2_34_port, B(35) => W2_33_port, B(34) => W2_32_port
                           , B(33) => W2_31_port, B(32) => W2_30_port, B(31) =>
                           W2_29_port, B(30) => W2_28_port, B(29) => W2_27_port
                           , B(28) => W2_26_port, B(27) => W2_25_port, B(26) =>
                           W2_24_port, B(25) => W2_23_port, B(24) => W2_22_port
                           , B(23) => W2_21_port, B(22) => W2_20_port, B(21) =>
                           W2_19_port, B(20) => W2_18_port, B(19) => W2_17_port
                           , B(18) => W2_16_port, B(17) => W2_15_port, B(16) =>
                           W2_14_port, B(15) => W2_13_port, B(14) => W2_12_port
                           , B(13) => W2_11_port, B(12) => W2_10_port, B(11) =>
                           W2_9_port, B(10) => W2_8_port, B(9) => W2_7_port, 
                           B(8) => W2_6_port, B(7) => W2_5_port, B(6) => 
                           W2_4_port, B(5) => W2_3_port, B(4) => W2_2_port, 
                           B(3) => W2_1_port, B(2) => W2_0_port, B(1) => GND, 
                           B(0) => GND, C(47) => qjD_47_port, C(46) => 
                           qjD_46_port, C(45) => qjD_45_port, C(44) => 
                           qjD_44_port, C(43) => qjD_43_port, C(42) => 
                           qjD_42_port, C(41) => qjD_41_port, C(40) => 
                           qjD_40_port, C(39) => qjD_39_port, C(38) => 
                           qjD_38_port, C(37) => qjD_37_port, C(36) => 
                           qjD_36_port, C(35) => qjD_35_port, C(34) => 
                           qjD_34_port, C(33) => qjD_33_port, C(32) => 
                           qjD_32_port, C(31) => qjD_31_port, C(30) => 
                           qjD_30_port, C(29) => qjD_29_port, C(28) => 
                           qjD_28_port, C(27) => qjD_27_port, C(26) => 
                           qjD_26_port, C(25) => qjD_25_port, C(24) => 
                           qjD_24_port, C(23) => qjD_23_port, C(22) => 
                           qjD_22_port, C(21) => qjD_21_port, C(20) => 
                           qjD_20_port, C(19) => qjD_19_port, C(18) => 
                           qjD_18_port, C(17) => qjD_17_port, C(16) => 
                           qjD_16_port, C(15) => qjD_15_port, C(14) => 
                           qjD_14_port, C(13) => qjD_13_port, C(12) => 
                           qjD_12_port, C(11) => qjD_11_port, C(10) => 
                           qjD_10_port, C(9) => qjD_9_port, C(8) => qjD_8_port,
                           C(7) => qjD_7_port, C(6) => qjD_6_port, C(5) => 
                           qjD_5_port, C(4) => qjD_4_port, C(3) => qjD_3_port, 
                           C(2) => qjD_2_port, C(1) => qjD_1_port, C(0) => 
                           qjD_0_port, Cin => qjD_c2, Cout => carry_ex, Z(47) 
                           => WS_47_port, Z(46) => WS_46_port, Z(45) => 
                           WS_45_port, Z(44) => WS_44_port, Z(43) => WS_43_port
                           , Z(42) => WS_42_port, Z(41) => WS_41_port, Z(40) =>
                           WS_40_port, Z(39) => WS_39_port, Z(38) => WS_38_port
                           , Z(37) => WS_37_port, Z(36) => WS_36_port, Z(35) =>
                           WS_35_port, Z(34) => WS_34_port, Z(33) => WS_33_port
                           , Z(32) => WS_32_port, Z(31) => WS_31_port, Z(30) =>
                           WS_30_port, Z(29) => WS_29_port, Z(28) => WS_28_port
                           , Z(27) => WS_27_port, Z(26) => WS_26_port, Z(25) =>
                           WS_25_port, Z(24) => WS_24_port, Z(23) => WS_23_port
                           , Z(22) => WS_22_port, Z(21) => WS_21_port, Z(20) =>
                           WS_20_port, Z(19) => WS_19_port, Z(18) => WS_18_port
                           , Z(17) => WS_17_port, Z(16) => WS_16_port, Z(15) =>
                           WS_15_port, Z(14) => WS_14_port, Z(13) => WS_13_port
                           , Z(12) => WS_12_port, Z(11) => WS_11_port, Z(10) =>
                           WS_10_port, Z(9) => WS_9_port, Z(8) => WS_8_port, 
                           Z(7) => WS_7_port, Z(6) => WS_6_port, Z(5) => 
                           WS_5_port, Z(4) => WS_4_port, Z(3) => WS_3_port, 
                           Z(2) => WS_2_port, Z(1) => WS_1_port, Z(0) => 
                           WS_0_port, Y(47) => WC_47_port, Y(46) => WC_46_port,
                           Y(45) => WC_45_port, Y(44) => WC_44_port, Y(43) => 
                           WC_43_port, Y(42) => WC_42_port, Y(41) => WC_41_port
                           , Y(40) => WC_40_port, Y(39) => WC_39_port, Y(38) =>
                           WC_38_port, Y(37) => WC_37_port, Y(36) => WC_36_port
                           , Y(35) => WC_35_port, Y(34) => WC_34_port, Y(33) =>
                           WC_33_port, Y(32) => WC_32_port, Y(31) => WC_31_port
                           , Y(30) => WC_30_port, Y(29) => WC_29_port, Y(28) =>
                           WC_28_port, Y(27) => WC_27_port, Y(26) => WC_26_port
                           , Y(25) => WC_25_port, Y(24) => WC_24_port, Y(23) =>
                           WC_23_port, Y(22) => WC_22_port, Y(21) => WC_21_port
                           , Y(20) => WC_20_port, Y(19) => WC_19_port, Y(18) =>
                           WC_18_port, Y(17) => WC_17_port, Y(16) => WC_16_port
                           , Y(15) => WC_15_port, Y(14) => WC_14_port, Y(13) =>
                           WC_13_port, Y(12) => WC_12_port, Y(11) => WC_11_port
                           , Y(10) => WC_10_port, Y(9) => WC_9_port, Y(8) => 
                           WC_8_port, Y(7) => WC_7_port, Y(6) => WC_6_port, 
                           Y(5) => WC_5_port, Y(4) => WC_4_port, Y(3) => 
                           WC_3_port, Y(2) => WC_2_port, Y(1) => WC_1_port, 
                           Y(0) => WC_0_port);
   I_REG1 : gl_dualreg_ld_n10 port map( AS(10) => WS_56_port, AS(9) => 
                           WS_55_port, AS(8) => WS_54_port, AS(7) => WS_53_port
                           , AS(6) => WS_52_port, AS(5) => WS_51_port, AS(4) =>
                           WS_50_port, AS(3) => WS_49_port, AS(2) => WS_48_port
                           , AS(1) => WS_47_port, AS(0) => WS_46_port, AC(10) 
                           => WC_56_port, AC(9) => WC_55_port, AC(8) => 
                           WC_54_port, AC(7) => WC_53_port, AC(6) => WC_52_port
                           , AC(5) => WC_51_port, AC(4) => WC_50_port, AC(3) =>
                           WC_49_port, AC(2) => WC_48_port, AC(1) => WC_47_port
                           , AC(0) => WC_46_port, RESET => CLR, CLOCK => CLOCK,
                           LOAD => LOAD, ZS(10) => W1_56_port, ZS(9) => 
                           W1_55_port, ZS(8) => W1_54_port, ZS(7) => W1_53_port
                           , ZS(6) => W1_52_port, ZS(5) => W1_51_port, ZS(4) =>
                           W1_50_port, ZS(3) => W1_49_port, ZS(2) => W1_48_port
                           , ZS(1) => W1_47_port, ZS(0) => W1_46_port, ZC(10) 
                           => W2_56_port, ZC(9) => W2_55_port, ZC(8) => 
                           W2_54_port, ZC(7) => W2_53_port, ZC(6) => W2_52_port
                           , ZC(5) => W2_51_port, ZC(4) => W2_50_port, ZC(3) =>
                           W2_49_port, ZC(2) => W2_48_port, ZC(1) => W2_47_port
                           , ZC(0) => W2_46_port);
   I_REG2 : gl_dualreg_ld_n45 port map( AS(45) => WS_45_port, AS(44) => 
                           WS_44_port, AS(43) => WS_43_port, AS(42) => 
                           WS_42_port, AS(41) => WS_41_port, AS(40) => 
                           WS_40_port, AS(39) => WS_39_port, AS(38) => 
                           WS_38_port, AS(37) => WS_37_port, AS(36) => 
                           WS_36_port, AS(35) => WS_35_port, AS(34) => 
                           WS_34_port, AS(33) => WS_33_port, AS(32) => 
                           WS_32_port, AS(31) => WS_31_port, AS(30) => 
                           WS_30_port, AS(29) => WS_29_port, AS(28) => 
                           WS_28_port, AS(27) => WS_27_port, AS(26) => 
                           WS_26_port, AS(25) => WS_25_port, AS(24) => 
                           WS_24_port, AS(23) => WS_23_port, AS(22) => 
                           WS_22_port, AS(21) => WS_21_port, AS(20) => 
                           WS_20_port, AS(19) => WS_19_port, AS(18) => 
                           WS_18_port, AS(17) => WS_17_port, AS(16) => 
                           WS_16_port, AS(15) => WS_15_port, AS(14) => 
                           WS_14_port, AS(13) => WS_13_port, AS(12) => 
                           WS_12_port, AS(11) => WS_11_port, AS(10) => 
                           WS_10_port, AS(9) => WS_9_port, AS(8) => WS_8_port, 
                           AS(7) => WS_7_port, AS(6) => WS_6_port, AS(5) => 
                           WS_5_port, AS(4) => WS_4_port, AS(3) => WS_3_port, 
                           AS(2) => WS_2_port, AS(1) => WS_1_port, AS(0) => 
                           WS_0_port, AC(45) => WC_45_port, AC(44) => 
                           WC_44_port, AC(43) => WC_43_port, AC(42) => 
                           WC_42_port, AC(41) => WC_41_port, AC(40) => 
                           WC_40_port, AC(39) => WC_39_port, AC(38) => 
                           WC_38_port, AC(37) => WC_37_port, AC(36) => 
                           WC_36_port, AC(35) => WC_35_port, AC(34) => 
                           WC_34_port, AC(33) => WC_33_port, AC(32) => 
                           WC_32_port, AC(31) => WC_31_port, AC(30) => 
                           WC_30_port, AC(29) => WC_29_port, AC(28) => 
                           WC_28_port, AC(27) => WC_27_port, AC(26) => 
                           WC_26_port, AC(25) => WC_25_port, AC(24) => 
                           WC_24_port, AC(23) => WC_23_port, AC(22) => 
                           WC_22_port, AC(21) => WC_21_port, AC(20) => 
                           WC_20_port, AC(19) => WC_19_port, AC(18) => 
                           WC_18_port, AC(17) => WC_17_port, AC(16) => 
                           WC_16_port, AC(15) => WC_15_port, AC(14) => 
                           WC_14_port, AC(13) => WC_13_port, AC(12) => 
                           WC_12_port, AC(11) => WC_11_port, AC(10) => 
                           WC_10_port, AC(9) => WC_9_port, AC(8) => WC_8_port, 
                           AC(7) => WC_7_port, AC(6) => WC_6_port, AC(5) => 
                           WC_5_port, AC(4) => WC_4_port, AC(3) => WC_3_port, 
                           AC(2) => WC_2_port, AC(1) => WC_1_port, AC(0) => 
                           WC_0_port, RESET => CLR, CLOCK => CLOCK, LOAD => 
                           LOAD, ZS(45) => W1_45_port, ZS(44) => W1_44_port, 
                           ZS(43) => W1_43_port, ZS(42) => W1_42_port, ZS(41) 
                           => W1_41_port, ZS(40) => W1_40_port, ZS(39) => 
                           W1_39_port, ZS(38) => W1_38_port, ZS(37) => 
                           W1_37_port, ZS(36) => W1_36_port, ZS(35) => 
                           W1_35_port, ZS(34) => W1_34_port, ZS(33) => 
                           W1_33_port, ZS(32) => W1_32_port, ZS(31) => 
                           W1_31_port, ZS(30) => W1_30_port, ZS(29) => 
                           W1_29_port, ZS(28) => W1_28_port, ZS(27) => 
                           W1_27_port, ZS(26) => W1_26_port, ZS(25) => 
                           W1_25_port, ZS(24) => W1_24_port, ZS(23) => 
                           W1_23_port, ZS(22) => W1_22_port, ZS(21) => 
                           W1_21_port, ZS(20) => W1_20_port, ZS(19) => 
                           W1_19_port, ZS(18) => W1_18_port, ZS(17) => 
                           W1_17_port, ZS(16) => W1_16_port, ZS(15) => 
                           W1_15_port, ZS(14) => W1_14_port, ZS(13) => 
                           W1_13_port, ZS(12) => W1_12_port, ZS(11) => 
                           W1_11_port, ZS(10) => W1_10_port, ZS(9) => W1_9_port
                           , ZS(8) => W1_8_port, ZS(7) => W1_7_port, ZS(6) => 
                           W1_6_port, ZS(5) => W1_5_port, ZS(4) => W1_4_port, 
                           ZS(3) => W1_3_port, ZS(2) => W1_2_port, ZS(1) => 
                           W1_1_port, ZS(0) => W1_0_port, ZC(45) => W2_45_port,
                           ZC(44) => W2_44_port, ZC(43) => W2_43_port, ZC(42) 
                           => W2_42_port, ZC(41) => W2_41_port, ZC(40) => 
                           W2_40_port, ZC(39) => W2_39_port, ZC(38) => 
                           W2_38_port, ZC(37) => W2_37_port, ZC(36) => 
                           W2_36_port, ZC(35) => W2_35_port, ZC(34) => 
                           W2_34_port, ZC(33) => W2_33_port, ZC(32) => 
                           W2_32_port, ZC(31) => W2_31_port, ZC(30) => 
                           W2_30_port, ZC(29) => W2_29_port, ZC(28) => 
                           W2_28_port, ZC(27) => W2_27_port, ZC(26) => 
                           W2_26_port, ZC(25) => W2_25_port, ZC(24) => 
                           W2_24_port, ZC(23) => W2_23_port, ZC(22) => 
                           W2_22_port, ZC(21) => W2_21_port, ZC(20) => 
                           W2_20_port, ZC(19) => W2_19_port, ZC(18) => 
                           W2_18_port, ZC(17) => W2_17_port, ZC(16) => 
                           W2_16_port, ZC(15) => W2_15_port, ZC(14) => 
                           W2_14_port, ZC(13) => W2_13_port, ZC(12) => 
                           W2_12_port, ZC(11) => W2_11_port, ZC(10) => 
                           W2_10_port, ZC(9) => W2_9_port, ZC(8) => W2_8_port, 
                           ZC(7) => W2_7_port, ZC(6) => W2_6_port, ZC(5) => 
                           W2_5_port, ZC(4) => W2_4_port, ZC(3) => W2_3_port, 
                           ZC(2) => W2_2_port, ZC(1) => W2_1_port, ZC(0) => 
                           W2_0_port);
   I_SEL : QDSEL port map( A1(6) => W1_56_port, A1(5) => W1_55_port, A1(4) => 
                           W1_54_port, A1(3) => W1_53_port, A1(2) => W1_52_port
                           , A1(1) => n114, A1(0) => W1_50_port, A2(6) => 
                           W2_56_port, A2(5) => W2_55_port, A2(4) => W2_54_port
                           , A2(3) => W2_53_port, A2(2) => W2_52_port, A2(1) =>
                           n107, A2(0) => W2_50_port, D(2) => D(51), D(1) => 
                           D(50), D(0) => D(49), M1 => Qj_2_port, M2 => n119, 
                           P1 => Qj_1_port, P2 => n120);
   U4 : IVHVTX0H port map( A => W2_50_port, Z => n104);
   U5 : IVSVTX0H port map( A => n104, Z => n105);
   U6 : IVSVTX8 port map( A => n106, Z => n107);
   U7 : IVSVTX4 port map( A => W2_51_port, Z => n106);
   U8 : IVHVTX0H port map( A => W1_50_port, Z => n108);
   U9 : IVSVTX0H port map( A => n108, Z => n109);
   U10 : IVSVTX8 port map( A => n113, Z => n114);
   U11 : BFHVTX1 port map( A => n105, Z => n110);
   U12 : IVSVTX6 port map( A => n119, Z => n115);
   U13 : IVHVTX0H port map( A => n107, Z => n111);
   U14 : IVSVTX0H port map( A => n111, Z => n112);
   U15 : IVSVTX4 port map( A => W1_51_port, Z => n113);
   U16 : IVSVTX8 port map( A => n120, Z => n117);
   U17 : IVSVTX12 port map( A => n115, Z => Qj_3_port);
   U18 : IVSVTX12 port map( A => n117, Z => Qj_0_port);

end SYN_SCHEMATIC;
