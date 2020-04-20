----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 04:14:07 PM
-- Design Name: 
-- Module Name: B_input_logic_adder_bench - Behavioral
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

entity B_input_logic_adder_bench is
--  Port ( );
end B_input_logic_adder_bench;

architecture behav of B_input_logic_adder_bench is

  component B_input_logic_adder
      Port ( B : in STD_LOGIC;
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC;
             Z : out STD_LOGIC);
  end component;

  --inputs 
  signal B: STD_LOGIC := '0';
  signal S0: STD_LOGIC := '0';
  signal S1: STD_LOGIC := '0';
  
  -- output
  signal Z: STD_LOGIC;
  
  constant TIME_CYCLE : time := 15ns;

begin

  uut: B_input_logic_adder port map ( 
    B  => B,
    S0 => S0,
    S1 => S1,
    Z  => Z 
    );

  stimul: process
     begin
        wait for TIME_CYCLE;
        B <= '1';
        wait for TIME_CYCLE;
        S0 <= '1';
        wait for TIME_CYCLE;
        S1 <= '1';
        S0 <= '0';
        wait for TIME_CYCLE;
        S0 <= '1';
        wait for TIME_CYCLE;
        S1 <= '0';
        B <= '0';    
        wait for TIME_CYCLE;
        S1 <= '1';
        S0 <= '0';      
        wait;
     end process;


end behav;