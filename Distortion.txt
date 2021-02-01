library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Distortion is
    Port ( clin : in STD_LOGIC_VECTOR(7 downto 0); --clean input
           disout : out STD_LOGIC_VECTOR(7 downto 0); --distorted output
           clk: in std_logic;
           ch : in STD_LOGIC_VECTOR(1 downto 0) --choice
       );
end Distortion;

architecture Behavioral of Distortion is

begin

process(clk, ch)
begin    
        if rising_edge(clk) then
        
            if ch="00" then --effect off
                disout<=clin;
            end if; 
        
            if ch="01" then --weak overdrive
                if unsigned(clin(7 downto 0)) >= 162 then
                    disout <= STD_LOGIC_VECTOR(to_unsigned(192,8));    
                elsif unsigned(clin(7 downto 0)) <= 94 then
                    disout <= STD_LOGIC_VECTOR(to_unsigned(64,8));
                else
                   disout<=clin;
                end if;
            end if;
            
            if ch="10" then --strong overdrive
                if unsigned(clin(7 downto 0)) >= 132 then
                    disout <= STD_LOGIC_VECTOR(to_unsigned(192,8));    
                elsif unsigned(clin(7 downto 0)) <= 124 then
                    disout <= STD_LOGIC_VECTOR(to_unsigned(64,8));
                else
                   disout<=clin;
                end if;
            end if;
                      
        end if;

end process;

end Behavioral;

