library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity divr4_rec is
      Port (   CLOCK : In    std_logic;
                   D : In    std_logic_vector (52 downto 0);
               RESET : In    std_logic;
                   X : In    std_logic_vector (53 downto 0);
                  Qj : Out   std_logic_vector (3 downto 0) );
end divr4_rec;

architecture SCHEMATIC of divr4_rec is

   signal       Y1 : std_logic_vector(6 downto 0);
   signal       Y2 : std_logic_vector(6 downto 0);
   signal       D3 : std_logic_vector(2 downto 0);
   signal       DD : std_logic_vector(54 downto 0);
   signal       XX : std_logic_vector(56 downto 0);
   signal       W2 : std_logic_vector(56 downto 0);
   signal       W1 : std_logic_vector(56 downto 0);
   signal      SW2 : std_logic_vector(56 downto 0);
   signal      SW1 : std_logic_vector(56 downto 0);
   signal       WC : std_logic_vector(56 downto 0);
   signal       WS : std_logic_vector(56 downto 0);
   signal     MXLA : std_logic_vector(56 downto 0);
   signal     MXLB : std_logic_vector(56 downto 0);
   signal      qjD : std_logic_vector(56 downto 0);
   signal      QLa : std_logic_vector(3 downto 0);
   signal      QL : std_logic_vector(3 downto 0);
   signal    M2, M1, P1, P2 : std_logic;
   signal    DIGIT, ROUND : std_logic;
   signal     muxW : std_logic;
   signal     CLR : std_logic;
   signal     LOAD : std_logic;
   signal     SIGN : std_logic;
   signal     qjD_c2 : std_logic;
   signal     GND : std_logic;
   signal     carry_ex : std_logic;

   component CONTROL
      Port (   CLOCK : In    std_logic;
               RESET : In    std_logic;
                 CL1 : Out   std_logic;
               DIGIT : Out   std_logic;
                 LD1 : Out   std_logic;
                 MX1 : Out   std_logic;
               ROUND : Out   std_logic );
   end component;

   component MUX
      Port (       A : In    std_logic_vector (56 downto 0);
                   B : In    std_logic_vector (56 downto 0);
                 SEL : In    std_logic;
                   Z : Out   std_logic_vector (56 downto 0) );
   end component;

   component WLATCH
      Port (      A1 : In    std_logic_vector (56 downto 0);
                  A2 : In    std_logic_vector (56 downto 0);
               CLEAR : In    std_logic;
                 CLK : In    std_logic;
                LOAD : In    std_logic;
                 RWC : Out   std_logic_vector (56 downto 0);
                 RWS : Out   std_logic_vector (56 downto 0) );
   end component;

   component  gl_csa32 
        GENERIC(n : integer);
        Port (  A : In std_logic_vector (n downto 0);
                B : In std_logic_vector (n downto 0);
                C : In std_logic_vector (n downto 0);
                Cin : In std_logic;
                Z : Out std_logic_vector (n downto 0);
                Y : Out std_logic_vector (n downto 0) );
   end component;

   component  csa32LSBs 
        GENERIC(n : integer);
        Port (  A : In std_logic_vector (n downto 0);
                B : In std_logic_vector (n downto 0);
                C : In std_logic_vector (n downto 0);
                Cin : In std_logic;
                Cout : Out std_logic;
                Z : Out std_logic_vector (n downto 0);
                Y : Out std_logic_vector (n downto 0) );
   end component;

   component gl_dualreg_ld 
     GENERIC(n : integer);
      Port (      AS : In    std_logic_vector (n downto 0);
            
               RESET : In    std_logic;
               CLOCK : In    std_logic;
                LOAD : In    std_logic;
                  ZS : Out   std_logic_vector (n downto 0)
                  );

   end component;

   component QDSEL
      Port (      A1 : In    std_logic_vector (6 downto 0);
                  A2 : In    std_logic_vector (6 downto 0);
                   D : In    std_logic_vector (2 downto 0);
                  M1 : Out   std_logic;
                  M2 : Out   std_logic;
                  P1 : Out   std_logic;
                  P2 : Out   std_logic );
   end component;

   component MULT
      Port (       A : In    std_logic_vector (54 downto 0);
                  M1 : In    std_logic;
                  M2 : In    std_logic;
                  P1 : In    std_logic;
                  P2 : In    std_logic;
                COUT : Out   std_logic;
                   Z : Out   std_logic_vector (56 downto 0) );
   end component;

begin

