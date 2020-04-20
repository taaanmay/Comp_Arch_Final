----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 02:08:39 PM
-- Design Name: 
-- Module Name: zero_fill_test_bench - Behavioral
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

entity zero_fill_test_bench is
--  Port ( );
end zero_fill_test_bench;

architecture Behavioral of zero_fill_test_bench is
  component zero_fill
      Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
             Z : out STD_LOGIC_VECTOR(15 downto 0));
  end component;

  signal A: STD_LOGIC_VECTOR(2 downto 0);
  signal Z: STD_LOGIC_VECTOR(15 downto 0);

  signal TIME_CYCLE : time := 200ns;
begin

  uut: zero_fill port map ( A => A,
                            Z => Z );

  stim: process
  begin
    A <= "011";
    wait for TIME_CYCLE;
    A <= "110";
    wait;
  end process;


end Behavioral;
