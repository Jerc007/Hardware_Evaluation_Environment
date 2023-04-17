
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TP_instructions is
	port(
		instruction_pointer_in : in  integer;
		num_instructions_out   : out integer;
		instruction_out        : out std_logic_vector(31 downto 0)
	);
end TP_instructions;

architecture arch of TP_instructions is
	constant TP_INSTRUCTIONS : integer := 109;

begin
	num_instructions_out <= TP_INSTRUCTIONS;

	process(instruction_pointer_in)
	begin
		case instruction_pointer_in is
			                when 0 => instruction_out <= x"10004c05";   -- 0000    MOV.U16 R0H, g [0x6].U16;
                when 1 => instruction_out <= x"0023c780";
                when 2 => instruction_out <= x"a0000005";   -- 0008    I2I.U32.U16 R1, R0L;
                when 3 => instruction_out <= x"04000780";
                when 4 => instruction_out <= x"41012200";   -- 0010    IMUL32.U16.U16 R0 g [0x1].U16, R0H;
                when 5 => instruction_out <= x"20000001";   -- 0014    IADD R0, R0, R1;
                when 6 => instruction_out <= x"04004780";
                when 7 => instruction_out <= x"30020005";   -- 001c    SHL R1, R0, 0x2;
                when 8 => instruction_out <= x"c4100780";
                when 9 => instruction_out <= x"2000ca01";   -- 0024    IADD R0, g [0x5], R1;
                when 10 => instruction_out <= x"04204780";
                when 11 => instruction_out <= x"2000c809";   -- 002c    IADD R2, g [0x4], R1;
                when 12 => instruction_out <= x"04204780";
                when 13 => instruction_out <= x"d00e0405";   -- 0034    GLD.U32 R1, global14 [R2];
                when 14 => instruction_out <= x"80c00780";
                when 15 => instruction_out <= x"90000205";   -- 003c    SIN R1, R1;
                when 16 => instruction_out <= x"80000780";
                when 17 => instruction_out <= x"d00e0005";   -- 0044    GST.U32 global14 [R0], R1;
                when 18 => instruction_out <= x"a0c00780";
                when 19 => instruction_out <= x"20008001";   -- 004c    IADD32I R0, R0, 0x900;
                when 20 => instruction_out <= x"00000093";
                when 21 => instruction_out <= x"20008409";   -- 0054    IADD32I R2, R2, 0x900;
                when 22 => instruction_out <= x"00000093";
                when 23 => instruction_out <= x"d00e0405";   -- 005c    GLD.U32 R1, global14 [R2];
                when 24 => instruction_out <= x"80c00780";
                when 25 => instruction_out <= x"90000205";   -- 0064    SIN R1, R1;
                when 26 => instruction_out <= x"80000780";
                when 27 => instruction_out <= x"d00e0005";   -- 006c    GST.U32 global14 [R0], R1;
                when 28 => instruction_out <= x"a0c00780";
                when 29 => instruction_out <= x"20008001";   -- 0074    IADD32I R0, R0, 0x900;
                when 30 => instruction_out <= x"00000093";
                when 31 => instruction_out <= x"20008409";   -- 007c    IADD32I R2, R2, 0x900;
                when 32 => instruction_out <= x"00000093";
                when 33 => instruction_out <= x"d00e0405";   -- 0084    GLD.U32 R1, global14 [R2];
                when 34 => instruction_out <= x"80c00780";
                when 35 => instruction_out <= x"90000205";   -- 008c    COS R1, R1;
                when 36 => instruction_out <= x"a0000780";
                when 37 => instruction_out <= x"d00e0005";   -- 0094    GST.U32 global14 [R0], R1;
                when 38 => instruction_out <= x"a0c00780";
                when 39 => instruction_out <= x"20008001";   -- 009c    IADD32I R0, R0, 0x900;
                when 40 => instruction_out <= x"00000093";
                when 41 => instruction_out <= x"20008409";   -- 00a4    IADD32I R2, R2, 0x900;
                when 42 => instruction_out <= x"00000093";
                when 43 => instruction_out <= x"d00e0405";   -- 00ac    GLD.U32 R1, global14 [R2];
                when 44 => instruction_out <= x"80c00780";
                when 45 => instruction_out <= x"90000205";   -- 00b4    RSQ R1, R1;
                when 46 => instruction_out <= x"40000780";
                when 47 => instruction_out <= x"d00e0005";   -- 00bc    GST.U32 global14 [R0], R1;
                when 48 => instruction_out <= x"a0c00780";
                when 49 => instruction_out <= x"20008001";   -- 00c4    IADD32I R0, R0, 0x900;
                when 50 => instruction_out <= x"00000093";
                when 51 => instruction_out <= x"20008409";   -- 00cc    IADD32I R2, R2, 0x900;
                when 52 => instruction_out <= x"00000093";
                when 53 => instruction_out <= x"d00e0405";   -- 00d4    GLD.U32 R1, global14 [R2];
                when 54 => instruction_out <= x"80c00780";
                when 55 => instruction_out <= x"90000205";   -- 00dc    RSQ R1, R1;
                when 56 => instruction_out <= x"40000780";
                when 57 => instruction_out <= x"d00e0005";   -- 00e4    GST.U32 global14 [R0], R1;
                when 58 => instruction_out <= x"a0c00780";
                when 59 => instruction_out <= x"20008001";   -- 00ec    IADD32I R0, R0, 0x900;
                when 60 => instruction_out <= x"00000093";
                when 61 => instruction_out <= x"20008409";   -- 00f4    IADD32I R2, R2, 0x900;
                when 62 => instruction_out <= x"00000093";
                when 63 => instruction_out <= x"d00e0405";   -- 00fc    GLD.U32 R1, global14 [R2];
                when 64 => instruction_out <= x"80c00780";
                when 65 => instruction_out <= x"90000205";   -- 0104    LG2 R1, R1;
                when 66 => instruction_out <= x"60000780";
                when 67 => instruction_out <= x"d00e0005";   -- 010c    GST.U32 global14 [R0], R1;
                when 68 => instruction_out <= x"a0c00780";
                when 69 => instruction_out <= x"20008001";   -- 0114    IADD32I R0, R0, 0x900;
                when 70 => instruction_out <= x"00000093";
                when 71 => instruction_out <= x"20008409";   -- 011c    IADD32I R2, R2, 0x900;
                when 72 => instruction_out <= x"00000093";
                when 73 => instruction_out <= x"d00e0405";   -- 0124    GLD.U32 R1, global14 [R2];
                when 74 => instruction_out <= x"80c00780";
                when 75 => instruction_out <= x"90000205";   -- 012c    LG2 R1, R1;
                when 76 => instruction_out <= x"60000780";
                when 77 => instruction_out <= x"d00e0005";   -- 0134    GST.U32 global14 [R0], R1;
                when 78 => instruction_out <= x"a0c00780";
                when 79 => instruction_out <= x"20008001";   -- 013c    IADD32I R0, R0, 0x900;
                when 80 => instruction_out <= x"00000093";
                when 81 => instruction_out <= x"20008409";   -- 0144    IADD32I R2, R2, 0x900;
                when 82 => instruction_out <= x"00000093";
                when 83 => instruction_out <= x"d00e0405";   -- 014c    GLD.U32 R1, global14 [R2];
                when 84 => instruction_out <= x"80c00780";
                when 85 => instruction_out <= x"90000205";   -- 0154    EX2 R1, R1;
                when 86 => instruction_out <= x"c0000780";
                when 87 => instruction_out <= x"d00e0005";   -- 015c    GST.U32 global14 [R0], R1;
                when 88 => instruction_out <= x"a0c00780";
                when 89 => instruction_out <= x"20008001";   -- 0164    IADD32I R0, R0, 0x900;
                when 90 => instruction_out <= x"00000093";
                when 91 => instruction_out <= x"20008409";   -- 016c    IADD32I R2, R2, 0x900;
                when 92 => instruction_out <= x"00000093";
                when 93 => instruction_out <= x"d00e0405";   -- 0174    GLD.U32 R1, global14 [R2];
                when 94 => instruction_out <= x"80c00780";
                when 95 => instruction_out <= x"90000205";   -- 017c    RCP R1, R1;
                when 96 => instruction_out <= x"00000780";
                when 97 => instruction_out <= x"d00e0005";   -- 0184    GST.U32 global14 [R0], R1;
                when 98 => instruction_out <= x"a0c00780";
                when 99 => instruction_out <= x"20008001";   -- 018c    IADD32I R0, R0, 0x900;
                when 100 => instruction_out <= x"00000093";
                when 101 => instruction_out <= x"20008409";   -- 0194    IADD32I R2, R2, 0x900;
                when 102 => instruction_out <= x"00000093";
                when 103 => instruction_out <= x"30000003";   -- 019c    RET;
                when 104 => instruction_out <= x"00000780";
                when 105 => instruction_out <= x"f0000001";   -- 01a4    NOP;
                when 106 => instruction_out <= x"e0000000";
                when 107 => instruction_out <= x"30000003";   -- RET
                when 108 => instruction_out <= x"00000780";

			when others => null;
		end case;
	end process;

end arch;

