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

	-- 
	 
	--  Soma algoritmo
	--  0 => "11000011",
	--  1 => "11000111",
	--  2 => "00000001",

	--  teste beq bne
	-- 0 => "11000001", -- Li $s0, 1
	-- 1 => "11000110", -- Li $s1, 2
	-- 2 => "11100100", -- JumpC $s0, $s1
	-- 3 => "01100100", -- Beq , 4

	--  Teste Load e store
	-- 0 => "11000011", -- Li $s0, 3
	-- 1 => "00110000", -- Sw $s0, 0
	-- 2 => "01110011", -- Addi $s0, 3
	-- 3 => "00100000", -- Lw $s0, 0

	--  Fatorial
	-- 0 => "11001111", -- Li $s3, 3
	-- 1 => "01111110", -- Addi $s3, 2
	-- 2 => "11000001", -- Li $s0, 1
	-- 3 => "11010100", -- Move $s1, $s0
	-- 4 => "10000001", -- Mul $s0, $s1
	-- 5 => "11100111", -- JumpC $s1, $s3
	-- 6 => "01110101", -- Addi $s1, 1
	-- 7 => "01100100", -- Bne 4
	 
	--  Fibonacci
	-- 0 => "11001111", -- Li $s3, 3
    -- 1 => "10001111", -- Mult $s3, $s3
    -- 2 => "01111101", -- Addi $s3, 1
	-- 3 => "11001001", -- Li $s2, 1
	-- 4 => "11000001", -- Li $s0, 1
    -- 5 => "11010100", -- Move $s1, $s0
    -- 6 => "00110100", -- Sw $s1, 0
    -- 7 => "00000100", -- Add $s1, $s0
    -- 8 => "00100000", -- Lw $s0, 0
    -- 9 => "11101110", -- JumpC $s3, $s2
    -- 10 => "01111001", -- Addi $s2, 1
    -- 11 => "01100110", -- Bne 6
	 
	others => "00000000"
    );
    begin
        process (clock)
		  begin
            out_data <= memoriaROM(to_integer(unsigned(in_data)));
        end process;
end main;   