----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:50:34 PM
-- Design Name: 
-- Module Name: ALU_one_bit_bench - Behavioral
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

entity ALU_one_bit_bench is
--  Port ( );
end ALU_one_bit_bench;

architecture Behavioral of ALU_one_bit_bench is
component ALU_one_bit
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             Cin : in STD_LOGIC;
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC;
             S2 : in STD_LOGIC;
             Cout : out STD_LOGIC;
             G : out STD_LOGIC);
  end component;

  --inputs
  signal A: STD_LOGIC := '1';
  signal B: STD_LOGIC := '1';
  signal Cin: STD_LOGIC := '0';
  signal S0: STD_LOGIC := '0';
  signal S1: STD_LOGIC := '0';
  signal S2: STD_LOGIC := '0';
  
  --outputs
  signal Cout: STD_LOGIC;
  signal G: STD_LOGIC;
  
  constant TIME_CYCLE: time := 20ns;

begin

  uut: ALU_one_bit port map ( 
    A => A,
    B => B,
    Cin => Cin,
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => Cout,
    G => G 
    );

  stimul: process
     begin
        wait for TIME_CYCLE;
        Cin <= '1';
        wait for TIME_CYCLE;
        Cin <= '0';
        S0 <= '1';
        wait for TIME_CYCLE;
        B <= '0';
        wait for TIME_CYCLE;
        S0 <= '0';
        S1 <= '1';
        wait for TIME_CYCLE;
        Cin <= '1';
        wait for TIME_CYCLE;
        Cin <= '0';
        S0 <= '1';
        wait for TIME_CYCLE;
        Cin <= '1';
        wait for TIME_CYCLE;
        Cin <= '0';
        S0 <= '0';
        S1 <= '0';
        S2 <= '1';
        wait for TIME_CYCLE;
        B <= '1';
        wait for TIME_CYCLE;
        S0 <= '1';
        wait for TIME_CYCLE;
        B <= '0';
        wait for TIME_CYCLE;
        A <= '0';
        wait for TIME_CYCLE;
        S1 <= '1';
        S0 <= '0';
        wait for TIME_CYCLE;
        A <= '1';
        wait for TIME_CYCLE;
        S0 <= '1';
        wait;
  end process;

end Behavioral;
