library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AdderNetlist is
port( A1 : in std_logic_vector(23 downto 0);
A2 : in std_logic_vector(23 downto 0);
Clock, Reset: in std_logic;
Z : out std_logic_vector( 23 downto 0));
end entity AdderNetlist;

architecture NetlistBehavior of AdderNetlist is
component NBitAdder is
    port (A, B: in std_logic_vector(23 downto 0);
        Cin: in std_logic;
        Sum: out std_logic_vector(23 downto 0);
        Cout: out std_logic);
end component NBitAdder;

component reg is
port (D : in std_logic_vector(23 downto 0);
Clock, Reset : in std_logic;
Q : out std_logic_vector(23 downto 0));
end component reg;

    signal Co, Ci : std_logic;
    signal A1out, A2out, Sum : std_logic_vector(23 downto 0);
    begin
        g1: reg port map (A1, Clock, Reset, A1out);
        g2: reg port map (A2, Clock, Reset, A2out);
        g3: nbitadder port map (A1out, A2out, Ci, Sum, Co);
        g4: reg port map (Sum, Clock, Reset, Z);
end architecture NetlistBehavior;
