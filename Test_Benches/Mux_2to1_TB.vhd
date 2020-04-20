----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 01:18:56 PM
-- Design Name: 
-- Module Name: Mux_2to1_TB - Behavioral
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

entity Mux_2to1_TB is
--  Port ( );
end Mux_2to1_TB;

architecture Behavioral of Mux_2to1_TB is
    component Mux_2to1 is
    Port (D0, D1 : in std_logic;
       Z : out std_logic;
       sel: in std_logic  );
   end component;

--SIGNALS
-- inputs
signal D0: STD_LOGIC := '0';
signal D1: STD_LOGIC := '1';
signal Sel: STD_LOGIC := '0';

-- output 
signal Z: STD_LOGIC;
   
constant TIME_CYCLE : time := 10ns;

begin
    uut: Mux_2to1 PORT MAP(
              D0 => D0,
              D1 => D1,
              Z => Z,
              Sel => sel);
                        
    
  stimul: process
    begin
        wait for TIME_CYCLE;
        D0 <= '1';
        wait for TIME_CYCLE;
        Sel <= '1';
        wait for TIME_CYCLE;
        D1 <= '0';
        wait;
  end process;

end Behavioral;
