--libaries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ULA is 
    port(
    in_A    : in std_logic_vector(7 downto 0);
    in_B    : in std_logic_vector(7 downto 0);
    AluOp   : in std_logic_vector(3 downto 0); 
    zero    : out std_logic;
    outULA  : out std_logic_vector(7 downto 0);
    overflow: out std_logic
    );
end entity;

architecture main of ULA is
   component multiplicador is
        Port ( a,b  : in Std_logic_vector (7 downto 0);
            Produto    : Out Std_Logic_Vector (15 downto 0)
              );
	end component;

   component somador8bits is 
    port (
        in_A    :   in std_logic_vector (7 downto 0);
        in_B    :   in std_logic_vector(7 downto 0);
        soma    :   out std_logic_vector(7 downto 0);
        cout    :   out std_logic
    );
    End component;

    component Subtrator_8b is 
    port (
        in_A    :in std_logic_vector (7 downto 0);
        in_B    :in std_logic_vector(7 downto 0);
        sub     :out std_logic_vector(7 downto 0);
		cout    :out std_logic
    );
    End component;
	 
	 component AuxJumpC is
    port(
        in_A : in std_logic;
        saida : out std_logic
    );
	end component;

    signal somadorOut : std_logic_vector(7 downto 0);
    signal subtratorOut : std_logic_vector(7 downto 0);
    signal overflowSoma : std_logic;
    signal overflowSub : std_logic;
    signal multiOut : std_logic_vector(15 downto 0);
	 
	 signal condition : std_logic;
	 signal resultcondition : std_logic;

    begin
		  aux		 : AuxJumpC port map(condition, resultcondition);
        soma    : somador8bits port map(in_A, in_B, somadorOut, overflowSoma);
        sub     : Subtrator_8b port map(in_A, in_B, subtratorOut, overflowSub);
        multi   : multiplicador port map(in_A, in_B, multiOut);
		  
		 process(AluOp)
		  begin

        case AluOp is
            when "0000" => -- Add
                outULA <= somadorOut;
                overflow <= overflowSoma;
            when "0001" => -- Sub
                outULA <= subtratorOut;
            when "0010" => -- Lw
                outULA <= in_B;
            when "0011" => -- Sw
                outULA <= in_B;
            when "0101" => -- Beq
                if resultcondition = '1' then
                    zero <= '1';
                else
                    zero <= '0';
                end if;
                outULA <= "00000000";
            when "0110" => -- Bne
                if resultcondition = '0' then
                    zero <= '1';
                else
                    zero <= '0';
                end if;
                outULA <= "00000000";
            when "0111" => -- Addi
                outULA <= somadorOut;
                overflow <= overflowSoma;
            when "1000" => -- Mul
                outULA <= multiOut(7 downto 0);
                if multiOut(15 downto 8) = "00000000" then
                    overflow <= '0';
                else
                    overflow <= '1';
                end if;
            when "1001" => -- And
                outULA <= in_A and in_B;
            when "1010" => -- Or
                outULA <= in_A or in_B;
            when "1011" => -- Not
                outULA <= not(in_A);
            when "1100" => -- Li
                outULA <= in_B;
            when "1101" => -- Move
                outULA <= in_B;
            when "1110" => -- JumpC
                if in_A = in_B then
                    condition <= '1';
                else
                    condition <= '0';
                end if;
					 outULA <= "00000000";
            when others =>
                outULA <= "00000000";
			end case;
		  end process;
end main;