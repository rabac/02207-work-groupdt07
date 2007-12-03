library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;
   
entity Processor_3 is
      Port (   CLOCK : In    std_logic;
               RESET : In    std_logic;
	           
	            Read:		Out std_logic;
	            Write:	Out std_logic;
	            Read_Addr:	Out std_logic_vector(15 downto 0);
	            Write_Addr: Out std_logic_vector(15 downto 0); 
	            Data_in: 	In std_logic_vector(7 downto 0);
	            Data_out: Out std_logic_vector(7 downto 0);
	            Filter: In std_logic_vector(7 downto 0);
	            disable_filter: In std_logic
	         );          
end Processor_3;

architecture SCHEMATIC_PROC_3 of Processor_3 is
  
   component  ADDER_3
   port(	A : In std_logic_vector (7 downto 0);
		   B : In std_logic_vector (7 downto 0);
		   C : In std_logic_vector (7 downto 0);
		   Z : Out std_logic_vector (7 downto 0));
   end component ADDER_3;

  
   component  ADDER_2 
   port(	A : In std_logic_vector (7 downto 0);
		   B : In std_logic_vector (7 downto 0);
		   Z : Out std_logic_vector (7 downto 0));
   end component ADDER_2;


   component SHIFTREG is
      Port (  CLOCK : In    std_logic;
              RESET : In    std_logic;
              disable : In    std_logic;
              QK : In    std_logic_vector (7 downto 0);
              Q : InOut   std_logic_vector (71 downto 0) );
   end component SHIFTREG;

   component Multiplier
      Port (       
            num1 : In    std_logic_vector (7 downto 0);
		      num2 : In    std_logic_vector (7 downto 0);
            product : Out   std_logic_vector (7 downto 0) );
   end component Multiplier;

   component MUX_4 is 
   port (
         SEL: in STD_LOGIC_VECTOR (1 downto 0); 
         A,B,C: in STD_LOGIC_VECTOR(7 downto 0);  
         SIG: out STD_LOGIC_VECTOR(7 downto 0)); 
   end component MUX_4; 

   component MUX_2 is 
   port (
         SEL: in STD_LOGIC; 
         A,B: in STD_LOGIC_VECTOR(15 downto 0);  
         SIG: out STD_LOGIC_VECTOR(15 downto 0)); 
   end component MUX_2; 

   component MUX_2_1 is 
   port (
         SEL: in STD_LOGIC; 
         A,B: in STD_LOGIC;  
         SIG: out STD_LOGIC); 
   end component MUX_2_1; 

   component FSM_in_3
        port (
               clock:		in std_logic;
	            reset:		in std_logic;
	            address:		out std_logic_vector(15 downto 0);
	            can_read:   out std_logic;
	            disable_cache: out std_logic
              );
    end component FSM_in_3;
    
    component FSM_out_3
        port (
               clock:		in std_logic;
	            reset:		in std_logic;
	            read_address:		out std_logic_vector(15 downto 0);
	            write_address:		out std_logic_vector(15 downto 0);
	            can_read:   out std_logic;
	            can_write:  out std_logic;
	            sel: out std_logic_vector(1 downto 0)
              );
    end component FSM_out_3;

    signal disable_to_cache: std_logic;
    signal Read_fsm_in: std_logic;
    signal Read_fsm_out: std_logic;    
    signal Read_Addr_fsm_in: std_logic_vector(15 downto 0);
    signal Read_Addr_fsm_out: std_logic_vector(15 downto 0);    
    signal cache_bits: std_logic_vector(71 downto 0);
    signal filter_bits: std_logic_vector(71 downto 0);
    signal mult1_out: std_logic_vector(7 downto 0);
    signal mult2_out: std_logic_vector(7 downto 0);
    signal mult3_out: std_logic_vector(7 downto 0);
    signal mult4_out: std_logic_vector(7 downto 0);
    signal mult5_out: std_logic_vector(7 downto 0);
    signal mult6_out: std_logic_vector(7 downto 0);
    signal mult7_out: std_logic_vector(7 downto 0);
    signal mult8_out: std_logic_vector(7 downto 0);
    signal mult9_out: std_logic_vector(7 downto 0);
    signal add1_out: std_logic_vector(7 downto 0);
    signal add2_out: std_logic_vector(7 downto 0);
    signal add3_out: std_logic_vector(7 downto 0);
    constant zeros: unsigned(7 downto 0) := (others => '0');
    signal select_adder: std_logic_vector(1 downto 0);
    signal mux_out: std_logic_vector(7 downto 0);
    
    begin
        
       fsm_input:
       FSM_in_3 port map(CLOCK, RESET, Read_Addr_fsm_in, Read_fsm_in, disable_to_cache);
        
       fsm_output:
       FSM_out_3 port map(CLOCK, RESET, Read_Addr_fsm_out, Write_Addr, Read_fsm_out, Write, select_adder);

       mux_2_proc_Read_Addr:
       MUX_2 port map(disable_to_cache, Read_Addr_fsm_in, Read_Addr_fsm_out, Read_Addr);

       mux_2_1_proc_Read:
       MUX_2_1 port map(disable_to_cache, Read_fsm_in, Read_fsm_out, Read);
       
       cache: 
       SHIFTREG port map(CLOCK, RESET, disable_to_cache, Data_in, cache_bits);
       
       filtermask: 
       SHIFTREG port map(CLOCK, RESET, disable_filter, Filter, filter_bits);
       
       
       Mult1: 
       Multiplier port map(cache_bits(7 downto 0), filter_bits(7 downto 0),mult1_out);
      
       Mult2: 
       Multiplier port map(cache_bits(15 downto 8), filter_bits(15 downto 8),mult2_out);

       Mult3: 
       Multiplier port map(cache_bits(23 downto 16), filter_bits(23 downto 16),mult3_out);

       Mult4: 
       Multiplier port map(cache_bits(31 downto 24), filter_bits(31 downto 24),mult4_out);

       Mult5: 
       Multiplier port map(cache_bits(39 downto 32), filter_bits(39 downto 32),mult5_out);

       Mult6: 
       Multiplier port map(cache_bits(47 downto 40), filter_bits(47 downto 40),mult6_out);

       Mult7: 
       Multiplier port map(cache_bits(55 downto 48), filter_bits(55 downto 48),mult7_out);

       Mult8: 
       Multiplier port map(cache_bits(63 downto 56), filter_bits(63 downto 56),mult8_out);

       Mult9: 
       Multiplier port map(cache_bits(71 downto 64), filter_bits(71 downto 64),mult9_out);

       Add1:
       Adder_3 port map(mult1_out, mult2_out, mult3_out, add1_out);

       Add2:
       Adder_3 port map(mult4_out, mult5_out, mult6_out, add2_out);

       Add3:
       Adder_3 port map(mult7_out, mult8_out, mult9_out, add3_out);

       Multiplexer:
       Mux_4 port map(select_adder, add3_out, add2_out, add1_out, mux_out);

       Add_new_value:
       Adder_2 port map(Data_in, mux_out, Data_out);
       
       
end SCHEMATIC_PROC_3;

