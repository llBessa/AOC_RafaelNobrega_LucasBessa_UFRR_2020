Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity somador8bits is 
    port (
        in_A    :   in std_logic_vector (7 downto 0);
        in_B    :   in std_logic_vector(7 downto 0);
        soma    :   out std_logic_vector(7 downto 0);
        cout    :   out std_logic
    );
End entity;

Architecture main of somador8bits is

    component somador is
        port(
            in_A    : in std_logic;
            in_B    : in std_logic;
            cin     : in std_logic;
            cout    : out std_logic;
            soma    : out std_logic
        );
    end component;

    signal cout0, cout1, cout2, cout3, cout4, cout5, cout6: std_logic;
    begin   
        sum0    : somador port map(in_A(0), in_B(0), '0', cout0, soma(0));
        sum1    : somador port map(in_A(1), in_B(1), cout0, cout1, soma(1));
        sum2    : somador port map(in_A(2), in_B(2), cout1, cout2, soma(2));
        sum3    : somador port map(in_A(3), in_B(3), cout2, cout3, soma(3));
        sum4    : somador port map(in_A(4), in_B(4), cout3, cout4, soma(4));
        sum5    : somador port map(in_A(5), in_B(5), cout4, cout5, soma(5));
        sum6    : somador port map(in_A(6), in_B(6), cout5, cout6, soma(6));
		  sum7    : somador port map(in_A(7), in_B(7), cout6, cout, soma(7));
end main;