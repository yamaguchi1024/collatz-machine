library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_counter is
	port
	(
	   data : in integer range 0 to 255;
		go :in std_logic;
		clk		: in std_logic;
		q		: out integer range 0 to 255
	);
end entity;

architecture rtl of gray_counter is
begin
	process (clk)
		variable	  dreg   : integer range 0 to 13120;
		variable   counter: integer range 0 to 127;
	begin
		if (rising_edge(clk)) then
		  if go = '1' then
		    dreg := data;
			 counter := 0;
		  end if;
		end if;
	   L1: loop
		   dreg := dreg - 1;
			exit L1 when (dreg = 1);
	   end loop L1;
		q <= counter;
	end process;

end rtl;

--		   while data='1' loop
--			   cnt := cnt + 1;
--				if data mod 2 = '0' then
--				  data := data / 2;
--				elsif data mod 2 = '1' then
--				  data := data * 3 + 1;
--				end if;
--			end loop;
