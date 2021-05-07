--bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memoriaRAM is
    port(
        endereco    : in std_logic_vector(7 downto 0);
        in_data     : in std_logic_vector(7 downto 0);
        out_data    : out std_logic_vector(7 downto 0);
        escreveMem  : in std_logic;
        lerMem      : in std_logic;
        clock       : in std_logic
    );
end entity;

architecture main of memoriaRAM is
    type RAM is array(0 to 255) of std_logic_vector(7 downto 0);
    signal memoriaRAM : RAM;
    begin
        process(clock)
        begin
            if rising_edge(clock) then
                if (escreveMem = '1') then
                    memoriaRAM(to_integer(unsigned(endereco))) <= in_data;
                end if;

                if (lerMem = '1') then
                    out_data <= memoriaRAM(to_integer(unsigned(endereco)));
                end if;
            end if;
        end process;
end main;