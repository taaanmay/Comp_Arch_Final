----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 01:27:01 PM
-- Design Name: 
-- Module Name: Mux_3to1_TB - Behavioral
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

entity Mux_3to1_TB is
--  Port ( );
end Mux_3to1_TB;

architecture Behavioral of Mux_3to1_TB is
    component Mux_3to1 is
    Port ( S: in std_logic_vector(1 downto 0);
        X0,X1,X2 : in std_logic;
        Z: out std_logic  );
        end component;
        
--SIGNALS
-- input
  signal S: STD_LOGIC_VECTOR (1 downto 0) := "00";
  signal X0: STD_LOGIC := '1';
  signal X1: STD_LOGIC := '1';
  signal X2: STD_LOGIC := '1';
  -- output
  signal Z: STD_LOGIC;
  
  constant TIME_CYCLE: time := 10ns;
  
          
begin

uut: Mux_3to1 port map ( 
        S  => S,
        X0 => X0,
        X1 => X1,
        X2 => X2,
        Z  => Z 
   );

  stimul: process
     begin
        wait for TIME_CYCLE;
        X0 <= '0';
        wait for TIME_CYCLE;
        S <= "01";
        wait for TIME_CYCLE;
        X1 <= '0';
        wait for TIME_CYCLE;
        S <= "10";
        wait for TIME_CYCLE;
        X2 <= '0';
        wait;
  end process;


end Behavioral;
