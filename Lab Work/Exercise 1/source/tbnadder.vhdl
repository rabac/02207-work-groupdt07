library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TestNBitAdder is
end entity TestNBitAdder;

architecture TestBench_4 of TestNBitAdder is
signal A, B, Sumint : NATURAL;
signal Aslv, Bslv, Sum: std_logic_vector (23 downto 0);
signal Cin, Cout: std_logic;
signal error: BOOLEAN := FALSE;

begin
s0: entity WORK.NBitAdder(unsgned) port map(Aslv, Bslv, Cin, Sum, Cout);
Aslv <= std_logic_vector(to_unsigned(A, 24));
Bslv <= std_logic_vector(to_unsigned(B, 24));
Sumint <= to_integer(unsigned(Cout & Sum));
stim: process is
begin
Cin <= '0';
A <= 44;
B <= 8990;
wait for 5 NS;
A <= 34545;
wait for 5 NS;
Cin <= '1';
wait for 5 NS;
A <= 7840;
wait for 5 NS;
B <= 0;
wait for 5 NS;
Cin <= '0';
wait;
end process;

resp:   process (Cout, Sum) is
begin
error <= (A + B + BIT'POS(to_bit(Cin))) /= Sumint;
end process;
end architecture TestBench_4;
