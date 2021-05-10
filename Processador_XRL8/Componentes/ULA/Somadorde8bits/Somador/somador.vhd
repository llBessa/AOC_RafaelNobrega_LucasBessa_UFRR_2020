--libraries

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity somador is
    port(
        in_A    : in std_logic;
        in_B    : in std_logic;
        cin     : in std_logic;
        cout    : out std_logic;
        soma    : out std_logic
    );
end entity;

architecture main of somador is
    component p_and IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
    END component;

    component p_xor IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
    END component;

    component p_or IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
    END component;

    signal meioSomadorOut1, meioSomadorOut2 : std_logic;
    signal cout0, cout1 : std_logic;

    begin
        sum         : p_xor port map(in_A, in_B, meioSomadorOut1);
        carryout    : p_and port map(in_A, in_B, cout0);

        sum1        : p_xor port map(cin, meioSomadorOut1, soma);
        carryout1   : p_and port map(cin, meioSomadorOut1, meioSomadorOut2);

        saida       : p_or port map(cout0, meioSomadorOut2, cout);
end main;