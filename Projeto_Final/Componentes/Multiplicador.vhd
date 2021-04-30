Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Multiplicador is
    Port (a,b : in Std_logic_vector (7 downto 0);
            Produto : Out Std_Logic_Vector (7 downto 0);

end Multiplicador; 

Architecture Multiplicador_8b is
    Signal sig_1, sig_2 : Signed (7 downto 0 );
Begin
        sig_1 <- signed(a);
        sig_2 <- signed(b);
        Produto <- Std_Logic_Vector(sig_1 * sig_2);

End Multiplicador;
