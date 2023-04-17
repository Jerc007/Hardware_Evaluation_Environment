-------------------------------------------------------------------------
-- VHDL : dp_ram.vhd
--   Generic Dual Port RAM
--   Fix Configuration:
--		1. Seperated Clocks
--		2. No confliction checks
--		3. Out of boundary read generates Xs
--		[WARNING] Read after write logic is not verified
-- 		[TODO]
--
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use ieee.std_logic_textio.all;
USE std.textio.all;

entity dp_ram is
	generic(RAM_SIZE      : integer := 1024;
		    RAM_A_WIDTH   : integer := 10;
		    RAM_D_WIDTH   : integer := 8
			-- synthesis translate_off
			;
		    RAM_INIT_FILE : string  := "./dummy.mif"
			-- synthesis translate_on
	);
	port(
		clk  : in  std_logic;
		rst  : in  std_logic;
		addr_a : in  std_logic_vector(RAM_A_WIDTH - 1 downto 0);
		din_a  : in  std_logic_vector(RAM_D_WIDTH - 1 downto 0);
		we_a   : in  std_logic;
		addr_b : in  std_logic_vector(RAM_A_WIDTH - 1 downto 0);
		din_b  : in  std_logic_vector(RAM_D_WIDTH - 1 downto 0);
		we_b   : in  std_logic;
		dout_a : out std_logic_vector(RAM_D_WIDTH - 1 downto 0);
		dout_b : out std_logic_vector(RAM_D_WIDTH - 1 downto 0)
	);
end entity dp_ram;

architecture dp_ram_archi of dp_ram is
	
	type mem_type is array (0 to RAM_SIZE - 1) of std_logic_vector(RAM_D_WIDTH - 1 downto 0);

	--impure function init_mem(mif_file_name : in string) return mem_type is
	impure function init_mem(mif_file_name : in string) return mem_type is
		file mif_file : text open read_mode is mif_file_name;
		variable mif_line : line;
		variable temp_v   : std_logic_vector(RAM_D_WIDTH - 1 downto 0);
		variable temp_mem : mem_type;
	begin
		for i in mem_type'range loop
			if not endfile(mif_file) then
				readline(mif_file, mif_line);
				hread(mif_line, temp_v);
				temp_mem(i) := std_logic_vector(resize(unsigned(temp_v), RAM_D_WIDTH));
			else
				temp_mem(i) := (RAM_D_WIDTH - 1 downto 0 => '0');
			end if;
		end loop;
		return temp_mem;
	end function init_mem;
	
	shared variable ram : mem_type := init_mem(mif_file_name => RAM_INIT_FILE);

begin
	-- MEM WRITE PROCESS
	process_a : process(rst, clk)
	begin
		if rst = '1' then
			null;
		elsif clk'event and clk = '1' then
			if we_a = '1' then
				if to_integer(unsigned(addr_a)) >= RAM_SIZE then
					null;
				else
					ram(to_integer(unsigned(addr_a))) := din_a;
				end if;
			end if;

            if we_b = '1' then
				if to_integer(unsigned(addr_b)) >= RAM_SIZE then
					null;
				else
					ram(to_integer(unsigned(addr_b))) := din_b;
				end if;
			end if;
		end if;
	end process process_a;

	dout_a <= (others => 'X') when to_integer(unsigned(addr_a)) >= RAM_SIZE
		else din_b when we_b = '1' and addr_a = addr_b
		else ram(to_integer(unsigned(addr_a))) when we_a /= '1'
		else din_a;

	dout_b <= (others => 'X') when to_integer(unsigned(addr_b)) >= RAM_SIZE
		else din_a when we_a = '1' and addr_a = addr_b
		else ram(to_integer(unsigned(addr_b))) when we_b /= '1'
		else din_b;

end architecture dp_ram_archi;
