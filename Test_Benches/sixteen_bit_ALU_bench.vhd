----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 05:55:56 PM
-- Design Name: 
-- Module Name: sixteen_bit_ALU_bench - Behavioral
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

entity sixteen_bit_ALU_bench is
--  Port ( );
end sixteen_bit_ALU_bench;

architecture Behavioral of sixteen_bit_ALU_bench is
component sixteen_bit_ALU
      Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
             B : in STD_LOGIC_VECTOR (15 downto 0);
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC;
             S2 : in STD_LOGIC;
             Sum : out STD_LOGIC_VECTOR (15 downto 0);
             Cin : in STD_LOGIC;
             Cout : out STD_LOGIC);
  end component;

  --inputs
  signal A: STD_LOGIC_VECTOR (15 downto 0) := x"6301";
  signal B: STD_LOGIC_VECTOR (15 downto 0) := x"5040";
  signal S0: STD_LOGIC := '0';
  signal S1: STD_LOGIC := '0';
  signal S2: STD_LOGIC := '0';
  signal Cin: STD_LOGIC := '0';
  
  --outputs
  signal Sum: STD_LOGIC_VECTOR (15 downto 0);
  signal Cout: STD_LOGIC;
  
  constant TIME_CYCLE: time := 40ns;

begin

  uut: sixteen_bit_ALU port map ( 
        A => A,
        B => B,
        S0 => S0,
        S1  => S1,
        S2 => S2,
        Sum => Sum,
        Cin => Cin,
        Cout => Cout 
        );

  stimul: process
  begin
    wait for TIME_CYCLE;
    S0 <= '1';
    wait for TIME_CYCLE;
    B <= x"ABBA";
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
    S0 <= '0';
    S1 <= '0';
    Cin <= '0';
    S2 <= '1';
    wait for TIME_CYCLE;
    S0 <= '1';
    wait for TIME_CYCLE;
    S0 <= '0';
    S1 <= '1';
    wait for TIME_CYCLE;
    S0 <= '0';
    wait;
  end process;
end Behavioral;
