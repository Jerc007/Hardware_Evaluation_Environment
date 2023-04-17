
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
	constant TP_INSTRUCTIONS : integer := 154;

begin
	num_instructions_out <= TP_INSTRUCTIONS;

	process(instruction_pointer_in)
	begin
		case instruction_pointer_in is
			                when 0 => instruction_out <= x"d00e0001";   -- 0000    GLD.U32 R0, global14 [R0];
                when 1 => instruction_out <= x"80c00780";
                when 2 => instruction_out <= x"d00e00fd";   -- 0008    GLD.U32 R63, global14 [R0];
                when 3 => instruction_out <= x"80c00780";
                when 4 => instruction_out <= x"d00e001d";   -- 0010    GLD.U32 R7, global14 [R0];
                when 5 => instruction_out <= x"80c00780";
                when 6 => instruction_out <= x"d00e00e1";   -- 0018    GLD.U32 R56, global14 [R0];
                when 7 => instruction_out <= x"80c00780";
                when 8 => instruction_out <= x"d00e00a9";   -- 0020    GLD.U32 R42, global14 [R0];
                when 9 => instruction_out <= x"80c00780";
                when 10 => instruction_out <= x"d00e0055";   -- 0028    GLD.U32 R21, global14 [R0];
                when 11 => instruction_out <= x"80c00780";
                when 12 => instruction_out <= x"d00e0031";   -- 0030    GLD.U32 R12, global14 [R0];
                when 13 => instruction_out <= x"80c00780";
                when 14 => instruction_out <= x"d00e00cd";   -- 0038    GLD.U32 R51, global14 [R0];
                when 15 => instruction_out <= x"80c00780";
                when 16 => instruction_out <= x"d00e7e01";   -- 0040    GLD.U32 R0, global14 [R63];
                when 17 => instruction_out <= x"80c00780";
                when 18 => instruction_out <= x"d00e7efd";   -- 0048    GLD.U32 R63, global14 [R63];
                when 19 => instruction_out <= x"80c00780";
                when 20 => instruction_out <= x"d00e7e1d";   -- 0050    GLD.U32 R7, global14 [R63];
                when 21 => instruction_out <= x"80c00780";
                when 22 => instruction_out <= x"d00e7ee1";   -- 0058    GLD.U32 R56, global14 [R63];
                when 23 => instruction_out <= x"80c00780";
                when 24 => instruction_out <= x"d00e7ea9";   -- 0060    GLD.U32 R42, global14 [R63];
                when 25 => instruction_out <= x"80c00780";
                when 26 => instruction_out <= x"d00e7e55";   -- 0068    GLD.U32 R21, global14 [R63];
                when 27 => instruction_out <= x"80c00780";
                when 28 => instruction_out <= x"d00e7e31";   -- 0070    GLD.U32 R12, global14 [R63];
                when 29 => instruction_out <= x"80c00780";
                when 30 => instruction_out <= x"d00e7ecd";   -- 0078    GLD.U32 R51, global14 [R63];
                when 31 => instruction_out <= x"80c00780";
                when 32 => instruction_out <= x"d00e0e01";   -- 0080    GLD.U32 R0, global14 [R7];
                when 33 => instruction_out <= x"80c00780";
                when 34 => instruction_out <= x"d00e0efd";   -- 0088    GLD.U32 R63, global14 [R7];
                when 35 => instruction_out <= x"80c00780";
                when 36 => instruction_out <= x"d00e0e1d";   -- 0090    GLD.U32 R7, global14 [R7];
                when 37 => instruction_out <= x"80c00780";
                when 38 => instruction_out <= x"d00e0ee1";   -- 0098    GLD.U32 R56, global14 [R7];
                when 39 => instruction_out <= x"80c00780";
                when 40 => instruction_out <= x"d00e0ea9";   -- 00a0    GLD.U32 R42, global14 [R7];
                when 41 => instruction_out <= x"80c00780";
                when 42 => instruction_out <= x"d00e0e55";   -- 00a8    GLD.U32 R21, global14 [R7];
                when 43 => instruction_out <= x"80c00780";
                when 44 => instruction_out <= x"d00e0e31";   -- 00b0    GLD.U32 R12, global14 [R7];
                when 45 => instruction_out <= x"80c00780";
                when 46 => instruction_out <= x"d00e0ecd";   -- 00b8    GLD.U32 R51, global14 [R7];
                when 47 => instruction_out <= x"80c00780";
                when 48 => instruction_out <= x"d00e7001";   -- 00c0    GLD.U32 R0, global14 [R56];
                when 49 => instruction_out <= x"80c00780";
                when 50 => instruction_out <= x"d00e70fd";   -- 00c8    GLD.U32 R63, global14 [R56];
                when 51 => instruction_out <= x"80c00780";
                when 52 => instruction_out <= x"d00e701d";   -- 00d0    GLD.U32 R7, global14 [R56];
                when 53 => instruction_out <= x"80c00780";
                when 54 => instruction_out <= x"d00e70e1";   -- 00d8    GLD.U32 R56, global14 [R56];
                when 55 => instruction_out <= x"80c00780";
                when 56 => instruction_out <= x"d00e70a9";   -- 00e0    GLD.U32 R42, global14 [R56];
                when 57 => instruction_out <= x"80c00780";
                when 58 => instruction_out <= x"d00e7055";   -- 00e8    GLD.U32 R21, global14 [R56];
                when 59 => instruction_out <= x"80c00780";
                when 60 => instruction_out <= x"d00e7031";   -- 00f0    GLD.U32 R12, global14 [R56];
                when 61 => instruction_out <= x"80c00780";
                when 62 => instruction_out <= x"d00e70cd";   -- 00f8    GLD.U32 R51, global14 [R56];
                when 63 => instruction_out <= x"80c00780";
                when 64 => instruction_out <= x"d00e5401";   -- 0100    GLD.U32 R0, global14 [R42];
                when 65 => instruction_out <= x"80c00780";
                when 66 => instruction_out <= x"d00e54fd";   -- 0108    GLD.U32 R63, global14 [R42];
                when 67 => instruction_out <= x"80c00780";
                when 68 => instruction_out <= x"d00e541d";   -- 0110    GLD.U32 R7, global14 [R42];
                when 69 => instruction_out <= x"80c00780";
                when 70 => instruction_out <= x"d00e54e1";   -- 0118    GLD.U32 R56, global14 [R42];
                when 71 => instruction_out <= x"80c00780";
                when 72 => instruction_out <= x"d00e54a9";   -- 0120    GLD.U32 R42, global14 [R42];
                when 73 => instruction_out <= x"80c00780";
                when 74 => instruction_out <= x"d00e5455";   -- 0128    GLD.U32 R21, global14 [R42];
                when 75 => instruction_out <= x"80c00780";
                when 76 => instruction_out <= x"d00e5431";   -- 0130    GLD.U32 R12, global14 [R42];
                when 77 => instruction_out <= x"80c00780";
                when 78 => instruction_out <= x"d00e54cd";   -- 0138    GLD.U32 R51, global14 [R42];
                when 79 => instruction_out <= x"80c00780";
                when 80 => instruction_out <= x"d00e2a01";   -- 0140    GLD.U32 R0, global14 [R21];
                when 81 => instruction_out <= x"80c00780";
                when 82 => instruction_out <= x"d00e2afd";   -- 0148    GLD.U32 R63, global14 [R21];
                when 83 => instruction_out <= x"80c00780";
                when 84 => instruction_out <= x"d00e2a1d";   -- 0150    GLD.U32 R7, global14 [R21];
                when 85 => instruction_out <= x"80c00780";
                when 86 => instruction_out <= x"d00e2ae1";   -- 0158    GLD.U32 R56, global14 [R21];
                when 87 => instruction_out <= x"80c00780";
                when 88 => instruction_out <= x"d00e2aa9";   -- 0160    GLD.U32 R42, global14 [R21];
                when 89 => instruction_out <= x"80c00780";
                when 90 => instruction_out <= x"d00e2a55";   -- 0168    GLD.U32 R21, global14 [R21];
                when 91 => instruction_out <= x"80c00780";
                when 92 => instruction_out <= x"d00e2a31";   -- 0170    GLD.U32 R12, global14 [R21];
                when 93 => instruction_out <= x"80c00780";
                when 94 => instruction_out <= x"d00e2acd";   -- 0178    GLD.U32 R51, global14 [R21];
                when 95 => instruction_out <= x"80c00780";
                when 96 => instruction_out <= x"d00e1801";   -- 0180    GLD.U32 R0, global14 [R12];
                when 97 => instruction_out <= x"80c00780";
                when 98 => instruction_out <= x"d00e18fd";   -- 0188    GLD.U32 R63, global14 [R12];
                when 99 => instruction_out <= x"80c00780";
                when 100 => instruction_out <= x"d00e181d";   -- 0190    GLD.U32 R7, global14 [R12];
                when 101 => instruction_out <= x"80c00780";
                when 102 => instruction_out <= x"d00e18e1";   -- 0198    GLD.U32 R56, global14 [R12];
                when 103 => instruction_out <= x"80c00780";
                when 104 => instruction_out <= x"d00e18a9";   -- 01a0    GLD.U32 R42, global14 [R12];
                when 105 => instruction_out <= x"80c00780";
                when 106 => instruction_out <= x"d00e1855";   -- 01a8    GLD.U32 R21, global14 [R12];
                when 107 => instruction_out <= x"80c00780";
                when 108 => instruction_out <= x"d00e1831";   -- 01b0    GLD.U32 R12, global14 [R12];
                when 109 => instruction_out <= x"80c00780";
                when 110 => instruction_out <= x"d00e18cd";   -- 01b8    GLD.U32 R51, global14 [R12];
                when 111 => instruction_out <= x"80c00780";
                when 112 => instruction_out <= x"d00e6601";   -- 01c0    GLD.U32 R0, global14 [R51];
                when 113 => instruction_out <= x"80c00780";
                when 114 => instruction_out <= x"d00e66fd";   -- 01c8    GLD.U32 R63, global14 [R51];
                when 115 => instruction_out <= x"80c00780";
                when 116 => instruction_out <= x"d00e661d";   -- 01d0    GLD.U32 R7, global14 [R51];
                when 117 => instruction_out <= x"80c00780";
                when 118 => instruction_out <= x"d00e66e1";   -- 01d8    GLD.U32 R56, global14 [R51];
                when 119 => instruction_out <= x"80c00780";
                when 120 => instruction_out <= x"d00e66a9";   -- 01e0    GLD.U32 R42, global14 [R51];
                when 121 => instruction_out <= x"80c00780";
                when 122 => instruction_out <= x"d00e6655";   -- 01e8    GLD.U32 R21, global14 [R51];
                when 123 => instruction_out <= x"80c00780";
                when 124 => instruction_out <= x"d00e6631";   -- 01f0    GLD.U32 R12, global14 [R51];
                when 125 => instruction_out <= x"80c00780";
                when 126 => instruction_out <= x"d00e66cd";   -- 01f8    GLD.U32 R51, global14 [R51];
                when 127 => instruction_out <= x"80c00780";
                when 128 => instruction_out <= x"d00e0001";   -- 0200    GLD.U8 R0, global14 [R0];
                when 129 => instruction_out <= x"80000780";
                when 130 => instruction_out <= x"d00e7e1d";   -- 0208    GLD.U8 R7, global14 [R63];
                when 131 => instruction_out <= x"80000780";
                when 132 => instruction_out <= x"d00e54e1";   -- 0210    GLD.U8 R56, global14 [R42];
                when 133 => instruction_out <= x"80000780";
                when 134 => instruction_out <= x"d00e2afd";   -- 0218    GLD.U8 R63, global14 [R21];
                when 135 => instruction_out <= x"80000780";
                when 136 => instruction_out <= x"d00e0001";   -- 0220    GLD.U16 R0, global14 [R0];
                when 137 => instruction_out <= x"80400780";
                when 138 => instruction_out <= x"d00e7e1d";   -- 0228    GLD.U16 R7, global14 [R63];
                when 139 => instruction_out <= x"80400780";
                when 140 => instruction_out <= x"d00e54e1";   -- 0230    GLD.U16 R56, global14 [R42];
                when 141 => instruction_out <= x"80400780";
                when 142 => instruction_out <= x"d00e2afd";   -- 0238    GLD.U16 R63, global14 [R21];
                when 143 => instruction_out <= x"80400780";
                when 144 => instruction_out <= x"d00e0001";   -- 0240    GLD.S16 R0, global14 [R0];
                when 145 => instruction_out <= x"80600780";
                when 146 => instruction_out <= x"d00e7e1d";   -- 0248    GLD.S16 R7, global14 [R63];
                when 147 => instruction_out <= x"80600780";
                when 148 => instruction_out <= x"d00e54e1";   -- 0250    GLD.S16 R56, global14 [R42];
                when 149 => instruction_out <= x"80600780";
                when 150 => instruction_out <= x"d00e2afd";   -- 0258    GLD.S16 R63, global14 [R21];
                when 151 => instruction_out <= x"80600780";
                when 152 => instruction_out <= x"30000003";   -- RET
                when 153 => instruction_out <= x"00000780";

			when others => null;
		end case;
	end process;

end arch;

