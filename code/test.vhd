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
	     signal    dreg   : integer range 0 to 13120;
        signal    counter: integer range 0 to 127;
        signal    calc   : std_logic;
        signal    div2   : integer range 0 to 13120;
        signal    mul3   : integer range 0 to 13120;
		  type MEMORY is array (0 to 255) of integer range 0 to 127;
		  type MEME is array (0 to 13120, 1 downto 0) of integer range 0 to 127;
		  type SORT is array (0 to 15) of integer range 0 to 127;
		  signal M_COUNT : MEMORY;
		  signal M_REM : MEME;
		  signal RES : SORT;
begin
    process (clk)
    begin

        if (rising_edge(clk)) then
            if(go = '1') then
                dreg <= data;
                counter <= 0;
                calc <= '1';
                div2 <= dreg / 2;
                mul3 <= (dreg * 3) + 1;
            end if;
            if(calc = '1') then
					 if(M_COUNT(dreg)/=0) then
					    q <= counter + M_COUNT(dreg);
						 end if;
                if(dreg = 1) then
                    q <= counter;
                else
                    if dreg mod 2 = 0 then
                        dreg <= div2;
                    else
                        dreg <= mul3;
                    end if;
                    div2 <= dreg / 2;
                    mul3 <= (dreg * 3) + 1;
                end if;
            end if;
        end if;
    end process;
end rtl;
