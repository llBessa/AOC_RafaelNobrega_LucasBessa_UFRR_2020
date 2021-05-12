-- libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AuxJumpC is
    port(
        in_A : in std_logic;
        saida : out std_logic
    );
end entity;

architecture main of AuxJumpC is
    begin
        saida <= in_A;
end main;