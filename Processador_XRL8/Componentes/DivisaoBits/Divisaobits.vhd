--libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Divisaobits is
    port(
        instruction : in std_logic_vector(7 downto 0);
        JumpAddress : out std_logic_vector(3 downto 0);
        reg1        : out std_logic_vector(1 downto 0);
        reg2        : out std_logic_vector(1 downto 0);
        Opcode      : out std_logic_vector(3 downto 0)
    );
end entity;

architecture main of Divisaobits is
    begin
        JumpAddress <= instruction(3 downto 0);
        Opcode <= instruction(7 downto 4);
        reg1 <= instruction(3 downto 2);
        reg2 <= instruction(1 downto 0);
end main;