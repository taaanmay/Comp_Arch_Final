----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 05:53:09 PM
-- Design Name: 
-- Module Name: logic_circuit_bench - Behavioral
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

entity logic_circuit_bench is
--  Port ( );
end logic_circuit_bench;

architecture behav of logic_circuit_bench is

  component logic_circuit
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC;
             G : out STD_LOGIC);
  end component;
  
  -- inputs
  signal A: STD_LOGIC := '0';
  signal B: STD_LOGIC := '0';
  signal S0: STD_LOGIC := '0';
  signal S1: STD_LOGIC := '0';
  
  -- output
  signal G: STD_LOGIC;
  
  constant TIME_CYCLE: time := 20ns;

begin

  uut: logic_circuit port map ( 
    A  => A,
    B  => B,
    S0 => S0,
    S1 => S1,
    G  => G 
    );

  stimul: process
    begin
     wait for TIME_CYCLE;
     A <= '1';
     wait for TIME_CYCLE;
     B <= '1';
     wait for TIME_CYCLE;
     S0 <= '1';
     wait for TIME_CYCLE;
     A <= '0';
     wait for TIME_CYCLE;
     B <= '0';
     wait for TIME_CYCLE;
     S0 <= '0';
     S1 <= '1';
     wait for TIME_CYCLE;
     A <= '1';
     wait for TIME_CYCLE;
     S0 <= '1';
     wait;
  end process;

end behav;
