library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity chargue is 
	port(
			clock: In std_logic;
			reset: In std_logic;
			loa: In std_logic;
			QF: Out std_logic_vector(71 downto 0)
	
			);
			
	end chargue;
	
	
	architecture SCHEMATIC of chargue is
	    
	    signal       AD: std_logic_vector(15 downto 0);
	    signal       re: std_logic;
	    signal       CLK: std_logic;
	    signal       RES: std_logic;
	    signal       D1 : std_logic_vector(7 downto 0);
	    signal       end1: std_logic;   
	    signal       w : std_logic;   
	    signal       WA : std_logic_vector(15 downto 0);
	    signal       QKau : std_logic_vector(71 downto 0); 
	    signal       WD : std_logic_vector(7 downto 0); 
	    signal       en_sh : std_logic; 
	    signal       en : std_logic;
	    
	    
	     component REG
           Port (       D : In    std_logic_vector (7 downto 0);
                    Reset : In    std_logic;
                    Clock : In    std_logic;
                        Q : Out   std_logic_vector (7 downto 0)
                       );
     
        end component;
        
        component Memory
            Port (	
                    Clock:		in std_logic;	
                    Enable:		in std_logic;
                    Read:		in std_logic;
                    Write:		in std_logic;
                    Read_Addr:	in std_logic_vector(15 downto 0);
                    Write_Addr: 	in std_logic_vector(15 downto 0); 
                    Data_in: 	in std_logic_vector(7 downto 0);
                    Data_out: 	out std_logic_vector(7 downto 0)
                 );
         end component;
         
         component FSM_in_3
             port (
                    clock:		in std_logic;
                    reset:		in std_logic;
                    address:		out std_logic_vector(15 downto 0);
                    can_read:   out std_logic
                   );
         end component;
         component SHIFTREG is
               Port (   CLOCK : In    std_logic;
                        RESET : In    std_logic;
                       ENABLE : In    std_logic;
                           QK : In    std_logic_vector (7 downto 0);
                            Q : InOut   std_logic_vector (71 downto 0) );
         end component;
         
         
    begin
        w<='0';
        
        if (reset = '1') then
        
    end if;
        
        if (end1='1') then
            
            FSM_INIC1: FSM_in_3
               Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load1: Memory
               Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
               Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN1: REG
	           Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(7 downto 0));
	               
            FSM_INIC2: FSM_in_3
               Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load2: Memory
               Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
               Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN2: REG
	           Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(15 downto 8));
	               
            FSM_INIC3: FSM_in_3
                       Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load3: Memory
                       Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                       Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN3: REG
	                   Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(23 downto 16));
	                       
            FSM_INIC4: FSM_in_3
                       Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load4: Memory
                       Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                       Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN4: REG
	                   Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(31 downto 24));
	                       
	         FSM_INIC5: FSM_in_3
                             Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load5: Memory
                             Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                             Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN5: REG
	                         Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(39 downto 32));
	                             
	         FSM_INIC6: FSM_in_3
                         Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load6: Memory
                         Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                         Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN6: REG
	                     Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(47 downto 40));
	                         
	         FSM_INIC7: FSM_in_3
                         Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load7: Memory
                         Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                         Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN7: REG
	                     Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(55 downto 48)); 
	                          
	         FSM_INIC8: FSM_in_3
                    Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load8: Memory
                    Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                    Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN8: REG
	                Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(63 downto 56));
	                    
	         FSM_INIC9: FSM_in_3
                    Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
            Mem_load9: Memory
                    Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                    Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
            Reg_IN9: REG
	                Port Map(D=>D1, Reset=>RESET,Clock=>CLOCK, Q=>QKau(71 downto 64));   
	                
	                
	         if (algo q sapiga q es el final de la fila) then
	             end1<='1';
	         end if;
	         end1<= '0';
	         
	         else
	            
	            FSM_INICS1: FSM_in_3
                  Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
               Mem_loadS1: Memory
                  Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                  Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
	            SHIF1: SHIFTREG
	                  Port Map(CLOCK=>CLK,RESET=>RES,ENABLE=>en_sh,Q=>D1(7 downto 0),QK=>QKau(71 downto 0));
	            
	            FSM_INICS2: FSM_in_3
                  Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
               Mem_loadS2: Memory
                  Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                  Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
               SHIF2: SHIFTREG
                     Port Map(CLOCK=>CLK,RESET=>RES,ENABLE=>en_sh,Q=>D1(7 downto 0),QK=>QKau(71 downto 0));
               
               FSM_INICS3: FSM_in_3
                  Port Map(clock=>CLOCK,reset=>RESET, address=>AD(15 downto 0), can_read=>re);
               Mem_loadS3: Memory
                  Port Map (clock=>CLOCK, enable=>en,read=>re,write=>w,
                  Read_addr=>AD, Write_Addr=>WA,Data_in=>WD,Data_out=>D1);
               SHIF3: SHIFTREG
                     Port Map(CLOCK=>CLK,RESET=>RES,ENABLE=>en_sh,Q=>D1(7 downto 0),QK=>QKau(71 downto 0));
	           
	           
	           end if;
	      end SCHEMATIC;
	      
	      configuration CFG_chargue_SCHEMATIC of chargue is
         
            for SCHEMATIC    
            
               for FSM_INIC1, FSM_INIC2,FSM_INIC3,FSM_INIC4,FSM_INIC5,FSM_INIC6,FSM_INIC7,FSM_INIC8,FSM_INIC9, FSM_INICS1,FSM_INICS2,FSM_INICS3 : FSM_in_3
                  use configuration WORK.CFG_FSM_in_3_BEHAVIORAL;
               end for;
               
               for Mem_load1, Mem_load2,Mem_load3,Mem_load4,Mem_load5,Mem_load6,Mem_load7,Mem_load8,Mem_load9, Mem_loadS1,Mem_loadS2,Mem_loadS3 : MEMORY
                  use configuration WORK.CFG_MEMORY_BEHAVIORAL;  
               end for;
               
               for Reg_IN1, Reg_IN2,Reg_IN3,Reg_IN4,Reg_IN5,Reg_IN6,Reg_IN7,Reg_IN8,Reg_IN9 : REG
                  use configuration WORK.CFG_REG_BEHAVIORAL; 
               end for;
               
               for SHIF1,SHIF2,SHIF3 : SHIFTREG
                  use configuration WORK.CFG_SHIFTREG_BEHAVIORAL;                                                                 
               end for;
               
           end for;
        
        end CFG_chargue_SCHEMATIC;    
               
               