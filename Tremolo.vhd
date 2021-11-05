library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Tremolo is
    Port (clk : in STD_LOGIC;
          ch : in STD_LOGIC_VECTOR(1 downto 0); -- choice
          tri1   : in STD_LOGIC_VECTOR(7 downto 0); --triangular wave 1
          tri2   : in STD_LOGIC_VECTOR(7 downto 0); --triangular wave 2
          del : in STD_LOGIC_VECTOR(7 downto 0); --delay module output
          trem   : out STD_LOGIC_VECTOR(7 downto 0)  --tremolo output
    );
end Tremolo;

architecture Behavioral of Tremolo is

signal tri1int, tri2int, delint : integer range -128 to 127;
signal temp1, temp2 : integer range -16256 to 16129;


begin
    process(clk)
    
        begin
            
            tri1int <= to_integer(unsigned(tri1)) - 128; 
            tri2int <= to_integer(unsigned(tri2)) - 128;
            delint <= to_integer(unsigned(del)) - 128;
            
            if (rising_edge(clk)) then
            
                temp1 <= tri1int * delint;
                temp2 <= tri2int * delint;

                if ch = "00" then
                    trem <= del;
                end if;
                
                if ch = "01" then
                    trem <= STD_LOGIC_VECTOR(to_unsigned((temp1/127)+128,8));
                end if;
                
                if ch = "10" then
                    trem <= STD_LOGIC_VECTOR(to_unsigned((temp2/127)+128,8));
                end if;
                
            end if;
        
    end process;

end Behavioral;
