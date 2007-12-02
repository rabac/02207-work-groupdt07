library IEEE;
	use IEEE.std_logic_1164.all;
	use STD.textio.all;
	use IEEE.std_logic_arith.all;
	use IEEE.std_logic_textio.all;
	use IEEE.std_logic_signed.all;

entity E is
end E;

architecture A of E is

   signal tb_Clock: std_logic;	
	signal tb_Enable:	std_logic;
   signal tb_Read:	std_logic;
	signal tb_Write:	std_logic;
   signal tb_Read_Addr:	std_logic_vector(15 downto 0);
	signal tb_Write_Addr: std_logic_vector(15 downto 0); 
	signal tb_Data_in: std_logic_vector(7 downto 0);
	signal tb_Data_out: std_logic_vector(7 downto 0);


component MEMORY is
generic(
	width:	integer:=8;
	depth:	integer:=256*256;
	addr:	integer:=16);
port(	
   Clock:		in std_logic;	
	Enable:		in std_logic;
	Read:		in std_logic;
	Write:		in std_logic;
	Read_Addr:	in std_logic_vector(addr-1 downto 0);
	Write_Addr: 	in std_logic_vector(addr-1 downto 0); 
	Data_in: 	in std_logic_vector(width-1 downto 0);
	Data_out: 	out std_logic_vector(width-1 downto 0)
);
end component MEMORY;

begin
   UUT : MEMORY
      Port Map (tb_CLOCK, tb_Enable, tb_Read, tb_Write, tb_Read_Addr, tb_Write_Addr, tb_Data_In, tb_Data_Out);

   TB : block
   begin
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
	   tb_Enable <= '1';
	   tb_Read <= '0';
	   tb_Data_Out <= (others => '0');
	   tb_Read_Addr <= (others => '0');
	   
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

         tb_Write <= '1';
         tb_Write_Addr <= conv_std_logic_vector(c, 16);
         tb_Data_In <= A(7 downto 0);

         tb_clock <= '1'; wait for 1 ns;
         tb_clock <= '0'; wait for 1 ns;   

         c := c + 1;
         write(line_out,c);
      end loop;

    write(line_out, string'("--------- END-------------"));
    writeline(OUTPUT,line_out);

 end process;
 end block;
end A;


