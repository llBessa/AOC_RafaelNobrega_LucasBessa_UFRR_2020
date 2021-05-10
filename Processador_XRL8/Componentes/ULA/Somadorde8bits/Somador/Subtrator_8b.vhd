Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity Subtrator_8b is 
    port (
        in_A    :in std_logic_vector (7 downto 0);
        in_B    :in std_logic_vector(7 downto 0);
        sub     :out std_logic_vector(7 downto 0);
		cout    :out std_logic
 
    );
End entity;

Architecture main of Subtrator_8b is

	component somador8bits is 
    port (
        in_A    :   in std_logic_vector (7 downto 0);
        in_B    :   in std_logic_vector(7 downto 0);
        soma    :   out std_logic_vector(7 downto 0);
        cout    :   out std_logic
    );
	 
	End component;
	
	signal subtrator : std_logic_vector(7 downto 0);
	
   begin
        subtrator <= not(in_B) + "00000001";
		  saia	: somador8bits port map(in_A, subtrator, sub, cout);
		  
end main;