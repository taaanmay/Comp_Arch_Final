----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2020 11:33:02 AM
-- Design Name: 
-- Module Name: reg_8 - Behavioral
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

entity reg_8 is
   Port ( D : in STD_LOGIC_VECTOR(15 downto 0);
           Clk : in STD_LOGIC;
           Load : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(15 downto 0);
           Reset : in STD_LOGIC
           );
end reg_8;

architecture Behavioral of reg_8 is
    signal state : STD_LOGIC_VECTOR(15 downto 0);
begin
    Q<=state;
    process(Clk, Reset)
    begin
        if(Reset = '1') then
            state <= x"0000";
        else 
            if(CLK = '1' and Load = '1') then
                state <= D;
            end if;
        end if;
    end process;
                    
end Behavioral;

