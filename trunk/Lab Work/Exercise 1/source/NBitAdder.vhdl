library IEEE;
use IEEE.std_logic_1164.all, IEEE.numeric_std.all;

entity NBitAdder is
    port (A, B: in std_logic_vector(23 downto 0);
        Cin: in std_logic;
        Sum: out std_logic_vector(23 downto 0);
        Cout: out std_logic);
end entity NBitAdder;

architecture unsgned of NBitAdder is
    signal result: unsigned(24 downto 0);
    signal carry: unsigned(24 downto 0);
    constant zeros: unsigned(23 downto 0) := (others => '0');

begin
    carry <= (zeros & Cin);
    result <= ('0' & unsigned(A)) + ('0' & unsigned(B)) + carry;
    Sum <= std_logic_vector(result(23 downto 0));
    Cout <= result(24);
end architecture unsgned;