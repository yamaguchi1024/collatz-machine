library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_bench is

    end test_bench;

architecture Behavioral of test_bench is
    component test port (
                            data : in integer range 0 to 255;
                            go :in std_logic;
                            clk		: in std_logic;
                            q		: out integer range 0 to 255
                        );
    end component;

    signal  data : in integer range 0 to 255;
    signal  go :in std_logic;
    signal  clk		: in std_logic;
    signal   q		: out integer range 0 to 255

begin 
    u0: test port map(
                         data => data,
                         go => go,
                         clk => clk,
                         q => q,
                     );

    process
        type pattern_type is record

            data : in integer range 0 to 255;
            go :in std_logic;
            clk		: in std_logic;
            q		: out integer range 0 to 255
    end record;


    type pattern_array is array (natural range<>) of pattern_type;

end process;
end Behavioral;
