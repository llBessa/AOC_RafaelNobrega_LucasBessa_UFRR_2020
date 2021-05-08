Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity Subtrator_8b is 
    port (
        in_A:in std_logic_vector (7 downto 0);
        in_B:in std_logic_vector(7 downto 0);
        sub:out std_logic_vector(7 downto 0)
 
    );
End entity;

Architecture main of Subtrator_8b is
    begin   
        sub <= in_A - in_B;
end main;
