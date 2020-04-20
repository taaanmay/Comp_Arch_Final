----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 01:35:51 PM
-- Design Name: 
-- Module Name: Mux_4to1_TB - Behavioral
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

entity Mux_4to1_TB is
--  Port ( );
end Mux_4to1_TB;

architecture Behavioral of Mux_4to1_TB is
    component Mux_4to1 is
    Port (S0,S1,X0,X1,X2,X3 : in std_logic;
        Z1 : out std_logic
         );
     end component;
     
--SIGNALS

-- input
  signal S0: STD_LOGIC := '0';
  signal S1: STD_LOGIC := '0';
  signal X0: STD_LOGIC := '1';
  signal X1: STD_LOGIC := '1';
  signal X2: STD_LOGIC := '1';
  signal X3: STD_LOGIC := '1';
  
  -- output
  signal Z1: STD_LOGIC;
  
  constant TIME_CYCLE: time := 20ns;

begin

  uut: Mux_4to1 port map ( 
        S0 => S0,
        S1 => S1,
        X0 => X0,
        X1 => X1,
        X2 => X2,
        X3 => X3,
        Z1 => Z1 
        );

  stimulus: process
      begin
        wait for TIME_CYCLE;
        X0 <= '0';
        wait for TIME_CYCLE;
        S0 <= '1';
        wait for TIME_CYCLE;
        X1 <= '0';
        wait for TIME_CYCLE;
        S1 <= '1';
        wait for TIME_CYCLE;
        X3 <= '0';
        wait for TIME_CYCLE;
        S0 <= '0';
        wait for TIME_CYCLE;
        X2 <= '0';
        wait;
  end process;


end Behavioral;
