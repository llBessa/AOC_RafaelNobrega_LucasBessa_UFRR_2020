library Ieee;
Use Ieee.std_logic_1164.all;
Use Ieee.numeric_std.all;

Entity BancoRegistradores is port (
	clock: in std_logic;
	escreverReg:in std_logic;
	endereco_regA:in std_logic_vector(1 downto 0);
	endereco_regB:in std_logic_vector(1 downto 0);
	escreverData:in std_logic_vector(7 downto 0);
	reg_outA:out std_logic_vector(7 downto 0);
	reg_outB:out std_logic_vector(7 downto 0)
	
);
End BancoRegistradores;

Architecture main of BancoRegistradores is 

	Type Banco_Registrador is Array (0 to 3)of std_logic_vector (7 downto 0);
	Signal registrador : Banco_Registrador;

Begin
		Process (clock)
		Begin
				if rising_edge(clock) then
					if (escreverReg = '1') then
						registrador(to_integer(unsigned(endereco_regA))) <= escreverData; 
					End if;
				End if;
				reg_outA <= registrador(to_integer(unsigned(endereco_regA)));
				reg_outB <= registrador(to_integer(unsigned(endereco_regB)));
		End Process;
End main;