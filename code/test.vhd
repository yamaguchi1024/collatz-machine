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
        variable    dreg   : integer range 0 to 13120;
        variable    counter: integer range 0 to 127;
        variable    calc   : std_logic;
        variable    div2   : integer range 0 to 13120;
        variable    mul3   : integer range 0 to 13120;
    begin
        if (rising_edge(clk) and go = '1') then
            dreg := data;
            counter := 0;
            calc := '1';
            div2 := dreg / 2;
            mul3 := (dreg * 3) + 1;
        end if;

        while (dreg /= 1) loop
            if(rising_edge(clk) and calc = '1') then
                if dreg mod 2 = 0 then
                    dreg := div2;
                else
                    dreg := mul3;
                end if;

                div2 := dreg / 2;
                mul3 := (dreg * 3) + 1;

            end if;
        end loop;

        q <= counter;
    end process;
end rtl;
