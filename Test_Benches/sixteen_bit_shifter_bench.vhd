----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 04:34:06 PM
-- Design Name: 
-- Module Name: sixteen_bit_shifter_bench - Behavioral
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

entity sixteen_bit_shifter_bench is
--  Port ( );
end sixteen_bit_shifter_bench;

architecture Behavioral of sixteen_bit_shifter_bench is
component sixteen_bit_shifter
      Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
             H : out STD_LOGIC_VECTOR (15 downto 0);
             S : in STD_LOGIC_VECTOR (1 downto 0);
             LeftOut : out STD_LOGIC;
             RightOut : out STD_LOGIC;
             LeftConst : in STD_LOGIC;
             RightConst : in STD_LOGIC);
  end component;

  --inputs
  signal B: STD_LOGIC_VECTOR (15 downto 0) := x"BEEF";
  signal S: STD_LOGIC_VECTOR (1 downto 0) := "00";
  signal LeftConst: STD_LOGIC := '0';
  signal RightConst: STD_LOGIC := '0';
  
  --outputs
  signal H: STD_LOGIC_VECTOR (15 downto 0);
  signal LeftOut: STD_LOGIC;
  signal RightOut: STD_LOGIC;
  
  
  constant TIME_CYCLE: time := 40ns;

begin

  uut: sixteen_bit_shifter port map ( 
        B => B,
        H => H,
        S => S,
        LeftOut => LeftOut,
        RightOut => RightOut,
        LeftConst => LeftConst,
        RightConst => RightConst 
  );

  stimul: process
  begin
    wait for TIME_CYCLE;
    S <= "01";
    wait for TIME_CYCLE;
    S <= "10";
    wait;
  end process;
end Behavioral;
