library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file_tb is
end;

architecture Behavioral of register_file_tb is

  component register_file
     Port ( src_S0 : in STD_LOGIC_VECTOR (2 downto 0);
           dst_1 : in STD_LOGIC;
           dst_2 : in STD_LOGIC;
           dst_3 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_new : in STD_LOGIC_VECTOR (15 downto 0);
           Data_select : in STD_LOGIC;
           Reset: in STD_LOGIC;
           Load_enable: in STD_LOGIC;
           Reg0 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
     signal src_S0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
     signal dst_1 : STD_LOGIC := '0';
     signal dst_2 : STD_LOGIC := '0';
     signal dst_3 : STD_LOGIC := '0';
     signal Clk : STD_LOGIC := '0';
     signal Data_new : STD_LOGIC_VECTOR (15 downto 0) := x"DEAD";
     signal Data_select : STD_LOGIC := '0';
     signal Reset: STD_LOGIC := '1';
     signal Load_enable: STD_LOGIC := '1';
     signal Reg0 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg1 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg2 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg3 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg4 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg5 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg6 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg7 : STD_LOGIC_VECTOR (15 downto 0); 
    
     constant TIME_CYCLE: time := 15 ns;
begin
  utt :register_file port map(
    src_S0 => src_S0,
    dst_1 => dst_1,
    dst_2 => dst_2,
    dst_3 => dst_3,
    Clk => Clk,
    Data_new => Data_new,
    Data_select => Data_select,
    Reset => Reset,
    Load_enable => Load_enable,
    Reg0 => Reg0,
    Reg1 => Reg1,
    Reg2 => Reg2,
    Reg3 => Reg3,
    Reg4 => Reg4,
    Reg5 => Reg5,
    Reg6 => Reg6,
    Reg7 => Reg7
  );

clock: process   
    begin
    wait for TIME_CYCLE/2;
        Clk <= not Clk;
    end process;
    
simul: process
    begin
        wait for TIME_CYCLE;
        Reset <= '0';
        wait for TIME_CYCLE;
        dst_1 <= '1';
        wait for TIME_CYCLE;
        dst_1 <= '0';
        dst_2 <= '1';
        wait for TIME_CYCLE;
        dst_1 <= '1';
        wait for TIME_CYCLE;
        dst_1 <= '0';
        dst_2 <= '0';
        dst_3 <= '1';
        wait for TIME_CYCLE;
        dst_1 <= '1';
        wait for TIME_CYCLE;
        dst_1 <= '0';
        dst_2 <= '1';
        wait for TIME_CYCLE;
        dst_1 <= '1';
        wait for TIME_CYCLE;
        dst_1 <= '0';
        dst_3 <= '0';
        data_new <= x"BEEF";
        wait for TIME_CYCLE;
        data_select <= '1';
        src_s0 <= "010";
        dst_1 <= '1';
        wait for TIME_CYCLE;
        wait for TIME_CYCLE;
        load_enable <= '0';
        dst_3 <= '1';
        wait;       
    end process;

end Behavioral;
