library IEEE;
	use IEEE.std_logic_1164.all;
	use STD.textio.all;
	use IEEE.std_logic_textio.all;
	use IEEE.std_logic_signed.all;

entity E is
end E;

architecture A of E is

   signal    CLOCK : std_logic;
   signal        D : std_logic_vector (52 downto 0);
   signal    RESET : std_logic;
   signal        X : std_logic_vector (53 downto 0);
   signal       Qj : std_logic_vector (3 downto 0);

   component divr4_rec
      Port (   CLOCK : In    std_logic;
                   D : In    std_logic_vector (52 downto 0);
               RESET : In    std_logic;
                   X : In    std_logic_vector (53 downto 0);
                  Qj : Out   std_logic_vector (3 downto 0) );
   end component;

begin
   UUT : divr4_rec
      Port Map ( CLOCK, D, RESET, X, Qj );

   TB : block
   begin
   process
--	CONSTANT NLOOPS : integer := 15;
  	CONSTANT NLOOPS : integer := 30;
	file cmdfile: TEXT; 		 -- Define the file 'handle'
	variable line_in,line_out: Line; -- Line buffers
	variable good: boolean;   	 -- Status of the read operations
	variable A,B: std_logic_vector(55 downto 0);
	variable S: std_logic_vector(55 downto 0);
	variable Z: std_logic_vector(55 downto 0);
	variable ERR: std_logic_vector(55 downto 0);
	variable c : integer;

	begin

  c := 1;
  FILE_OPEN(cmdfile,"testvecs1.in",READ_MODE);
  
-- -------------------------------------------------------------------------
  loop
    if endfile(cmdfile) then  -- Check EOF
	assert false
	   report "End of file encountered; exiting."
	   severity NOTE;
	exit;
    end if;

  reset <= '0';
  clock <= '1'; wait for 5 ns;
  reset <= '1';
  clock <= '0'; wait for 5 ns;


    readline(cmdfile,line_in);     -- Read a line from the file
    next when line_in'length = 0;  -- Skip empty lines

    hread(line_in,A,good);         -- Read the X argument as hex value
    assert good report "Text I/O read error" severity ERROR;

    hread(line_in,B,good);         -- Read the D argument as hex value
    assert good report "Text I/O read error" severity ERROR;

    hread(line_in,S,good);         -- Read the Q argument as hex value
    assert good report "Text I/O read error" severity ERROR;

    D(52 downto 0)  <= B(52 downto 0);
    X(53 downto 1) <= A(52 downto 0); X(0)<= '0';

  for i in 0 to NLOOPS loop
        clock <= '1'; wait for 5 ns;
        clock <= '0'; wait for 5 ns;
  end loop;
    
    write(line_out, string'("Test "));
    write(line_out,c);
    write(line_out, string'(": "));
    hwrite(line_out,A,RIGHT,14);
    write(line_out, string'(" / "));
    hwrite(line_out,B,RIGHT,14);
    writeline(OUTPUT,line_out);     -- write the message
    c := c + 1;
  end loop;
write(line_out, string'("--------- END SIMULATION  ------------------"));
writeline(OUTPUT,line_out); 
-- -------------------------------------------------------------------------
 
-- ===============================================================
  clock <= '1'; wait for 1000 ns;
  assert qj = "1111"
    report "--------- END SIMULATION  ------------------ " severity error;
-- ===============================================================


   end process;
 end block;
end A;

configuration CFG_TB_divr4_rec_BEHAVIORAL of E is
   for A
      for UUT : divr4_rec
         use configuration WORK.CFG_divr4_rec_SCHEMATIC;
      end for;

      for TB
      end for;

   end for;
end CFG_TB_divr4_rec_BEHAVIORAL;

