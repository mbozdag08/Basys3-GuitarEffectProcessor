library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Delay is        
  Port ( clk : in STD_LOGIC;
         mo0 : in STD_LOGIC_VECTOR(7 downto 0); --Distortion Module Output
         mo2 : in STD_LOGIC_VECTOR(7 downto 0); --Memory Output 200
         mo3 : in STD_LOGIC_VECTOR(7 downto 0); --Memory Output 400
         del : out STD_LOGIC_VECTOR(7 downto 0); --Delayed output
         ch : in STD_LOGIC
         );
end Delay;

architecture Behavioral of Delay is

signal divider : integer :=0; -- Clock Divider

begin


    process (clk)
    begin 
        if rising_edge(clk) then
            if divider = 0 then
            
                if ch = '1' then   
                    del <= mo0 + mo2(7 downto 2) + mo3(7 downto 3);
                else
                    del <= mo0;
                end if;  
            
            end if;
            
            divider <= divider+1 ;
            
            if divider = 2500 then
                divider <= 0;
            end if;     
                                         
        end if;      
                    
    end process;

end Behavioral;
