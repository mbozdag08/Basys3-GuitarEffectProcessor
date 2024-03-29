library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity CleanMod is
    Port ( clk   : in  STD_LOGIC;
           JXADC    : in STD_LOGIC_VECTOR (7 downto 0);
           vp_in    : in STD_LOGIC;
           vn_in    : in STD_LOGIC;
           Jout      : out STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture Behavioral of CleanMod is
    component xadc_wiz_0 is port (
        daddr_in    : in STD_LOGIC_VECTOR (6 downto 0);
        dclk_in     : in STD_LOGIC;
        den_in      : in STD_LOGIC;
        di_in       : in STD_LOGIC_VECTOR (15 downto 0);
        dwe_in      : in STD_LOGIC;
        vauxp6      : in STD_LOGIC;
        vauxn6      : in STD_LOGIC;
        busy_out    : out STD_LOGIC;
        channel_out : out STD_LOGIC_VECTOR (4 downto 0);
        do_out      : out STD_LOGIC_VECTOR (15 downto 0);
        drdy_out    : out STD_LOGIC;
        eoc_out     : out STD_LOGIC;
        eos_out     : out STD_LOGIC;
        vp_in       : in STD_LOGIC;
        vn_in       : in STD_LOGIC);
    end component;

    signal enable : STD_LOGIC;
    signal di_in : STD_LOGIC_VECTOR (15 downto 0);

    signal ready : STD_LOGIC;
    signal channel_out : STD_LOGIC_VECTOR (4 downto 0);
    signal do_out : STD_LOGIC_VECTOR (15 downto 0);

begin

    XADC_1 : xadc_wiz_0 port map (
        daddr_in            => "0010110",
        dclk_in             => clk,
        den_in              => enable,
        di_in               => (others => '0'),
        dwe_in              => '0',
        vauxp6              => JXADC(0),
        vauxn6              => JXADC(4),
        busy_out            => open,
        channel_out         => open,
        do_out              => do_out,
        drdy_out            => ready,
        eoc_out             => enable,
        eos_out             => open,
        vp_in               => vp_in,
        vn_in               => vn_in);

    process (ready) is
    begin
        if ready = '1' then
            Jout <= do_out(13 downto 6);
            
--            process(currentMicroSeconds)
--             if current microseconds mod 25 = 0
--                do_out(13 downto 6)
                
                
                
--                ----
--                Jout <= array(len(array) - 16000)* 2/3
--                ----
            
        end if;
    end process;

end Behavioral;
