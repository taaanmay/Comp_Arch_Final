----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:25:31 AM
-- Design Name: 
-- Module Name: Instruction_Register - Behavioral
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

entity Instruction_Register is
Port( Inst_in : in STD_LOGIC_VECTOR (15 downto 0);
          IL : in STD_LOGIC;
          Opcode : out STD_LOGIC_VECTOR (7 downto 0);
          DR: out STD_LOGIC_VECTOR (2 downto 0);
          SA: out STD_LOGIC_VECTOR (2 downto 0);
          SB: out STD_LOGIC_VECTOR (2 downto 0);
          Clk: in STD_LOGIC;
          Reset: in STD_LOGIC
    );

end Instruction_Register;

architecture Behavioral of Instruction_Register is
 signal s : STD_LOGIC_VECTOR (15 downto 0);
begin
    Opcode(6 downto 0) <= s(15 downto 9) after 1ns;
    DR <= s(8 downto 6) after 1ns;
    SA <= s(5 downto 3) after 1ns;
    SB <= s(2 downto 0) after 1ns;
    Opcode(7) <= '0'; 
    process(Clk, Reset)
    begin
        if(Reset = '1') then
            s <= x"0000";
        elsif(Clk ='1' and IL = '1') then 
            s <= Inst_in;
        end if;
    end process;
end Behavioral;
