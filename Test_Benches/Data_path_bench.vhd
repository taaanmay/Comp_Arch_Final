----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 04:17:45 PM
-- Design Name: 
-- Module Name: Data_path_bench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_path_bench is
--  Port ( );
end Data_path_bench;

architecture Behavioral of data_path_bench is
component data_path
      Port ( DestSel : in STD_LOGIC_VECTOR (2 downto 0);
             LoadEnable : in STD_LOGIC;
             Asel : in STD_LOGIC_VECTOR (2 downto 0);
             Bsel : in STD_LOGIC_VECTOR (2 downto 0);
             Data_in : in STD_LOGIC_VECTOR (15 downto 0);
             Ll : in STD_LOGIC;          
             MD_sel : in STD_LOGIC;
             MB_sel : in STD_LOGIC;
             Const_in : in STD_LOGIC_VECTOR (15 downto 0);
             FS : in STD_LOGIC_VECTOR ( 4 downto 0);
             Lr : in STD_LOGIC;
             Clk : in STD_LOGIC;
             Reset : in STD_LOGIC;
             V : out STD_LOGIC;
             C : out STD_LOGIC;
             N : out STD_LOGIC;
             Data_out : out STD_LOGIC_VECTOR (15 downto 0);
             Address_out : out STD_LOGIC_VECTOR (15 downto 0);
             Z : out STD_LOGIC);
  end component;

  --inputs
  signal DestSel: STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal LoadEnable: STD_LOGIC := '0';
  signal Asel: STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal Bsel: STD_LOGIC_VECTOR (2 downto 0) := "001" ;
  signal Data_in: STD_LOGIC_VECTOR (15 downto 0) := x"CAFE";
  signal MD_sel: STD_LOGIC := '0';
  signal MB_sel: STD_LOGIC := '0';
  signal Const_in: STD_LOGIC_VECTOR (15 downto 0) := x"DEAD";
  signal FS: STD_LOGIC_VECTOR ( 4 downto 0) := "00000";
  signal Clk: STD_LOGIC := '0';
  signal Reset: STD_LOGIC := '1'; 
  signal Ll: STD_LOGIC := '0';
  signal Lr: STD_LOGIC := '0';
  
  --outputs
  signal V: STD_LOGIC;
  signal C: STD_LOGIC;
  signal N: STD_LOGIC;
  signal Z: STD_LOGIC;
  signal Data_out: STD_LOGIC_VECTOR (15 downto 0);
  signal Address_out: STD_LOGIC_VECTOR (15 downto 0);
  
  
  constant TIME_CYCLE: time := 80ns;

begin

  uut: data_path port map ( 
        DestSel => DestSel,
        LoadEnable => LoadEnable,
        Asel => Asel,
        Bsel => Bsel,
        Data_in => Data_in,
        Data_out => Data_out,
        Address_out => Address_out,
        MD_sel => MD_sel,
        MB_sel => MB_sel,
        Const_in => Const_in,
        FS => FS,
        Lr => Lr,
        Clk => Clk,
        Reset => Reset,
        V => V,
        C => C,
        N => N,
        Z => Z,
        Ll => Ll 
  );
    
  clock : process
  begin
    wait for TIME_CYCLE/2;
    Clk <= not Clk;
  end process;
  
  stimul: process
    begin
        wait for TIME_CYCLE;
        Reset <= '0';
        LoadEnable <= '1';
        MD_Sel <= '1';
        wait for TIME_CYCLE;
        DestSel <= "001";
        wait for TIME_CYCLE;
        DestSel <= "010";
        wait for TIME_CYCLE;
        DestSel <= "011";
        wait for TIME_CYCLE;
        DestSel <= "100";
        wait for TIME_CYCLE;
        DestSel <= "101";
        wait for TIME_CYCLE;
        DestSel <= "110";
        wait for TIME_CYCLE;
        DestSel <= "111";
        wait for TIME_CYCLE;
        MD_Sel <= '0';
        FS <= "00001";
        wait for TIME_CYCLE;
        DestSel <= "000";
        Asel <= "011";
        FS <= "00010";
        wait for TIME_CYCLE;
        DestSel <= "010";
        Bsel <= "100";
        FS <= "00011";
        wait for TIME_CYCLE;
        DestSel <= "011";
        Asel <= "101";
        FS <= "00100";
        wait for TIME_CYCLE;
        DestSel <= "100";
        Bsel <= "110";
        FS <= "00101";
        wait for TIME_CYCLE;
        DestSel <= "101";
        Asel <= "111";
        FS <= "00110";
        wait for TIME_CYCLE;
        DestSel <= "110";
        FS <= "00111";
        wait for TIME_CYCLE;
        DestSel <= "000";
        MB_Sel <= '1';
        FS <= "01000";
        wait for TIME_CYCLE;
        FS <= "01010";
        wait for TIME_CYCLE;
        FS <= "01100";
        wait for TIME_CYCLE;
        FS <= "01110";
        wait for TIME_CYCLE;
        DestSel <= "001";
        FS <= "10000";
        wait for TIME_CYCLE;
        FS <= "10100";
        wait for TIME_CYCLE;
        FS <= "11000";
        wait;
  end process;
end Behavioral;
