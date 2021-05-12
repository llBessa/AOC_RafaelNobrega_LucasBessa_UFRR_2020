--libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity processador is
  port(
        clock           : in std_logic;
        outPC           : out std_logic_vector(7 downto 0);
        outROM          : out std_logic_vector(7 downto 0);
        Opcode          : out std_logic_vector(3 downto 0);
        JumpAddress      : out std_logic_vector(3 downto 0);
        Reg1Address      : out std_logic_vector(1 downto 0);
        Reg2Address      : out std_logic_vector(1 downto 0);
        Reg1             : out std_logic_vector(7 downto 0);
        Reg2             : out std_logic_vector(7 downto 0);
        outULA          : out std_logic_vector(7 downto 0);
        overflow        : out std_logic;
        outRAM          : out std_logic_vector(7 downto 0);
        outSomaPC       : out std_logic_vector(7 downto 0);
		  outAndPort		: out std_logic;
		  Zero				: out std_logic
  );
end entity;

architecture main of processador is
  component BancoRegistradores is 
	port (
    clock			: in std_logic;
    escreveReg		:in std_logic;
    addressReg1		:in std_logic_vector(1 downto 0);
    addressReg2		:in std_logic_vector(1 downto 0);
    escreveDado		:in std_logic_vector(7 downto 0);
    out_Reg1		:out std_logic_vector(7 downto 0);
    out_Reg2		:out std_logic_vector(7 downto 0)
	);
  end component;

  component Divisaobits is
    port(
        instruction : in std_logic_vector(7 downto 0);
        JumpAddress : out std_logic_vector(3 downto 0);
        reg1        : out std_logic_vector(1 downto 0);
        reg2        : out std_logic_vector(1 downto 0);
        Opcode      : out std_logic_vector(3 downto 0)
    );
  end component;

  component Extensor_2_8 is 
		Port (
				in_port  : in Std_Logic_Vector (1 downto 0);
				out_port : out Std_Logic_Vector (7 downto 0)
		);
  end component;

  component Extensor_4_8 Is 
		Port (
				in_port  : in Std_Logic_Vector (3 downto 0);
				out_port : out Std_Logic_Vector (7 downto 0)
		);
  end component;

  component memoriaRAM is
    port(
        endereco    : in std_logic_vector(7 downto 0);
        in_data     : in std_logic_vector(7 downto 0);
        out_data    : out std_logic_vector(7 downto 0);
        escreveMem  : in std_logic;
        lerMem      : in std_logic;
        clock       : in std_logic
    );
  end component;

  component memoriaROM is
    port(
        in_data     : in std_logic_vector(7 downto 0);
        clock       : in std_logic;
        out_data    : out std_logic_vector(7 downto 0)
    );
  end component;

  component mult2x1 is 
    Port(
		A, B		: in std_logic_vector(7 downto 0);
		S 			: in std_logic;
		out_data : out std_logic_vector(7 downto 0)
    );
  end component;

  component Pc IS
    PORT (
        clock : IN std_logic;
        in_port : IN std_logic_vector (7 DOWNTO 0);
        out_port : OUT std_logic_vector (7 DOWNTO 0)
        );
  END component;

  component Somador_pc IS
    PORT (
        clock : IN std_logic;
        in_port : IN std_logic_vector (7 DOWNTO 0);
        out_port : OUT std_logic_vector (7 DOWNTO 0)
		);
  END component;

  component p_and IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
  END component;

  component ULA is 
    port(
    in_A    : in std_logic_vector(7 downto 0);
    in_B    : in std_logic_vector(7 downto 0);
    AluOp   : in std_logic_vector(3 downto 0); 
    zero    : out std_logic;
    outULA  : out std_logic_vector(7 downto 0);
    overflow: out std_logic
    );
  end component;

  component UnidadeDeControle is
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
  End component;

    -- saida do pc
    signal saidaPC : std_logic_vector(7 downto 0);

    -- saida do somador do pc
    signal saidaSomaPC : std_logic_vector(7 downto 0);

    -- saida da memoria ROM
    signal saidaROM : std_logic_vector(7 downto 0);

    -- sinais pós divisão de bits
    signal JAddress : std_logic_vector(3 downto 0);
    signal OPcodeROM : std_logic_vector(3 downto 0);
    signal AddressReg1 : std_logic_vector(1 downto 0);
    signal AddressReg2 : std_logic_vector(1 downto 0);

    -- saida extensores
    signal outExt4p8 : std_logic_vector(7 downto 0);
    signal outExt2p8 : std_logic_vector(7 downto 0);

    -- saida das flags da Unidade de Controle
    signal JumpFlag : std_logic;
    signal BranchFlag : std_logic;
    signal LerMemFlag : std_logic;
    signal MemToRegFlag : std_logic;
    signal ALUOpFlag : std_logic_vector(3 downto 0);
    signal EscreveMemFlag : std_logic;
    signal OrigALUFlag : std_logic;
    signal EscreveRegFlag : std_logic;

    -- saida do banco de registradores
    signal outDado1 : std_logic_vector(7 downto 0);
    signal outDado2 : std_logic_vector(7 downto 0);

    -- saida do multiplex antes da ula
    signal outMultplex1 : std_logic_vector(7 downto 0);

    -- saidas da ULA
    signal saidaULA : std_logic_vector(7 downto 0);
    signal ULAZero : std_logic;

    -- saida porta end pós ULA e UC
    signal outAnd : std_logic;

    -- identificador de overflow
    signal estouroMEM : std_logic;

    -- saida dos multiplexadores de seleção de endereço para o PC
    signal outMultplex2 : std_logic_vector(7 downto 0);
    signal outMultplex3 : std_logic_vector(7 downto 0);

    -- saida memoria RAM
    signal outDadoRAM : std_logic_vector(7 downto 0);

    -- saida do multiplexador pós memoria RAM
    signal outMultplex4 : std_logic_vector(7 downto 0);

  begin
    -- PC
    ProgramCounter : Pc port map(clock, outMultplex3, saidaPC);

    -- ligação PC e somador do PC
    SomaPC : Somador_pc port map(clock, saidaPC, saidaSomaPC);

    -- ligação PC e ROM
    ROM : memoriaROM port map(saidaPC, clock, saidaROM);

    -- ligação ROM e divisão de instrução
    Divisao : Divisaobits port map(saidaROM, JAddress, AddressReg1, AddressReg2, OPcodeROM);

    -- ligação divisão de instruções e Banco de registradores
    Registradores : BancoRegistradores port map(clock, EscreveRegFlag, AddressReg1, AddressReg2, outMultplex4, outDado1, outDado2);

    -- ligação ROM e Unidade de controle
    Controle : UnidadeDeControle port map(clock, OPcodeROM, OrigALUFlag, EscreveRegFlag, EscreveMemFlag, ALUOpFlag, MemToRegFlag, LerMemFlag, BranchFlag, JumpFlag);

    -- ligação endereços de salto e extensores
    Extensor4p8 : Extensor_4_8 port map(JAddress, outExt4p8);
    Extensor2p8 : Extensor_2_8 port map(AddressReg2, outExt2p8);

    -- ligação somadorPC e multiplexador respectivo e ligação mult2 e mult3
    Mult2 : mult2x1 port map(saidaSomaPC, outExt4p8, outAnd, outMultplex2);
    Mult3 : mult2x1 port map(outMultplex2, outExt4p8, JumpFlag, outMultplex3);

    -- ligação BR/Ext e multiplexador 1
    Mult1 : mult2x1 port map(outDado2, outExt2p8, OrigALUFlag, outMultplex1);

    -- ligação mult/BR e ULA
    ALU : ULA port map(outDado1, outMultplex1, ALUOpFlag, ULAZero, saidaULA, estouroMEM);

    -- ligação Zero/Branch e porta and
    AndPorta : p_and port map(BranchFlag, ULAZero, outAnd);

    -- Memoria RAM
    RAM : memoriaRAM port map(outExt2p8, saidaULA, outDadoRAM, EscreveMemFlag, LerMemFlag, clock);

    -- Multiplexador pós RAM
    Mult4 : mult2x1 port map(outDadoRAM, saidaULA, MemToRegFlag, outMultplex4);

    -- Saidas
    outPC <= saidaPC;
    outROM <= saidaROM;
    Opcode <= OPcodeROM;
    JumpAddress <= JAddress;
    Reg1Address <= AddressReg1;
    Reg2Address <= AddressReg2;
    Reg1 <= outDado1;
    Reg2 <= outDado2;
    outULA <= saidaULA;
    overflow <= estouroMEM;
    outRAM  <= outDadoRAM;
    outSomaPC <= saidaSomaPC;
	 outAndPort <= outAnd;
	 Zero <= ULAZero;
end main;