GND <= '0';

   -- divisor alignment
   DD(54)<='0' ; DD(53 downto 1)<=D(52 downto 0); DD(0)<='0' ;

   -- dividend alignment
   XX(56)<='0'; XX(55)<='0'; XX(54)<='0'; XX(53 downto 0)<=X(53 downto 0);

   -- bits of d and y going into SEL
   D3(2 downto 0)<=D(51 downto 49);
   Y1(6 downto 0)<=WS(56 downto 50);
   Y2(6 downto 0)<=WC(56 downto 50);


   I_CTRL : CONTROL
      Port Map ( CLOCK=>CLOCK, RESET=>RESET, CL1=>CLR, DIGIT=>DIGIT,
                 LD1=>LOAD, MX1=>muxW, ROUND=>ROUND );

   -- shift 2 left
   SW1(56 downto 2)<=W1(54 downto 0) ; SW1(1)<='0'; SW1(0)<='0';
   SW2(56 downto 2)<=W2(54 downto 0) ; SW2(1)<='0'; SW2(0)<='0';

   -- MUX selecting either X (initialization) or Ws
   I_MUX : MUX
      Port Map ( A(56 downto 0)=>XX(56 downto 0),
                 B(56 downto 0)=>SW1(56 downto 0), SEL=>muxW,
                 Z(56 downto 0)=>MXLA(56 downto 0) );

   -- mux 4:1 acting as multiplier q_j*d
   I_MULT : MULT
      Port Map ( A(54 downto 0)=>DD(54 downto 0), 
                 M1=>QLa(2), M2=>QLa(3), P1=>QLa(1), P2=>QLa(0), COUT=>qjD_c2,
                 Z(56 downto 0)=>qjD(56 downto 0) );

   -- CSA 3:2 is split into two slices
   I_CSA1 : gl_csa32 Generic Map(n=>8)
      Port Map ( A=>MXLA(56 downto 48),
                 B=>SW2(56 downto 48), CIN=>carry_ex,
                 C=>qjD(56 downto 48),
                 Y=>WC(56 downto 48),
                 Z=>WS(56 downto 48) );
   I_CSA2 : csa32LSBs Generic Map(n=>47)
      Port Map ( A=>MXLA(47 downto 0),
                 B=>SW2(47 downto 0), CIN=>qjD_c2,
                 C=>qjD(47 downto 0), Cout=>carry_ex,
                 Y=>WC(47 downto 0),
                 Z=>WS(47 downto 0) );
                 


   -- REG Ws and Wc are split into two slices

   I_REG1 : gl_dualreg_ld Generic Map(n=>56)
      Port Map ( AS=>WS(56 downto 0),  
		 RESET=>CLR, CLOCK=>CLOCK, LOAD=>LOAD,
                 ZS=>W1(56 downto 0) );
                 
   I_REG2 : gl_dualreg_ld Generic Map(n=>56)
      Port Map ( AS=>WC(56 downto 0),  
		 RESET=>CLR, CLOCK=>CLOCK, LOAD=>LOAD,
                 ZS=>W2(56 downto 0) );
                 

   
   
   -- SELECTION FUNCTION
   I_SEL : QDSEL
      Port Map ( A1(6 downto 0)=>Y1(6 downto 0), A2(6 downto 0)=>Y2(6 downto 0),
                 D(2 downto 0)=>D3(2 downto 0), 
		 M1=>M1, M2=>M2, P1=>P1, P2=>P2 );
		 
   QL(3)<=M2;
   QL(2)<=M1;
   QL(1)<=P1;
   QL(0)<=P2;
   I_REG3 : gl_dualreg_ld Generic Map(n=>3)
      Port Map ( AS=>QL(3 downto 0), 
                 RESET=>CLR, CLOCK=>CLOCK, LOAD=>LOAD,
                 ZS=>QLa(3 downto 0) );

QJ(3)<=QLa(3);
QJ(2)<=QLa(2);
QJ(1)<=QLa(1);
QJ(0)<=QLa(0);


end SCHEMATIC;

configuration CFG_divr4_rec_SCHEMATIC of divr4_rec is

   for SCHEMATIC
      for I_CTRL: CONTROL
         use configuration WORK.CFG_CONTROL_BEHAVIORAL;
      end for;
      for I_MUX: MUX
         use configuration WORK.CFG_MUX_BEHAVIORAL;
      end for;
      for I_REG1, I_REG2, I_REG3 : gl_dualreg_ld
         use configuration WORK.CFG_gl_dualreg_ld_BEHAVIORAL;
      end for;
      for I_CSA1: gl_csa32
         use configuration WORK.CFG_GL_CSA32_BEHAVIORAL;
      end for;
      for I_CSA2: csa32LSBs
         use configuration WORK.CFG_csa32LSBs_BEHAVIORAL;
      end for;
      for I_SEL: QDSEL
         use configuration WORK.CFG_QDSEL_SCHEMATIC;
      end for;
      for I_MULT: MULT
         use configuration WORK.CFG_MULT_BEHAVIORAL;
      end for;
   end for;

end CFG_divr4_rec_SCHEMATIC;
