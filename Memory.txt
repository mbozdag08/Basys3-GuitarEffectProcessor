library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory is
  Port (dist : in STD_LOGIC_VECTOR(7 downto 0); --Distortion Module Output
        clk : in STD_LOGIC; --100MHz Clock
        out0 : out STD_LOGIC_VECTOR(7 downto 0);
        out1 : out STD_LOGIC_VECTOR(7 downto 0);
        out2 : out STD_LOGIC_VECTOR(7 downto 0);
        out3 : out STD_LOGIC_VECTOR(7 downto 0)
        );
end Memory;

architecture Behavioral of Memory is

constant srate : integer := 35000; -- Sample Rate for 40kHz
type memory is array (0 to srate-1) of STD_LOGIC_VECTOR(7 downto 0); -- RAM
signal memo : memory; -- Stored Signals in RAM
signal d1,d2 : STD_LOGIC; -- Delay Points
signal divider : integer := 0; --Clock Divider


begin
      
    process (clk)
    
    variable i: integer range 0 to srate-1:= 0; -- Writing/Reading counter
    variable j,k: integer range 0 to srate-1; --Reading counters 
    
    begin 
        if rising_edge(clk) then
        
            if divider = 0 then
        
                memo(i) <= dist; -- Writing The Memory
                i := i + 1;
                out1 <= memo(i);
                
                if i = 15999 then
                    d1 <= '1';
                    j := 0;                    
                end if;
                
                if d1 = '1' then 
                j := j+1;
                out2 <= memo(j); 
                    if j = srate-1 then --Resetting The Memory
                        j := 0;
                    end if; 
                end if;
                
                if i = 31999 then
                    d2 <= '1'; 
                    k := 0;                    
                end if;
                
                if d2 = '1' then 
                k := k+1;
                out3 <= memo(k); 
                    if k = srate-1 then --Resetting The Memory
                        k := 0;
                    end if; 
                end if;
                
                if i = srate-1 then --Resetting The Memory
                    i := 0;
                end if; 
            end if;
            
            divider <= divider+1 ;
            
            if divider = 2500 then
                divider <= 0;
            end if;     
                                         
        end if;
        
    out0 <= dist;
    
    end process;        

end Behavioral;
