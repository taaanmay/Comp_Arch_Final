----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 02:58:51 PM
-- Design Name: 
-- Module Name: Processor_TB - Behavioral
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
use IEEE.Numeric_Std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor_TB is
--  Port ( );
end Processor_TB;

architecture Behavioral of Processor_TB is

component processor
    Port ( 
          Clk: in STD_LOGIC;
          Reset: in STD_LOGIC
    );
  end component;

  signal Clk: STD_LOGIC := '1';
  signal Reset: STD_LOGIC := '1' ;
  
  signal TIME_CYCLE : time := 300ns;

begin

  uut: processor port map ( Clk   => Clk,
                            Reset => Reset );
  clock: process
  begin
    WAIT FOR TIME_CYCLE/2;
    Clk <= not Clk;
  end process;
  stim: process
  begin
    wait for TIME_CYCLE;
    Reset <= '0';
    wait;
  end process;





end Behavioral;
