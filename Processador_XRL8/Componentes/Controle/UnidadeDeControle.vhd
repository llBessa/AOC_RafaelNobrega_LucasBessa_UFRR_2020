Library Ieee;
use Ieee.std_logic_1164.all;

Entity UnidadeDeControle is
	Port(
		clock : IN std_logic;
        Op_code : IN std_logic_vector (3 DOWNTO 0);
        OrigAlu : OUT std_logic;
        EscreveReg : OUT std_logic;
        EscreveMem : OUT std_logic;
        AluOp : OUT std_logic_vector (3 DOWNTO 0);
        MemToReg : OUT std_logic;
        LerMem : OUT std_logic;
        Branch : OUT std_logic;
        Jump : OUT std_logic

		);

End UnidadeDeControle;

Architecture main of UnidadeDeControle is
Begin
	PROCESS (clock)
    BEGIN
        CASE Op_code IS
            WHEN "0000" => -- add
                OrigAlu <= '0';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "0000";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "0001" => -- Sub
                OrigAlu <= '0';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "0001";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "0010" => -- Lw
                OrigAlu <= '1';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "0010";
                MemToReg <= '0';
                LerMem <= '1';
                Branch <= '0';
                Jump <= '0';

            WHEN "0011" => -- Sw
                OrigAlu <= '0';
                EscreveReg <= '0';
                EscreveMem <= '1';
                AluOp <= "0011";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "0100" => -- J
                OrigAlu <= '0';
                EscreveReg <= '0';
                EscreveMem <= '0';
                AluOp <= "0100";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '1';

            WHEN "0101" => -- Beq
                OrigAlu <= '0';
                EscreveReg <= '0';
                EscreveMem <= '0';
                AluOp <= "0101";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '1';
                Jump <= '0';

            WHEN "0110" => -- Bne
                OrigAlu <= '0';
                EscreveReg <= '0';
                EscreveMem <= '0';
                AluOp <= "0110";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '1';
                Jump <= '0';
					 
				WHEN "1110" => -- JumpC
                OrigAlu <= '0';
                EscreveReg <= '0';
                EscreveMem <= '0';
                AluOp <= "1110";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "0111" => -- addi
                OrigAlu <= '1';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "0111";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "1000" => -- Mul
                OrigAlu <= '0';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "1000";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "1001" => -- And
                OrigAlu <= '0';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "1001";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "1010" => -- Or
                OrigAlu <= '0';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "1010";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "1011" => -- Not
                OrigAlu <= '0';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "1011";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "1100" => -- Li
                OrigAlu <= '1';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "1100";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

            WHEN "1101" => -- Move
                OrigAlu <= '0';
                EscreveReg <= '1';
                EscreveMem <= '0';
                AluOp <= "1101";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';

				WHEN OTHERS =>
                OrigAlu <= '0';
                EscreveReg <= '0';
                EscreveMem <= '0';
                AluOp <= "1111";
                MemToReg <= '1';
                LerMem <= '0';
                Branch <= '0';
                Jump <= '0';
        END CASE;
    END PROCESS;
END main;