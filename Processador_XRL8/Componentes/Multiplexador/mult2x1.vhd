------mult2x1-------
Library Ieee;
Use iEEE.STD_LOGIC_1164.ALL;

Entity mult2x1 Is 
Port(
		A, B		: in std_logic_vector(7 downto 0);
		S 			: in std_logic;
		out_data : out std_logic_vector(7 downto 0)
);

End mult2x1;

Architecture logic of mult2x1 is 
Begin
Process (A,B,S) IS 
Begin 
		If s = '0' then  
		out_data <= A;
		else
		out_data <= B;
		End if;
End Process;
End logic;