-- VHDL Model Created from SGE Symbol qds_table.sym -- Apr 21 16:34:54 1995

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity QDS_TABLE is
      Port (       D : In    std_logic_vector (2 downto 0);
                   Y : In    std_logic_vector (6 downto 0);
                  M1 : Out   std_logic;
                  M2 : Out   std_logic;
                  P1 : Out   std_logic;
                  P2 : Out   std_logic );
end QDS_TABLE;

architecture BEHAVIORAL of QDS_TABLE is

   begin

  process(Y, D)
    TYPE table_type IS ARRAY(0 to 3) OF std_logic_vector (6 downto 0);
    CONSTANT sel_fun0 : table_type := (
                     "0001100", "0000100", "1111100", "1110011" );
    CONSTANT sel_fun1 : table_type := (
                     "0001110", "0000100", "1111010", "1110001" );
    CONSTANT sel_fun2 : table_type := (
                     "0001111", "0000100", "1111010", "1110000" );
    CONSTANT sel_fun3 : table_type := (
                     "0010000", "0000100", "1111010", "1101110" );
    CONSTANT sel_fun4 : table_type := (
                     "0010010", "0000110", "1111000", "1101100" );
    CONSTANT sel_fun5 : table_type := (
                     "0010100", "0000110", "1111000", "1101100" );
    CONSTANT sel_fun6 : table_type := (
                     "0010100", "0001000", "1111000", "1101010" );
    CONSTANT sel_fun7 : table_type := (
                     "0011000", "0001000", "1111000", "1101000" );

    begin

	-- Selection function
        if ( D = "000" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun0(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun0(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun0(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun0(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        elsif ( D = "001" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun1(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun1(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun1(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun1(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        elsif ( D = "010" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun2(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun2(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun2(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun2(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        elsif ( D = "011" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun3(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun3(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun3(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun3(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        elsif ( D = "100" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun4(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun4(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun4(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun4(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        elsif ( D = "101" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun5(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun5(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun5(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun5(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        elsif ( D = "110" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun6(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun6(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun6(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun6(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        elsif ( D = "111" ) then
	    if ( y(6) = '0' ) then   ------- y is positive
		if ( y >= sel_fun7(0) ) then
		   M2 <= '1'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		elsif ( y < sel_fun7(1) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '1'; P1 <= '0'; P2 <= '0';
		end if;
	    else                     ------- y is negative
		if ( y < sel_fun7(3) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '1';
		elsif ( y >= sel_fun7(2) ) then
		   M2 <= '0'; M1 <= '0'; P1 <= '0'; P2 <= '0';
		else
		   M2 <= '0'; M1 <= '0'; P1 <= '1'; P2 <= '0';
		end if;
	    end if;
        end if;

  end process;

end BEHAVIORAL;

configuration CFG_QDS_TABLE_BEHAVIORAL of QDS_TABLE is
   for BEHAVIORAL

   end for;

end CFG_QDS_TABLE_BEHAVIORAL;
