library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memoriaROM is
    port(
        in_data     : in std_logic_vector(7 downto 0);
        clock       : in std_logic;
        out_data    : out std_logic_vector(7 downto 0)
    );
end entity;

architecture main of memoriaROM is
    type ROM is array(0 to 255) of std_logic_vector(7 downto 0);
    signal memoriaROM : ROM := (
	 
	 0 => "00000010",
	 1 => "00000100",
	 2 => "00001111",
	 others => "00000000"
    );
    begin
        process (clock)
		  begin
            if rising_edge(clock) then
                out_data <= memoriaROM(to_integer(unsigned(in_data)));
            end if;
        end process;
end main;   