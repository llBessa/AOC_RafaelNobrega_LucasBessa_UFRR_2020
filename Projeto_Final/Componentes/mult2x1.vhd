------mult2x1-------
Library Ieee;
Use iEEE.STD_LOGIC_1164.ALL;

Entity mult2x1 Is 
Port(
		A, B ,S : iN sTD_lOGIC;
		S0      : Out Std_Logic
);

End mult2x1;

Architecture logic of mult2x1 is 
Begin
Process (A,B,S) IS 
Begin 
		If s = '0' then  S0 <= A;
		else S0 <= B;
		End if;
End Process;
End logic;
-- 