library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopMod is
  Port (clk : in STD_LOGIC;
        JXADC : in STD_LOGIC_VECTOR (7 downto 0);
        vpin : in STD_LOGIC;
        vnin : in STD_LOGIC;
        efout: out STD_LOGIC_VECTOR (7 downto 0);
        test : out STD_LOGIC_VECTOR (7 downto 0);
        choice1 : in STD_LOGIC_VECTOR (1 downto 0);
        choice2 : in STD_LOGIC_VECTOR (1 downto 0);
        choice3 : in STD_LOGIC;
        choiceT : in STD_LOGIC_VECTOR (4 downto 0);
        LED : out STD_LOGIC_VECTOR(9 downto 0)
        );
end TopMod;

architecture Behavioral of TopMod is

component CleanMod

Port (clk   : in  STD_LOGIC;
           JXADC    : in STD_LOGIC_VECTOR (7 downto 0);
           vp_in    : in STD_LOGIC;
           vn_in    : in STD_LOGIC;
           Jout      : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Distortion 
Port ( clin : in STD_LOGIC_VECTOR(7 downto 0); --clean input
           disout : out STD_LOGIC_VECTOR(7 downto 0); --distorted output
           clk: in std_logic;
           ch : in STD_LOGIC_VECTOR(1 downto 0) --choice
       );
end component;

component Tremolo 
    Port (clk : in STD_LOGIC;
          ch : in STD_LOGIC_VECTOR(1 downto 0); -- choice
          tri1   : in STD_LOGIC_VECTOR(7 downto 0); --triangular wave 1
          tri2   : in STD_LOGIC_VECTOR(7 downto 0); --triangular wave 2
          del : in STD_LOGIC_VECTOR(7 downto 0); --delay module output
          trem   : out STD_LOGIC_VECTOR(7 downto 0)  --tremolo output
    );
end component;

component TWave 

port (clk : in STD_LOGIC; 
      wave1 : out STD_LOGIC_VECTOR(7 downto 0);
      wave2 : out STD_LOGIC_VECTOR(7 downto 0)

     );
     
end component;

component Delay 
      
  Port ( clk : in STD_LOGIC;
         mo0 : in STD_LOGIC_VECTOR(7 downto 0); --Memory Output
         mo2 : in STD_LOGIC_VECTOR(7 downto 0); --Memory Output 400
         mo3 : in STD_LOGIC_VECTOR(7 downto 0); --Memory Output 800
         del : out STD_LOGIC_VECTOR(7 downto 0); --Delayed output
         ch : in STD_LOGIC
         );
         
end component;

component Memory

  Port (dist : in STD_LOGIC_VECTOR(7 downto 0); --Distortion Module Output
        clk : in STD_LOGIC; --100MHz Clock
        out0 : out STD_LOGIC_VECTOR(7 downto 0);
        out1 : out STD_LOGIC_VECTOR(7 downto 0);
        out2 : out STD_LOGIC_VECTOR(7 downto 0);
        out3 : out STD_LOGIC_VECTOR(7 downto 0)
        );

end component;

signal triwave1 : STD_LOGIC_VECTOR(7 downto 0);
signal triwave2 : STD_LOGIC_VECTOR(7 downto 0);
signal memo0 : STD_LOGIC_VECTOR(7 downto 0);
signal memo1 : STD_LOGIC_VECTOR(7 downto 0);
signal memo2 : STD_LOGIC_VECTOR(7 downto 0);
signal memo3 : STD_LOGIC_VECTOR(7 downto 0);
signal clean : STD_LOGIC_VECTOR (7 downto 0);
signal dist : STD_LOGIC_VECTOR (7 downto 0);
signal del : STD_LOGIC_VECTOR (7 downto 0);

begin

comp1: CleanMod Port Map (

    clk => clk,
    JXADC => JXADC,
    vp_in => vpin,
    vn_in => vnin,
    Jout => clean   

);

comp2: Distortion Port Map (

    clin => clean,
    disout => dist,
    clk => clk,
    ch => choice1

);

comp3: Tremolo Port Map (

    del => del,
    trem => efout,
    clk => clk,
    tri1 => triwave1,
    tri2 => triwave2,
    ch => choice2

);

comp4: TWave Port Map (

     clk => clk,
     wave1 => triwave1,
     wave2 => triwave2

);

comp5: Delay Port Map (

    clk => clk,
    mo0 => memo0,
    mo2 => memo2,
    mo3 => memo3,
    del => del,
    ch => choice3
    
);

comp6: Memory Port Map (

    clk => clk,
    out0 => memo0,
    out1 => memo1,
    out2 => memo2,
    out3 => memo3,
    dist => dist
    
);

process (clk)
begin  
   
    if rising_edge(clk) then    
    
        if choiceT = "00001" then 
            test <= triwave1;
        elsif choiceT = "00010" then
            test <= triwave2;
        elsif choiceT = "00100" then
            test <= memo1;
        elsif choiceT = "01000" then
            test <= memo2;
        elsif choiceT = "10000" then
            test <= memo3;
        end if;
        
    end if;
    
end process;

LED(1 downto 0) <= choice1;
LED(3 downto 2) <= choice2;
LED(4) <= choice3;
LED(9 downto 5) <= choiceT;


end Behavioral;
