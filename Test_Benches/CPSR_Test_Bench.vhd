----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 02:52:04 PM
-- Design Name: 
-- Module Name: CPSR_Test_Bench - Behavioral
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

entity CPSR_Test_Bench is
--  Port ( );
end CPSR_Test_Bench;

architecture Behavioral of CPSR_Test_Bench is

component CPSR
      Port ( V : in STD_LOGIC;
             C : in STD_LOGIC;
             N : in STD_LOGIC;
             Z : in STD_LOGIC;
             Flag_out : out STD_LOGIC;
             MS : in STD_LOGIC_VECTOR (2 downto 0));
  end component;

  signal V: STD_LOGIC;
  signal C: STD_LOGIC;
  signal N: STD_LOGIC;
  signal Z: STD_LOGIC;
  signal Flag_out: STD_LOGIC;
  signal MS: STD_LOGIC_VECTOR (2 downto 0);
  
  signal TIME_CYCLE : time := 100ns;

begin

  uut: CPSR port map ( V        => V,
                       C        => C,
                       N        => N,
                       Z        => Z,
                       Flag_out => Flag_out,
                       MS       => MS );

  stimulus: process
  begin
  
    C <= '1';
    V <= '0';
    N <= '1';
    Z <= '1';
    MS <= "000";
    wait for TIME_CYCLE;
    MS <= "001";
    wait for TIME_CYCLE;
    MS <= "010";
    wait for TIME_CYCLE;
    MS <= "011";
    wait for TIME_CYCLE;
    MS <= "100";
    wait for TIME_CYCLE;
    MS <= "101";
    wait for TIME_CYCLE;
    MS <= "110";
    wait for TIME_CYCLE;
    MS <= "111";
    wait;
  end process;





end Behavioral;
