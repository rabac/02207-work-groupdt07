library IEEE;
	use IEEE.std_logic_1164.all;
	use STD.textio.all;
	use IEEE.std_logic_arith.all;
	use IEEE.std_logic_textio.all;
	use IEEE.std_logic_signed.all;

entity TB_Filter is
end TB_Filter;

architecture A of TB_Filter is

   signal Clock: std_logic;	

	signal mem_Enable:	std_logic;
   signal mem_Read:	std_logic;
	signal mem_Write:	std_logic;
   signal mem_Read_Addr:	std_logic_vector(15 downto 0);
	signal mem_Write_Addr: std_logic_vector(15 downto 0); 
	signal mem_Data_in: std_logic_vector(7 downto 0);
	signal mem_Data_out: std_logic_vector(7 downto 0);
	
   signal proc_RESET: std_logic;	
   signal proc_Read:	std_logic;
	signal proc_Write:	std_logic;
   signal proc_Read_Addr:	std_logic_vector(15 downto 0);
	signal proc_Write_Addr: std_logic_vector(15 downto 0); 
	signal proc_Data_in: std_logic_vector(7 downto 0);
	signal proc_Data_out: std_logic_vector(7 downto 0);
   
	signal proc_filter_disable: std_logic;	
	signal proc_filter: std_logic_vector(7 downto 0);   

component MEMORY is
port(	
   Clock:		in std_logic;	
	Enable:		in std_logic;
	Read:		in std_logic;
	Write:		in std_logic;
	Read_Addr:	in std_logic_vector(15 downto 0);
	Write_Addr: 	in std_logic_vector(15 downto 0); 
	Data_in: 	in std_logic_vector(7 downto 0);
	Data_out: 	out std_logic_vector(7 downto 0)
);
end component MEMORY;

component Processor_3 is
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
end component Processor_3;


begin
    
   UUTP : PROCESSOR_3
      Port Map (CLOCK, proc_RESET, proc_Read, proc_Write, proc_Read_Addr,
                proc_Write_Addr, proc_Data_In, proc_Data_Out, proc_filter, 
                proc_filter_disable);

   UUTM : MEMORY
      Port Map (CLOCK, mem_Enable, mem_Read, mem_Write, 
                mem_Read_Addr, mem_Write_Addr, mem_Data_In, mem_Data_Out);
          
    clock_signal: 
    process begin
	   Clock <= '1';			
	   wait for 1 ns;
	   Clock <= '0';
	   wait for 1 ns;
    end process;

    process
       
	   CONSTANT NLOOPS : integer := 15;
	   file cmdfile: TEXT; 		 -- Define the file 'handle'
	   variable line_in,line_out: Line; -- Line buffers
	   variable good: boolean;   	 -- Status of the read operations
	   variable A,B: std_logic_vector(7 downto 0);
	   variable S: std_logic_vector(55 downto 0);
	   variable Z: std_logic_vector(31 downto 0);
	   variable ERR: std_logic_vector(55 downto 0);
	   variable c : integer;
	   -- constant TEST_PASSED: string := "Test passed:";
	   -- constant TEST_FAILED: string := "Test FAILED:";

	begin
	   
	   FILE_OPEN(cmdfile,"lena_256x256.hex",READ_MODE);
	   
	   c := 1;
	   proc_RESET <= '1';
	   proc_filter_disable <= '1';

	   mem_Enable <= '1';
	   mem_Read <= '0';
	   --mem_Data_Out <= (others => '0');
	   mem_Read_Addr <= (others => '0');
	   
      loop
      
         if endfile(cmdfile) then  -- Check EOF
            assert false
            report "End of file encountered; exiting."
	         severity NOTE;
	         exit;
         end if;

         readline(cmdfile,line_in);     -- Read a line from the file
         
         next when line_in'length = 0;  -- Skip empty lines

         hread(line_in,A,good);         -- Read the D argument as hex value
         assert good report "Text I/O read error" severity ERROR;

         mem_Write <= '1';
         mem_Write_Addr <= conv_std_logic_vector(c, 16);
         mem_Data_In <= A(7 downto 0);

         c := c + 1;
         write(line_out,c);
         
         wait for 2 ns;
         
      end loop;
      
      proc_filter_disable <= '0';
      c := 0;
      
      loop
         if(c = 9) then
            assert false;
            report "Filter has been initialized."
	         severity NOTE;
	         exit;
         end if;   
         
         proc_filter <= (others => '1');
      
         wait for 2 ns;
         c := c + 1;
         
      end loop;
      
      proc_filter_disable <= '1';
      proc_reset <= '0';
      
      loop
    
         proc_Data_In <= mem_Data_Out; 
         mem_Data_In <= proc_Data_Out;
         mem_Read <= proc_Read;
         mem_Write <= proc_Write;
         mem_Read_Addr <= proc_Read_Addr;
         mem_Write_Addr <= proc_Write_Addr;
         
         wait for 2 ns;

      end loop;		

    write(line_out, string'("--------- END-------------"));
    writeline(OUTPUT,line_out);

 end process;
 
end A;