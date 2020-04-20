----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 05:50:31 PM
-- Design Name: 
-- Module Name: function_unit_bench - Behavioral
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

entity function_unit_bench is
--  Port ( );
end function_unit_bench;

architecture Behavioral of function_unit_bench is
component function_unit
      Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
             B : in STD_LOGIC_VECTOR (15 downto 0);
             Gout : out STD_LOGIC_VECTOR (15 downto 0);
             FS : in STD_LOGIC_VECTOR (4 downto 0);
             V : out STD_LOGIC;
             C : out STD_LOGIC;
             N : out STD_LOGIC;
             Z : out STD_LOGIC);
  end component;

  --inputs
  signal A: STD_LOGIC_VECTOR (15 downto 0) := x"ABBA";
  signal B: STD_LOGIC_VECTOR (15 downto 0) := x"BEEF";
  signal FS: STD_LOGIC_VECTOR (4 downto 0) := "00000";
  
  -- outputs
  signal Gout: STD_LOGIC_VECTOR (15 downto 0);
  signal V: STD_LOGIC;
  signal C: STD_LOGIC;
  signal N: STD_LOGIC;
  signal Z: STD_LOGIC;
  
  
  constant TIME_CYCLE: time := 50ns;

begin

  uut: function_unit port map ( 
        A => A,
        B => B,
        Gout => Gout,
        FS => FS,
        V => V,
        C => C,
        N => N,
        Z => Z 
  );

  stimul: process
  begin
    wait for TIME_CYCLE;
    FS <= "00001";
    wait for TIME_CYCLE;
    FS <= "00010";
    wait for TIME_CYCLE;
    FS <= "00011";
    wait for TIME_CYCLE;
    FS <= "00100";
    wait for TIME_CYCLE;
    FS <= "00101";
    wait for TIME_CYCLE;
    FS <= "00110";
    wait for TIME_CYCLE;
    FS <= "00111";
    wait for TIME_CYCLE;
    FS <= "01000";
    wait for TIME_CYCLE;
    FS <= "01010";
    wait for TIME_CYCLE;
    FS <= "01100";
    wait for TIME_CYCLE;
    FS <= "01110";
    wait for TIME_CYCLE;
    FS <= "10000";
    wait for TIME_CYCLE;
    FS <= "10100";
    wait for TIME_CYCLE;
    FS <= "11000";
    wait;
  end process;

end Behavioral;
