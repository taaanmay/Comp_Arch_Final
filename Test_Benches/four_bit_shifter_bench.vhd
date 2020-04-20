----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 05:47:16 PM
-- Design Name: 
-- Module Name: four_bit_shifter_bench - Behavioral
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

entity four_bit_shifter_bench is
--  Port ( );
end four_bit_shifter_bench;

architecture Behavioral of four_bit_shifter_bench is
component four_bit_shifter
      Port ( B0 : in STD_LOGIC;
             B1 : in STD_LOGIC;
             B2 : in STD_LOGIC;
             B3 : in STD_LOGIC;
             Lr : in STD_LOGIC;
             Ll : in STD_LOGIC;
             S : in STD_LOGIC_VECTOR (1 downto 0);
             H0 : out STD_LOGIC;
             H1 : out STD_LOGIC;
             H2 : out STD_LOGIC;
             H3 : out STD_LOGIC;
             OutR : out STD_LOGIC;
             OutL : out STD_LOGIC);
  end component;

  --inputs
  signal B0: STD_LOGIC := '0';
  signal B1: STD_LOGIC := '1';
  signal B2: STD_LOGIC := '1';
  signal B3: STD_LOGIC := '1';
  signal Lr: STD_LOGIC := '0';
  signal Ll: STD_LOGIC := '0';
  signal S: STD_LOGIC_VECTOR (1 downto 0) := "00";
  
  --outputs
  signal H0: STD_LOGIC;
  signal H1: STD_LOGIC;
  signal H2: STD_LOGIC;
  signal H3: STD_LOGIC;
  signal OutR: STD_LOGIC;
  signal OutL: STD_LOGIC;
  
  constant TIME_CYCLE: time := 20ns;

begin

  uut: four_bit_shifter port map ( 
        B0 => B0,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        Lr => Lr,
        Ll => Ll,
        S => S,
        H0 => H0,
        H1 => H1,
        H2 => H2,
        H3 => H3,
        OutR => OutR,
        OutL => OutL 
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
