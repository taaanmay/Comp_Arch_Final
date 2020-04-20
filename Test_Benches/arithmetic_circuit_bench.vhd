----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 04:10:05 PM
-- Design Name: 
-- Module Name: arithmetic_circuit_bench - Behavioral
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

entity arithmetic_circuit_bench is
--  Port ( );
end arithmetic_circuit_bench;

architecture behav of arithmetic_circuit_bench is

  component arithmetic_circuit
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             Cin : in STD_LOGIC;
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC;
             Sum : out STD_LOGIC;
             Cout : out STD_LOGIC);
  end component;
  
 -- inputs
  signal A: STD_LOGIC := '0';
  signal B: STD_LOGIC := '0';
  signal Cin: STD_LOGIC := '0'; 
  signal S0: STD_LOGIC := '0';
  signal S1: STD_LOGIC :='0';
  
  --outputs
  signal Sum: STD_LOGIC;
  signal Cout: STD_LOGIC;
  
  constant TIME_CYCLE: time := 20ns;

begin

  uut: arithmetic_circuit port map ( 
    A => A,
    B => B,
    Cin => Cin,
    S0 => S0,
    S1 => S1,
    Sum => Sum,
    Cout => Cout
    );

  stimulus: process
      begin
      wait for TIME_CYCLE;
      A <= '1';
      wait for TIME_CYCLE;
      S0 <= '1';
      wait for TIME_CYCLE;
      B <= '1';
      wait for TIME_CYCLE;
      S1 <= '1';
      wait for TIME_CYCLE;
      S0 <= '0';
      wait for TIME_CYCLE;
      S0 <= '1';
      S1 <= '0';
      wait for TIME_CYCLE;
      Cin <= '1';
      wait for TIME_CYCLE;
      A <= '0';
      wait for TIME_CYCLE;
      S1 <= '1';
      S0 <= '0';
      wait for TIME_CYCLE;
      A <= '1';
      wait for TIME_CYCLE;
      B <= '0';
      wait;
    end process;

end behav;