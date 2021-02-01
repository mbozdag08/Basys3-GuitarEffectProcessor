library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TWave is
port (clk : in STD_LOGIC; 
      wave1 : out STD_LOGIC_VECTOR(7 downto 0);
      wave2 : out STD_LOGIC_VECTOR(7 downto 0)
     );
end TWave;

architecture Behavioral of TWave is

signal temp1,temp2 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
signal direction1,direction2 : integer range 128 to 255 := 128;


signal divider1 : integer range 0 to 45000:= 0;   --clock divider signals (Clock Period: 10ns)
                                                  --Sample Frequency : 1/(Clock Period * Divider Range), Wave Frequency: Sample Frequency / 256
                                                  --divider1 range: 45000, Sample Freq: 2222.2Hz, Triangle Wave Freq: 8.68Hz                                    
signal divider2 : integer range 0 to 30000:= 0;  --divider2 range: 30000, Sample Freq: 3333.3Hz, Triangle Wave Freq: 13.02Hz


begin

process(clk)
begin
    if (rising_edge(clk)) then
        
            if( divider1 = 0 ) then  --dividing the clock signal
            
                if (direction1 < 255) then
                    temp1 <= temp1 + 1 ;
                    direction1 <= direction1 + 1 ;       
                else 
                    temp1 <= temp1 - 1 ;
                    
                    if temp1 = "10000000" then 
                        direction1 <= 128; 
                    end if;
                end if; 
            end if;
            
            divider1 <= divider1 + 1;
                
            if(divider1 = 45000) then
                divider1 <= 0;            
            end if;
              
        
        
        
            if( divider2 = 0 ) then  --dividing the clock signal
            
                if (direction2 < 255) then
                    temp2 <= temp2 + 1;
                    direction2 <= direction2 + 1;  
                else 
                    temp2 <= temp2 - 1;
                    
                    if temp2 = "10000000" then 
                       direction2 <= 128; 
                    end if;
                end if;
            end if;
            
            divider2 <= divider2 + 1;
                
            if(divider2 = 30000) then
                divider2 <= 0;            
            end if;
              
    end if;
          wave1 <= temp1;
          wave2 <= temp2;
end process;

end Behavioral;

