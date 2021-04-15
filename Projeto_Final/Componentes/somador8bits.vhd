library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somador_8b is
    
    generic(
        DATA_WiDTH : natural := 8
    );
    
    port(
        A    : in unsigned ((DATA_WIDTH-1)  downto 0);
        B    : in unsigned ((DATA_WIDTH-1)  downto 0);
        SUM  : out unsigned ((DATA_WIDTH-1) downto 0) 
    );
    
end entity;

architecture main of somador_8b is
begin

    SUM <= A + B;
    
end main;